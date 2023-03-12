#!/system/bin/sh
{
	MODDIR=${0%/*}
	MODULES=${MODDIR%/*}
	NVBASE=${MODULES%/*}
	rm $NVBASE/rvmmt/__PKGNAME_rv.apk
	rmdir $NVBASE/rvhc
	if __ISBNDL :; then
		until [ "$(getprop sys.boot_completed)" = 1 ]; do sleep 1; done
		sleep 15
		pm uninstall __PKGNAME
	fi
} &
