name :
	 Solid
homepage :
	 http://www.dtecta.com/
url :
	 http://www.dtecta.com/files/solid-3.5.6.tgz
description :
	 Collision detection library for geometric objects in 3D space
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
	 diff --git a/include/MT/Quaternion.h b/include/MT/Quaternion.h
	 index 3726b4f..3393697 100644
	 --- a/include/MT/Quaternion.h
	 +++ b/include/MT/Quaternion.h
	 @@ -154,7 +154,7 @@ namespace MT {
	 Quaternion<Scalar> inverse() const
	 {
	 -			return conjugate / length2();
	 +			return conjugate() / length2();
	 }
	 Quaternion<Scalar> slerp(const Quaternion<Scalar>& q, const Scalar& t) const
	 diff --git a/src/complex/DT_CBox.h b/src/complex/DT_CBox.h
	 index 7fc7c5d..16ce972 100644
	 --- a/src/complex/DT_CBox.h
	 +++ b/src/complex/DT_CBox.h
	 @@ -131,4 +131,6 @@ inline DT_CBox operator-(const DT_CBox& b1, const DT_CBox& b2)
	 b1.getExtent() + b2.getExtent());
	 }
	 +inline DT_CBox computeCBox(MT_Scalar margin, const MT_Transform& xform);
	 +
	 #endif
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-debug",
	 "--prefix=#{prefix}",
	 "--infodir=#{info}"
	 inreplace "Makefile", " examples ", " "
	 system "make", "install"
