name :
	 Rclone
homepage :
	 https://rclone.org/
url :
	 https://github.com/ncw/rclone/archive/v1.45.tar.gz
description :
	 Rsync for cloud storage
build_deps :
	 go
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
	 mkdir_p buildpath/"src/github.com/ncw/"
	 ln_s buildpath, buildpath/"src/github.com/ncw/rclone"
	 system "go", "build", "-o", bin/"rclone"
	 man1.install "rclone.1"
	 system bin/"rclone", "genautocomplete", "bash", "rclone.bash"
	 system bin/"rclone", "genautocomplete", "zsh", "_rclone"
	 bash_completion.install "rclone.bash" => "rclone"
	 zsh_completion.install "_rclone"
