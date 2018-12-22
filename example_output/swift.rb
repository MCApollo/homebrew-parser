name :
	 Swift
homepage :
	 https://github.com/apple/swift
url :
	 https://github.com/apple/swift/archive/swift-4.2.1-RELEASE.tar.gz
description :
	 High-performance system programming language
build_deps :
	 cmake
	 ninja
link_deps :
	 :xcode
conflicts :
patches :
EOF_patch :
install :
	 workspace = buildpath.parent
	 build = workspace/"build"
	 toolchain_prefix = "/Swift-#{version}.xctoolchain"
	 install_prefix = "#{toolchain_prefix}/usr"
	 ln_sf buildpath, "#{workspace}/swift"
	 resources.each { |r| r.stage("#{workspace}/#{r.name}") }
	 mkdir build do
	 components = %w[
	 compiler clang-resource-dir-symlink
	 clang-builtin-headers-in-clang-resource-dir stdlib sdk-overlay tools
	 editor-integration testsuite-tools toolchain-dev-tools license
	 sourcekit-xpc-service swift-remote-mirror
	 swift-remote-mirror-headers
	 ]
	 system "#{workspace}/swift/utils/build-script",
	 "--release", "--assertions",
	 "--no-swift-stdlib-assertions",
	 "--build-subdir=#{build}",
	 "--llbuild", "--swiftpm",
	 "--",
	 "--workspace=#{workspace}",
	 "--build-args=-j#{ENV.make_jobs}",
	 "--install-destdir=#{prefix}",
	 "--toolchain-prefix=#{toolchain_prefix}",
	 "--install-prefix=#{install_prefix}",
	 "--host-target=macosx-x86_64",
	 "--stdlib-deployment-targets=macosx-x86_64",
	 "--build-swift-static-stdlib",
	 "--build-swift-dynamic-stdlib",
	 "--build-swift-static-sdk-overlay",
	 "--build-swift-dynamic-sdk-overlay",
	 "--build-swift-stdlib-unittest-extra",
	 "--install-swift",
	 "--swift-install-components=#{components.join(";")}",
	 "--llvm-install-components=clang;libclang;libclang-headers",
	 "--install-llbuild",
	 "--install-swiftpm"
	 end
