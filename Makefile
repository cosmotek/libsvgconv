
run:
	love $(shell pwd)

svgconv:
	rm libsvgconv.so
	# pkg-config --cflags --libs cairo --libs librsvg-2.0
	gcc -o libsvgconv.so -I/usr/include/librsvg-2.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/harfbuzz -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/harfbuzz -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/libpng16 -lrsvg-2 -lm -lgio-2.0 -lgdk_pixbuf-2.0 -lgobject-2.0 -lglib-2.0 -lcairo -W -Wall -g -fPIC -shared svgconv.c