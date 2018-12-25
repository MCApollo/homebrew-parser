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
optional_deps :
conflicts :
resource :
	 ['cffi', 'img2pdf', 'pikepdf', 'Pillow', 'pycparser', 'python-xmp-toolkit', 'pytz', 'reportlab', 'ruffus']
	 ['https://files.pythonhosted.org/packages/e7/a7/4cd50e57cc6f436f1cc3a7e8fa700ff9b8b4d471620629074913e3735fb2/cffi-1.11.5.tar.gz', 'https://files.pythonhosted.org/packages/3e/40/aa7b63857908566b76d1849065a700248b088bf502c244e839fa2548d99e/img2pdf-0.3.1.tar.gz', 'https://files.pythonhosted.org/packages/09/ef/db0bc644097f52382f8040633ca8bc49b04a54dfbf76147c495398e2949b/pikepdf-0.3.5.tar.gz', 'https://files.pythonhosted.org/packages/d3/c4/b45b9c0d549f482dd072055e2d3ced88f3b977f7b87c7a990228b20e7da1/Pillow-5.2.0.tar.gz', 'https://files.pythonhosted.org/packages/8c/2d/aad7f16146f4197a11f8e91fb81df177adcc2073d36a17b1491fd09df6ed/pycparser-2.18.tar.gz', 'https://files.pythonhosted.org/packages/5b/0b/4f95bc448e4e30eb0e831df0972c9a4b3efa8f9f76879558e9123215a7b7/python-xmp-toolkit-2.0.1.tar.gz', 'https://files.pythonhosted.org/packages/ca/a9/62f96decb1e309d6300ebe7eee9acfd7bccaeedd693794437005b9067b44/pytz-2018.5.tar.gz', 'https://files.pythonhosted.org/packages/70/4c/19fe74b800e7d74b3dd636137aac6e8df4b19286e318c1a5b6d8ca4b17fd/reportlab-3.5.6.tar.gz', 'https://files.pythonhosted.org/packages/ea/32/5048607dd7a9104406789b15fb4078e774121b23190c9e464d4dd1f7ed89/ruffus-2.7.0.tar.gz']
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
	 end
	 ENV.append "CFLAGS", "-I#{MacOS.sdk_path}/System/Library/Frameworks/Tk.framework/Versions/8.5/Headers" unless MacOS::CLT.installed?
	 venv.pip_install Pathname.pwd
	 end
	 res = resources.map(&:name).to_set - ["Pillow"]
	 res.each do |r|
	 venv.pip_install resource(r)
	 end
	 venv.pip_install_and_link buildpath
