#ifdef __cplusplus
extern "C"
#endif

#include <cairo.h>
#include <librsvg/rsvg.h>

void convert(const char svgfile[], const char pngfile[], double scalex, double scaley) {
	RsvgHandle *handle;
	RsvgDimensionData dimension_data;

	GError* err = NULL;
	handle = rsvg_handle_new_from_file(svgfile, &err);

	if (err != NULL) {
		fprintf(stderr, "libsvgconv: Failed to load svg: '%s'; %s\n", svgfile, (char*) err->message);
		g_error_free(err);
		err = NULL;
	}

	cairo_surface_t *surface;
	cairo_t *ctx;

	rsvg_handle_get_dimensions(handle, &dimension_data);
	double resx = ((double) dimension_data.width) * scalex;
	double resy = ((double) dimension_data.height) * scaley;

	surface = cairo_image_surface_create(CAIRO_FORMAT_ARGB32, (int) resx, (int) resy);
	ctx = cairo_create(surface);

	cairo_set_source_rgba(ctx, 255, 255, 255, 0);
	cairo_scale(ctx, scalex, scaley);

	rsvg_handle_render_cairo(handle, ctx);
	cairo_paint(ctx);

	cairo_surface_write_to_png(surface, pngfile);
	cairo_destroy(ctx);
	cairo_surface_destroy(surface);
}