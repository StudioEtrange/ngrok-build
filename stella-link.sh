#!/bin/bash
_STELLA_LINK_CURRENT_FILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
STELLA_ROOT=$_STELLA_LINK_CURRENT_FILE_DIR/../stella
STELLA_APP_ROOT=$_STELLA_LINK_CURRENT_FILE_DIR
[ ! -f "$STELLA_ROOT/stella.sh" ] && echo "** WARNING Stella is missing"

ACTION=$1
case $ACTION in
	include)
		source "$STELLA_ROOT/conf.sh"
		__init_stella_env
		;;

	bootstrap)
		cd "$_STELLA_LINK_CURRENT_FILE_DIR"
		curl -sSL https://raw.githubusercontent.com/StudioEtrange/stella/master/nix/pool/stella-bridge.sh -o stella-bridge.sh
		chmod +x stella-bridge.sh
		./stella-bridge.sh bootstrap
		rm -f stella-bridge.sh
		;;
	nothing)
		;;
	*) 
		$STELLA_ROOT/stella.sh $*
		;;
esac
