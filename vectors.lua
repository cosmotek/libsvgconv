local vectors = {}
vectors.__index = vectors

function vectors:new(x, y)
	local vec = { x = x, y = y }
	setmetatable(vec, vectors)
	return vec
end

function vectors:add(vec)
	self.x = self.x + vec.x
	self.y = self.y + vec.y
end

function vectors:sub(vec)
	self.x = self.x - vec.x
	self.y = self.y - vec.y
end

function vectors:mult(n)
	self.x = self.x * n
	self.y = self.y * n
end

function vectors:div(n)
	self.x = self.x / n
	self.y = self.y / n
end

function vectors:mag()
	return sqrt((self.x * self.x) + (self.y * self.y))
end

function vectors:limit(max)
	if self:mag() > max*max then
      self:normalize()
      self:mult(max)
    end
end

function vectors:equals(vec)
	if self.x == vec.x and self.y == vec.y then
		return true
	else
		return false
	end
end

-- dist between two points
function vectors:dist(vec)
	dx = self.x - vec.x
	dy = self.y - vec.y
	return sqrt((dx*dx) + (dy*dy))
end

function vectors:normalize()
	m = self:mag()
	self:div(mag)
end

return vectors