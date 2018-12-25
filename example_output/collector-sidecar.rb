name :
	 CollectorSidecar
homepage :
	 https://github.com/Graylog2/collector-sidecar
url :
	 https://github.com/Graylog2/collector-sidecar/archive/0.1.7.tar.gz
description :
	 Manage log collectors through Graylog
build_deps :
	 glide
	 go
	 mercurial
link_deps :
	 filebeat
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
	 (buildpath/"src/github.com/Graylog2/collector-sidecar").install buildpath.children
	 cd "src/github.com/Graylog2/collector-sidecar" do
	 inreplace "main.go", "/etc", etc
	 inreplace "collector_sidecar.yml" do |s|
	 s.gsub! "/usr", HOMEBREW_PREFIX
	 s.gsub! "/etc", etc
	 s.gsub! "/var", var
	 end
	 system "glide", "install"
	 system "make", "build"
	 (etc/"graylog/collector-sidecar").install "collector_sidecar.yml"
	 bin.install "graylog-collector-sidecar"
	 prefix.install_metafiles
	 end
