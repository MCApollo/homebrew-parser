name :
	 Eiffelstudio
homepage :
	 https://www.eiffel.com
url :
	 https://ftp.eiffel.com/pub/download/17.01/eiffelstudio-17.01.9.9700.tar
description :
	 Development environment for the Eiffel language
build_deps :
	 pkg-config
link_deps :
	 gtk+
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./compile_exes", ise_platform
	 system "./make_images", ise_platform
	 prefix.install Dir["Eiffel_17.01/*"]
	 bin.mkpath
	 env = { :ISE_EIFFEL => prefix, :ISE_PLATFORM => ise_platform }
	 (bin/"ec").write_env_script(prefix/"studio/spec/#{ise_platform}/bin/ec", env)
	 (bin/"ecb").write_env_script(prefix/"studio/spec/#{ise_platform}/bin/ecb", env)
	 (bin/"estudio").write_env_script(prefix/"studio/spec/#{ise_platform}/bin/estudio", env)
	 (bin/"finish_freezing").write_env_script(prefix/"studio/spec/#{ise_platform}/bin/finish_freezing", env)
	 (bin/"compile_all").write_env_script(prefix/"tools/spec/#{ise_platform}/bin/compile_all", env)
	 (bin/"iron").write_env_script(prefix/"tools/spec/#{ise_platform}/bin/iron", env)
	 (bin/"syntax_updater").write_env_script(prefix/"tools/spec/#{ise_platform}/bin/syntax_updater", env)
	 (bin/"vision2_demo").write_env_script(prefix/"vision2_demo/spec/#{ise_platform}/bin/vision2_demo", env)
