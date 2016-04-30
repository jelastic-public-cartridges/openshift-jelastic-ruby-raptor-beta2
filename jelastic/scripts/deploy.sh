#!/bin/bash

inherit default exceptor output;
inherit php-common-deploy ;
inherit ruby-common;

$PROGRAM unzip;

[ -n "${NGRUBYDEPLOY_VERSION:-}" ] && return 0;
NGRUBYDEPLOY="0.1";

function _setEnvApp(){
    local bundle_type=$1;

    echo "rails_env ${bundle_type};" > /etc/nginx/ruby.env
    chown -hR ${DATA_OWNER} /etc/nginx/ruby.env 2>>"$JEM_CALLS_LOG"

}

[[ -n "${WEBROOT}" ]] && [ ! -d "$WEBROOT" ] && mkdir -p ${WEBROOT};

[ -e "${MANAGE_CORE_PATH}/${COMPUTE_TYPE}"-deploy.lib ] && { include ${COMPUTE_TYPE}-deploy; }

function _setContext(){
    local context=$1;
    log "context: $context" ;
}

function prepareContext(){
    local context=$1;
    if ! $GREP -q ${context} <<< "development production test" ; then 
	    writeJSONResponceErr "result=>4079" "message=>Invalid context name specified" ; exit 4079;
    fi
    echo "${context}" > /var/lib/jelastic/env;
    bundle_type=$context;
    APPWEBROOT=${WEBROOT}/ROOT/;
}

function _finishDeploy(){
    _bundleInstall;
    _updateOwnership $APPWEBROOT;
    _clearCache;
    #service cartridge restart 2>/dev/null 1>/dev/null;
}

function _undeploy(){
    local context=$1;
#   if [[ ${COMPUTE_TYPE} == "apache-ruby" ]]
#   then
    	shopt -s dotglob;
		rm -Rf $WEBROOT/ROOT/* ;
    	shopt -u dotglob;
        return 0;
#   fi
}

function _renameContext(){
    local newContext=$1;
    local oldContext=$2;
    if ! $GREP -q ${oldContext} <<< "development production test" ;then
            writeJSONResponceErr "result=>4079" "message=>Invalid context name specified: ${oldContext}" ; exit 4079;
    fi
    if ! $GREP -q ${newContext} <<< "development production test" ; then
            writeJSONResponceErr "result=>4079" "message=>Invalid context name specified: ${newContext}" ; exit 4079;
    fi

    echo "${newContext}" > /var/lib/jelastic/env;

    stopService ${SERVICE} > /dev/null 2>&1;

    _bundleInstall 

    startService ${SERVICE} > /dev/null 2>&1;

    _updateOwnership "$WEBROOT/ROOT"
}

function describeDeploy(){
    echo "deploy ruby application \n\t\t -u \t <package URL> \n\t\t -c \t <context> \n\t\t -e \t zip | tar | tar.gz | tar.bz";
}

function describeUndeploy(){
    echo "undeploy ruby application \n\t\t -c \t <context>";
}

function describeRename(){
    echo "rename ruby context \n\t\t -n \t <new context> \n\t\t -o \t <old context>\n\t\t -e \t <extension>";
}
