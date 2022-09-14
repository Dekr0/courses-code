#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Tue Sep 06 22:33:52 MDT 2022
# SW Build 2902540 on Wed May 27 19:54:35 MDT 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto 07f246235d9a46818812bbdd9160842b --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot bcd_tb_behav xil_defaultlib.bcd_tb -log elaborate.log"
xelab -wto 07f246235d9a46818812bbdd9160842b --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot bcd_tb_behav xil_defaultlib.bcd_tb -log elaborate.log
