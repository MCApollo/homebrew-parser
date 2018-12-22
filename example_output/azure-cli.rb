name :
	 AzureCli
homepage :
	 https://docs.microsoft.com/cli/azure/overview
url :
	 https://azurecliprod.blob.core.windows.net/releases/azure-cli-2.0.52.tar.gz
description :
	 Microsoft Azure CLI 2.0
build_deps :
link_deps :
	 openssl
	 python
conflicts :
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 site_packages = libexec/"lib/python#{xy}/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", site_packages
	 ENV.prepend "LDFLAGS", "-L#{Formula["openssl"].opt_lib}"
	 ENV.prepend "CFLAGS", "-I#{Formula["openssl"].opt_include}"
	 ENV.prepend "CPPFLAGS", "-I#{Formula["openssl"].opt_include}"
	 components = [
	 buildpath/"src/azure-cli",
	 buildpath/"src/azure-cli-core",
	 buildpath/"src/azure-cli-nspkg",
	 buildpath/"src/azure-cli-command_modules-nspkg",
	 ]
	 components += Pathname.glob(buildpath/"src/command_modules/azure-cli-*/")
	 deps = resources.map(&:name).to_set - ["futures"]
	 deps.each do |r|
	 resource(r).stage do
	 system "python3", *Language::Python.setup_install_args(libexec)
	 end
	 end
	 components.each do |item|
	 cd item do
	 system "python3", *Language::Python.setup_install_args(libexec)
	 end
	 end
	 File.open(site_packages/"azure/__init__.py", "w") {}
	 File.open(site_packages/"azure/cli/__init__.py", "w") {}
	 File.open(site_packages/"azure/cli/command_modules/__init__.py", "w") {}
	 File.open(site_packages/"azure/mgmt/__init__.py", "w") {}
	 (bin/"az").write <<~EOS
	 #!/usr/bin/env bash
	 export PYTHONPATH="#{ENV["PYTHONPATH"]}"
	 if command -v python#{xy} >/dev/null 2>&1; then
	 python#{xy} -m azure.cli \"$@\"
	 else
	 python3 -m azure.cli \"$@\"
	 fi
	 EOS
	 bash_completion.install "az.completion" => "az"
	 end
	 test do
	 json_text = shell_output("#{bin}/az cloud show --name AzureCloud")
	 azure_cloud = JSON.parse(json_text)
	 assert_equal azure_cloud["name"], "AzureCloud"
	 assert_equal azure_cloud["endpoints"]["management"], "https://management.core.windows.net/"
	 assert_equal azure_cloud["endpoints"]["resourceManager"], "https://management.azure.com/"
	 end
