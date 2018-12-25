name :
	 Weboob
homepage :
	 http://weboob.org/
url :
	 https://symlink.me/attachments/download/356/weboob-1.3.tar.gz
description :
	 Web Outside of Browsers
build_deps :
link_deps :
	 freetype
	 gnupg
	 jpeg
	 libyaml
	 python@2
optional_deps :
conflicts :
resource :
	 ['Pillow', 'PyYAML', 'certifi', 'chardet', 'cssselect', 'futures', 'html2text', 'html5lib', 'idna', 'lxml', 'mechanize', 'olefile', 'python-dateutil', 'requests', 'six', 'urllib3', 'webencodings']
	 ['https://files.pythonhosted.org/packages/e0/82/ec499c78bfe4ecaa91c2f3000040451d187ed0a816d58b8543e29c48827f/Pillow-4.3.0.tar.gz', 'https://files.pythonhosted.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz', 'https://files.pythonhosted.org/packages/23/3f/8be01c50ed24a4bd6b8da799839066ce0288f66f5e11f0367323467f0cbc/certifi-2017.11.5.tar.gz', 'https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz', 'https://files.pythonhosted.org/packages/77/ff/9c865275cd19290feba56344eba570e719efb7ca5b34d67ed12b22ebbb0d/cssselect-1.0.1.tar.gz', 'https://files.pythonhosted.org/packages/1f/9e/7b2ff7e965fc654592269f2906ade1c7d705f1bf25b7d469fa153f7d19eb/futures-3.2.0.tar.gz', 'https://files.pythonhosted.org/packages/dd/10/d257bb28d08b3e8a864ed28829508564cc4a864ba0a79fda42e4393f6842/html2text-2017.10.4.tar.gz', 'https://files.pythonhosted.org/packages/85/3e/cf449cf1b5004e87510b9368e7a5f1acd8831c2d6691edd3c62a0823f98f/html5lib-1.0.1.tar.gz', 'https://files.pythonhosted.org/packages/f4/bd/0467d62790828c23c47fc1dfa1b1f052b24efdf5290f071c7a91d0d82fd3/idna-2.6.tar.gz', 'https://files.pythonhosted.org/packages/e1/4c/d83979fbc66a2154850f472e69405572d89d2e6a6daee30d18e83e39ef3a/lxml-4.1.1.tar.gz', 'https://files.pythonhosted.org/packages/a7/ac/7f54bcf39b62cd56dec461f4c5e2d7c096508ab2b283c7ee099a466e1b9f/mechanize-0.3.6.tar.gz', 'https://files.pythonhosted.org/packages/35/17/c15d41d5a8f8b98cc3df25eb00c5cee76193114c78e5674df6ef4ac92647/olefile-0.44.zip', 'https://files.pythonhosted.org/packages/54/bb/f1db86504f7a49e1d9b9301531181b00a1c7325dc85a29160ee3eaa73a54/python-dateutil-2.6.1.tar.gz', 'https://files.pythonhosted.org/packages/b0/e1/eab4fc3752e3d240468a8c0b284607899d2fbfb236a56b7377a329aa8d09/requests-2.18.4.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/ee/11/7c59620aceedcc1ef65e156cc5ce5a24ef87be4107c2b74458464e437a5d/urllib3-1.22.tar.gz', 'https://files.pythonhosted.org/packages/0b/02/ae6ceac1baeda530866a85075641cec12989bd8d31af6d5ab4a3e8c92f47/webencodings-0.5.1.tar.gz']
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec)
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
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 res = resources.map(&:name).to_set - ["Pillow"]
	 res.each do |r|
	 venv.pip_install resource(r)
	 end
	 venv.pip_install_and_link buildpath
