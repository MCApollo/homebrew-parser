name :
	 Mkvdts2ac3
homepage :
	 https://github.com/JakeWharton/mkvdts2ac3
url :
description :
	 Convert DTS audio to AC3 within a matroska file
build_deps :
link_deps :
	 ffmpeg
	 mkvtoolnix
conflicts :
patches :
EOF_patch :
	 diff --git a/mkvdts2ac3.sh b/mkvdts2ac3.sh
	 index 270f768..156d60d 100755
	 --- a/mkvdts2ac3.sh
	 +++ b/mkvdts2ac3.sh
	 @@ -355,8 +355,18 @@ if [ $EXECUTE = 1 ]; then
	 checkdep perl
	 fi
	 +
	 +MKVTOOLNIXVERSION=$(mkvmerge -V | cut -d " " -f 2 | sed s/\[\^0-9\]//g)
	 +if [ ${MKVTOOLNIXVERSION} -lt 670 ]; then
	 +	AUDIOTRACKPREFIX="audio (A_"
	 +	VIDEOTRACKPREFIX="video (V_"
	 +else
	 +	AUDIOTRACKPREFIX="audio ("
	 +	VIDEOTRACKPREFIX="video ("
	 +fi
	 +
	 -if [ "$(mkvmerge -i "$MKVFILE" | grep -i "A_AC3")" ]; then
	 +if [ "$(mkvmerge -i "$MKVFILE" | grep -i "${AUDIOTRACKPREFIX}AC3")" ]; then
	 echo $"AC3 track already exists in '$MKVFILE'."
	 if [ $FORCE = 0 ]; then
	 echo $"Use -f or --force argument to bypass this check."
	 @@ -389,11 +399,11 @@ doprint $"WORKING DIRECTORY: $WD"
	 if [ -z $DTSTRACK ]; then
	 doprint ""
	 doprint $"Find first DTS track in MKV file."
	 -	doprint "> mkvmerge -i \"$MKVFILE\" | grep -m 1 \"audio (A_DTS)\" | cut -d ":" -f 1 | cut -d \" \" -f 3"
	 +	doprint "> mkvmerge -i \"$MKVFILE\" | grep -m 1 \"${AUDIOTRACKPREFIX}DTS)\" | cut -d ":" -f 1 | cut -d \" \" -f 3"
	 DTSTRACK="DTSTRACK" #Value for debugging
	 dopause
	 if [ $EXECUTE = 1 ]; then
	 -		DTSTRACK=$(mkvmerge -i "$MKVFILE" | grep -m 1 "audio (A_DTS)" | cut -d ":" -f 1 | cut -d " " -f 3)
	 +		DTSTRACK=$(mkvmerge -i "$MKVFILE" | grep -m 1 "${AUDIOTRACKPREFIX}DTS)" | cut -d ":" -f 1 | cut -d " " -f 3)
	 if [ -z $DTSTRACK ]; then
	 @@ -405,10 +415,10 @@ if [ -z $DTSTRACK ]; then
	 else
	 doprint $"Checking to see if DTS track specified via arguments is valid."
	 -	doprint "> mkvmerge -i \"$MKVFILE\" | grep \"Track ID $DTSTRACK: audio (A_DTS)\""
	 +	doprint "> mkvmerge -i \"$MKVFILE\" | grep \"Track ID $DTSTRACK: ${AUDIOTRACKPREFIX}DTS)\""
	 dopause
	 if [ $EXECUTE = 1 ]; then
	 -		VALID=$(mkvmerge -i "$MKVFILE" | grep "Track ID $DTSTRACK: audio (A_DTS)")
	 +		VALID=$(mkvmerge -i "$MKVFILE" | grep "Track ID $DTSTRACK: ${AUDIOTRACKPREFIX}DTS)")
	 if [ -z "$VALID" ]; then
	 error $"Track ID '$DTSTRACK' is not a DTS track and/or does not exist."
	 @@ -555,14 +565,14 @@ else
	 if [ $NODTS ]; then
	 -		AUDIOTRACKS=$(mkvmerge -i "$MKVFILE" | grep "audio (A_" | wc -l)
	 +		AUDIOTRACKS=$(mkvmerge -i "$MKVFILE" | grep "$AUDIOTRACKPREFIX" | wc -l)
	 if [ $AUDIOTRACKS -eq 1 ]; then
	 CMD="$CMD -A"
	 else
	 -			SAVETRACKS=$(mkvmerge -i "$MKVFILE" | grep "audio (A_" | cut -d ":" -f 1 | grep -vx "Track ID $DTSTRACK" | cut -d " " -f 3 | awk '{ if (T == "") T=$1; else T=T","$1 } END { print T }')
	 +			SAVETRACKS=$(mkvmerge -i "$MKVFILE" | grep "$AUDIOTRACKPREFIX" | cut -d ":" -f 1 | grep -vx "Track ID $DTSTRACK" | cut -d " " -f 3 | awk '{ if (T == "") T=$1; else T=T","$1 } END { print T }')
	 CMD="$CMD -a \"$SAVETRACKS\""
	 @@ -576,7 +586,7 @@ else
	 fi
	 -	VIDEOTRACK=$(mkvmerge -i "$MKVFILE" | grep -m 1 "video (V_" | cut -d ":" -f 1 | cut -d " " -f 3)
	 +	VIDEOTRACK=$(mkvmerge -i "$MKVFILE" | grep -m 1 "$VIDEOTRACKPREFIX" | cut -d ":" -f 1 | cut -d " " -f 3)
	 CMD="$CMD --compression $VIDEOTRACK:$COMP \"$MKVFILE\""
install :
	 bin.install "mkvdts2ac3.sh" => "mkvdts2ac3"
