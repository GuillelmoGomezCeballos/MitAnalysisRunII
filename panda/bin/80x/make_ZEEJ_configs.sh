#!/bin/sh

if [ $# == 1 ] && [ $1 == 1 ]; then

ls -l /mnt/hadoop/scratch/bmaier/panda/009/ZJToEEJ_M-50_scalesUpTo8_NNPDF31_plus_CMSPDF_TuneCP5_13TeV_powheg2-minlo-pythia+RunIISummer16MiniAODv2-PUMoriond17_80X_mcRun2_asymptotic_2016_TrancheIV_v6-v3+MINIAODSIM/*root|awk '{print"ZJToEEJ_M-50_scalesUpTo8_NNPDF31_plus_CMSPDF_TuneCP5_13TeV_powheg2-minlo-pythia MC 1 "$9}' > ZJToEEJ_M-50_scalesUpTo8_NNPDF31_plus_CMSPDF_TuneCP5_13TeV_powheg2-minlo-pythia.cfg
wc *.cfg;

fi
