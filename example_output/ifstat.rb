name :
	 Ifstat
homepage :
	 http://gael.roualland.free.fr/ifstat/
url :
	 http://gael.roualland.free.fr/ifstat/ifstat-1.1.tar.gz
description :
	 Tool to report network interface bandwidth
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/drivers.c b/drivers.c
	 index d5ac501..47fb320 100644
	 --- a/drivers.c
	 +++ b/drivers.c
	 @@ -593,7 +593,8 @@ static int get_ifcount() {
	 int ifcount[] = {
	 CTL_NET, PF_LINK, NETLINK_GENERIC, IFMIB_SYSTEM, IFMIB_IFCOUNT
	 };
	 -  int count, size;
	 +  int count;
	 +  size_t size;
	 size = sizeof(count);
	 if (sysctl(ifcount, sizeof(ifcount) / sizeof(int), &count, &size, NULL, 0) < 0) {
	 @@ -607,7 +608,7 @@ static int get_ifdata(int index, struct ifmibdata * ifmd) {
	 int ifinfo[] = {
	 CTL_NET, PF_LINK, NETLINK_GENERIC, IFMIB_IFDATA, index, IFDATA_GENERAL
	 };
	 -  int size = sizeof(*ifmd);
	 +  size_t size = sizeof(*ifmd);
	 if (sysctl(ifinfo, sizeof(ifinfo) / sizeof(int), ifmd, &size, NULL, 0) < 0)
	 return 0;
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
