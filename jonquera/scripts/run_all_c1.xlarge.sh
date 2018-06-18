#!/bin/bash

for pC in `seq 1 9`; do
	for pM in `seq 1 9`; do
		sed "s/pCrossover       = 0.5/pCrossover       = 0.${pC}/" scenario_template.ini | sed "s/pMutation        = 0.1/pMutation        = 0.${pM}/" > input/scenario_10_g_128_ipg_0.${pC}_pC_0.${pM}_pM_2_c1.xlarge.ini
	done;
done;

for pC in `seq 1 9`; do
	for pM in `seq 1 9`; do
		c=${pC};m=${pM}; scenario="scenario_10_g_128_ipg_0.${c}_pC_0.${m}_pM_2_c1.xlarge"; time mpirun -np 4 /home/sgeadmin/two_stage_prediction_framework/spif/genetic ${c}${m} input/${scenario}.ini > output/${scenario}.txt 
		mkdir -p resultados/${c}${m} && cp output/raster_10_* output/GenAlError_${c}${m}.dat output/${scenario}.* input/${scenario}.* resultados/${c}${m} && mv time_output.txt resultados/${c}${m}/${scenario}_farsite_time_outputs.txt
	done;
done;


exit 0;
