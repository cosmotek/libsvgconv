local camera = {}
camera.__index = camera

function camera:new()
	local cam = {
		rotation = 0,
		offset = {
			x = 0,
			y = 0
		},
		scale = {
			x = 1,
			y = 1
		}
	}

	setmetatable(cam, camera)
	return cam
end

function camera:pan(x, y)
	self.offset.x = self.offset.x - x
	self.offset.y = self.offset.y - y
end

function camera:zoom(x, y)
	self.scale.x = self.scale.x - x
	self.scale.y = self.scale.y - y
end

function camera:createCanvas(width, height, loop)
	local canvas = love.graphics.newCanvas(width, height)
	canvas:renderTo(loop)
	self.canvas = canvas
end

function camera:render(x, y)
	love.graphics.draw(
		self.canvas, x, y,
		self.rotation,
		self.scale.x,
		self.scale.y,
		self.offset.x,
		self.offset.y
	)
end

return camera