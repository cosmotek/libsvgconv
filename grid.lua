local stategrid = {}
stategrid.__index = stategrid

function stategrid:new()
	local grid = {}
	setmetatable(grid, stategrid)
	return grid
end