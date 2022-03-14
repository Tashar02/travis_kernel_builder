#bin/#!/bin/bash

###############################   MISC   ###################################

	gut() {
		git clone --depth=1 -q $@
	}

	inform() {
		telegram-send "setup: $@"
	}

############################################################################

######################## Setup Telegram API ################################

	pip install telegram-send
	sed -i s/demo1/${BOT_API_KEY}/g telegram-send.conf
	sed -i s/demo2/${CHAT_ID}/g telegram-send.conf
	mkdir $HOME/.config
	mv telegram-send.conf $HOME/.config/telegram-send.conf

############################################################################

############################## Setup Toolchains ############################

	inform 'Cloning toolchains'
	mkdir toolchains
#	gut https://github.com/mvaisakh/gcc-arm64.git -b gcc-master toolchains/gcc-arm64
	gut https://github.com/mvaisakh/gcc-arm.git -b gcc-master toolchains/gcc-arm32
	gut https://gitlab.com/dakkshesh07/neutron-clang.git toolchains/clang

############################################################################

############################## Setup AnyKernel #############################

	inform 'Cloning AK3'
	gut https://github.com/Tashar02/AnyKernel3-4.19.git AnyKernel3

############################################################################

############################## Setup Kernel ################################

	inform 'Cloning Kernel'
	gut https://github.com/Atom-X-Devs/android_kernel_xiaomi_scarlet.git -b test-QTI-2 Kernel

############################################################################

############################ Setup Scripts #################################

	mv build.sh Kernel/build.sh
	cd Kernel
	bash build.sh

############################################################################
