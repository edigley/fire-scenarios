#!/bin/bash

version=$1
nCores=$2
simulationFile=$3

farsiteMPI="/home/edigley/doutorado_uab/playpen/farsite4P_serial"
farsiteSerial="/home/edigley/doutorado_uab/playpen/farsite4P_serial"

if [ "${version}" = "mpi" ]
then
    mpirun -np ${nCores} ${farsiteMPI} -f ${nCores} -i ${simulationFile} >/dev/null 2>&1
else
    ${farsiteSerial} -f ${nCores} -i ${simulationFile} >/dev/null 2>&1
fi

exit $?

