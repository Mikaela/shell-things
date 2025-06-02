# Computer English for root
if [[ "$(id -u)" == "0" ]]; then
	unset LC_ALL
	unset LANGUAGE
	export LANG="C.utf8"
	export LC_CTYPE="C.utf8"
	export LC_NUMERIC="C.utf8"
	export LC_TIME="C.utf8"
	export LC_COLLATE="C.utf8"
	export LC_MONETARY="C.utf8"
	export LC_MESSAGES="C.utf8"
	export LC_PAPER="C.utf8"
	export LC_NAME="C.utf8"
	export LC_ADDRESS="C.utf8"
	export LC_TELEPHONE="C.utf8"
	export LC_MEASUREMENT="C.utf8"
	export LC_IDENTIFICATION="C.utf8"
fi
