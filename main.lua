camera = require("camera")
unit = require("unit")
vecs = require("vectors")

assets = require("assets")
assetman = require("assetman")

fps = 60

function love.load()
	font = love.graphics.newFont(30)
	love.graphics.setFont(font)

	love.window.setMode(800, 600, {resizable=true, vsync=true})
	cam = camera:new()

	width = love.graphics.getWidth()
	height = love.graphics.getHeight()

	velocity = vecs:new(0, 0)
	box = unit:new()
end

function love.update(dt)
	if love.keyboard.isDown('w', 'a', 's', 'd') then
		xmove = 0
		ymove = 0

		if love.keyboard.isDown('w') then
			ymove = 1
		end

		if love.keyboard.isDown('a') then
			xmove = 1
		end
		
		if love.keyboard.isDown('d') then
			xmove = -1
		end
		
		if love.keyboard.isDown('s') then
			ymove = -1
		end

		cam:pan(xmove, ymove)
	end

	if love.keyboard.isDown('y', 'g', 'h', 'j') then
		xmove = 0
		ymove = 0

		if love.keyboard.isDown('y') then
			ymove = 1
		end

		if love.keyboard.isDown('g') then
			xmove = 1
		end
		
		if love.keyboard.isDown('j') then
			xmove = -1
		end
		
		if love.keyboard.isDown('h') then
			ymove = -1
		end

		velocity = vecs:new(xmove,ymove)
	else
		velocity = vecs:new(0,0)
	end

	box:move(velocity)

	-- set delay to cap framerate at fps setting
	-- if dt < 1/fps then
 --      love.timer.sleep(1/fps - dt)
 --   end
end

function love.resize(w, h)
	width = w
	height = h
end

function love.draw()
	love.graphics.print(tostring(love.timer.getFPS()), 10, 10)
	cam:render(0, 0, width, height, function() 
		love.graphics.setColor(0, 200, 0, 255)
		love.graphics.rectangle("fill", 100, 100, 110, 80)

		box:render()
	end)
end

function love.wheelmoved(x ,y)
	if y > 0 then
		cam:zoom(0.08, 0.08)
	else
		cam:zoom(-0.08, -0.08)
	end
end

function love.gamepadpressed(joystick, button)
	print(joystick, button)
end

function love.joystickpressed(joystick,button)
	print(joystick, button)
end

-- http://scrupp.sourceforge.net/manuals/svn/lua-oocairo/index.html
-- cairo lib lua for svg to png
-- use lgi to use GObject libs (vala/gnome)
-- https://github.com/pavouk/lgi/blob/master/samples/cairo.lua

-- libvups for svg to png? Store all tiles and scalable
-- assets as svgs and raster to needed resolution when the settings are changes
-- https://github.com/XanClic/g1/blob/master/src/steam_controller.cpp
-- https://github.com/XanClic/g1/blob/master/include/steam_controller.hpp
function love.joystickadded( joystick )
	print(joystick)
end