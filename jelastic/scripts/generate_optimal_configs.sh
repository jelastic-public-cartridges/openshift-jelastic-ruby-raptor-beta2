#!/bin/bash

source /etc/environment 

version=`passenger-config --version`

if [[ $version =~ 4.* ]] ;then

    gem install passenger --pre >>/opt/repo/log/out.log 2>&1 ;

    gem uninstall passenger -v `gem list|grep passenger|grep -o "4[.0-9]*"` >>/opt/repo/log/out.log 2>&1 ;

    passenger-config install-agent >>/opt/repo/log/out.log 2>&1 ;

    passenger-config install-standalone-runtime >>/opt/repo/log/out.log 2>&1 ;

    passenger-config build-native-support >>/opt/repo/log/out.log 2>&1 ;
    
    [ -f $GEM_HOME/gems/passenger-`gem list|grep passenger|grep -o "5[.0-9a-z]*"`/lib/phusion_passenger/standalone/start_command/builtin_engine.rb ] && { sed -ib_q 's/ecape/escape/' $GEM_HOME/gems/passenger-`gem list|grep passenger|grep -o "5[.0-9a-z]*"`/lib/phusion_passenger/standalone/start_command/builtin_engine.rb; }

fi
