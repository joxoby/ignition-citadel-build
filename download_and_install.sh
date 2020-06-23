for PACKAGE in "$@"
do
  FILENAME="$PACKAGE.deb"
  curl -L "https://dl.bintray.com/joxoby/ignition-citadel/$PACKAGE/dev/$PACKAGE" -o $FILENAME
  dpkg -i $FILENAME
done
