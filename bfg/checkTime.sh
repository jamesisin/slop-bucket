#! /usr/bin/env bash 
# Title   :  checkTime.sh 
# Parent  :  .sh 
# Author  :  JamesIsIn 20190918  Do something nice today.  

# Purpose :   
# 

## 

############### 
#  Variables  # 

declare -i timeMinutes 
declare -i timeSleep 

# # debugging 
# 
# # 

## 

############### 
#  Functions  # 

function func_checkTime() { 
	timeMinutes="$( date +%M )" 
	timeMinutes=$(( 10#${timeMinutes} )) 
	until [[ "${timeMinutes}" -ge 25 && "${timeMinutes}" -lt 50 ]] ; do 
		if [[  "${timeMinutes}" -lt 25  ]] ; then 
			timeSleep="$(( 60 * ( 25 - "${timeMinutes}" ) ))" 
		elif [[  "${timeMinutes}" -ge 50  ]] ; then 
			timeSleep="$(( 60 * ( 35 - ( "${timeMinutes}" - 50 ) ) ))" 
		fi 
		printf '%b\n' "I cannot run this next command between the times XX:50 and XX:25.  " "I will sleep for ${timeSleep} seconds and try again.  " "" 
		sleep "${timeSleep}" 
		timeMinutes="$( date +%M )" 
		timeMinutes="$(( 10#${timeMinutes} ))" 
	done 
	return 
} 

function main() { 
	func_checkTime 
} 

## 

########## 
#  Main  # 

main 

exit $? 

## 
