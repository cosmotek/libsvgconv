 # libsvgconv
 
 Libsvgconv is a simple C library (with LuaJIT wrapper) for converting SVG files into PNG files with some resizing allowed.
 This library is experimental (I'm not very confident in my C skills), so use at your own risk. If you get some use out this
 library and find that it needs work, let me know as I would be willing to invest time if people get something out of it. Thanks
 and enjoy!
 
 
## usage examples

LuaJIT
```lua

local svgconv = require("svgconv")

-- convert simply takes an input file, output file and a table with the scaling factors (x, y floats)
svgconv.convert(input_svg_file, output_png_file, {x: 1.0, y: 1.0})
```

C
```c
// no header file implemented yet, I would recommend just cloning the methods into your own code
```
