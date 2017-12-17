local svgconv = {}
ffi = require("ffi")

svgconvso = ffi.load("./libsvgconv.so")
ffi.cdef("void convert(const char[], const char[], double, double);")

function svgconv.convert(svgfile, pngfile, scale)
	svgconvso.convert(ffi.string(svgfile), ffi.string(pngfile), scale.x, scale.y)
end

return svgconv