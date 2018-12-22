name :
	 Zbar
homepage :
	 https://zbar.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/zbar/zbar/0.10/zbar-0.10.tar.bz2
description :
	 Suite of barcodes-reading tools
build_deps :
	 pkg-config
link_deps :
	 freetype
	 imagemagick
	 jpeg
	 libtool
	 ufraw
	 xz
	 :x11
conflicts :
patches :
EOF_patch :
	 diff --git a/zbar/jpeg.c b/zbar/jpeg.c
	 index fb566f4..d1c1fb2 100644
	 --- a/zbar/jpeg.c
	 +++ b/zbar/jpeg.c
	 @@ -79,8 +79,15 @@ int fill_input_buffer (j_decompress_ptr cinfo)
	 void skip_input_data (j_decompress_ptr cinfo,
	 long num_bytes)
	 {
	 -    cinfo->src->next_input_byte = NULL;
	 -    cinfo->src->bytes_in_buffer = 0;
	 +    if (num_bytes > 0) {
	 +        if (num_bytes < cinfo->src->bytes_in_buffer) {
	 +            cinfo->src->next_input_byte += num_bytes;
	 +            cinfo->src->bytes_in_buffer -= num_bytes;
	 +        }
	 +        else {
	 +            fill_input_buffer(cinfo);
	 +        }
	 +    }
	 }
	 void term_source (j_decompress_ptr cinfo)
install :
	 if build.head?
	 inreplace "configure.ac", "-Werror", ""
	 gettext = Formula["gettext"]
	 system "autoreconf", "-fvi", "-I", "#{gettext.opt_share}/aclocal"