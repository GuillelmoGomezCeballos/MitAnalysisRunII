#!/bin/sh

export NSEL=$1;
export YEAR=$2;

if [ $NSEL == 0 ]; then
  root -q -l -b MitAnalysisRunII/panda/skimming/skimmingAnalysis.C+
  nohup time root -q -l -b MitAnalysisRunII/panda/skimming/skimmingAnalysis.C+'('${YEAR}')' >& log_skimming_${YEAR} &

elif [ $NSEL == 1 ]; then
  root -q -l -b MitAnalysisRunII/panda/macros/9x/triggerAnalysis.C+
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/triggerAnalysis.C+'('${YEAR}')' >& log_trigger_${YEAR} &

elif [ $NSEL == 2 ]; then
  root -q -l -b MitAnalysisRunII/panda/macros/9x/fakeRateAnalysis.C+
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/fakeRateAnalysis.C+'('${YEAR}')'   >& log_fake_${YEAR} &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/fakeRateAnalysis.C+'('${YEAR}',1)' >& log_fake_${YEAR}_btagged &

elif [ $NSEL == 3 ]; then
  root -q -l -b MitAnalysisRunII/panda/macros/9x/zAnalysis.C+
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zAnalysis.C+'('${YEAR}')'     >& log_z_${YEAR} &
  if [ $# == 3 ] && [ $3 == 1 ]; then
    nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zAnalysis.C+'('${YEAR}',0,1)' >& log_z_${YEAR}_0_1 &
    nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zAnalysis.C+'('${YEAR}',0,2)' >& log_z_${YEAR}_0_2 &
  fi

elif [ $NSEL == 4 ]; then
  root -q -l -b MitAnalysisRunII/panda/macros/9x/wwAnalysis.C+
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/wwAnalysis.C+'('${YEAR}')'       >& log_ww_${YEAR} &

elif [ $NSEL == 5 ]; then
  root -q -l -b MitAnalysisRunII/panda/macros/9x/wzAnalysis.C+
  root -q -l -b MitAnalysisRunII/panda/macros/9x/zzAnalysis.C+
  root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+
  if [ $# == 3 ] && [ $3 == 0 ]; then
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/wzAnalysis.C+'('${YEAR}')'     >& log_wz_${YEAR} &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zzAnalysis.C+'('${YEAR}')'     >& log_zz_${YEAR} &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}',0)'   >& log_zh_${YEAR}_0j &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}',1)'   >& log_zh_${YEAR}_1j &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}',2)'   >& log_zh_${YEAR}_2j &
  fi
  if [ $# == 3 ] && [ $3 == 1 ]; then
    for jetValue in 0 1; do
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"NoBSM")' >& log_zhNoBSM_${YEAR}_${jetValue}j &

      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"Unpart_ZToLL_SU-0_dU-1p01")' >& log_zhUnpart_ZToLL_SU-0_dU-1p01_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"Unpart_ZToLL_SU-0_dU-1p02")' >& log_zhUnpart_ZToLL_SU-0_dU-1p02_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"Unpart_ZToLL_SU-0_dU-1p04")' >& log_zhUnpart_ZToLL_SU-0_dU-1p04_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"Unpart_ZToLL_SU-0_dU-1p06")' >& log_zhUnpart_ZToLL_SU-0_dU-1p06_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"Unpart_ZToLL_SU-0_dU-1p09")' >& log_zhUnpart_ZToLL_SU-0_dU-1p09_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"Unpart_ZToLL_SU-0_dU-1p10")' >& log_zhUnpart_ZToLL_SU-0_dU-1p10_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"Unpart_ZToLL_SU-0_dU-1p20")' >& log_zhUnpart_ZToLL_SU-0_dU-1p20_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"Unpart_ZToLL_SU-0_dU-1p30")' >& log_zhUnpart_ZToLL_SU-0_dU-1p30_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"Unpart_ZToLL_SU-0_dU-1p40")' >& log_zhUnpart_ZToLL_SU-0_dU-1p40_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"Unpart_ZToLL_SU-0_dU-1p50")' >& log_zhUnpart_ZToLL_SU-0_dU-1p50_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"Unpart_ZToLL_SU-0_dU-1p60")' >& log_zhUnpart_ZToLL_SU-0_dU-1p60_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"Unpart_ZToLL_SU-0_dU-1p70")' >& log_zhUnpart_ZToLL_SU-0_dU-1p70_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"Unpart_ZToLL_SU-0_dU-1p80")' >& log_zhUnpart_ZToLL_SU-0_dU-1p80_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"Unpart_ZToLL_SU-0_dU-1p90")' >& log_zhUnpart_ZToLL_SU-0_dU-1p90_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"Unpart_ZToLL_SU-0_dU-2p00")' >& log_zhUnpart_ZToLL_SU-0_dU-2p00_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"Unpart_ZToLL_SU-0_dU-2p20")' >& log_zhUnpart_ZToLL_SU-0_dU-2p20_${YEAR}_${jetValue}j &

      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"ADDMonoZ_MD_1_d_2")' >& log_zhADDMonoZ_MD_1_d_2_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"ADDMonoZ_MD_1_d_3")' >& log_zhADDMonoZ_MD_1_d_3_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"ADDMonoZ_MD_1_d_4")' >& log_zhADDMonoZ_MD_1_d_4_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"ADDMonoZ_MD_1_d_5")' >& log_zhADDMonoZ_MD_1_d_5_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"ADDMonoZ_MD_1_d_6")' >& log_zhADDMonoZ_MD_1_d_6_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"ADDMonoZ_MD_1_d_7")' >& log_zhADDMonoZ_MD_1_d_7_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"ADDMonoZ_MD_2_d_2")' >& log_zhADDMonoZ_MD_2_d_2_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"ADDMonoZ_MD_2_d_3")' >& log_zhADDMonoZ_MD_2_d_3_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"ADDMonoZ_MD_2_d_4")' >& log_zhADDMonoZ_MD_2_d_4_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"ADDMonoZ_MD_2_d_5")' >& log_zhADDMonoZ_MD_2_d_5_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"ADDMonoZ_MD_2_d_6")' >& log_zhADDMonoZ_MD_2_d_6_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"ADDMonoZ_MD_2_d_7")' >& log_zhADDMonoZ_MD_2_d_7_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"ADDMonoZ_MD_3_d_2")' >& log_zhADDMonoZ_MD_3_d_2_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"ADDMonoZ_MD_3_d_3")' >& log_zhADDMonoZ_MD_3_d_3_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"ADDMonoZ_MD_3_d_4")' >& log_zhADDMonoZ_MD_3_d_4_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"ADDMonoZ_MD_3_d_5")' >& log_zhADDMonoZ_MD_3_d_5_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"ADDMonoZ_MD_3_d_6")' >& log_zhADDMonoZ_MD_3_d_6_${YEAR}_${jetValue}j &
      nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhAnalysis.C+'('${YEAR}','${jetValue}',"ADDMonoZ_MD_3_d_7")' >& log_zhADDMonoZ_MD_3_d_7_${YEAR}_${jetValue}j &
    done
  fi

elif [ $NSEL == 6 ]; then
  root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',0)' >& log_ssww_fid0_${YEAR} &
  if [ $# == 3 ] && [ $3 == 1 ]; then
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',1)' >& log_ssww_fid1_${YEAR} &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',2)' >& log_ssww_fid2_${YEAR} &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',3)' >& log_ssww_fid3_${YEAR} &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',4)' >& log_ssww_fid4_${YEAR} &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',7)' >& log_ssww_fid7_${YEAR} &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',8)' >& log_ssww_fid8_${YEAR} &
  fi

elif [ $NSEL == 60 ]; then
  root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',5)' >& log_ssww_fid5_${YEAR} &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',9)' >& log_ssww_fid9_${YEAR} &
  #root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_3d.C+
  #nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_3d.C+'('${YEAR}',5,"wwframe")' >& log_ssww_fid5_${YEAR} &

elif [ $NSEL == 61 ]; then
  root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',6,"wwframe",1,200)'  >& log_ssww_fid6_${YEAR}_200 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',6,"wwframe",1,300)'  >& log_ssww_fid6_${YEAR}_300 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',6,"wwframe",1,400)'  >& log_ssww_fid6_${YEAR}_400 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',6,"wwframe",1,500)'  >& log_ssww_fid6_${YEAR}_500 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',6,"wwframe",1,600)'  >& log_ssww_fid6_${YEAR}_600 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',6,"wwframe",1,700)'  >& log_ssww_fid6_${YEAR}_700 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',6,"wwframe",1,800)'  >& log_ssww_fid6_${YEAR}_800 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',6,"wwframe",1,900)'  >& log_ssww_fid6_${YEAR}_900 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',6,"wwframe",1,1000)' >& log_ssww_fid6_${YEAR}_1000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',6,"wwframe",1,1500)' >& log_ssww_fid6_${YEAR}_1500 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',6,"wwframe",1,2000)' >& log_ssww_fid6_${YEAR}_2000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis.C+'('${YEAR}',6,"wwframe",1,3000)' >& log_ssww_fid6_${YEAR}_3000 &

elif [ $NSEL == 62 ]; then
  root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',0,"wwframe",137.4)' >& log_ssww_hllhc_fid0_wwframe_${YEAR}_137  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',0,"wwframe",300)'   >& log_ssww_hllhc_fid0_wwframe_${YEAR}_300  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',0,"wwframe",500)'   >& log_ssww_hllhc_fid0_wwframe_${YEAR}_500  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',0,"wwframe",1000)'  >& log_ssww_hllhc_fid0_wwframe_${YEAR}_1000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',0,"wwframe",2000)'  >& log_ssww_hllhc_fid0_wwframe_${YEAR}_2000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',0,"wwframe",3000)'  >& log_ssww_hllhc_fid0_wwframe_${YEAR}_3000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',0,"wwframe",4500)'  >& log_ssww_hllhc_fid0_wwframe_${YEAR}_4500 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',0,"wwframe",6000)'  >& log_ssww_hllhc_fid0_wwframe_${YEAR}_6000 &

  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"wwframe",137.4)' >& log_ssww_hllhc_fid5_wwframe_${YEAR}_137  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"wwframe",300)'   >& log_ssww_hllhc_fid5_wwframe_${YEAR}_300  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"wwframe",500)'   >& log_ssww_hllhc_fid5_wwframe_${YEAR}_500  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"wwframe",1000)'  >& log_ssww_hllhc_fid5_wwframe_${YEAR}_1000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"wwframe",2000)'  >& log_ssww_hllhc_fid5_wwframe_${YEAR}_2000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"wwframe",3000)'  >& log_ssww_hllhc_fid5_wwframe_${YEAR}_3000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"wwframe",4500)'  >& log_ssww_hllhc_fid5_wwframe_${YEAR}_4500 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"wwframe",6000)'  >& log_ssww_hllhc_fid5_wwframe_${YEAR}_6000 &

  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"new",137.4)' >& log_ssww_hllhc_fid5_new_${YEAR}_137  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"new",300)'   >& log_ssww_hllhc_fid5_new_${YEAR}_300  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"new",500)'   >& log_ssww_hllhc_fid5_new_${YEAR}_500  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"new",1000)'  >& log_ssww_hllhc_fid5_new_${YEAR}_1000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"new",2000)'  >& log_ssww_hllhc_fid5_new_${YEAR}_2000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"new",3000)'  >& log_ssww_hllhc_fid5_new_${YEAR}_3000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"new",4500)'  >& log_ssww_hllhc_fid5_new_${YEAR}_4500 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"new",6000)'  >& log_ssww_hllhc_fid5_new_${YEAR}_6000 &

elif [ $NSEL == 63 ]; then
  root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',0,"wwframe",3000,0.50)'  >& log_ssww_hllhc_fid0_wwframe_${YEAR}_3000_fake0p50 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',0,"wwframe",3000,0.75)'  >& log_ssww_hllhc_fid0_wwframe_${YEAR}_3000_fake0p75 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',0,"wwframe",3000,1.00)'  >& log_ssww_hllhc_fid0_wwframe_${YEAR}_3000_fake1p00 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',0,"wwframe",3000,1.25)'  >& log_ssww_hllhc_fid0_wwframe_${YEAR}_3000_fake1p25 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',0,"wwframe",3000,1.50)'  >& log_ssww_hllhc_fid0_wwframe_${YEAR}_3000_fake1p50 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',0,"wwframe",3000,2.00)'  >& log_ssww_hllhc_fid0_wwframe_${YEAR}_3000_fake2p00 &

  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"wwframe",3000,0.50)'  >& log_ssww_hllhc_fid5_wwframe_${YEAR}_3000_fake0p50 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"wwframe",3000,0.75)'  >& log_ssww_hllhc_fid5_wwframe_${YEAR}_3000_fake0p75 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"wwframe",3000,1.00)'  >& log_ssww_hllhc_fid5_wwframe_${YEAR}_3000_fake1p00 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"wwframe",3000,1.25)'  >& log_ssww_hllhc_fid5_wwframe_${YEAR}_3000_fake1p25 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"wwframe",3000,1.50)'  >& log_ssww_hllhc_fid5_wwframe_${YEAR}_3000_fake1p50 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"wwframe",3000,2.00)'  >& log_ssww_hllhc_fid5_wwframe_${YEAR}_3000_fake2p00 &

  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"new",3000,0.50)'  >& log_ssww_hllhc_fid5_new_${YEAR}_3000_fake0p50 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"new",3000,0.75)'  >& log_ssww_hllhc_fid5_new_${YEAR}_3000_fake0p75 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"new",3000,1.00)'  >& log_ssww_hllhc_fid5_new_${YEAR}_3000_fake1p00 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"new",3000,1.25)'  >& log_ssww_hllhc_fid5_new_${YEAR}_3000_fake1p25 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"new",3000,1.50)'  >& log_ssww_hllhc_fid5_new_${YEAR}_3000_fake1p50 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"new",3000,2.00)'  >& log_ssww_hllhc_fid5_new_${YEAR}_3000_fake2p00 &

elif [ $NSEL == 64 ]; then
  root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',0,"wwframe",3000,-1,40)'  >& log_ssww_hllhc_fid0_wwframe_${YEAR}_3000_jetpt40  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',0,"wwframe",3000,-1,50)'  >& log_ssww_hllhc_fid0_wwframe_${YEAR}_3000_jetpt50  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',0,"wwframe",3000,-1,60)'  >& log_ssww_hllhc_fid0_wwframe_${YEAR}_3000_jetpt60  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',0,"wwframe",3000,-1,80)'  >& log_ssww_hllhc_fid0_wwframe_${YEAR}_3000_jetpt80  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',0,"wwframe",3000,-1,100)' >& log_ssww_hllhc_fid0_wwframe_${YEAR}_3000_jetpt100 &

  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"wwframe",3000,-1,40)'  >& log_ssww_hllhc_fid5_wwframe_${YEAR}_3000_jetpt40  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"wwframe",3000,-1,50)'  >& log_ssww_hllhc_fid5_wwframe_${YEAR}_3000_jetpt50  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"wwframe",3000,-1,60)'  >& log_ssww_hllhc_fid5_wwframe_${YEAR}_3000_jetpt60  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"wwframe",3000,-1,80)'  >& log_ssww_hllhc_fid5_wwframe_${YEAR}_3000_jetpt80  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"wwframe",3000,-1,100)' >& log_ssww_hllhc_fid5_wwframe_${YEAR}_3000_jetpt100 &

  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"new",3000,-1,40)'  >& log_ssww_hllhc_fid5_new_${YEAR}_3000_jetpt40  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"new",3000,-1,50)'  >& log_ssww_hllhc_fid5_new_${YEAR}_3000_jetpt50  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"new",3000,-1,60)'  >& log_ssww_hllhc_fid5_new_${YEAR}_3000_jetpt60  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"new",3000,-1,80)'  >& log_ssww_hllhc_fid5_new_${YEAR}_3000_jetpt80  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc.C+'('${YEAR}',5,"new",3000,-1,100)' >& log_ssww_hllhc_fid5_new_${YEAR}_3000_jetpt100 &

elif [ $NSEL == 65 ]; then
  root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_3d.C+
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_3d.C+'('${YEAR}',5,"wwframe",137.4)' >& log_ssww_hllhc_3d_fid5_wwframe_${YEAR}_137  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_3d.C+'('${YEAR}',5,"wwframe",300)'   >& log_ssww_hllhc_3d_fid5_wwframe_${YEAR}_300  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_3d.C+'('${YEAR}',5,"wwframe",500)'   >& log_ssww_hllhc_3d_fid5_wwframe_${YEAR}_500  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_3d.C+'('${YEAR}',5,"wwframe",1000)'  >& log_ssww_hllhc_3d_fid5_wwframe_${YEAR}_1000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_3d.C+'('${YEAR}',5,"wwframe",2000)'  >& log_ssww_hllhc_3d_fid5_wwframe_${YEAR}_2000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_3d.C+'('${YEAR}',5,"wwframe",3000)'  >& log_ssww_hllhc_3d_fid5_wwframe_${YEAR}_3000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_3d.C+'('${YEAR}',5,"wwframe",4500)'  >& log_ssww_hllhc_3d_fid5_wwframe_${YEAR}_4500 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_3d.C+'('${YEAR}',5,"wwframe",6000)'  >& log_ssww_hllhc_3d_fid5_wwframe_${YEAR}_6000 &

  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_3d.C+'('${YEAR}',5,"new",137.4)' >& log_ssww_hllhc_3d_fid5_new_${YEAR}_137  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_3d.C+'('${YEAR}',5,"new",300)'   >& log_ssww_hllhc_3d_fid5_new_${YEAR}_300  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_3d.C+'('${YEAR}',5,"new",500)'   >& log_ssww_hllhc_3d_fid5_new_${YEAR}_500  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_3d.C+'('${YEAR}',5,"new",1000)'  >& log_ssww_hllhc_3d_fid5_new_${YEAR}_1000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_3d.C+'('${YEAR}',5,"new",2000)'  >& log_ssww_hllhc_3d_fid5_new_${YEAR}_2000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_3d.C+'('${YEAR}',5,"new",3000)'  >& log_ssww_hllhc_3d_fid5_new_${YEAR}_3000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_3d.C+'('${YEAR}',5,"new",4500)'  >& log_ssww_hllhc_3d_fid5_new_${YEAR}_4500 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_3d.C+'('${YEAR}',5,"new",6000)'  >& log_ssww_hllhc_3d_fid5_new_${YEAR}_6000 &

elif [ $NSEL == 66 ]; then
  root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_4d.C+
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_4d.C+'('${YEAR}',5,"wwframe",137.4)' >& log_ssww_hllhc_4d_fid5_wwframe_${YEAR}_137  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_4d.C+'('${YEAR}',5,"wwframe",300)'   >& log_ssww_hllhc_4d_fid5_wwframe_${YEAR}_300  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_4d.C+'('${YEAR}',5,"wwframe",500)'   >& log_ssww_hllhc_4d_fid5_wwframe_${YEAR}_500  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_4d.C+'('${YEAR}',5,"wwframe",1000)'  >& log_ssww_hllhc_4d_fid5_wwframe_${YEAR}_1000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_4d.C+'('${YEAR}',5,"wwframe",2000)'  >& log_ssww_hllhc_4d_fid5_wwframe_${YEAR}_2000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_4d.C+'('${YEAR}',5,"wwframe",3000)'  >& log_ssww_hllhc_4d_fid5_wwframe_${YEAR}_3000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_4d.C+'('${YEAR}',5,"wwframe",4500)'  >& log_ssww_hllhc_4d_fid5_wwframe_${YEAR}_4500 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_4d.C+'('${YEAR}',5,"wwframe",6000)'  >& log_ssww_hllhc_4d_fid5_wwframe_${YEAR}_6000 &

  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_4d.C+'('${YEAR}',5,"new",137.4)' >& log_ssww_hllhc_4d_fid5_new_${YEAR}_137  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_4d.C+'('${YEAR}',5,"new",300)'   >& log_ssww_hllhc_4d_fid5_new_${YEAR}_300  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_4d.C+'('${YEAR}',5,"new",500)'   >& log_ssww_hllhc_4d_fid5_new_${YEAR}_500  &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_4d.C+'('${YEAR}',5,"new",1000)'  >& log_ssww_hllhc_4d_fid5_new_${YEAR}_1000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_4d.C+'('${YEAR}',5,"new",2000)'  >& log_ssww_hllhc_4d_fid5_new_${YEAR}_2000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_4d.C+'('${YEAR}',5,"new",3000)'  >& log_ssww_hllhc_4d_fid5_new_${YEAR}_3000 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_4d.C+'('${YEAR}',5,"new",4500)'  >& log_ssww_hllhc_4d_fid5_new_${YEAR}_4500 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/sswwAnalysis_hllhc_4d.C+'('${YEAR}',5,"new",6000)'  >& log_ssww_hllhc_4d_fid5_new_${YEAR}_6000 &

elif [ $NSEL == 7 ]; then
  root -q -l -b MitAnalysisRunII/panda/macros/9x/zhgAnalysis.C+
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhgAnalysis.C+'('${YEAR}',0,125)'    >& log_zhg_${YEAR}_125 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhgAnalysis.C+'('${YEAR}',0,200)'    >& log_zhg_${YEAR}_200 &
  nohup time root -q -l -b MitAnalysisRunII/panda/macros/9x/zhgAnalysis.C+'('${YEAR}',0,300)'    >& log_zhg_${YEAR}_300 &

elif [ $NSEL == 8 ]; then
  root -l -q -b MitAnalysisRunII/panda/macros/10x_g/vbfgAnalysis.C+
  nohup time root -l -q -b MitAnalysisRunII/panda/macros/10x_g/vbfgAnalysis.C+'('${YEAR}',0,125)'  >& log_vbfg_${YEAR}_trigger0_mh125  &
  nohup time root -l -q -b MitAnalysisRunII/panda/macros/10x_g/vbfgAnalysis.C+'('${YEAR}',1,125)'  >& log_vbfg_${YEAR}_trigger1_mh125  &
  if [ $# == 3 ] && [ $3 == 1 ]; then
    nohup time root -l -q -b MitAnalysisRunII/panda/macros/10x_g/vbfgAnalysis.C+'('${YEAR}',0,115)'  >& log_vbfg_${YEAR}_trigger0_mh115  &
    nohup time root -l -q -b MitAnalysisRunII/panda/macros/10x_g/vbfgAnalysis.C+'('${YEAR}',1,115)'  >& log_vbfg_${YEAR}_trigger1_mh115  &
    nohup time root -l -q -b MitAnalysisRunII/panda/macros/10x_g/vbfgAnalysis.C+'('${YEAR}',0,120)'  >& log_vbfg_${YEAR}_trigger0_mh120  &
    nohup time root -l -q -b MitAnalysisRunII/panda/macros/10x_g/vbfgAnalysis.C+'('${YEAR}',1,120)'  >& log_vbfg_${YEAR}_trigger1_mh120  &
    nohup time root -l -q -b MitAnalysisRunII/panda/macros/10x_g/vbfgAnalysis.C+'('${YEAR}',0,150)'  >& log_vbfg_${YEAR}_trigger0_mh150  &
    nohup time root -l -q -b MitAnalysisRunII/panda/macros/10x_g/vbfgAnalysis.C+'('${YEAR}',1,150)'  >& log_vbfg_${YEAR}_trigger1_mh150  &
    nohup time root -l -q -b MitAnalysisRunII/panda/macros/10x_g/vbfgAnalysis.C+'('${YEAR}',0,200)'  >& log_vbfg_${YEAR}_trigger0_mh200  &
    nohup time root -l -q -b MitAnalysisRunII/panda/macros/10x_g/vbfgAnalysis.C+'('${YEAR}',1,200)'  >& log_vbfg_${YEAR}_trigger1_mh200  &
    nohup time root -l -q -b MitAnalysisRunII/panda/macros/10x_g/vbfgAnalysis.C+'('${YEAR}',0,300)'  >& log_vbfg_${YEAR}_trigger0_mh300  &
    nohup time root -l -q -b MitAnalysisRunII/panda/macros/10x_g/vbfgAnalysis.C+'('${YEAR}',1,300)'  >& log_vbfg_${YEAR}_trigger1_mh300  &
    nohup time root -l -q -b MitAnalysisRunII/panda/macros/10x_g/vbfgAnalysis.C+'('${YEAR}',0,500)'  >& log_vbfg_${YEAR}_trigger0_mh500  &
    nohup time root -l -q -b MitAnalysisRunII/panda/macros/10x_g/vbfgAnalysis.C+'('${YEAR}',1,500)'  >& log_vbfg_${YEAR}_trigger1_mh500  &
    nohup time root -l -q -b MitAnalysisRunII/panda/macros/10x_g/vbfgAnalysis.C+'('${YEAR}',0,800)'  >& log_vbfg_${YEAR}_trigger0_mh800  &
    nohup time root -l -q -b MitAnalysisRunII/panda/macros/10x_g/vbfgAnalysis.C+'('${YEAR}',1,800)'  >& log_vbfg_${YEAR}_trigger1_mh800  &
    nohup time root -l -q -b MitAnalysisRunII/panda/macros/10x_g/vbfgAnalysis.C+'('${YEAR}',0,1000)' >& log_vbfg_${YEAR}_trigger0_mh1000 &
    nohup time root -l -q -b MitAnalysisRunII/panda/macros/10x_g/vbfgAnalysis.C+'('${YEAR}',1,1000)' >& log_vbfg_${YEAR}_trigger1_mh1000 &
  fi
fi
