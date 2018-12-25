name :
	 Passenger
homepage :
	 https://www.phusionpassenger.com/
url :
	 https://github.com/phusion/passenger/releases/download/release-6.0.0/passenger-6.0.0.tar.gz
description :
	 Server for Ruby, Python, and Node.js apps via Apache/NGINX
build_deps :
link_deps :
	 :macos
	 openssl
	 pcre
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.delete("SDKROOT")
	 inreplace "src/ruby_supportlib/phusion_passenger/platform_info/openssl.rb" do |s|
	 s.gsub! "-I/usr/local/opt/openssl/include", "-I#{Formula["openssl"].opt_include}"
	 s.gsub! "-L/usr/local/opt/openssl/lib", "-L#{Formula["openssl"].opt_lib}"
	 end
	 system "rake", "apache2" if build.with? "apache2-module"
	 system "rake", "nginx"
	 (libexec/"download_cache").mkpath
	 rm_rf "buildout/libev"
	 rm_rf "buildout/libuv"
	 rm_rf "buildout/cache"
	 necessary_files = %w[configure Rakefile README.md CONTRIBUTORS
	 CONTRIBUTING.md LICENSE CHANGELOG package.json
	 passenger.gemspec build bin doc images man dev src
	 resources buildout]
	 libexec.mkpath
	 cp_r necessary_files, libexec, :preserve => true
	 bin.install_symlink Dir["#{libexec}/bin/*"]
	 locations_ini = `/usr/bin/ruby ./bin/passenger-config --make-locations-ini --for-native-packaging-method=homebrew`
	 locations_ini.gsub!(/=#{Regexp.escape Dir.pwd}/, "=#{libexec}")
	 (libexec/"src/ruby_supportlib/phusion_passenger/locations.ini").write(locations_ini)
	 ruby_libdir = `/usr/bin/ruby ./bin/passenger-config about ruby-libdir`.strip
	 ruby_libdir.gsub!(/^#{Regexp.escape Dir.pwd}/, libexec)
	 system "/usr/bin/ruby", "./dev/install_scripts_bootstrap_code.rb",
	 "--ruby", ruby_libdir, *Dir[libexec/"bin/*"]
	 system("/usr/bin/ruby ./bin/passenger-config compile-nginx-engine")
	 cp Dir["buildout/support-binaries/nginx*"], libexec/"buildout/support-binaries", :preserve => true
	 nginx_addon_dir = `/usr/bin/ruby ./bin/passenger-config about nginx-addon-dir`.strip
	 nginx_addon_dir.gsub!(/^#{Regexp.escape Dir.pwd}/, libexec)
	 system "/usr/bin/ruby", "./dev/install_scripts_bootstrap_code.rb",
	 "--nginx-module-config", libexec/"bin", "#{nginx_addon_dir}/config"
	 mv libexec/"man", share
	 end
	 def caveats
	 s = <<~EOS
	 To activate Phusion Passenger for Nginx, run:
	 brew install nginx --with-passenger
	 EOS
	 s += <<~EOS if build.with? "apache2-module"
	 To activate Phusion Passenger for Apache, create /etc/apache2/other/passenger.conf:
	 LoadModule passenger_module #{opt_libexec}/buildout/apache2/mod_passenger.so
	 PassengerRoot #{opt_libexec}/src/ruby_supportlib/phusion_passenger/locations.ini
	 PassengerDefaultRuby /usr/bin/ruby
	 EOS
	 s
