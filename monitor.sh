#!/bin/bash
declare -a app_pid
declare -a app_cpu
declare -a app_mem
declare -i app_cpu_total
declare -i app_mem_total

while true; do
	app_pid=`ps aux | grep $1 | grep -v grep | awk '{print $2}'`
	app_cpu=`ps aux | grep $1 | grep -v grep | awk '{print $3*100}'`
	app_mem=`ps aux | grep $1 | grep -v grep | awk '{print $4*100}'`

	for i in ${app_cpu[@]}; do
			let app_cpu_total+=$i
	done

	for i in ${app_mem[@]}; do
			let app_mem_total+=$i
	done

	echo "CPU: $app_cpu_total, MEM: $app_mem_total"

	app_cpu_total=0
	app_mem_total=0
	
	sleep $2
done

