-- assets file
local types = require("assettypes")

return {
	legoman = {
		component = types.character,
		-- scalable images must be svg files set
		-- to what their actual size should be at
		-- the default resolution (1080p)
		src = "legoman.svg"
	},

	bomb = {
		component = types.sndeffect,
		-- sound can be mp3, ogg, ogv, oga, wav
		src = "" 
	},

	intro = {
		component = types.video,
		-- video can only be ogg, ogv
		src = ""
	},

	datamancer = {
		component = types.font,
		-- fonts can only be ttf
		src = ""
	}
}