local svgconv = require("svgconv")

local assetman = {
	cachepath = "",
	currScale = "",
	assets = {},
	cache = {},
	pathfunc = {}
}

local os = love.system.getOS()
-- Windows, OS X, Linux
-- consider using the file protocol
-- to map urls to OS dependent paths
-- file://warmind/assets/imgs/bot.svg
-- windows -> C:\warmind\assets\imgs\bot.svg
-- unix/linux/mac -> /warmind/assets/imgs/bot.svg

-- default dirs should be in the cachepath
-- and set to the name of their component type
-- e.g /video /music /sndeffect /font etc...

function generate(infile, outfile, scale)
	-- will cause crash if the files don't exist
	svgconv.convert(infile, outfile, {x=scale.x, y=scale.y})
end

function assetman:setCachePath(path)
	self.cachepath = path
	-- check the cachepath for files
	-- and add them to the cache
end

function assetman:load(assetfile)
	self.assets = require(assetfile)
end

function assetman:preload(file)

end

function assetman:get(file)
	return self.assets[self.currScale].path
end

return assetman