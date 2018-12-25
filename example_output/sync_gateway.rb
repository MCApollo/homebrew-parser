name :
	 SyncGateway
homepage :
	 https://docs.couchbase.com/sync-gateway
url :
	 https://github.com/couchbase/sync_gateway.git
description :
	 Make Couchbase Server a replication endpoint for Couchbase Lite
build_deps :
	 gnupg
	 go
link_deps :
optional_deps :
conflicts :
resource :
	 ['depot_tools']
	 ['https://chromium.googlesource.com/chromium/tools/depot_tools.git']
patches :
EOF_patch :
install :
	 repo_cache = HOMEBREW_CACHE/"repo_cache/#{name}/.repo"
	 repo_cache.mkpath
	 (buildpath/"depot_tools").install resource("depot_tools")
	 ENV.prepend_path "PATH", buildpath/"depot_tools"
	 (buildpath/"build").install_symlink repo_cache
	 cp Dir["*.sh"], "build"
	 git_commit = `git rev-parse HEAD`.chomp
	 manifest = buildpath/"new-manifest.xml"
	 manifest.write Utils.popen_read "python", "rewrite-manifest.sh",
	 "--manifest-url",
	 "file://#{buildpath}/manifest/default.xml",
	 "--project-name", "sync_gateway",
	 "--set-revision", git_commit
	 cd "build" do
	 mkdir "godeps"
	 system "repo", "init", "-u", stable.url, "-m", "manifest/default.xml"
	 cp manifest, ".repo/manifest.xml"
	 system "repo", "sync"
	 system "sh", "build.sh", "-v"
	 mv "godeps/bin", prefix
	 end
