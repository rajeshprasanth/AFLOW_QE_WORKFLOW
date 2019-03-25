#!/bin/bash
#
# Created on Mon Mar 25 06:23:16 IST 2019
#
#------------------------#
# AFLOW PATH DEFINITIONS #
#------------------------#
AFLOW_PATH="/usr/share/espresso/aflow/bin"
#
#----------------------------------------------------------#
# Read input POSCAR and rewrite to AFLOW STD POSCAR format #
#----------------------------------------------------------#
#
INP_POSCAR=$1

$AFLOW_PATH/aflow --poscar < $INP_POSCAR > aflow.std_poscar

#--------------------------------------------------------#
# Convert aflow.std_poscar to POSCAR (CONVENTIONAL CELL) #
#--------------------------------------------------------#
# aflow --std_conv | --standard_conventional | --sconv | --sc < POSCAR 

$AFLOW_PATH/aflow --std_conv < aflow.std_poscar > aflow.std_conv_poscar

#-----------------------------------------------------#
# Convert aflow.std_poscar to POSCAR (PRIMITIVE CELL) #
#-----------------------------------------------------#
# aflow --std_prim | --standard_primitive | --sprim | --sp < POSCAR

$AFLOW_PATH/aflow --std_prim < aflow.std_poscar > aflow.std_prim_poscar
