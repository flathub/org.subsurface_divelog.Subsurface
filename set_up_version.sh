# set up the Subsurface versions by hand
# taken from https://github.com/Subsurface-divelog/subsurface/blob/master/packaging/ios/build.sh#L56
# and appended the .0, since otherwise the updatcheck page on subsurface-divelog.org returns that we're running a development version
CANONICALVERSION=$(git describe --abbrev=12 | sed -e 's/-g.*$// ; s/^v//' | sed -e 's/-/./')
MOBILEVERSION=$(grep MOBILE cmake/Modules/version.cmake | cut -d\" -f 2)
echo "#define GIT_VERSION_STRING \"$CANONICALVERSION\"" > ssrf-version.h
echo "#define CANONICAL_VERSION_STRING \"$CANONICALVERSION.0\"" >> ssrf-version.h
echo "#define MOBILE_VERSION_STRING \"$MOBILEVERSION\"" >> ssrf-version.h
