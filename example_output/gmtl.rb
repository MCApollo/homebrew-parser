name :
	 Gmtl
homepage :
	 https://ggt.sourceforge.io/
url :
description :
	 Lightweight math library
build_deps :
	 scons
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://gist.githubusercontent.com/anonymous/c16cad998a4903e6b3a8/raw/e4669b3df0e14996c7b7b53937dd6b6c2cbc7c04/gmtl_Sconstruct.diff
EOF_patch :
	 diff --git a/SConstruct b/SConstruct
	 index 8326a89..2eb7ff0 100644
	 --- a/SConstruct
	 +++ b/SConstruct
	 @@ -126,7 +126,9 @@ def BuildDarwinEnvironment():
	 exp = re.compile('^(.*)\/Python\.framework.*$')
	 m = exp.search(distutils.sysconfig.get_config_var('prefix'))
	 -   framework_opt = '-F' + m.group(1)
	 +   framework_opt = None
	 +   if m:
	 +      framework_opt = '-F' + m.group(1)
	 CXX = os.environ.get("CXX", WhereIs('g++'))
	 @@ -138,7 +140,10 @@ def BuildDarwinEnvironment():
	 LINK = CXX
	 CXXFLAGS = ['-ftemplate-depth-256', '-DBOOST_PYTHON_DYNAMIC_LIB',
	 -               '-Wall', framework_opt, '-pipe']
	 +               '-Wall', '-pipe']
	 +
	 +   if framework_opt is not None:
	 +      CXXFLAGS.append(framework_opt)
	 compiler_ver       = match_obj.group(1)
	 compiler_major_ver = int(match_obj.group(2))
	 @@ -152,7 +157,10 @@ def BuildDarwinEnvironment():
	 CXXFLAGS += ['-Wno-long-double', '-no-cpp-precomp']
	 SHLIBSUFFIX = distutils.sysconfig.get_config_var('SO')
	 -   SHLINKFLAGS = ['-bundle', framework_opt, '-framework', 'Python']
	 +   SHLINKFLAGS = ['-bundle']
	 +
	 +   if framework_opt is not None:
	 +      SHLINKFLAGS.extend([framework_opt, '-framework', 'Python'])
	 LINKFLAGS = []
install :
	 scons "install", "prefix=#{prefix}"
