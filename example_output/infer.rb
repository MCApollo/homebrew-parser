name :
	 Infer
homepage :
	 https://fbinfer.com/
url :
	 https://github.com/facebook/infer.git
description :
	 Static analyzer for Java, C, C++, and Objective-C
build_deps :
	 autoconf
	 automake
	 cmake
	 libtool
	 ocaml
	 opam
	 pkg-config
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 ENV.permit_arch_flags
	 ENV.libcxx if ENV.compiler == :clang
	 opamroot = buildpath/"opamroot"
	 opamroot.mkpath
	 ENV["OPAMROOT"] = opamroot
	 ENV["OPAMYES"] = "1"
	 ENV["INFER_CONFIGURE_OPTS"] = "--prefix=#{prefix} --without-fcp-clang"
	 llvm_args = %w[
	 -DLLVM_INCLUDE_DOCS=OFF
	 -DLLVM_INSTALL_UTILS=OFF
	 -DLLVM_TARGETS_TO_BUILD=all
	 -DLIBOMP_ARCH=x86_64
	 -DLLVM_BUILD_EXTERNAL_COMPILER_RT=ON
	 -DLLVM_BUILD_LLVM_DYLIB=ON
	 ]
	 system "opam", "init", "--no-setup"
	 ocaml_version = File.read("build-infer.sh").match(/OCAML_VERSION_DEFAULT=\"([^\"]+)\"/)[1]
	 ocaml_version_number = ocaml_version.split("+", 2)[0]
	 inreplace "#{opamroot}/compilers/#{ocaml_version_number}/#{ocaml_version}/#{ocaml_version}.comp",
	 '["./configure"', '["./configure" "-no-graph"'
	 inreplace "infer/src/base/Version.ml.in", "let is_release = is_yes \"@IS_RELEASE_TREE@\"", "let is_release = true"
	 inreplace "facebook-clang-plugins/clang/setup.sh", "CMAKE_ARGS=(", "CMAKE_ARGS=(\n  " + llvm_args.join("\n  ")
	 system "./build-infer.sh", "all", "--yes"
	 system "opam", "config", "exec", "--switch=infer-#{ocaml_version}", "--", "make", "install"
