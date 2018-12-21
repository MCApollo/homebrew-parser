name :
	 Aamath
	 SumSymbol
	 ProductSymbol
	 OpSymbol
	 SumOrProduct
homepage :
	 http://fuse.superglue.se/aamath/
url :
	 http://fuse.superglue.se/aamath/aamath-0.3.tar.gz
description :
	 Renders mathematical expressions as ASCII art
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
	 diff --git a/expr.cc b/expr.cc
	 index 7bc0ee3..8f4eaf7 100644
	 --- a/expr.cc
	 +++ b/expr.cc
	 @@ -1192,7 +1192,7 @@ IntegralOnInterval::render_head() const
	 public:
	 -	void render(Canvas& c, int r, int c) const;
	 +	void render(Canvas& canvas, int r, int c) const;
	 };
	 void
	 @@ -1208,7 +1208,7 @@ SumSymbol::render(Canvas& canvas, int r, int c) const
	 public:
	 -	void render(Canvas& c, int r, int c) const;
	 +	void render(Canvas& canvas, int r, int c) const;
	 };
	 void
	 @@ -1612,7 +1612,7 @@ Matrix::render() const
	 int cols = num_cols();
	 int rows = num_rows();
	 -	CanvasPtr ec[cols * rows];
	 +	CanvasPtr *ec = new CanvasPtr[cols * rows];
	 Size sz[cols * rows];
	 int row_height[rows];
	 @@ -1692,6 +1692,8 @@ Matrix::render() const
	 canvas->center();
	 +    delete[] ec;
	 +
	 return canvas;
	 }
	 diff --git a/expr.h b/expr.h
	 index 000ebd4..d233da9 100644
	 --- a/expr.h
	 +++ b/expr.h
	 @@ -451,7 +451,7 @@ class Integral : public OpOnFunction {
	 virtual CanvasPtr render_head() const;
	 -	void render_symbol(Canvas& c, int r, int c, int h) const;
	 +	void render_symbol(Canvas& canvas, int r, int c, int h) const;
	 virtual CanvasPtr render() const;
	 };
	 @@ -467,7 +467,7 @@ class IntegralOnInterval : public Integral, public OpOverInterval {
	 public:
	 -	virtual void render(Canvas& c, int r, int c) const = 0;
	 +	virtual void render(Canvas& canvas, int r, int c) const = 0;
	 };
install :
	 ENV.deparallelize
	 system "make"
	 bin.install "aamath"
	 man1.install "aamath.1"
	 prefix.install "testcases"
