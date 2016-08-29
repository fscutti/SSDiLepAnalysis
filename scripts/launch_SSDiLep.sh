#!/bin/bash

#inDS="data15_13TeV"
#sample="DAOD_EXOT12.07668731._000011.pool.root.1"


inDS="mc15_13TeV"
sample="DAOD_EXOT12.07627500._000006.pool.root.1"


infilepath="/data/fscutti/${inDS}/${sample}"


# ------------------------------------------------------------------------------------

# tokenize inDS using '.' as separator
#
tokens=(${inDS//./ })
configpath="$ROOTCOREBIN/user_scripts/SSDiLepAnalysis/jobOptions_SSDiLep.py"
current_time="$(date +'%d-%m-%Y-%T')"
outdir=output_local_DxAOD-2015-13TeV_${tokens[2]}_${current_time}
nevents=200

echo ""
echo "Input file path :"
echo ""
echo ${infilepath}
echo ""
echo "Configuring job with :"
echo ""
echo ${configpath}
echo ""
echo "Output will be stored in :"
echo ""
echo ${outdir}
echo ""

xAH_run.py -vv --files ${infilepath} --config ${configpath} --submitDir ${outdir} --nevents ${nevents} direct
