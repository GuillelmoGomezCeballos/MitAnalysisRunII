#!/bin/sh

if [ $# == 1 ] && [ $1 == "zhg" ]; then

for i in `seq 0 100`;
do
  ls done_ana/histoZHG_mH125_2016_${i}.root done_ana/histoZHG_mH125_2017_${i}.root done_ana/histoZHG_mH125_2018_${i}.root >& /dev/null
  if [ $? -eq 0 ]; then
    hadd -f done_ana/histoZHG_mH125_2019_${i}.root done_ana/histoZHG_mH125_2016_${i}.root done_ana/histoZHG_mH125_2017_${i}.root done_ana/histoZHG_mH125_2018_${i}.root
  fi
done

for i in `seq 0 100`;
do
  ls done_ana/histoZHG_mH200_2016_${i}.root done_ana/histoZHG_mH200_2017_${i}.root done_ana/histoZHG_mH200_2018_${i}.root >& /dev/null
  if [ $? -eq 0 ]; then
    hadd -f done_ana/histoZHG_mH200_2019_${i}.root done_ana/histoZHG_mH200_2016_${i}.root done_ana/histoZHG_mH200_2017_${i}.root done_ana/histoZHG_mH200_2018_${i}.root
  fi
done

for i in `seq 0 100`;
do
  ls done_ana/histoZHG_mH300_2016_${i}.root done_ana/histoZHG_mH300_2017_${i}.root done_ana/histoZHG_mH300_2018_${i}.root >& /dev/null
  if [ $? -eq 0 ]; then
    hadd -f done_ana/histoZHG_mH300_2019_${i}.root done_ana/histoZHG_mH300_2016_${i}.root done_ana/histoZHG_mH300_2017_${i}.root done_ana/histoZHG_mH300_2018_${i}.root
  fi
done

elif [ $# == 1 ] && [ $1 == "ssww" ]; then

for i in `seq 0 150`;
do
  ls done_ana/histossww_2016_${i}.root done_ana/histossww_2017_${i}.root done_ana/histossww_2018_${i}.root >& /dev/null
  if [ $? -eq 0 ]; then
    hadd -f done_ana/histossww_2019_${i}.root done_ana/histossww_2016_${i}.root done_ana/histossww_2017_${i}.root done_ana/histossww_2018_${i}.root
  fi
done

for i in `seq 0 150`;
do
  ls done_ana/histossww_2016_${i}_fiducial5.root done_ana/histossww_2017_${i}_fiducial5.root done_ana/histossww_2018_${i}_fiducial5.root >& /dev/null
  if [ $? -eq 0 ]; then
    hadd -f done_ana/histossww_2019_${i}_fiducial5.root done_ana/histossww_2016_${i}_fiducial5.root done_ana/histossww_2017_${i}_fiducial5.root done_ana/histossww_2018_${i}_fiducial5.root
  fi
done

elif [ $# == 1 ] && [ $1 == "vbfg" ]; then

for i in `seq 0 1`;
do
  ls plots/histoVBFGMTGMETMJJ_201[6-8]_trigger[0-1]_mH125_${i}.root >& /dev/null
  if [ $? -eq 0 ]; then
    hadd -f done_vbfg/histoVBFGMTGMETMJJ_2019_trigger2_mH125_${i}.root plots/histoVBFGMTGMETMJJ_201[6-8]_trigger[0-1]_mH125_${i}.root
  fi
done

for i in `seq 0 150`;
do
  ls plots/histoVBFG_2016_trigger0_mH125_${i}.root plots/histoVBFG_2017_trigger0_mH125_${i}.root plots/histoVBFG_2017_trigger1_mH125_${i}.root plots/histoVBFG_2018_trigger0_mH125_${i}.root plots/histoVBFG_2018_trigger1_mH125_${i}.root >& /dev/null
  if [ $? -eq 0 ]; then
    hadd -f done_vbfg/histoVBFG_2019_trigger2_mH125_${i}.root plots/histoVBFG_2016_trigger0_mH125_${i}.root plots/histoVBFG_2017_trigger0_mH125_${i}.root plots/histoVBFG_2017_trigger1_mH125_${i}.root plots/histoVBFG_2018_trigger0_mH125_${i}.root plots/histoVBFG_2018_trigger1_mH125_${i}.root
  fi
done

elif [ $# == 1 ] && [ $1 == "zh" ]; then

for NJET in 0 1; do
  for i in `seq 0 100`;
  do
    ls done_ana/histoZH_2016_${NJET}j_${i}.root done_ana/histoZH_2017_${NJET}j_${i}.root done_ana/histoZH_2018_${NJET}j_${i}.root >& /dev/null
    if [ $? -eq 0 ]; then
      hadd -f done_ana/histoZH_2019_${NJET}j_${i}.root done_ana/histoZH_2016_${NJET}j_${i}.root done_ana/histoZH_2017_${NJET}j_${i}.root done_ana/histoZH_2018_${NJET}j_${i}.root
    fi
  done
done

for i in `seq 0 100`;
do
  ls done_ana/histoWZ_2016_${i}.root done_ana/histoWZ_2017_${i}.root done_ana/histoWZ_2018_${i}.root >& /dev/null
  if [ $? -eq 0 ]; then
    hadd -f done_ana/histoWZ_2019_${i}.root done_ana/histoWZ_2016_${i}.root done_ana/histoWZ_2017_${i}.root done_ana/histoWZ_2018_${i}.root
  fi
done

for i in `seq 0 100`;
do
  ls done_ana/histoZZ_2016_${i}.root done_ana/histoZZ_2017_${i}.root done_ana/histoZZ_2018_${i}.root >& /dev/null
  if [ $? -eq 0 ]; then
    hadd -f done_ana/histoZZ_2019_${i}.root done_ana/histoZZ_2016_${i}.root done_ana/histoZZ_2017_${i}.root done_ana/histoZZ_2018_${i}.root
  fi
done

fi
