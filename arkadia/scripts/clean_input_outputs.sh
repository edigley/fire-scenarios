#!/bin/bash

rm output/*
rm Trace/*
rm trace/*

cd input/
for i in `seq 1 10`; do rm pob_${i}*.*; rm gen_${i}_ind_*.???; done
rm gen_0_ind_*.???
rm pob_0_errors.txt
rm scenario*.ini

cd ..

rm Settings.txt
rm timed_output*.txt
rm gmon.out

exit 0;
