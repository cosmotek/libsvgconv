vec = require("vectors")

local unit = {}
unit.__index = unit

function unit:new()
	local uni = {
		location = vec:new(0,0),
		velocity = vec:new(0,0),
		acceleration = vec:new(0,0),
		selected = false
	}

	setmetatable(uni, unit)
	return uni
end

function unit:move(vec)
	self.location:add(vec)
end

function unit:select()

end

function unit:unselect()

end

function unit:selected()
	return self.selected
end

function applyDamage(n)

end

function unit:render()
	love.graphics.setColor(255, 0, 0, 255)
	love.graphics.rectangle("fill", self.location.x, self.location.y, 25, 25)
end

return unit