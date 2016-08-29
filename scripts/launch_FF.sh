#!/bin/bash

#inDS="data15_13TeV"
#sample="DAOD_EXOT12.07668731._000011.pool.root.1"


inDS="HIGG3D3test"
sample="DAOD_HIGG3D3.08583139._000001.pool.root.1" #p2666
##sample="DAOD_HIGG3D3.08586109._000002.pool.root.1"

#inDS="EXOT12test"
#sample="DAOD_EXOT12.test_size_MC_ttbar.pool.root"
##sample="DAOD_EXOT12.test_size_data_EXOT12_slimmingSimilarToEXOT0.pool.root"

#inDS="EXOT0test"
#sample="DAOD_EXOT0.08613494._000007.pool.root.1"

#inDS="TOPQ1test"
#sample="DAOD_TOPQ1.08551887._000715.pool.root.1"

##inDS="TOPQ1unsktest"
##sample="DAOD_TOPQ1.08614728._000021.pool.root.1"

#inDS="EXOT12newtest"
#sample="DAOD_EXOT12.test_size_MC_ttbar_moreTruthInfo.pool.root"

infilepath="/data/fscutti/${inDS}/${sample}"


# ------------------------------------------------------------------------------------

# tokenize inDS using '.' as separator
#
tokens=(${inDS//./ })
configpath="$ROOTCOREBIN/user_scripts/SSDiLepAnalysis/jobOptions_FF.py"
current_time="$(date +'%d-%m-%Y-%T')"
outdir=output_local_DxAOD-2016-13TeV_${tokens[2]}_${current_time}
nevents=300

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
