name :
	 Mergepbx
homepage :
	 https://github.com/simonwagner/mergepbx
url :
	 https://github.com/simonwagner/mergepbx/archive/v0.10.tar.gz
description :
	 Merge XCode project files in git
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['dummy_base', 'dummy_mine', 'dummy_theirs']
	 ['https://raw.githubusercontent.com/simonwagner/mergepbx/a9bd9d8f4a732eff989ea03fbc0d78f6f6fb594f/test/fixtures/merge/dummy/dummy1/project.pbxproj.base', 'https://raw.githubusercontent.com/simonwagner/mergepbx/a9bd9d8f4a732eff989ea03fbc0d78f6f6fb594f/test/fixtures/merge/dummy/dummy1/project.pbxproj.mine', 'https://raw.githubusercontent.com/simonwagner/mergepbx/a9bd9d8f4a732eff989ea03fbc0d78f6f6fb594f/test/fixtures/merge/dummy/dummy1/project.pbxproj.theirs']
patches :
EOF_patch :
install :
	 system "./build.py"
	 bin.install "mergepbx"
