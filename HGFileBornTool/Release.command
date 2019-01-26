#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 运行终端的函数
function run {
	echo "Executing command: $@"
	$@
	if [[ $? != "0" ]]; then
		echo "Executing the above command has failed!"
		exit 1
	fi
}

#  这个有点厉害
function run_at {
	pushd $1
	shift
	run $@
	popd
}

# 执行 make
run_at ${DIR} "make"

echo "==================CoderHG(done)=================="

exit;
