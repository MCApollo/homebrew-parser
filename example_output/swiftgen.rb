name :
	 Swiftgen
homepage :
	 https://github.com/SwiftGen/SwiftGen
url :
	 https://github.com/SwiftGen/SwiftGen.git
description :
	 Swift code generator for assets, storyboards, Localizable.strings, …
build_deps :
link_deps :
	 ruby
	 :xcode
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["NO_CODE_LINT"] = "1"
	 ENV["GEM_HOME"] = buildpath/"gem_home"
	 system "gem", "install", "bundler"
	 ENV.prepend_path "PATH", buildpath/"gem_home/bin"
	 system "bundle", "install", "--without", "development", "release"
	 system "bundle", "exec", "rake", "cli:install[#{bin},#{lib},#{pkgshare}/templates]"
	 fixtures = {
	 "Tests/Fixtures/Resources/Colors/colors.xml"                                   => "colors.xml",
	 "Tests/Fixtures/Resources/Fonts"                                               => "Fonts",
	 "Tests/Fixtures/Resources/IB-iOS"                                              => "IB-iOS",
	 "Tests/Fixtures/Resources/Plist/good"                                          => "Plist",
	 "Tests/Fixtures/Resources/Strings/Localizable.strings"                         => "Localizable.strings",
	 "Tests/Fixtures/Resources/XCAssets"                                            => "XCAssets",
	 "Tests/Fixtures/Resources/YAML/good"                                           => "YAML",
	 "Tests/Fixtures/Generated/Colors/swift4-context-defaults.swift"                => "colors.swift",
	 "Tests/Fixtures/Generated/Fonts/swift4-context-defaults.swift"                 => "fonts.swift",
	 "Tests/Fixtures/Generated/IB-iOS/scenes-swift4-context-all.swift"              => "ib-scenes.swift",
	 "Tests/Fixtures/Generated/Plist/runtime-swift4-context-all.swift"              => "plists.swift",
	 "Tests/Fixtures/Generated/Strings/structured-swift4-context-localizable.swift" => "strings.swift",
	 "Tests/Fixtures/Generated/XCAssets/swift4-context-all.swift"                   => "xcassets.swift",
	 "Tests/Fixtures/Generated/YAML/inline-swift4-context-all.swift"                => "yaml.swift",
	 }
	 (pkgshare/"fixtures").install fixtures
