name :
	 GoAT14
homepage :
	 https://golang.org
url :
	 https://github.com/golang/go.git
description :
	 Go programming environment (1.4)
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.refurbish_args
	 if build.with? "cc-all"
	 targets = [
	 ["linux",   ["386", "amd64", "arm"]],
	 ["freebsd", ["386", "amd64", "arm"]],
	 ["netbsd",  ["386", "amd64", "arm"]],
	 ["openbsd", ["386", "amd64"]],
	 ["windows", ["386", "amd64"]],
	 ["dragonfly", ["386", "amd64"]],
	 ["plan9",   ["386", "amd64"]],
	 ["solaris", ["amd64"]],
	 ["darwin",  ["386", "amd64"]],
	 ]
	 elsif build.with? "cc-common"
	 targets = [
	 ["linux",   ["386", "amd64", "arm"]],
	 ["windows", ["386", "amd64"]],
	 ["darwin",  ["386", "amd64"]],
	 ]
	 else
	 targets = [["darwin", [""]]]
