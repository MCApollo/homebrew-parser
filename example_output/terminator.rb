name :
	 Terminator
homepage :
	 https://gnometerminator.blogspot.com/p/introduction.html
url :
description :
	 Multiple terminals in one window
build_deps :
	 intltool
	 pkg-config
link_deps :
	 pango
	 pygobject
	 pygtk
	 python@2
	 vte
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/terminatorlib/cwd.py b/terminatorlib/cwd.py
	 index 7b17d84..e3bdbad 100755
	 --- a/terminatorlib/cwd.py
	 +++ b/terminatorlib/cwd.py
	 @@ -49,6 +49,11 @@ def get_pid_cwd():
	 func = sunos_get_pid_cwd
	 else:
	 dbg('Unable to determine a get_pid_cwd for OS: %s' % system)
	 +        try:
	 +            import psutil
	 +            func = generic_cwd
	 +        except (ImportError):
	 +            dbg('psutil not found')
	 return(func)
	 @@ -71,4 +76,9 @@ def sunos_get_pid_cwd(pid):
	 """Determine the cwd for a given PID on SunOS kernels"""
	 return(proc_get_pid_cwd(pid, '/proc/%s/path/cwd'))
	 +def generic_cwd(pid):
	 +    """Determine the cwd using psutil which also supports Darwin"""
	 +    import psutil
	 +    return psutil.Process(pid).as_dict()['cwd']
	 +
install :
	 ENV.prepend_create_path "PYTHONPATH", lib/"python2.7/site-packages"
	 system "python", *Language::Python.setup_install_args(prefix)
	 system "#{Formula["gtk"].opt_bin}/gtk-update-icon-cache", "-f",
	 "-t", "#{HOMEBREW_PREFIX}/share/icons/hicolor"
