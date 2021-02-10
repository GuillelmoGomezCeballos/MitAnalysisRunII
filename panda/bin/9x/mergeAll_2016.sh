#!/bin/sh

export NSEL=$1;

if [ $NSEL == 'mc' ]; then
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ZZJJQCD
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ZZJJEWK
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qqZZ
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ggZZ
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WZ
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WZ3l_MG_QCD
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WZ3l_MG_EWK
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qqWW
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ggWW
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WWdps
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 VVV
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 TTV
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 TT2L
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 TT
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 TW
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WGstar
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 VG
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 VG_M120
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 H125
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 DYNJetsToLL
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 DYJetsToLL_Pt0To50
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 DYJetsToLL_Pt50To100 
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 DYJetsToLL_Pt100To250  
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 DYJetsToLL_Pt250To400  
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 DYJetsToLL_Pt400To650  
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 DYJetsToLL_Pt650ToInf  
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 DYJetsToTauTau
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 DYJetsToLL_M-10to50
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 DYJetsToLL_M-50_NLO
#PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 DYJetsToLL_M-50_LO_Pt000To050
#PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 DYJetsToLL_M-50_LO_Pt100to200
#PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 DYJetsToLL_M-50_LO_Pt200toInf
#PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 DYJetsToLL_POWHEG
#PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 DYJetsToMM_POWHEG
#PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 DYJetsToEE_POWHEG
#PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ZtoNuNu_pt100to250
#PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ZtoNuNu_pt250to400
#PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ZtoNuNu_pt400to650
#PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ZtoNuNu_pt650toinf
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WJets
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WpWp_EWK_QCD
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WpWp_EWK
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WpWp_QCD
#PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 DYJetsToEE_POWHEG_MINLO
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ggZH125inv
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qqZH110inv
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qqZH125inv
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qqZH150inv
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qqZH200inv
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qqZH300inv
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qqZH400inv
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qqZH500inv
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qqZH600inv
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qqZH800inv
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qqZH1000inv
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 MET
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 Unpart_ZToLL_SU-0_dU-1p01
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 Unpart_ZToLL_SU-0_dU-1p02
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 Unpart_ZToLL_SU-0_dU-1p04
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 Unpart_ZToLL_SU-0_dU-1p06
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 Unpart_ZToLL_SU-0_dU-1p09
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 Unpart_ZToLL_SU-0_dU-1p10
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 Unpart_ZToLL_SU-0_dU-1p20
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 Unpart_ZToLL_SU-0_dU-1p30
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 Unpart_ZToLL_SU-0_dU-1p40
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 Unpart_ZToLL_SU-0_dU-1p50
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 Unpart_ZToLL_SU-0_dU-1p60
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 Unpart_ZToLL_SU-0_dU-1p70
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 Unpart_ZToLL_SU-0_dU-1p80
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 Unpart_ZToLL_SU-0_dU-1p90
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 Unpart_ZToLL_SU-0_dU-2p00
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 Unpart_ZToLL_SU-0_dU-2p20
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ADDMonoZ_MD_1_d_2
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ADDMonoZ_MD_1_d_3
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ADDMonoZ_MD_1_d_4
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ADDMonoZ_MD_1_d_5
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ADDMonoZ_MD_1_d_6
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ADDMonoZ_MD_1_d_7
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ADDMonoZ_MD_2_d_2
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ADDMonoZ_MD_2_d_3
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ADDMonoZ_MD_2_d_4
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ADDMonoZ_MD_2_d_5
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ADDMonoZ_MD_2_d_6
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ADDMonoZ_MD_2_d_7
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ADDMonoZ_MD_3_d_2
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ADDMonoZ_MD_3_d_3
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ADDMonoZ_MD_3_d_4
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ADDMonoZ_MD_3_d_5
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ADDMonoZ_MD_3_d_6
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ADDMonoZ_MD_3_d_7
#PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 SingleMuon           
#PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 SingleElectron     
#PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 MuonEG       
#PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 DoubleEG     
#PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 DoubleMuon

elif [ $NSEL == 'higgs' ]; then
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WZ200
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WZ300
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WZ400
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WZ500
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WZ600
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WZ700
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WZ800
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WZ900
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WZ1000
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WZ1500
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WZ2000
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WZ3000
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WW200
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WW300
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WW400
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WW500
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WW600
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WW700
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WW800
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WW900
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WW1000
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WW1500
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WW2000
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 qq_cH_WW3000

elif [ $NSEL == 'specialmc' ]; then
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ZH_ZToLL_HToGDarkG_M125
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ZH_ZToLL_HToGDarkG_M200
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 ZH_ZToLL_HToGDarkG_M300

elif [ $NSEL == 'dim8' ]; then
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WWjj_SS_dim8_ewk
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WZjj_dim8_ewk
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WWjj_SS_dim8_ewk_ext
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WZjj_dim8_ewk_ext
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WWjj_SS_long
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WWjj_SS_lttt
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WWjj_SS_interference
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WZJJ_interference
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WWjj_SS_long_new
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WWjj_SS_lt_new
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WWjj_SS_tt_new
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WWjj_SS_long_wwframe
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WWjj_SS_lt_wwframe
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 WWjj_SS_tt_wwframe

elif [ $NSEL == 'da' ]; then
PandaAnalysis/T3/merging/merge.py --cfg leptonic_2016 data_overlaps

root -q -l -b MitAnalysisRunII/panda/macros/9x/makeGoodRunSample.C+'("${PANDA_FLATDIR}/data_overlaps.root","${PANDA_FLATDIR}/data.root","MitAnalysisRunII/json/80x/Cert_271036-284044_13TeV_23Sep2016ReReco_Collisions16_JSON.txt")'
fi
