name :
	 Swftools
homepage :
	 http://www.swftools.org/
url :
	 http://www.swftools.org/swftools-0.9.2.tar.gz
description :
	 SWF manipulation and generation tools
build_deps :
link_deps :
	 :x11
optional_deps :
conflicts :
resource :
	 ['xpdf']
	 ['https://src.fedoraproject.org/repo/pkgs/xpdf/xpdf-3.04.tar.gz/3bc86c69c8ff444db52461270bef3f44/xpdf-3.04.tar.gz']
patches :
EOF_patch :
	 --- a/configure	2012-04-08 10:25:35.000000000 -0700
	 +++ b/configure	2012-04-09 17:42:10.000000000 -0700
	 @@ -6243,7 +6243,7 @@
	 int main()
	 {
	 -	char*data = fftw_malloc(sizeof(fftwf_complex)*600*800);
	 +	char*data = fftwf_malloc(sizeof(fftwf_complex)*600*800);
	 fftwf_plan plan = fftwf_plan_dft_2d(600, 800, (fftwf_complex*)data, (fftwf_complex*)data, FFTW_FORWARD, FFTW_ESTIMATE);
	 plan = fftwf_plan_dft_r2c_2d(600, 800, (float*)data, (fftwf_complex*)data, FFTW_ESTIMATE);
	 plan = fftwf_plan_dft_c2r_2d(600, 800, (fftwf_complex*)data, (float*)data, FFTW_ESTIMATE);
install :
	 (buildpath/"lib/pdf").install resource("xpdf") if build.with? "xpdf"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
