#! /bin/bash

for template_file in `find | grep -v '\.git' |grep -v analyze |  grep -E 'conf$|ini$'`
do
    config_file=`echo ${template_file} | sed 's/\.\//\/etc\//'`
    if [ -f ${config_file} ]; then
        echo "check ${config_file} start"
        output=`echo ${template_file} | awk -F/ '{print $NF}'`
        dt=`date +%m_%d-%H_%M_%S`
        python analyze_opts.py -s ${template_file} -c ${config_file} $1 $2 > ${output}_${dt}.log
    else
        echo "Config file ${config_file} not exist, skip it"
    fi
done