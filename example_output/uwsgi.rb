name :
	 Uwsgi
homepage :
	 https://uwsgi-docs.readthedocs.org/en/latest/
url :
description :
	 Full stack for building hosting services
build_deps :
	 pkg-config
link_deps :
	 go
	 openssl
	 pcre
	 python@2
	 yajl
	 libyaml
	 python
	 zeromq
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/726bff4/uwsgi/libpython-tbd-xcode-sdk.diff
EOF_patch :
install :
	 if MacOS.version == :sierra || MacOS.version == :el_capitan
	 ENV["SDKROOT"] = MacOS.sdk_path
