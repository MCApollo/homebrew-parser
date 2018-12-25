name :
	 CdDiscid
homepage :
	 http://linukz.org/cd-discid.shtml
url :
description :
	 Read CD and get CDDB discid information
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/cd-discid.c b/cd-discid.c
	 index 9b0b40a..2c96641 100644
	 --- a/cd-discid.c
	 +++ b/cd-discid.c
	 @@ -93,7 +93,7 @@
	 #define cdth_trk1               lastTrackNumberInLastSessionLSB
	 #define cdrom_tocentry          CDTrackInfo
	 #define cdte_track_address      trackStartAddress
	 -#define DEVICE_NAME             "/dev/disk1"
	 +#define DEVICE_NAME             "/dev/rdisk1"
	 #else
	 #error "Your OS isn't supported yet."
	 @@ -236,8 +236,7 @@ int main(int argc, char *argv[])
	 * TocEntry[last-1].lastRecordedAddress + 1, so we compute the start
	 * of leadout from the start+length of the last track instead
	 */
	 -	TocEntry[last].cdte_track_address = TocEntry[last - 1].trackSize +
	 -		TocEntry[last - 1].trackStartAddress;
	 +TocEntry[last].cdte_track_address = htonl(ntohl(TocEntry[last-1].trackSize) + ntohl(TocEntry[last-1].trackStartAddress));
	 #else   /* FreeBSD, Linux, Solaris */
	 for (i = 0; i < last; i++) {
	 /* tracks start with 1, but I must start with 0 on OpenBSD */
	 @@ -260,12 +259,12 @@ int main(int argc, char *argv[])
	 /* release file handle */
	 close(drive);
	 -#if defined(__FreeBSD__)
	 +#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__)
	 TocEntry[i].cdte_track_address = ntohl(TocEntry[i].cdte_track_address);
	 #endif
	 for (i = 0; i < last; i++) {
	 -#if defined(__FreeBSD__)
	 +#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__)
	 TocEntry[i].cdte_track_address = ntohl(TocEntry[i].cdte_track_address);
	 #endif
	 cksum += cddb_sum((TocEntry[i].cdte_track_address + CD_MSF_OFFSET) / CD_FRAMES);
install :
	 system "make", "CC=#{ENV.cc}"
	 bin.install "cd-discid"
	 man1.install "cd-discid.1"
