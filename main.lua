camera = require("camera")

fps = 60

function love.load()
	font = love.graphics.newFont(30)
	love.graphics.setFont(font)

	love.window.setMode(800, 600, {resizable=true, vsync=false})
	cam = camera:new()

	width = love.graphics.getWidth()
	height = love.graphics.getHeight()

	cam:createCanvas(width, height, function() 
		love.graphics.setColor(0, 200, 0, 255)
		love.graphics.rectangle("fill", 10, 10, 110, 80)
	end)
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

	-- set delay to cap framerate at fps setting
	-- if dt < 1/fps then
 --      love.timer.sleep(1/fps - dt)
 --   end
end

function love.resize(w, h)
	width = w
	height = h

	cam:createCanvas(width, height, function() 
		love.graphics.setColor(0, 200, 0, 255)
		love.graphics.rectangle("fill", 100, 100, 110, 80)
	end)
end

function love.draw()
	love.graphics.print(tostring(love.timer.getFPS( )), 10, 10)
	cam:render(0,0)
end

function love.wheelmoved(x ,y)
	if y > 0 then
		cam:zoom(0.08, 0.08)
	else
		cam:zoom(-0.08, -0.08)
	end
end