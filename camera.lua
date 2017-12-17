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

-- TODO: modify camera movement to use
-- vectors
function camera:pan(x, y)
	self.offset.x = self.offset.x + x
	self.offset.y = self.offset.y + y
end

function camera:zoom(x, y)
	self.scale.x = self.scale.x + x
	self.scale.y = self.scale.y + y
end

function camera:render(x, y, width, height, loop)
	love.graphics.setScissor(x, y, width, height)
	love.graphics.push()
	love.graphics.rotate(self.rotation)
	love.graphics.scale(self.scale.x, self.scale.y)
	love.graphics.translate(self.offset.x, self.offset.y)
	loop()
	love.graphics.pop()
end

return camera