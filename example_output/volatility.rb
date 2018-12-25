name :
	 Volatility
homepage :
	 https://github.com/volatilityfoundation/volatility
url :
	 https://downloads.volatilityfoundation.org/releases/2.6/volatility-2.6.zip
description :
	 Advanced memory forensics framework
build_deps :
link_deps :
	 freetype
	 jpeg
	 python@2
	 yara
optional_deps :
conflicts :
resource :
	 ['distorm3', 'yara-python', 'pycrypto', 'Pillow', 'openpyxl', 'et_xmlfile', 'jdcal', 'ujson', 'pytz', 'ipython', 'appnope', 'backports.shutil_get_terminal_size', 'decorator', 'enum34', 'ipython_genutils', 'pathlib2', 'pexpect', 'pickleshare', 'prompt_toolkit', 'ptyprocess', 'Pygments', 'simplegeneric', 'six', 'traitlets', 'wcwidth']
	 ['https://files.pythonhosted.org/packages/28/f9/8ff25a8f3edb581b5bc0efbed6382dcca22e5e7eff39464346c629105739/distorm3-3.3.4.zip', 'https://files.pythonhosted.org/packages/3e/6c/ec2453fd811ea2f8c157d196b4dd76eb3c229362918fdb661358bd3e8645/yara-python-3.5.0.tar.gz', 'https://files.pythonhosted.org/packages/60/db/645aa9af249f059cc3a368b118de33889219e0362141e75d4eaf6f80f163/pycrypto-2.6.1.tar.gz', 'https://files.pythonhosted.org/packages/46/4f/94f6165052774839b4a4af0c72071aa528d5dc8cb8bc6bb43e24a55c10cc/Pillow-3.4.2.tar.gz', 'https://files.pythonhosted.org/packages/dc/f2/c57f9f00f8ae5e1a73cb096dbf600433724f037ffcbd51c456f89da5efd9/openpyxl-2.4.1.tar.gz', 'https://files.pythonhosted.org/packages/22/28/a99c42aea746e18382ad9fb36f64c1c1f04216f41797f2f0fa567da11388/et_xmlfile-1.0.1.tar.gz', 'https://files.pythonhosted.org/packages/9b/fa/40beb2aa43a13f740dd5be367a10a03270043787833409c61b79e69f1dfd/jdcal-1.3.tar.gz', 'https://files.pythonhosted.org/packages/16/c4/79f3409bc710559015464e5f49b9879430d8f87498ecdc335899732e5377/ujson-1.35.tar.gz', 'https://files.pythonhosted.org/packages/d0/e1/aca6ef73a7bd322a7fc73fd99631ee3454d4fc67dc2bee463e2adf6bb3d3/pytz-2016.10.tar.bz2', 'https://files.pythonhosted.org/packages/89/63/a9292f7cd9d0090a0f995e1167f3f17d5889dcbc9a175261719c513b9848/ipython-5.1.0.tar.gz', 'https://files.pythonhosted.org/packages/26/34/0f3a5efac31f27fabce64645f8c609de9d925fe2915304d1a40f544cff0e/appnope-0.1.0.tar.gz', 'https://files.pythonhosted.org/packages/ec/9c/368086faa9c016efce5da3e0e13ba392c9db79e3ab740b763fe28620b18b/backports.shutil_get_terminal_size-1.0.0.tar.gz', 'https://files.pythonhosted.org/packages/13/8a/4eed41e338e8dcc13ca41c94b142d4d20c0de684ee5065523fee406ce76f/decorator-4.0.10.tar.gz', 'https://files.pythonhosted.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876/enum34-1.1.6.tar.gz', 'https://files.pythonhosted.org/packages/71/b7/a64c71578521606edbbce15151358598f3dfb72a3431763edc2baf19e71f/ipython_genutils-0.1.0.tar.gz', 'https://files.pythonhosted.org/packages/c9/27/8448b10d8440c08efeff0794adf7d0ed27adb98372c70c7b38f3947d4749/pathlib2-2.1.0.tar.gz', 'https://files.pythonhosted.org/packages/e8/13/d0b0599099d6cd23663043a2a0bb7c61e58c6ba359b2656e6fb000ef5b98/pexpect-4.2.1.tar.gz', 'https://files.pythonhosted.org/packages/69/fe/dd137d84daa0fd13a709e448138e310d9ea93070620c9db5454e234af525/pickleshare-0.7.4.tar.gz', 'https://files.pythonhosted.org/packages/83/14/5ac258da6c530eca02852ee25c7a9ff3ca78287bb4c198d0d0055845d856/prompt_toolkit-1.0.9.tar.gz', 'https://files.pythonhosted.org/packages/db/d7/b465161910f3d1cef593c5e002bff67e0384898f597f1a7fdc8db4c02bf6/ptyprocess-0.5.1.tar.gz', 'https://files.pythonhosted.org/packages/b8/67/ab177979be1c81bc99c8d0592ef22d547e70bb4c6815c383286ed5dec504/Pygments-2.1.3.tar.gz', 'https://files.pythonhosted.org/packages/3d/57/4d9c9e3ae9a255cd4e1106bb57e24056d3d0709fc01b2e3e345898e49d5b/simplegeneric-0.8.1.zip', 'https://files.pythonhosted.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz', 'https://files.pythonhosted.org/packages/b1/d6/5b5aa6d5c474691909b91493da1e8972e309c9f01ecfe4aeafd272eb3234/traitlets-4.3.1.tar.gz', 'https://files.pythonhosted.org/packages/55/11/e4a2bb08bb450fdbd42cc709dd40de4ed2c472cf0ccb9e64af22279c5495/wcwidth-0.1.7.tar.gz']
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec)
	 resource("Pillow").stage do
	 inreplace "setup.py" do |s|
	 sdkprefix = MacOS.sdk_path_if_needed ? MacOS.sdk_path : ""
	 s.gsub! "openjpeg.h", "probably_not_a_header_called_this_eh.h"
	 s.gsub! "ZLIB_ROOT = None", "ZLIB_ROOT = ('#{sdkprefix}/usr/lib', '#{sdkprefix}/usr/include')"
	 s.gsub! "JPEG_ROOT = None",
	 "JPEG_ROOT = ('#{Formula["jpeg"].opt_prefix}/lib', " \
	 "'#{Formula["jpeg"].opt_prefix}/include')"
	 s.gsub! "FREETYPE_ROOT = None",
	 "FREETYPE_ROOT = ('#{Formula["freetype"].opt_prefix}/lib', " \
	 "'#{Formula["freetype"].opt_prefix}/include')"
	 end
	 begin
	 deleted = ENV.delete "SDKROOT"
	 unless MacOS::CLT.installed?
	 ENV.append "CFLAGS", "-I#{MacOS.sdk_path}/System/Library/Frameworks/Tk.framework/Versions/8.5/Headers"
	 end
	 venv.pip_install Pathname.pwd
	 ensure
	 ENV["SDKROOT"] = deleted
	 end
