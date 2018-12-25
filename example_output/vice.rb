name :
	 Vice
homepage :
	 https://vice-emu.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/vice-emu/releases/vice-3.2.tar.gz
description :
	 Versatile Commodore Emulator
build_deps :
	 pkg-config
	 texinfo
	 xa
	 yasm
link_deps :
	 ffmpeg
	 flac
	 giflib
	 jpeg
	 lame
	 libogg
	 libpng
	 libvorbis
	 mpg123
	 portaudio
	 sdl2
	 xz
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/src/gfxoutputdrv/ffmpegdrv.c b/src/gfxoutputdrv/ffmpegdrv.c
	 index 4748348..8169be4 100644
	 --- a/src/gfxoutputdrv/ffmpegdrv.c
	 +++ b/src/gfxoutputdrv/ffmpegdrv.c
	 @@ -360,7 +360,7 @@ static int ffmpegdrv_open_audio(AVFormatContext *oc, AVStream *st)
	 }
	 audio_is_open = 1;
	 -    if (c->codec->capabilities & CODEC_CAP_VARIABLE_FRAME_SIZE) {
	 +    if (c->codec->capabilities & AV_CODEC_CAP_VARIABLE_FRAME_SIZE) {
	 audio_inbuf_samples = 10000;
	 } else {
	 audio_inbuf_samples = c->frame_size;
	 @@ -454,7 +454,7 @@ static int ffmpegmovie_init_audio(int speed, int channels, soundmovie_buffer_t *
	 /* Some formats want stream headers to be separate. */
	 if (ffmpegdrv_oc->oformat->flags & AVFMT_GLOBALHEADER)
	 -        c->flags |= CODEC_FLAG_GLOBAL_HEADER;
	 +        c->flags |= AV_CODEC_FLAG_GLOBAL_HEADER;
	 /* create resampler context */
	 #ifndef HAVE_FFMPEG_AVRESAMPLE
	 @@ -787,7 +787,7 @@ static void ffmpegdrv_init_video(screenshot_t *screenshot)
	 /* Some formats want stream headers to be separate. */
	 if (ffmpegdrv_oc->oformat->flags & AVFMT_GLOBALHEADER) {
	 -        c->flags |= CODEC_FLAG_GLOBAL_HEADER;
	 +        c->flags |= AV_CODEC_FLAG_GLOBAL_HEADER;
	 }
	 if (audio_init_done) {
	 @@ -967,6 +967,7 @@ static int ffmpegdrv_record(screenshot_t *screenshot)
	 video_st.frame->pts = video_st.next_pts++;
	 +#ifdef AVFMT_RAWPICTURE
	 if (ffmpegdrv_oc->oformat->flags & AVFMT_RAWPICTURE) {
	 AVPacket pkt;
	 VICE_P_AV_INIT_PACKET(&pkt);
	 @@ -977,7 +978,9 @@ static int ffmpegdrv_record(screenshot_t *screenshot)
	 pkt.pts = pkt.dts = video_st.frame->pts;
	 ret = VICE_P_AV_INTERLEAVED_WRITE_FRAME(ffmpegdrv_oc, &pkt);
	 -    } else {
	 +    } else
	 +#endif
	 +    {
	 AVPacket pkt = { 0 };
	 int got_packet;
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking",
	 "--disable-arch",
	 "--disable-bundle",
	 "--enable-external-ffmpeg",
	 "--enable-sdlui2"
	 system "make", "install"
