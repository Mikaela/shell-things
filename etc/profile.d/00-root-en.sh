# European/standardizedish English for root
if [[ "$(id -u)" == "0" ]]; then
	unset LC_ALL
	unset LANGUAGE
	export LANG="en_DK.UTF-8"
	export LC_CTYPE="en_DK.UTF-8"
	export LC_NUMERIC="en_DK.UTF-8"
	export LC_TIME="en_DK.UTF-8"
	export LC_COLLATE="en_DK.UTF-8"
	export LC_MONETARY="en_DK.UTF-8"
	export LC_MESSAGES="en_DK.UTF-8"
	export LC_PAPER="en_DK.UTF-8"
	export LC_NAME="en_DK.UTF-8"
	export LC_ADDRESS="en_DK.UTF-8"
	export LC_TELEPHONE="en_DK.UTF-8"
	export LC_MEASUREMENT="en_DK.UTF-8"
	export LC_IDENTIFICATION="en_DK.UTF-8"
fi
