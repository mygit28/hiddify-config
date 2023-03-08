#!/bin/bash
function main(){
	systemctl status --no-pager hiddify-nginx hiddify-xray haproxy|cat

for s in netdata other/**/*.service **/*.service haproxy;do
	s=${s##*/}
	s=${s%%.*}
	printf "%-30s %-30s \n" $s $(systemctl is-active $s)
done




}
mkdir -p log/system/
main |& tee log/system/status.log
