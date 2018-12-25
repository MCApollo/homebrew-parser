name :
	 Afsctool
homepage :
	 https://brkirch.wordpress.com/afsctool/
url :
	 https://dl.bintray.com/homebrew/mirror/afsctool-1.6.4.zip
description :
	 Utility for manipulating HFS+ compressed files
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/vfx01j/afsctool/commit/26293a3809c9ad1db5f9bff9dffaefb8e201a089.diff?full_index=1
EOF_patch :
	 diff --git a/afsctool_34/afsctool.c b/afsctool_34/afsctool.c
	 index 8713407fa673f216e69dfc36152c39bc1dea4fe7..7038859f43e035be44c9b8cfbb1bb76a93e26e0a 100644
	 --- a/afsctool_34/afsctool.c
	 +++ b/afsctool_34/afsctool.c
	 @@ -104,8 +104,8 @@ void compressFile(const char *inFile, struct stat *inFileInfo, long long int max
	 if (statfs(inFile, &fsInfo) < 0)
	 return;
	 -	if (fsInfo.f_type != 17 && fsInfo.f_type != 23) {
	 -		printf("Expecting f_type of 17 or 23. f_type is %i.\n", fsInfo.f_type);
	 +	if (fsInfo.f_type != 17 && fsInfo.f_type != 23 && fsInfo.f_type != 24) {
	 +		printf("Expecting f_type of 17, 23 or 24. f_type is %i.\n", fsInfo.f_type);
	 return;
	 }
	 if (!S_ISREG(inFileInfo->st_mode))
install :
	 system ENV.cc, ENV.cflags, "-lz", "afsctool.c",
	 "-framework", "CoreServices", "-o", "afsctool"
	 bin.install "afsctool"
