#!/bin/bash

export KERNELNAME="LoliKernel"

export LOCALVERSION=1.4

export KBUILD_BUILD_USER=Prooholic

export KBUILD_BUILD_HOST=LoliServer

export TOOLCHAIN=gcc

export DEVICES=whyred

source helper

gen_toolchain

send_msg "Start building ${KERNELNAME} ${LOCALVERSION} for ${DEVICES}..."

START=$(date +"%s")

for i in ${DEVICES//,/ }
do
	build ${i} -oldcam -OC

	build ${i} -newcam -OC
done

END=$(date +"%s")

DIFF=$(( END - START ))

send_msg "Build succesfully in $((DIFF / 60))m $((DIFF % 60))s"

