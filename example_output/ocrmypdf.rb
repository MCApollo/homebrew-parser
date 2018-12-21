name :
	 Ocrmypdf
homepage :
	 https://github.com/jbarlow83/OCRmyPDF
url :
	 https://files.pythonhosted.org/packages/c1/32/06c0381653284bab21b26612dee0c923440f35143e59a43a744e4cf1bd12/ocrmypdf-7.2.1.tar.gz
description :
	 Adds an OCR text layer to scanned PDF files
build_deps :
	 pkg-config
link_deps :
	 exempi
	 freetype
	 ghostscript
	 jbig2enc
	 jpeg
	 leptonica
	 libpng
	 pngquant
	 pybind11
	 python
	 qpdf
	 tesseract
	 unpaper
conflicts :
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 resource("Pillow").stage do
	 inreplace "setup.py" do |s|
	 sdkprefix = MacOS.sdk_path_if_needed ? MacOS.sdk_path : ""
	 s.gsub! "openjpeg.h", "probably_not_a_header_called_this_eh.h"
	 s.gsub! "ZLIB_ROOT = None", "ZLIB_ROOT = ('#{sdkprefix}/usr/lib', '#{sdkprefix}/usr/include')"
	 s.gsub! "JPEG_ROOT = None", "JPEG_ROOT = ('#{Formula["jpeg"].opt_prefix}/lib', '#{Formula["jpeg"].opt_prefix}/include')"
	 s.gsub! "FREETYPE_ROOT = None", "FREETYPE_ROOT = ('#{Formula["freetype"].opt_prefix}/lib', '#{Formula["freetype"].opt_prefix}/include')"
