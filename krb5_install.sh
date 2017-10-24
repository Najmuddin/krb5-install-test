#!/bin/bash

REQD_PACKAGES=krb5-server krb5-libs
MISSING=""
for pkgs in $REQD_PACKAGES; do
	rpm -q $pkgs
	if [ $? -ne 0 ]; then
		$MISSING="$MISSING $pkgs"
	fi
done

yum install -y $REQD_PACKAGES

# check installed packages.

rpm -q $REQD_PACKAGES

if [ $? -ne '0' ] ; then
  echo "Please install $REQD_PACKAGES manually"
  exit 1
fi 


