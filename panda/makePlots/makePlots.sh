#!/bin/sh

export NSEL=$1;
export APPLYSCALING=$2;
export YEAR=$3;

if [ $NSEL == 'random' ]; then
  export sf_dy=1.0;
  export legendBSM="";
  export isNeverBlinded=0;
  export isBlinded=0;
  export fidAnaName="_fiducial5";
  if [ $# == 4 ]; then
    export isBlinded=$4;
  fi
  export mlfitResult="comb/fitDiagnosticsssww_comb_wwwz_obs.root";
  export channelName="SSWW_"${YEAR};
  if [ $NSEL == 'random' ]; then
    export legendBSM="W_{L}W_{L}"
    export mlfitResult="done_ana/../ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root";
    export fidAnaName="_fiducial5";
    export channelName="SSWW_2019"; 
    if [ $YEAR != '2019' ]; then
      export mlfitResult="done_ana/../ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root";
      export channelName="SSWW_"${YEAR};
    fi
  fi

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Lepton type","","done_ana/histossww_'${YEAR}'_104'${fidAnaName}'.root","ssww_loosesel_leptype",                           0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{ll}","GeV","done_ana/histossww_'${YEAR}'_105'${fidAnaName}'.root","ssww_loosesel_mll",                                 0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{miss}","GeV","done_ana/histossww_'${YEAR}'_106'${fidAnaName}'.root","ssww_loosesel_met",                           0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{jet}","","done_ana/histossww_'${YEAR}'_107'${fidAnaName}'.root","ssww_loosesel_njet",                                  0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta#eta_{jj}","","done_ana/histossww_'${YEAR}'_108'${fidAnaName}'.root","ssww_loosesel_detajj",                        0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeV","done_ana/histossww_'${YEAR}'_109'${fidAnaName}'.root","ssww_loosesel_mjj",                                 0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{medium b jets}","","done_ana/histossww_'${YEAR}'_110'${fidAnaName}'.root","ssww_loosesel_nmbjets",                     0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}^{WW}","GeV","done_ana/histossww_'${YEAR}'_111'${fidAnaName}'.root","ssww_loosesel_mww",                             0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Sum p^{vectorial}_{T} / p^{scalar}_{T}","","done_ana/histossww_'${YEAR}'_112'${fidAnaName}'.root","ssww_loosesel_ptotrel",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"z^{*}","","done_ana/histossww_'${YEAR}'_113'${fidAnaName}'.root","ssww_loosesel_zstar",                                   0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{j}","","done_ana/histossww_'${YEAR}'_114'${fidAnaName}'.root","ssww_loosesel_ptj",                                 0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#eta^{j}","","done_ana/histossww_'${YEAR}'_115'${fidAnaName}'.root","ssww_loosesel_etaj",                                 0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{l}","GeV","done_ana/histossww_'${YEAR}'_116'${fidAnaName}'.root","ssww_loosesel_ptl",                              0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"|#eta^{l}|","","done_ana/histossww_'${YEAR}'_117'${fidAnaName}'.root","ssww_loosesel_etal",                               0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

elif [ $NSEL == 'wz' ]; then
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWZ_'${YEAR}'_4.root","wz_mllmin",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"|m_{ll}-m_{Z}|","GeV","done_ana/histoWZ_'${YEAR}'_9.root","wz_mz",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{l W}","GeV","done_ana/histoWZ_'${YEAR}'_14.root","wz_wlpt",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{miss}","GeV","done_ana/histoWZ_'${YEAR}'_19.root","wz_met",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{3l}","GeV","done_ana/histoWZ_'${YEAR}'_24.root","wz_m3l",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{l1 Z}","GeV","done_ana/histoWZ_'${YEAR}'_29.root","wz_z1lpt",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{l2 Z}","GeV","done_ana/histoWZ_'${YEAR}'_34.root","wz_z2lpt",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{T}","GeV","done_ana/histoWZ_'${YEAR}'_39.root","wz_mt",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{miss}","GeV","done_ana/histoWZ_'${YEAR}'_44.root","wz_topsel_met",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{jets}","","done_ana/histoWZ_'${YEAR}'_49.root","wz_njets",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{jets}","","done_ana/histoWZ_'${YEAR}'_54.root","wz_topsel_njets",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{b jets}","","done_ana/histoWZ_'${YEAR}'_59.root","wz_nbjets",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}^{miss}","GeV","done_ana/histoWZ_'${YEAR}'_64.root","wz_zxliketight_met",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}^{miss}","GeVBINBinWidth","done_ana/histoWZ_'${YEAR}'_69.root","wz_zxlikeloose_met",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Cut evolution","","done_ana/histoWZ_'${YEAR}'_77.root","wz_cutevol",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{#gamma}","GeV","done_ana/histoWZ_'${YEAR}'_78.root","wzgsel_ptg",0,'${YEAR}',"",1,0,"WZ#gamma region",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"|#eta^{#gamma}","","done_ana/histoWZ_'${YEAR}'_79.root","wzgsel_etag",0,'${YEAR}',"",1,0,"WZ#gamma region",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{l#gamma}","GeV","done_ana/histoWZ_'${YEAR}'_80.root","wzgsel_mlg",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';

elif [ $NSEL == 'zhpaper' ]; then
  export APPLYSCALING=1;
  export sf_dy=1.0;  
  export isBlinded=0;
  if [ $# == 4 ]; then
    export isBlinded=$4;
  fi
  export YEAR=2016;
  export mlfitResult="comb/../ana_zh/fitDiagnosticszh_comb_obs.root";
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}^{miss}","GeVBINBinWidth","done_ana/histoWZ_'${YEAR}'_81.root","wz_card_met",1,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","WZ_'${YEAR}'",0)';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}^{miss}","GeVBINBinWidth","done_ana/histoZZ_'${YEAR}'_70.root","zz_card_met",1,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","ZZ_'${YEAR}'",0)';
  export YEAR=2017;
  export mlfitResult="comb/../ana_zh/fitDiagnosticszh_comb_obs.root";
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}^{miss}","GeVBINBinWidth","done_ana/histoWZ_'${YEAR}'_81.root","wz_card_met",1,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","WZ_'${YEAR}'",0)';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}^{miss}","GeVBINBinWidth","done_ana/histoZZ_'${YEAR}'_70.root","zz_card_met",1,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","ZZ_'${YEAR}'",0)';
  export YEAR=2018;
  export mlfitResult="comb/../ana_zh/fitDiagnosticszh_comb_obs.root";
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}^{miss}","GeVBINBinWidth","done_ana/histoWZ_'${YEAR}'_81.root","wz_card_met",1,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","WZ_'${YEAR}'",0)';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}^{miss}","GeVBINBinWidth","done_ana/histoZZ_'${YEAR}'_70.root","zz_card_met",1,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","ZZ_'${YEAR}'",0)';
  export YEAR=2019;
  export mlfitResult="comb/fitDiagnosticszh_comb_obs.root";
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}^{miss}","GeVBINBinWidth","done_ana/histoWZ_'${YEAR}'_81.root","wz_card_met",1,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","WZ_'${YEAR}'",0)';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}^{miss}","GeVBINBinWidth","done_ana/histoZZ_'${YEAR}'_70.root","zz_card_met",1,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","ZZ_'${YEAR}'",0)';

elif [ $NSEL == 'zz' ]; then
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"m_{ll}","GeV", "done_ana/histoZZ_'${YEAR}'_4.root","zz_mllmin",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"m_{ll}","GeV", "done_ana/histoZZ_'${YEAR}'_9.root","zz_mz",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"m_{ll}","GeV","done_ana/histoZZ_'${YEAR}'_14.root","zz_mzmin",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"m_{4l}","GeV","done_ana/histoZZ_'${YEAR}'_19.root","zz_m4l",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"p_{T}^{l1 Z1}","GeV","done_ana/histoZZ_'${YEAR}'_24.root","zz_ptl1z1",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"p_{T}^{l2 Z1}","GeV","done_ana/histoZZ_'${YEAR}'_29.root","zz_ptl2z1",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"p_{T}^{l1 Z2}","GeV","done_ana/histoZZ_'${YEAR}'_34.root","zz_ptl1z2",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"p_{T}^{l2 Z2}","GeV","done_ana/histoZZ_'${YEAR}'_39.root","zz_ptl2z2",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"p_{T}^{miss}","GeV","done_ana/histoZZ_'${YEAR}'_44.root","zz_met",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{jets}","","done_ana/histoZZ_'${YEAR}'_49.root","zz_njets",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{b jets}","","done_ana/histoZZ_'${YEAR}'_54.root","zz_nbjets",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}^{miss}","GeV","done_ana/histoZZ_'${YEAR}'_59.root","zz_zxliketight_met",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}^{miss}","GeV","done_ana/histoZZ_'${YEAR}'_64.root","zz_zxlikeloose_met",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Cut evolution","","done_ana/histoZZ_'${YEAR}'_69.root","zz_cutevol",0,'${YEAR}',"",1,0,"",1,'${APPLYSCALING}')';

elif [ $NSEL == 'zh' ]; then
  export sf_dy=1.0;  
  export isBlinded=0;
  if [ $# == 4 ]; then
    export isBlinded=$4;
  fi
  for NJET in 0 1; do
    export mlfitResult="comb/fitDiagnosticszh_comb_obs.root";
    export channelName="ZH"${NJET}"_"${YEAR}; 
    if [ $YEAR != '2019' ]; then
      export mlfitResult="comb/../ana_zh/fitDiagnosticszh_comb_obs.root";
    fi
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_0001.root done_ana/histoZH_${YEAR}_${NJET}j_0.root  done_ana/histoZH_${YEAR}_${NJET}j_1.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_0304.root done_ana/histoZH_${YEAR}_${NJET}j_3.root  done_ana/histoZH_${YEAR}_${NJET}j_4.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_0607.root done_ana/histoZH_${YEAR}_${NJET}j_6.root  done_ana/histoZH_${YEAR}_${NJET}j_7.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_0910.root done_ana/histoZH_${YEAR}_${NJET}j_9.root  done_ana/histoZH_${YEAR}_${NJET}j_10.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_1213.root done_ana/histoZH_${YEAR}_${NJET}j_12.root done_ana/histoZH_${YEAR}_${NJET}j_13.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_1516.root done_ana/histoZH_${YEAR}_${NJET}j_15.root done_ana/histoZH_${YEAR}_${NJET}j_16.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_1819.root done_ana/histoZH_${YEAR}_${NJET}j_18.root done_ana/histoZH_${YEAR}_${NJET}j_19.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_2122.root done_ana/histoZH_${YEAR}_${NJET}j_21.root done_ana/histoZH_${YEAR}_${NJET}j_22.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_2425.root done_ana/histoZH_${YEAR}_${NJET}j_24.root done_ana/histoZH_${YEAR}_${NJET}j_25.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_2728.root done_ana/histoZH_${YEAR}_${NJET}j_27.root done_ana/histoZH_${YEAR}_${NJET}j_28.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_3031.root done_ana/histoZH_${YEAR}_${NJET}j_30.root done_ana/histoZH_${YEAR}_${NJET}j_31.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_3334.root done_ana/histoZH_${YEAR}_${NJET}j_33.root done_ana/histoZH_${YEAR}_${NJET}j_34.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_3637.root done_ana/histoZH_${YEAR}_${NJET}j_36.root done_ana/histoZH_${YEAR}_${NJET}j_37.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_3940.root done_ana/histoZH_${YEAR}_${NJET}j_39.root done_ana/histoZH_${YEAR}_${NJET}j_40.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_4243.root done_ana/histoZH_${YEAR}_${NJET}j_42.root done_ana/histoZH_${YEAR}_${NJET}j_43.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_4546.root done_ana/histoZH_${YEAR}_${NJET}j_45.root done_ana/histoZH_${YEAR}_${NJET}j_46.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_5455.root done_ana/histoZH_${YEAR}_${NJET}j_54.root done_ana/histoZH_${YEAR}_${NJET}j_55.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_5758.root done_ana/histoZH_${YEAR}_${NJET}j_57.root done_ana/histoZH_${YEAR}_${NJET}j_58.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_6061.root done_ana/histoZH_${YEAR}_${NJET}j_60.root done_ana/histoZH_${YEAR}_${NJET}j_61.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_6364.root done_ana/histoZH_${YEAR}_${NJET}j_63.root done_ana/histoZH_${YEAR}_${NJET}j_64.root 
    hadd -f done_ana/histoZH_${YEAR}_${NJET}j_6667.root done_ana/histoZH_${YEAR}_${NJET}j_66.root done_ana/histoZH_${YEAR}_${NJET}j_67.root 

    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_0001.root","zh_zhtightsel_mt_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"ZH selection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_0304.root","zh_zhsel_met_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"B-tagged selection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_0607.root","zh_btagsel_met_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"Preselection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_0910.root","zh_presel_met_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"WW-like selection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_1213.root","zh_ww_met_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection |m_{ll}-m_{Z}|","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_1516.root","zh_zhselnminus1_mz_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection N_{jets}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_1819.root","zh_zhselnminus1_njets_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_2122.root","zh_zhselnminus1_met_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection |p_{T}^{ll}-p_{T}^{miss}|/p_{T}^{ll}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_2425.root","zh_zhselnminus1_ptfrac_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection #Delta#phi_{ll,p_{T}^{miss}}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_2728.root","zh_zhselnminus1_dphidilepmet_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,0)';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection N_{b jets}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_3031.root","zh_zhselnminus1_nbjets_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection p_{T}^{ll}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_3334.root","zh_zhselnminus1_ptll_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection #Delta#phi_{jet,p_{T}^{miss}}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_3637.root","zh_zhselnminus1_dphijetmet_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection N_{#tau}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_3940.root","zh_zhselnminus1_ntau_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"N-1 ZH selection #Delta R_{ll}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_4243.root","zh_zhselnminus1_drll_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"ZH cut evolution","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_4546.root","zh_cutevol_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta#phi_{jet,p_{T}^{miss}}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_5455.root","zh_presel_dphijetmet_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_5758.root","zh_presel_met_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"|p_{T}^{ll}-p_{T}^{miss}|/p_{T}^{ll}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_6061.root","zh_presel_ptfrac_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll,p_{T}^{miss}}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_6364.root","zh_presel_dphidilepmet_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,0)';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{b jets}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_6667.root","zh_presel_nbjets_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}')';

    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_48.root","zhll_zhsel_dphidilepmettight_met_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"0 jet category",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_49.root","zhem_zhsel_dphidilepmettight_met_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"#leq 1 jet category",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#eta_{j}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_50.root","zhll_zhsel1j_etaj_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#eta_{j}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_51.root","zhem_zhsel1j_etaj_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#eta_{j}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_52.root","zhll_zhsel2j_etaj_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#eta_{j}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_53.root","zhem_zhsel2j_etaj_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

    
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"ZH cut evolution","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_45.root","zhmm_cutevol_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"ZH cut evolution","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_46.root","zhee_cutevol_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"ZH cut evolution","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_47.root","zhem_cutevol_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta#phi_{jet,p_{T}^{miss}}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_54.root","zhmm_presel_dphijetmet_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta#phi_{jet,p_{T}^{miss}}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_55.root","zhee_presel_dphijetmet_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta#phi_{jet,p_{T}^{miss}}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_56.root","zhem_presel_dphijetmet_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_57.root","zhmm_presel_met_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_58.root","zhee_presel_met_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_59.root","zhem_presel_met_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"|p_{T}^{ll}-p_{T}^{miss}|/p_{T}^{ll}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_60.root","zhmm_presel_ptfrac_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"|p_{T}^{ll}-p_{T}^{miss}|/p_{T}^{ll}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_61.root","zhee_presel_ptfrac_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"|p_{T}^{ll}-p_{T}^{miss}|/p_{T}^{ll}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_62.root","zhem_presel_ptfrac_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll,p_{T}^{miss}}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_63.root","zhmm_presel_dphidilepmet_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,0)';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll,p_{T}^{miss}}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_64.root","zhee_presel_dphidilepmet_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,0)';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll,p_{T}^{miss}}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_65.root","zhem_presel_dphidilepmet_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,0)';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{b jets}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_66.root","zhmm_presel_nbjets_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{b jets}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_67.root","zhee_presel_nbjets_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{b jets}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_68.root","zhem_presel_nbjets_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"No jet selection #eta_{j}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_69.root","zh_nojetsel_etaj_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"No jet selection N_{jets}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_70.root","zh_nojetsel_njets_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"No jet selection #Delta#phi_{ll,p_{T}^{miss}}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_71.root","zh_nojetsel_dphidilepmet_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"No jet selection #Delta#phi_{jet,p_{T}^{miss}}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_72.root","zh_nojetsel_dphijetmet_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{llj}/ H_{T}^{llj}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_73.root","zh_zhsel_vtptht_2j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{llj}/ H_{T}^{llj}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_74.root","zh_zhsel_vtptht_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{max}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_79.root","zh_zhsel_ptl1_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{min}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_80.root","zh_zhsel_ptl2_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"e#mu + p_{T}^{miss}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_81.root","zh_card_met_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"ZH tight selection m_{T}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_0.root","zhmm_zhtightsel_mt_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"ZH selection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_3.root","zhmm_zhsel_met_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"B-tagged selection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_6.root","zhmm_btagsel_met_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"Preselection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_9.root","zhmm_presel_met_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"WW-like selection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_12.root","zhmm_ww_met_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection |m_{ll}-m_{Z}|","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_15.root","zhmm_zhselnminus1_mz_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection N_{jets}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_18.root","zhmm_zhselnminus1_njets_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_21.root","zhmm_zhselnminus1_met_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection |p_{T}^{ll}-p_{T}^{miss}|/p_{T}^{ll}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_24.root","zhmm_zhselnminus1_ptfrac_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection #Delta#phi_{ll,p_{T}^{miss}}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_27.root","zhmm_zhselnminus1_dphidilepmet_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,0)';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection N_{b jets}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_30.root","zhmm_zhselnminus1_nbjets_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection p_{T}^{ll}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_33.root","zhmm_zhselnminus1_ptll_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection #Delta#phi_{jet,p_{T}^{miss}}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_36.root","zhmm_zhselnminus1_dphijetmet_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection N_{#tau}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_39.root","zhmm_zhselnminus1_ntau_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"N-1 ZH selection #Delta R_{ll}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_42.root","zhmm_zhselnminus1_drll_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"ZH tight selection m_{T}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_1.root","zhee_zhtightsel_mt_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"ZH selection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_4.root","zhee_zhsel_met_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"B-tagged selection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_7.root","zhee_btagsel_met_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"Preselection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_10.root","zhee_presel_met_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"WW-like selection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_13.root","zhee_ww_met_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection |m_{ll}-m_{Z}|","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_16.root","zhee_zhselnminus1_mz_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection N_{jets}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_19.root","zhee_zhselnminus1_njets_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_22.root","zhee_zhselnminus1_met_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection |p_{T}^{ll}-p_{T}^{miss}|/p_{T}^{ll}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_25.root","zhee_zhselnminus1_ptfrac_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection #Delta#phi_{ll,p_{T}^{miss}}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_28.root","zhee_zhselnminus1_dphidilepmet_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection N_{b jets}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_31.root","zhee_zhselnminus1_nbjets_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection p_{T}^{ll}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_34.root","zhee_zhselnminus1_ptll_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection #Delta#phi_{jet,p_{T}^{miss}}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_37.root","zhee_zhselnminus1_dphijetmet_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection N_{#tau}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_40.root","zhee_zhselnminus1_ntau_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"N-1 ZH selection #Delta R_{ll}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_43.root","zhee_zhselnminus1_drll_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"ZH tight selection m_{T}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_2.root","zhem_zhtightsel_mt_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"ZH selection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_5.root","zhem_zhsel_met_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"B-tagged selection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_8.root","zhem_btagsel_met_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"Preselection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_11.root","zhem_presel_met_'${NJET}'j",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"WW-like selection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_14.root","zhem_ww_met_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection |m_{ll}-m_{Z}|","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_17.root","zhem_zhselnminus1_mz_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection N_{jets}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_20.root","zhem_zhselnminus1_njets_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection p_{T}^{miss}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_23.root","zhem_zhselnminus1_met_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection |p_{T}^{ll}-p_{T}^{miss}|/p_{T}^{ll}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_26.root","zhem_zhselnminus1_ptfrac_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection #Delta#phi_{ll,p_{T}^{miss}}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_29.root","zhem_zhselnminus1_dphidilepmet_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,0)';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection N_{b jets}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_32.root","zhem_zhselnminus1_nbjets_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"N-1 ZH selection p_{T}^{ll}","GeV","done_ana/histoZH_'${YEAR}'_'${NJET}'j_35.root","zhem_zhselnminus1_ptll_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection #Delta#phi_{jet,p_{T}^{miss}}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_38.root","zhem_zhselnminus1_dphijetmet_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection N_{#tau}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_41.root","zhem_zhselnminus1_ntau_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"N-1 ZH selection #Delta R_{ll}","","done_ana/histoZH_'${YEAR}'_'${NJET}'j_44.root","zhem_zhselnminus1_drll_'${NJET}'j",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}',0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  done

elif [ $NSEL == 'zhgpaper' ]; then
  export sf_dy=1.0;
  export isBlinded=0;
  hadd -f done_ana/histoZHG_mH125_'${YEAR}'_09101112.root  done_ana/histoZHG_mH125_'${YEAR}'_9.root done_ana/histoZHG_mH125_'${YEAR}'_10.root done_ana/histoZHG_mH125_'${YEAR}'_11.root done_ana/histoZHG_mH125_'${YEAR}'_12.root 
  hadd -f done_ana/histoZHG_mH125_'${YEAR}'_171819.root   done_ana/histoZHG_mH125_'${YEAR}'_17.root done_ana/histoZHG_mH125_'${YEAR}'_18.root done_ana/histoZHG_mH125_'${YEAR}'_19.root 

  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBINNoBSM","done_ana/histoZHG_mH125_'${YEAR}'_2.root","zhg_emusel_mtg_prefit",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"#splitline{e#mu}{control region}",0,'${APPLYSCALING}',"","",0,"","",1)';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBINNoBSM","done_ana/histoZHG_mH125_'${YEAR}'_09101112.root","zhg_wzsel_mtg_prefit",1,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"#splitline{WZ}{control region}",0,'${APPLYSCALING}',"","",0,"","")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBINNoBSM","done_ana/histoZHG_mH125_'${YEAR}'_171819.root","zhg_zzsel_mtg_prefit",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"#splitline{ZZ}{control region}",0,'${APPLYSCALING}',"","",0,"","")';

  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBINNoBSM","done_ana/histoZHG_mH125_'${YEAR}'_2.root","zhg_emusel_mtg_withratio",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"#splitline{e#mu}{control region}",1,'${APPLYSCALING}',"comb/fitDiagnosticszhg_comb_125_obs.root","ZHG_2019_125",0,"","",1)';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBINNoBSM","done_ana/histoZHG_mH125_'${YEAR}'_09101112.root","zhg_wzsel_mtg_withratio",1,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"#splitline{WZ}{control region}",1,'${APPLYSCALING}',"comb/fitDiagnosticszhg_comb_125_obs.root","ZHG_2019_125",0,"","")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBINNoBSM","done_ana/histoZHG_mH125_'${YEAR}'_171819.root","zhg_zzsel_mtg_withratio",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"#splitline{ZZ}{control region}",1,'${APPLYSCALING}',"comb/fitDiagnosticszhg_comb_125_obs.root","ZHG_2019_125",0,"","")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBINNoBSM","done_ana/histoZHG_mH125_'${YEAR}'_2.root","zhg_emusel_mtg",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"#splitline{e#mu}{control region}",0,'${APPLYSCALING}',"comb/fitDiagnosticszhg_comb_125_obs.root","ZHG_2019_125",0,"","",1)';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBINNoBSM","done_ana/histoZHG_mH125_'${YEAR}'_09101112.root","zhg_wzsel_mtg",1,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"#splitline{WZ}{control region}",0,'${APPLYSCALING}',"comb/fitDiagnosticszhg_comb_125_obs.root","ZHG_2019_125",0,"","")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBINNoBSM","done_ana/histoZHG_mH125_'${YEAR}'_171819.root","zhg_zzsel_mtg",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"#splitline{ZZ}{control region}",0,'${APPLYSCALING}',"comb/fitDiagnosticszhg_comb_125_obs.root","ZHG_2019_125",0,"","")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBINStack","done_ana/histoZHG_mH125_'${YEAR}'_54.root","zhg_sigsel125200_etaglt1_mtg",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})+ bkg.",'${sf_dy}',0,"|#eta^{#gamma}| < 1",0,'${APPLYSCALING}',"comb/fitDiagnosticszhg_comb_125_obs.root","ZHG_2019_125",0,"done_ana/histoZHG_mH200_2019_54.root","Z(ll)H_{200}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})+ bkg.")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBINStack","done_ana/histoZHG_mH125_'${YEAR}'_55.root","zhg_sigsel125200_etaggt1_mtg",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})+ bkg.",'${sf_dy}',0,"|#eta^{#gamma}| > 1",0,'${APPLYSCALING}',"comb/fitDiagnosticszhg_comb_125_obs.root","ZHG_2019_125",0,"done_ana/histoZHG_mH200_2019_54.root","Z(ll)H_{200}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})+ bkg.")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBINStack","done_ana/histoZHG_mH125_'${YEAR}'_54.root","zhg_sigsel125300_etaglt1_mtg",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})+ bkg.",'${sf_dy}',0,"|#eta^{#gamma}| < 1",0,'${APPLYSCALING}',"comb/fitDiagnosticszhg_comb_125_obs.root","ZHG_2019_125",0,"done_ana/histoZHG_mH300_2019_54.root","Z(ll)H_{300}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})+ bkg.")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBINStack","done_ana/histoZHG_mH125_'${YEAR}'_55.root","zhg_sigsel125300_etaggt1_mtg",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM}+ bkg.)",'${sf_dy}',0,"|#eta^{#gamma}| > 1",0,'${APPLYSCALING}',"comb/fitDiagnosticszhg_comb_125_obs.root","ZHG_2019_125",0,"done_ana/histoZHG_mH300_2019_54.root","Z(ll)H_{300}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM}+ bkg.)")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBINStack","done_ana/histoZHG_mH125_'${YEAR}'_54.root","zhg_sigsel125200_etaglt1_mtg_withratio",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})+ bkg.",'${sf_dy}',0,"|#eta^{#gamma}| < 1",1,'${APPLYSCALING}',"comb/fitDiagnosticszhg_comb_125_obs.root","ZHG_2019_125",0,"done_ana/histoZHG_mH200_2019_54.root","Z(ll)H_{200}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})+ bkg.")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBINStack","done_ana/histoZHG_mH125_'${YEAR}'_55.root","zhg_sigsel125200_etaggt1_mtg_withratio",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})+ bkg.",'${sf_dy}',0,"|#eta^{#gamma}| > 1",1,'${APPLYSCALING}',"comb/fitDiagnosticszhg_comb_125_obs.root","ZHG_2019_125",0,"done_ana/histoZHG_mH200_2019_54.root","Z(ll)H_{200}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})+ bkg.")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBINStack","done_ana/histoZHG_mH125_'${YEAR}'_54.root","zhg_sigsel125300_etaglt1_mtg_withratio",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})+ bkg.",'${sf_dy}',0,"|#eta^{#gamma}| < 1",1,'${APPLYSCALING}',"comb/fitDiagnosticszhg_comb_125_obs.root","ZHG_2019_125",0,"done_ana/histoZHG_mH300_2019_54.root","Z(ll)H_{300}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})+ bkg.")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBINStack","done_ana/histoZHG_mH125_'${YEAR}'_55.root","zhg_sigsel125300_etaggt1_mtg_withratio",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})+ bkg.",'${sf_dy}',0,"|#eta^{#gamma}| > 1",1,'${APPLYSCALING}',"comb/fitDiagnosticszhg_comb_125_obs.root","ZHG_2019_125",0,"done_ana/histoZHG_mH300_2019_54.root","Z(ll)H_{300}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})+ bkg.")';
elif [ $NSEL == 'zhg' ]; then
  export sf_dy=1.0;
  export isBlinded=0;
  hadd -f done_ana/histoZHG_mH125_${YEAR}_0001.root done_ana/histoZHG_mH125_${YEAR}_0.root   done_ana/histoZHG_mH125_${YEAR}_1.root 
  hadd -f done_ana/histoZHG_mH200_${YEAR}_0001.root done_ana/histoZHG_mH200_${YEAR}_0.root   done_ana/histoZHG_mH200_${YEAR}_1.root 
  hadd -f done_ana/histoZHG_mH300_${YEAR}_0001.root done_ana/histoZHG_mH300_${YEAR}_0.root   done_ana/histoZHG_mH300_${YEAR}_1.root 

  hadd -f done_ana/histoZHG_mH125_${YEAR}_0304.root done_ana/histoZHG_mH125_${YEAR}_3.root   done_ana/histoZHG_mH125_${YEAR}_4.root 
  hadd -f done_ana/histoZHG_mH125_${YEAR}_0607.root done_ana/histoZHG_mH125_${YEAR}_6.root   done_ana/histoZHG_mH125_${YEAR}_7.root 
  hadd -f done_ana/histoZHG_mH125_${YEAR}_13141516.root done_ana/histoZHG_mH125_${YEAR}_13.root done_ana/histoZHG_mH125_${YEAR}_14.root done_ana/histoZHG_mH125_${YEAR}_15.root done_ana/histoZHG_mH125_${YEAR}_16.root
  hadd -f done_ana/histoZHG_mH125_${YEAR}_2122.root done_ana/histoZHG_mH125_${YEAR}_21.root done_ana/histoZHG_mH125_${YEAR}_22.root 
  hadd -f done_ana/histoZHG_mH125_${YEAR}_3738.root  done_ana/histoZHG_mH125_${YEAR}_37.root done_ana/histoZHG_mH125_${YEAR}_38.root 

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_ana/histoZHG_mH125_'${YEAR}'_0001.root","zhg_zh125sel_mtg"   ,0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"",0,'${APPLYSCALING}',"comb/fitDiagnosticszhg_comb_125_obs.root","ZHG_2019_125")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_ana/histoZHG_mH200_'${YEAR}'_0001.root","zhg_zh200sel_mtg",0,'${YEAR}',"Z(ll)H_{200}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"",0,'${APPLYSCALING}',"comb/fitDiagnosticszhg_comb_200_obs.root","ZHG_2019_200")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_ana/histoZHG_mH300_'${YEAR}'_0001.root","zhg_zh300sel_mtg",0,'${YEAR}',"Z(ll)H_{300}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"",0,'${APPLYSCALING}',"comb/fitDiagnosticszhg_comb_300_obs.root","ZHG_2019_300")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_ana/histoZHG_mH125_'${YEAR}'_0304.root","zhg_btagsel_mtg",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"B tagged region",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_ana/histoZHG_mH125_'${YEAR}'_0607.root","zhg_zllgsel_mtg",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"Z#gamma region",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_ana/histoZHG_mH125_'${YEAR}'_13141516.root","zhg_wzgsel_mtg",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"WZ#gamma region",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_ana/histoZHG_mH125_'${YEAR}'_2122.root","zhg_wwsel_mtg",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"WW region",0,1)';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"N-1 ZH selection |m_{ll}-m_{Z}|","GeV","done_ana/histoZHG_mH125_'${YEAR}'_24.root","zhg_zhselnminus1_mz",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection N_{jets}","","done_ana/histoZHG_mH125_'${YEAR}'_25.root","zhg_zhselnminus1_njets",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"N-1 ZH selection p_{T}^{miss}","GeV","done_ana/histoZHG_mH125_'${YEAR}'_26.root","zhg_zhselnminus1_met",1,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"N-1 ZH selection |p_{T}^{ll}-p_{T}^{p_{T}^{miss}+E_{T}^{gamma}}|/p_{T}^{ll}","","done_ana/histoZHG_mH125_'${YEAR}'_27.root","zhg_zhselnminus1_ptfrac",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"N-1 ZH selection #Delta#phi_{ll,p_{T}^{miss}+E_{T}^{gamma}}","","done_ana/histoZHG_mH125_'${YEAR}'_28.root","zhg_zhselnminus1_dphidilepmet",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection N_{b jets}","","done_ana/histoZHG_mH125_'${YEAR}'_29.root","zhg_zhselnminus1_nbjets",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"N-1 ZH selection p_{T}^{ll}","GeV","done_ana/histoZHG_mH125_'${YEAR}'_30.root","zhg_zhselnminus1_ptll",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection #Delta#phi_{jet,p_{T}^{miss}}","","done_ana/histoZHG_mH125_'${YEAR}'_31.root","zhg_zhselnminus1_dphijetmet",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection N_{#tau}","","done_ana/histoZHG_mH125_'${YEAR}'_32.root","zhg_zhselnminus1_ntau",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,20,"N-1 ZH selection m_{T}","GeV","done_ana/histoZHG_mH125_'${YEAR}'_33.root","zhg_zhselnminus1_mtg",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N-1 ZH selection m_{ll#gamma}","GeV","done_ana/histoZHG_mH125_'${YEAR}'_34.root","zhg_zhselnminus1_mllg",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"|#eta^{#gamma}|","","done_ana/histoZHG_mH125_'${YEAR}'_35.root","zhg_zhsel_etag",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"",0,'${APPLYSCALING}',"comb/fitDiagnosticszhg_comb_125_obs.root","ZHG_2019_125")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"ZH selection Tightphoton veto","","done_ana/histoZHG_mH125_'${YEAR}'_36.root","zhg_zhsel_photonveto",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"ZH cut evolution","","done_ana/histoZHG_mH125_'${YEAR}'_3738.root","zhg_zll_cutevol",1,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"ZH cut evolution","","done_ana/histoZHG_mH125_'${YEAR}'_37.root","zhg_zmm_cutevol",1,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"ZH cut evolution","","done_ana/histoZHG_mH125_'${YEAR}'_38.root","zhg_zee_cutevol",1,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"ZH cut evolution","","done_ana/histoZHG_mH125_'${YEAR}'_39.root","zhg_zem_cutevol",1,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"ZH #eta_{j}","","done_ana/histoZHG_mH125_'${YEAR}'_40.root","zhg_zhllsel_etaj",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{miss}","GeV","done_ana/histoZHG_mH125_'${YEAR}'_41.root","zhg_zllhselnminus4_met",1,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"|p_{T}^{ll}-p_{T}^{miss#gamma}|/p_{T}^{ll}","","done_ana/histoZHG_mH125_'${YEAR}'_42.root","zhg_zllhselnminus4_ptfracg",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"|p_{T}^{ll#gamma}-p_{T}^{miss}|/p_{T}^{ll#gamma}","","done_ana/histoZHG_mH125_'${YEAR}'_43.root","zhg_zllhselnminus4_ptfrac",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll,p_{T}^{miss#gamma}}","","done_ana/histoZHG_mH125_'${YEAR}'_44.root","zhg_zllhselnminus4_dphidilepmetg",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"",1,0)';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll#gamma,p_{T}^{miss}}","","done_ana/histoZHG_mH125_'${YEAR}'_45.root","zhg_zllhselnminus4_dphidilepgmet",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"",1,0)';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeV","done_ana/histoZHG_mH125_'${YEAR}'_46.root","zhg_zllhselnminus4_mtg",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"#Delta#phi_{ll,p_{T}^{miss}+E_{T}^{gamma}}","","done_ana/histoZHG_mH125_'${YEAR}'_47.root","zhg_zllhselnminus3_dphidilepmetg",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta#phi_{jet,p_{T}^{miss}}","","done_ana/histoZHG_mH125_'${YEAR}'_48.root","zhg_zllhselnminus3_dphijetmet",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeV","done_ana/histoZHG_mH125_'${YEAR}'_49.root","zhg_zllhselnminus3_mtg",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"Leading p_{T}","GeV","done_ana/histoZHG_mH125_'${YEAR}'_50.root","zhg_zhgsel_ptl1",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"Signal region",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"Trailing p_{T}","GeV","done_ana/histoZHG_mH125_'${YEAR}'_51.root","zhg_zhgsel_ptl2",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"Signal region",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"WZ selection m_{T}","GeV","done_ana/histoZHG_mH125_'${YEAR}'_52.root","zhg_wzsel_emulation_mtg",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"WZ region",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Z+fake photon selection m_{T}","GeV","done_ana/histoZHG_mH125_'${YEAR}'_53.root","zhg_fakesel_mtg",0,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}',0,"WZ region",0,'${APPLYSCALING}')';
  if [ $YEAR != 2019 ]; then
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Bin #","","done_ana/histoZHG_mH125_'${YEAR}'_55.root","zhg_card_mt",1,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"",0,'${APPLYSCALING}',"done_ana/../ana_zhg/fitDiagnosticszhg_comb_125_obs.root","ZHG_'${YEAR}'_125")';
  elif [ $YEAR == 2019 ]; then
    root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Bin #","","done_ana/histoZHG_mH125_'${YEAR}'_55.root","zhg_card_mt",1,'${YEAR}',"Z(ll)H_{125}(#gamma_{D}+#gamma) (0.1 #times #sigma_{SM})",'${sf_dy}','${isBlinded}',"",0,'${APPLYSCALING}',"comb/fitDiagnosticszhg_comb_125_obs.root","ZHG_'${YEAR}'_125")';
  fi

elif [ $NSEL == 'z' ]; then
  export sf_dy=1.0;

  hadd -f done_dy/histoDY0zll_'${YEAR}'_4243.root done_dy/histoDY0zll_'${YEAR}'_42.root done_dy/histoDY0zll_'${YEAR}'_43.root
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"N_{vtx}","","done_dy/histoDY0zll_'${YEAR}'_4243.root","zll_npv",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,1)';

  hadd -f done_dy/histoDY0zll_'${YEAR}'_2425.root done_dy/histoDY0zll_'${YEAR}'_24.root done_dy/histoDY0zll_'${YEAR}'_25.root
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#phi p_{T}^{miss}","","done_dy/histoDY0zll_'${YEAR}'_2425.root","zll_metphi",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#phi p_{T}^{miss}","","done_dy/histoDY0zll_'${YEAR}'_87.root","zll_corrmetphi",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';

  hadd -f done_dy/histoDY0zll_'${YEAR}'_2728.root done_dy/histoDY0zll_'${YEAR}'_27.root done_dy/histoDY0zll_'${YEAR}'_28.root
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#phi_{ll,p_{T}^{miss}}","","done_dy/histoDY0zll_'${YEAR}'_2728.root","zll_dphidilepmet",0,'${YEAR}',"",'${sf_dy}',0,"",1,'${APPLYSCALING}')';

  hadd -f done_dy/histoDY0zll_'${YEAR}'_3031.root done_dy/histoDY0zll_'${YEAR}'_30.root done_dy/histoDY0zll_'${YEAR}'_31.root
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#phi_{ll,X/Y Corr. p_{T}^{miss}}","","done_dy/histoDY0zll_'${YEAR}'_3031.root","zll_dphidilepcorrmet",0,'${YEAR}',"",'${sf_dy}',0,"",1,'${APPLYSCALING}')';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_0.root","zmm_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_1.root","zee_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_2.root","zem_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_3.root","zmm_mll_ss",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_4.root","zee_mll_ss",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_5.root","zem_mll_ss",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{central jets}","","done_dy/histoDY0zll_'${YEAR}'_6.root","zmm_ncjets",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{central jets}","","done_dy/histoDY0zll_'${YEAR}'_7.root","zee_ncjets",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{central jets}","","done_dy/histoDY0zll_'${YEAR}'_8.root","zem_ncjets",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{jets}","","done_dy/histoDY0zll_'${YEAR}'_9.root","zmm_njets",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{jets}","","done_dy/histoDY0zll_'${YEAR}'_10.root","zee_njets",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{jets}","","done_dy/histoDY0zll_'${YEAR}'_11.root","zem_njets",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_12.root","zmm_ptll",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_13.root","zee_ptll",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_14.root","zem_ptll",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_15.root","zmm_met",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_16.root","zee_met",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_17.root","zem_met",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"Puppi p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_18.root","zmm_puppimet",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"Puppi p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_19.root","zee_puppimet",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"Puppi p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_20.root","zem_puppimet",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"X/Y Corr. p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_21.root","zmm_corrmet",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"X/Y Corr. p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_22.root","zee_corrmet",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"X/Y Corr. p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_23.root","zem_corrmet",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#phi p_{T}^{miss}","","done_dy/histoDY0zll_'${YEAR}'_24.root","zmm_metphi",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#phi p_{T}^{miss}","","done_dy/histoDY0zll_'${YEAR}'_25.root","zee_metphi",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#phi p_{T}^{miss}","","done_dy/histoDY0zll_'${YEAR}'_26.root","zem_metphi",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#phi_{ll,p_{T}^{miss}}","","done_dy/histoDY0zll_'${YEAR}'_27.root","zmm_dphidilepmet",0,'${YEAR}',"",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#phi_{ll,p_{T}^{miss}}","","done_dy/histoDY0zll_'${YEAR}'_28.root","zee_dphidilepmet",0,'${YEAR}',"",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#phi_{ll,p_{T}^{miss}}","","done_dy/histoDY0zll_'${YEAR}'_29.root","zem_dphidilepmet",0,'${YEAR}',"",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#phi_{ll,X/Y Corr. p_{T}^{miss}}","","done_dy/histoDY0zll_'${YEAR}'_30.root","zmm_dphidilepcorrmet",0,'${YEAR}',"",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#phi_{ll,X/Y Corr. p_{T}^{miss}}","","done_dy/histoDY0zll_'${YEAR}'_31.root","zee_dphidilepcorrmet",0,'${YEAR}',"",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#phi_{ll,X/Y Corr. p_{T}^{miss}}","","done_dy/histoDY0zll_'${YEAR}'_32.root","zem_dphidilepcorrmet",0,'${YEAR}',"",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#phi_{ll}","","done_dy/histoDY0zll_'${YEAR}'_33.root","zmm_dphill",0,'${YEAR}',"",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#phi_{ll}","","done_dy/histoDY0zll_'${YEAR}'_34.root","zee_dphill",0,'${YEAR}',"",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#phi_{ll}","","done_dy/histoDY0zll_'${YEAR}'_35.root","zem_dphill",0,'${YEAR}',"",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"|p_{T}^{ll}-p_{T}^{miss}|/p_{T}^{ll}","","done_dy/histoDY0zll_'${YEAR}'_36.root","zmm_ptfrac",0,'${YEAR}',"",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"|p_{T}^{ll}-p_{T}^{miss}|/p_{T}^{ll}","","done_dy/histoDY0zll_'${YEAR}'_37.root","zee_ptfrac",0,'${YEAR}',"",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"|p_{T}^{ll}-p_{T}^{miss}|/p_{T}^{ll}","","done_dy/histoDY0zll_'${YEAR}'_38.root","zem_ptfrac",0,'${YEAR}',"",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta R_{ll}","","done_dy/histoDY0zll_'${YEAR}'_39.root","zmm_drll",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta R_{ll}","","done_dy/histoDY0zll_'${YEAR}'_40.root","zee_drll",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta R_{ll}","","done_dy/histoDY0zll_'${YEAR}'_41.root","zem_drll",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"N_{vtx}","","done_dy/histoDY0zll_'${YEAR}'_42.root","zmm_npv",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"N_{vtx}","","done_dy/histoDY0zll_'${YEAR}'_43.root","zee_npv",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"N_{vtx}","","done_dy/histoDY0zll_'${YEAR}'_44.root","zem_npv",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"Leading #eta_{l}","","done_dy/histoDY0zll_'${YEAR}'_45.root","zmm_eta",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"Leading #eta_{l}","","done_dy/histoDY0zll_'${YEAR}'_46.root","zee_eta",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"Leading #eta_{l}","","done_dy/histoDY0zll_'${YEAR}'_47.root","zem_eta",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{l}","GeV","done_dy/histoDY0zll_'${YEAR}'_48.root","zmm_ptl",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{l}","GeV","done_dy/histoDY0zll_'${YEAR}'_49.root","zee_ptl",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{l}","GeV","done_dy/histoDY0zll_'${YEAR}'_50.root","zem_ptl",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{Loose b jets}","","done_dy/histoDY0zll_'${YEAR}'_51.root","zmm_nlbjets",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{Loose b jets}","","done_dy/histoDY0zll_'${YEAR}'_52.root","zee_nlbjets",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{Loose b jets}","","done_dy/histoDY0zll_'${YEAR}'_53.root","zem_nlbjets",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{Medium b jets}","","done_dy/histoDY0zll_'${YEAR}'_54.root","zmm_nmbjets",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{Medium b jets}","","done_dy/histoDY0zll_'${YEAR}'_55.root","zee_nmbjets",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{Medium b jets}","","done_dy/histoDY0zll_'${YEAR}'_56.root","zem_nmbjets",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{j}","GeV","done_dy/histoDY0zll_'${YEAR}'_57.root","zll_ptj",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"B tag","","done_dy/histoDY0zll_'${YEAR}'_58.root","zll_btag",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#eta^{j}","","done_dy/histoDY0zll_'${YEAR}'_59.root","zll_etaj",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#phi^{j}","","done_dy/histoDY0zll_'${YEAR}'_60.root","zll_phij",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_61.root","zll_etajlt2p5_met",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_62.root","zll_etajlt2p5_corrmet",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_63.root","zll_etajlt2p5_met_nonvtx",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_64.root","zll_etajlt2p5_corrmet_nonvtx",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_65.root","zll_etajcrack_met",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_66.root","zll_etajcrack_corrmet",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_67.root","zll_etajcrack_met_nonvtx",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_68.root","zll_etajcrack_corrmet_nonvtx",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_69.root","zll_etajgt3p0_met",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_70.root","zll_etajgt3p0_corrmet",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_71.root","zll_etajgt3p0_met_nonvtx",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_72.root","zll_etajgt3p0_corrmet_nonvtx",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_73.root","zll_met",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_74.root","zll_corrmet",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_75.root","zll_met_nonvtx",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_76.root","zll_corrmet_nonvtx",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_77.root","zll_ptjgt100_met",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_78.root","zll_ptjgt100_corrmet",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_79.root","zll_ptjgt100_met_nonvtx",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_80.root","zll_ptjgt100_corrmet_nonvtx",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_81.root","zll_ptjgt100_etajlt2p5_met",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_82.root","zll_ptjgt100_etajlt2p5_corrmet",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_83.root","zll_ptjgt100_etajlt2p5_met_nonvtx",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_84.root","zll_ptjgt100_etajlt2p5_corrmet_nonvtx",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"Raw p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_85.root","zll_rawmet",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,4,"Calo p_{T}^{miss}","GeV","done_dy/histoDY0zll_'${YEAR}'_86.root","zll_calomet",1,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeV","done_dy/histoDY0zll_'${YEAR}'_118.root","zll_2j_mjj",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta#eta_{jj}","","done_dy/histoDY0zll_'${YEAR}'_119.root","zll_2j_detajj",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta#phi_{jj}","","done_dy/histoDY0zll_'${YEAR}'_120.root","zll_2j_dphijj",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#eta_{j}","GeV","done_dy/histoDY0zll_'${YEAR}'_121.root","zll_2j_etaj",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{j}","GeV","done_dy/histoDY0zll_'${YEAR}'_122.root","zll_2j_ptj",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeV","done_dy/histoDY0zll_'${YEAR}'_123.root","zll_2j_mjjgt500_mjj",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta#eta_{jj}","","done_dy/histoDY0zll_'${YEAR}'_124.root","zll_2j_mjjgt500_detajj",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta#phi_{jj}","","done_dy/histoDY0zll_'${YEAR}'_125.root","zll_2j_mjjgt500_dphijj",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#eta_{j}","GeV","done_dy/histoDY0zll_'${YEAR}'_126.root","zll_2j_mjjgt500_etaj",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{j}","GeV","done_dy/histoDY0zll_'${YEAR}'_127.root","zll_2j_mjjgt500_ptj",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';

elif [ $NSEL == 'zexo' ]; then
  export sf_dy=1.0;
  if [ $YEAR == '2019' ]; then
    for i in `seq 144 164`;
      do
        hadd -f done_dy/histoDY0zll_2019_${i}.root done_dy/histoDY0zll_201[6-8]_${i}.root;
      done
  fi

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"H_{T}","GeV","done_dy/histoDY0zll_'${YEAR}'_144.root","zmm_1j_1b_ht",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"H_{T}","GeV","done_dy/histoDY0zll_'${YEAR}'_145.root","zee_1j_1b_ht",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"H_{T}","GeV","done_dy/histoDY0zll_'${YEAR}'_146.root","zem_1j_1b_ht",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"H_{T}","GeV","done_dy/histoDY0zll_'${YEAR}'_147.root","zmm_1j_0b_ht",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"H_{T}","GeV","done_dy/histoDY0zll_'${YEAR}'_148.root","zee_1j_0b_ht",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"H_{T}","GeV","done_dy/histoDY0zll_'${YEAR}'_149.root","zem_1j_0b_ht",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"log10(#phi^{*})","","done_dy/histoDY0zll_'${YEAR}'_150.root","zmm_0j_phistar",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"log10(#phi^{*})","","done_dy/histoDY0zll_'${YEAR}'_151.root","zee_0j_phistar",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"log10(#phi^{*})","","done_dy/histoDY0zll_'${YEAR}'_152.root","zem_0j_phistar",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#chi","","done_dy/histoDY0zll_'${YEAR}'_153.root","zmm_0j_chi",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#chi","","done_dy/histoDY0zll_'${YEAR}'_154.root","zee_0j_chi",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#chi","","done_dy/histoDY0zll_'${YEAR}'_155.root","zem_0j_chi",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p^{j}_{T}","GeV","done_dy/histoDY0zll_'${YEAR}'_156.root","zmm_1j_0b_ht800_ptj",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"HT > 800 GeV",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p^{j}_{T}","GeV","done_dy/histoDY0zll_'${YEAR}'_157.root","zee_1j_0b_ht800_ptj",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"HT > 800 GeV",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p^{j}_{T}","GeV","done_dy/histoDY0zll_'${YEAR}'_158.root","zem_1j_0b_ht800_ptj",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"HT > 800 GeV",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p^{l-max}_{T}","GeV","done_dy/histoDY0zll_'${YEAR}'_159.root","zmm_1j_0b_ht800_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"HT > 800 GeV",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p^{l-max}_{T}","GeV","done_dy/histoDY0zll_'${YEAR}'_160.root","zee_1j_0b_ht800_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"HT > 800 GeV",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p^{l-max}_{T}","GeV","done_dy/histoDY0zll_'${YEAR}'_161.root","zem_1j_0b_ht800_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"HT > 800 GeV",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p^{l-min}_{T}","GeV","done_dy/histoDY0zll_'${YEAR}'_162.root","zmm_1j_0b_ht800_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"HT > 800 GeV",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p^{l-min}_{T}","GeV","done_dy/histoDY0zll_'${YEAR}'_163.root","zee_1j_0b_ht800_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"HT > 800 GeV",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p^{l-min}_{T}","GeV","done_dy/histoDY0zll_'${YEAR}'_164.root","zem_1j_0b_ht800_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"HT > 800 GeV",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#eta^{j}","","done_dy/histoDY0zll_'${YEAR}'_165.root","zmm_1j_0b_ht800_etaj",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"HT > 800 GeV",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#eta^{j}","","done_dy/histoDY0zll_'${YEAR}'_166.root","zee_1j_0b_ht800_etaj",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"HT > 800 GeV",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#eta^{j}","","done_dy/histoDY0zll_'${YEAR}'_167.root","zem_1j_0b_ht800_etaj",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"HT > 800 GeV",1,'${APPLYSCALING}')';

elif [ $NSEL == 'zmass' ]; then
  export sf_dy=1.0;

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_88.root","zmm_mll_88",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_89.root","zmm_mll_89",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_90.root","zmm_mll_90",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_91.root","zmm_mll_91",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_92.root","zmm_mll_92",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_93.root","zee_mll_93",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_94.root","zee_mll_94",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_95.root","zee_mll_95",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_96.root","zee_mll_96",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_97.root","zee_mll_97",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_98.root","zmm_mll_98",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_99.root","zee_mll_99",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_100.root","zmm_mll_100",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_101.root","zee_mll_101",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_102.root","zmm_mll_102",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_103.root","zee_mll_103",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_104.root","zmm_mll_104",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_105.root","zee_mll_105",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_106.root","zmm_mll_106",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_107.root","zee_mll_107",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_108.root","zmm_mll_108",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_109.root","zee_mll_109",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_110.root","zmm_mll_110",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_111.root","zee_mll_111",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_112.root","zmm_mll_112",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_113.root","zee_mll_113",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_114.root","zmm_mll_114",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_115.root","zee_mll_115",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_116.root","zmm_mll_116",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0zll_'${YEAR}'_117.root","zee_mll_117",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';

elif [ $NSEL == 'sswwpaper' ]; then
  #hadd -f done_ana/histossww_2019_134_t2_2p9.root histossww_201?_134.root
  #hadd -f done_ana/histossww_2019_135_t2_2p9.root histossww_201?_135.root
  #hadd -f done_ana/histossww_2019_136_t2_2p9.root histossww_201?_136.root
  #hadd -f done_ana/histossww_2019_137_t2_2p9.root histossww_201?_137.root
  #hadd -f done_ana/histossww_2019_138_t2_2p9.root histossww_201?_138.root
  #hadd -f done_ana/histossww_2019_139_t2_2p9.root histossww_201?_139.root
  #hadd -f done_ana/histossww_2019_134_s0_20.root histossww_201?_134.root
  #hadd -f done_ana/histossww_2019_135_s0_20.root histossww_201?_135.root
  #hadd -f done_ana/histossww_2019_136_s0_20.root histossww_201?_136.root
  #hadd -f done_ana/histossww_2019_137_s0_20.root histossww_201?_137.root
  #hadd -f done_ana/histossww_2019_138_s0_20.root histossww_201?_138.root
  #hadd -f done_ana/histossww_2019_139_s0_20.root histossww_201?_139.root
  #hadd -f done_ana/histossww_2019_134_aqgc.root done_ana/histossww_2019_134.root done_ana/histossww_2019_134_t2_2p9.root
  #hadd -f done_ana/histossww_2019_135_aqgc.root done_ana/histossww_2019_135.root done_ana/histossww_2019_135_t2_2p9.root
  #hadd -f done_ana/histossww_2019_136_aqgc.root done_ana/histossww_2019_136.root done_ana/histossww_2019_136_t2_2p9.root
  #hadd -f done_ana/histossww_2019_137_aqgc.root done_ana/histossww_2019_137.root done_ana/histossww_2019_137_t2_2p9.root
  #hadd -f done_ana/histossww_2019_138_aqgc.root done_ana/histossww_2019_138.root done_ana/histossww_2019_138_t2_2p9.root
  #hadd -f done_ana/histossww_2019_139_aqgc.root done_ana/histossww_2019_139.root done_ana/histossww_2019_139_t2_2p9.root
  export isNeverBlinded=0;
  export isBlinded=0;
  export fidAnaName="";
  export YEAR=2019
  export mlfitResult="comb/fitDiagnosticsssww_comb_wwwz_obs.root";
  export channelName="SSWW_"${YEAR};

  hadd -f done_ana/histossww_${YEAR}_686970${fidAnaName}.root done_ana/histossww_${YEAR}_68${fidAnaName}.root  done_ana/histossww_${YEAR}_69${fidAnaName}.root	done_ana/histossww_${YEAR}_70${fidAnaName}.root

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,1,"m_{jj}","GeVBINBinWidthROOT","done_ana/histossww_'${YEAR}'_0'${fidAnaName}'.root","ssww_wwsel_mjj",0,  '${YEAR}',"H_{125}",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,1,"m_{ll}","GeVBINBinWidthROOT","done_ana/histossww_'${YEAR}'_66'${fidAnaName}'.root","ssww_wwsel_mll",0,'${YEAR}',"H_{125}",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,1,"m_{jj}","GeVBINBinWidthROOT","done_ana/histossww_'${YEAR}'_4'${fidAnaName}'.root","ssww_wzsel_mjj",0,  '${YEAR}',"H_{125}",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,1,"BDT score","BINROOT","done_ana/histossww_'${YEAR}'_77'${fidAnaName}'.root","ssww_wzsel_bdt",0,'${YEAR}',"H_{125}",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,1,"m_{ll}"    ,"GeVBIN","ana_ssww_frozen/histossww_'${YEAR}'_134'${fidAnaName}'_aqgc.root","ssww_wwsel_aqgc_mll"     ,1,'${YEAR}',"f_{T2}/#Lambda^{4} = 2.9 TeV^{-4}",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'",0,"ana_ssww_frozen/histossww_'${YEAR}'_134'${fidAnaName}'_s0_20.root","f_{S0}/#Lambda^{4} = 20 TeV^{-4}")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,1,"m_{T}^{WW}","GeVBINROOT","ana_ssww_frozen/histossww_'${YEAR}'_135'${fidAnaName}'_aqgc.root","ssww_wwsel_aqgc_fullmtww",1,'${YEAR}',"f_{T2}/#Lambda^{4} = 2.9 TeV^{-4}",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'",0,"ana_ssww_frozen/histossww_'${YEAR}'_135'${fidAnaName}'_s0_20.root","f_{S0}/#Lambda^{4} = 20 TeV^{-4}")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,1,"m^{WW}"    ,"GeVBIN","ana_ssww_frozen/histossww_'${YEAR}'_136'${fidAnaName}'_aqgc.root","ssww_wwsel_aqgc_fullmww" ,1,'${YEAR}',"f_{T2}/#Lambda^{4} = 2.9 TeV^{-4}",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'",0,"ana_ssww_frozen/histossww_'${YEAR}'_136'${fidAnaName}'_s0_20.root","f_{S0}/#Lambda^{4} = 20 TeV^{-4}")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,1,"m_{T}^{WZ}","GeVBIN","ana_ssww_frozen/histossww_'${YEAR}'_137'${fidAnaName}'_aqgc.root","ssww_wzsel_aqgc_mtwz"    ,1,'${YEAR}',"f_{T2}/#Lambda^{4} = 2.9 TeV^{-4}",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'",0,"ana_ssww_frozen/histossww_'${YEAR}'_137'${fidAnaName}'_s0_20.root","f_{S0}/#Lambda^{4} = 20 TeV^{-4}")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,1,"m_{T}^{WZ}","GeVBINROOT","ana_ssww_frozen/histossww_'${YEAR}'_138'${fidAnaName}'_aqgc.root","ssww_wzsel_aqgc_fullmtwz",1,'${YEAR}',"f_{T2}/#Lambda^{4} = 2.9 TeV^{-4}",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'",0,"ana_ssww_frozen/histossww_'${YEAR}'_138'${fidAnaName}'_s0_20.root","f_{S0}/#Lambda^{4} = 20 TeV^{-4}")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,1,"m^{WZ}"    ,"GeVBIN","ana_ssww_frozen/histossww_'${YEAR}'_139'${fidAnaName}'_aqgc.root","ssww_wzsel_aqgc_fullmwz" ,1,'${YEAR}',"f_{T2}/#Lambda^{4} = 2.9 TeV^{-4}",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'",0,"ana_ssww_frozen/histossww_'${YEAR}'_139'${fidAnaName}'_s0_20.root","f_{S0}/#Lambda^{4} = 20 TeV^{-4}")';

  sed -i 's/writeExtraText = false/writeExtraText = true/' MitAnalysisRunII/panda/makePlots/CMS_lumi.h
  sed -i 's/extraText   = "Preliminary"/extraText   = "Supplementary"/' MitAnalysisRunII/panda/makePlots/CMS_lumi.h
  touch MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,2,"#Delta#eta_{jj}","","done_ana/histossww_'${YEAR}'_5'${fidAnaName}'.root","ssww_wwsel_detajj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,2,"p_{T}^{j}","GeV","done_ana/histossww_'${YEAR}'_15'${fidAnaName}'.root","ssww_wwsel_ptj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,2,"p_{T}^{j}","GeV","done_ana/histossww_'${YEAR}'_19'${fidAnaName}'.root","ssww_wzsel_ptj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,1,"N_{j}","","done_ana/histossww_'${YEAR}'_25'${fidAnaName}'.root","ssww_wwsel_njet",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,1,"N_{j}","","done_ana/histossww_'${YEAR}'_29'${fidAnaName}'.root","ssww_wzsel_njet",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,2,"#Delta#phi_{jj}","","done_ana/histossww_'${YEAR}'_124'${fidAnaName}'.root","ssww_wwsel_dphijj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,2,"#Delta#phi_{jj}","","done_ana/histossww_'${YEAR}'_92'${fidAnaName}'.root","ssww_wzsel_dphijj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,2,"z_{ll}^{*}","","done_ana/histossww_'${YEAR}'_46'${fidAnaName}'.root","ssww_wwsel_zvvstar",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,2,"z_{3l}^{*}","","done_ana/histossww_'${YEAR}'_47'${fidAnaName}'.root","ssww_wzsel_zvvstar",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,1,"p_{T}^{max}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_686970'${fidAnaName}'.root","ssww_wwsel_ptl1",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp19012.C+'(0,1,"p_{T}^{max}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_72'${fidAnaName}'.root","ssww_wzsel_ptl1",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  sed -i 's/writeExtraText = true/writeExtraText = false/' MitAnalysisRunII/panda/makePlots/CMS_lumi.h
  sed -i 's/extraText   = "Supplementary"/extraText   = "Preliminary"/' MitAnalysisRunII/panda/makePlots/CMS_lumi.h

elif [ $NSEL == 'sswwlongpaper' ]; then
  export legend0=""
  export legend1="W_{L}W_{L}/W_{T}W_{X}"
  export legend2="W_{L}W_{X}/W_{T}W_{T}"
  export isNeverBlinded=0;
  export isBlinded=0;
  export fidAnaName="";
  export mlfitResult="";
  export channelName="";
  export YEAR=2019;
  export APPLYSCALING=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp20006.C+'(0,1,"m_{jj}","GeVBINBinWidth","ana_ssww_frozen/ssww_wwsel_mjj_2019.root"	    ,"sswwlong_wwsel_mjj"            ,0,'${YEAR}',"",1.0,'${isBlinded}',"'${legend0}'",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp20006.C+'(0,1,"BDT score","BIN",        "ana_ssww_frozen/ssww_wwsel_wsbdt_2019.root"          ,"sswwlong_wwsel_wsbdt"          ,0,'${YEAR}',"",1.0,'${isBlinded}',"'${legend0}'",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp20006.C+'(0,2,"#Delta#phi_{jj}","",     "ana_ssww_frozen/ssww_wwsel_dphijj_2019.root"         ,"sswwlong_wwsel_dphijj"         ,0,'${YEAR}',"",1.0,'${isBlinded}',"'${legend0}'",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp20006.C+'(0,2,"#Delta #phi_{ll}","",    "ana_ssww_frozen/ssww_wwsel_dphill_2019.root"         ,"sswwlong_wwsel_dphill"         ,0,'${YEAR}',"",1.0,'${isBlinded}',"'${legend0}'",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp20006.C+'(0,1,"BDT score","BIN",	      "ana_ssww_frozen/ssww_wwsel_bdt_2019.root"            ,"sswwlong_wwsel_bdt"            ,1,'${YEAR}',"",1.0,'${isBlinded}',"'${legend1}'",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp20006.C+'(0,1,"BDT score","BIN",	      "ana_ssww_frozen/ssww_wwsel_bdtlx_2019.root"          ,"sswwlong_wwsel_bdtlx"          ,1,'${YEAR}',"",1.0,'${isBlinded}',"'${legend2}'",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  sed -i 's/writeExtraText = false/writeExtraText = true/' MitAnalysisRunII/panda/makePlots/CMS_lumi.h
  sed -i 's/extraText   = "Preliminary"/extraText   = "Supplementary"/' MitAnalysisRunII/panda/makePlots/CMS_lumi.h
  touch MitAnalysisRunII/panda/makePlots/finalPlot_smp20006.C
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp20006.C+'(0,1,"BDT score","BIN",	      "ana_ssww_frozen/ssww_wwsel_wsbdtgt0_bdt_2019.root"   ,"sswwlong_wwsel_wsbdtgt0_bdt"   ,1,'${YEAR}',"",1.0,'${isBlinded}',"'${legend1}'",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_smp20006.C+'(0,1,"BDT score","BIN",        "ana_ssww_frozen/ssww_wwsel_wsbdtgt0_bdtlx_2019.root" ,"sswwlong_wwsel_wsbdtgt0_bdtlx" ,1,'${YEAR}',"",1.0,'${isBlinded}',"'${legend2}'",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  sed -i 's/writeExtraText = true/writeExtraText = false/' MitAnalysisRunII/panda/makePlots/CMS_lumi.h
  sed -i 's/extraText   = "Supplementary"/extraText   = "Preliminary"/' MitAnalysisRunII/panda/makePlots/CMS_lumi.h

elif [ $NSEL == 'ssww' ] || [ $NSEL == 'sswwll' ] || [ $NSEL == 'sswwlx' ] || [ $NSEL == 'higgs' ]; then
  export legendBSM="";
  export isNeverBlinded=0;
  export isBlinded=0;
  export fidAnaName="";
  if [ $# == 4 ]; then
    export isBlinded=$4;
  fi
  export mlfitResult="comb/fitDiagnosticsssww_comb_wwwz_obs.root";
  export channelName="SSWW_"${YEAR}; 
  if [ $NSEL == 'sswwll' ]; then
    export legendBSM="W_{L}W_{L}"
    export mlfitResult="done_ana/../ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root";
    export fidAnaName="_fiducial5";
    export channelName="SSWW_2019"; 
    if [ $YEAR != '2019' ]; then
      export mlfitResult="done_ana/../ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root";
      export channelName="SSWW_"${YEAR};
    fi
  fi
  if [ $NSEL == 'sswwlx' ]; then
    export mlfitResult="done_ana/../ana_long/fitDiagnosticsssww_comb_fiducial9_obs.root";
    export fidAnaName="_fiducial9";
    export channelName="SSWW_2019"; 
    if [ $YEAR != '2019' ]; then
      export mlfitResult="done_ana/../ana_long/fitDiagnosticsssww_2019_fiducial9_obs.root";
      export channelName="SSWW_"${YEAR};
    fi
  fi
  if [ $NSEL == 'higgs' ]; then
    export legendBSM="m_{H_{5}}=500GeV,s_{H}=1";
    export mlfitResult="done_ana/../ana_higgs/fitDiagnosticsssww_comb_fiducial6_mH500_obs.root";
    export fidAnaName="_fiducial6_mH500";
    export channelName="SSWW_2019"; 
    if [ $YEAR != '2019' ]; then
      export mlfitResult="done_ana/../ana_higgs/fitDiagnosticsssww_2019_fiducial6_mH500_obs.root";
      export channelName="SSWW_"${YEAR};
    fi
  fi
  if [ $YEAR != '2019' ] && [ $NSEL == 'ssww' ]; then
    export mlfitResult="done_ana/../ana_ssww/fitDiagnosticsssww_${YEAR}_wwwz_obs.root";
    export channelName="ch1";
  fi

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","ROOT"          ,"done_ana/histossww_'${YEAR}'_0'${fidAnaName}'.root","ssww_wwsel_mjj"     ,0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,0,"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta#phi_{jj}","ROOT" ,"done_ana/histossww_'${YEAR}'_124'${fidAnaName}'.root","ssww_wwsel_dphijj",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,0,"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta #phi_{ll}","ROOT","done_ana/histossww_'${YEAR}'_131'${fidAnaName}'.root","ssww_wwsel_dphill",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,0,"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BINROOT"    ,"done_ana/histossww_'${YEAR}'_151'${fidAnaName}'.root","ssww_wwsel_wsbdt" ,0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,0,"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_0'${fidAnaName}'.root","ssww_wwsel_mjj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#phi_{jj}","","done_ana/histossww_'${YEAR}'_124'${fidAnaName}'.root","ssww_wwsel_dphijj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta #phi_{ll}","","done_ana/histossww_'${YEAR}'_131'${fidAnaName}'.root","ssww_wwsel_dphill",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_151'${fidAnaName}'.root","ssww_wwsel_wsbdt"  ,0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  if [ $NSEL == 'sswwll' ]; then
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Output fit","BIN","done_ana/histossww_'${YEAR}'_154'${fidAnaName}'.root","ssww_datacard",1,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BINROOT","done_ana/histossww_'${YEAR}'_89'${fidAnaName}'.root","ssww_wwsel_bdt",1,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,0,"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BINROOT","done_ana/histossww_'${YEAR}'_153'${fidAnaName}'.root","ssww_wwsel_wsbdtgt0_bdt",1,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_77'${fidAnaName}'.root","ssww_wzsel_bdt"	,0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}'     ,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_52'${fidAnaName}'.root","ssww_wzsel_wwbdt"	,0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_53'${fidAnaName}'.root","ssww_wzbsel_wwbdt"  ,0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}'     ,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_90'${fidAnaName}'.root","ssww_btagsel_bdt"	,0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_91'${fidAnaName}'.root","ssww_wzbsel_bdt"	,0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_151'${fidAnaName}'.root","ssww_wwsel_wsbdt"  ,0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_152'${fidAnaName}'.root","ssww_btagsel_wsbdt",0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  elif [ $NSEL == 'sswwlx' ]; then
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Output fit","BIN","done_ana/histossww_'${YEAR}'_154'${fidAnaName}'.root","ssww_datacardlx",1,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BINROOT","done_ana/histossww_'${YEAR}'_89'${fidAnaName}'.root","ssww_wwsel_bdtlx",1,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,0,"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BINROOT","done_ana/histossww_'${YEAR}'_153'${fidAnaName}'.root","ssww_wwsel_wsbdtgt0_bdtlx",1,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_77'${fidAnaName}'.root","ssww_wzsel_bdtlx"	,0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}'     ,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_52'${fidAnaName}'.root","ssww_wzsel_wwbdtlx"	,0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_53'${fidAnaName}'.root","ssww_wzbsel_wwbdtlx"  ,0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}'     ,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_90'${fidAnaName}'.root","ssww_btagsel_bdtlx"	,0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_91'${fidAnaName}'.root","ssww_wzbsel_bdtlx"	,0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_151'${fidAnaName}'.root","ssww_wwsel_wsbdtlx"  ,0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_152'${fidAnaName}'.root","ssww_btagsel_wsbdtlx",0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  elif [ $NSEL == 'higgs' ]; then
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Output fit","BIN","done_ana/histossww_'${YEAR}'_154'${fidAnaName}'.root","ssww_datacardhiggs",1,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BINROOT","done_ana/histossww_'${YEAR}'_89'${fidAnaName}'.root","ssww_wwsel_bdthiggs",1,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,0,"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BINROOT","done_ana/histossww_'${YEAR}'_153'${fidAnaName}'.root","ssww_wwsel_wsbdtgt0_bdthiggs",1,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_77'${fidAnaName}'.root","ssww_wzsel_bdthiggs"	,0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}'     ,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_52'${fidAnaName}'.root","ssww_wzsel_wwbdthiggs"	,0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_53'${fidAnaName}'.root","ssww_wzbsel_wwbdthiggs"  ,0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}'     ,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_90'${fidAnaName}'.root","ssww_btagsel_bdthiggs"	,0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_91'${fidAnaName}'.root","ssww_wzbsel_bdthiggs"	,0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_151'${fidAnaName}'.root","ssww_wwsel_wsbdthiggs"  ,0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_152'${fidAnaName}'.root","ssww_btagsel_wsbdthiggs",0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{ll}"    ,"GeVBIN","done_ana/histossww_'${YEAR}'_134'${fidAnaName}'.root","ssww_wwsel_higgs_mll"     ,0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}^{WW}","GeVBIN","done_ana/histossww_'${YEAR}'_135'${fidAnaName}'.root","ssww_wwsel_higgs_fullmtww",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m^{WW}"    ,"GeVBIN","done_ana/histossww_'${YEAR}'_136'${fidAnaName}'.root","ssww_wwsel_higgs_fullmww" ,0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}^{WZ}","GeVBIN","done_ana/histossww_'${YEAR}'_137'${fidAnaName}'.root","ssww_wzsel_higgs_mtwz"    ,0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}^{WZ}","GeVBIN","done_ana/histossww_'${YEAR}'_138'${fidAnaName}'.root","ssww_wzsel_higgs_fullmtwz",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m^{WZ}"    ,"GeVBIN","done_ana/histossww_'${YEAR}'_139'${fidAnaName}'.root","ssww_wzsel_higgs_fullmwz" ,0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_0'${fidAnaName}'.root","ssww_wwsel_mjj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{jj}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_1'${fidAnaName}'.root","ssww_btagsel_mjj",0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{jj}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_2'${fidAnaName}'.root","ssww_zzsel_mjj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{jj}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_3'${fidAnaName}'.root","ssww_wzbsel_mjj",0, '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{jj}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_4'${fidAnaName}'.root","ssww_wzsel_mjj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  else
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Output fit","BIN","done_ana/histossww_'${YEAR}'_154'${fidAnaName}'.root","ssww_datacard",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"BDT score","BIN","done_ana/histossww_'${YEAR}'_89'${fidAnaName}'.root","ssww_wwsel_bdt",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  fi

  if [ $NSEL == 'sswwlx' ] || [ $NSEL == 'sswwll' ]; then
  exit;
  fi
  if [ $NSEL == 'higgs' ]; then
  export isBlinded=0;
  fi

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_0'${fidAnaName}'.root","ssww_wwsel_mjj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{jj}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_1'${fidAnaName}'.root","ssww_btagsel_mjj",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{jj}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_2'${fidAnaName}'.root","ssww_zzsel_mjj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{jj}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_3'${fidAnaName}'.root","ssww_wzbsel_mjj",0, '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{jj}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_4'${fidAnaName}'.root","ssww_wzsel_mjj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#eta_{jj}","","done_ana/histossww_'${YEAR}'_5'${fidAnaName}'.root","ssww_wwsel_detajj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#eta_{jj}","","done_ana/histossww_'${YEAR}'_6'${fidAnaName}'.root","ssww_btagsel_detajj",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#eta_{jj}","","done_ana/histossww_'${YEAR}'_7'${fidAnaName}'.root","ssww_zzsel_detajj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#eta_{jj}","","done_ana/histossww_'${YEAR}'_8'${fidAnaName}'.root","ssww_wzbsel_detajj",0, '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#eta_{jj}","","done_ana/histossww_'${YEAR}'_9'${fidAnaName}'.root","ssww_wzsel_detajj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Lepton type","","done_ana/histossww_'${YEAR}'_10'${fidAnaName}'.root","ssww_wwsel_leptype",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Lepton type","","done_ana/histossww_'${YEAR}'_11'${fidAnaName}'.root","ssww_btagsel_leptype",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Lepton type","","done_ana/histossww_'${YEAR}'_12'${fidAnaName}'.root","ssww_zzsel_leptype",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Lepton type","","done_ana/histossww_'${YEAR}'_13'${fidAnaName}'.root","ssww_wzbsel_leptype",0, '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Lepton type","","done_ana/histossww_'${YEAR}'_14'${fidAnaName}'.root","ssww_wzsel_leptype",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{j}","GeV","done_ana/histossww_'${YEAR}'_15'${fidAnaName}'.root","ssww_wwsel_ptj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{j}","GeV","done_ana/histossww_'${YEAR}'_16'${fidAnaName}'.root","ssww_btagsel_ptj",0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{j}","GeV","done_ana/histossww_'${YEAR}'_17'${fidAnaName}'.root","ssww_zzsel_ptj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{j}","GeV","done_ana/histossww_'${YEAR}'_18'${fidAnaName}'.root","ssww_wzbsel_ptj",0, '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{j}","GeV","done_ana/histossww_'${YEAR}'_19'${fidAnaName}'.root","ssww_wzsel_ptj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#eta^{j}","","done_ana/histossww_'${YEAR}'_20'${fidAnaName}'.root","ssww_wwsel_etaj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#eta^{j}","","done_ana/histossww_'${YEAR}'_21'${fidAnaName}'.root","ssww_btagsel_etaj",0,'${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#eta^{j}","","done_ana/histossww_'${YEAR}'_22'${fidAnaName}'.root","ssww_zzsel_etaj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#eta^{j}","","done_ana/histossww_'${YEAR}'_23'${fidAnaName}'.root","ssww_wzbsel_etaj",0, '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#eta^{j}","","done_ana/histossww_'${YEAR}'_24'${fidAnaName}'.root","ssww_wzsel_etaj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{jet}","","done_ana/histossww_'${YEAR}'_25'${fidAnaName}'.root","ssww_wwsel_njet",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{jet}","","done_ana/histossww_'${YEAR}'_26'${fidAnaName}'.root","ssww_btagsel_njet",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{jet}","","done_ana/histossww_'${YEAR}'_27'${fidAnaName}'.root","ssww_zzsel_njet",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{jet}","","done_ana/histossww_'${YEAR}'_28'${fidAnaName}'.root","ssww_wzbsel_njet",0, '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{jet}","","done_ana/histossww_'${YEAR}'_29'${fidAnaName}'.root","ssww_wzsel_njet",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  hadd -f done_ana/histossww_${YEAR}_303132'${fidAnaName}'.root done_ana/histossww_${YEAR}_30'${fidAnaName}'.root  done_ana/histossww_${YEAR}_31'${fidAnaName}'.root   done_ana/histossww_${YEAR}_32'${fidAnaName}'.root
  hadd -f done_ana/histossww_${YEAR}_333435'${fidAnaName}'.root done_ana/histossww_${YEAR}_33'${fidAnaName}'.root  done_ana/histossww_${YEAR}_34'${fidAnaName}'.root   done_ana/histossww_${YEAR}_35'${fidAnaName}'.root
  hadd -f done_ana/histossww_${YEAR}_363738'${fidAnaName}'.root done_ana/histossww_${YEAR}_36'${fidAnaName}'.root  done_ana/histossww_${YEAR}_37'${fidAnaName}'.root   done_ana/histossww_${YEAR}_38'${fidAnaName}'.root
  hadd -f done_ana/histossww_${YEAR}_394041'${fidAnaName}'.root done_ana/histossww_${YEAR}_39'${fidAnaName}'.root  done_ana/histossww_${YEAR}_40'${fidAnaName}'.root   done_ana/histossww_${YEAR}_41'${fidAnaName}'.root
  hadd -f done_ana/histossww_${YEAR}_424344'${fidAnaName}'.root done_ana/histossww_${YEAR}_42'${fidAnaName}'.root  done_ana/histossww_${YEAR}_43'${fidAnaName}'.root   done_ana/histossww_${YEAR}_44'${fidAnaName}'.root
  hadd -f done_ana/histossww_${YEAR}_484950'${fidAnaName}'.root done_ana/histossww_${YEAR}_48'${fidAnaName}'.root  done_ana/histossww_${YEAR}_49'${fidAnaName}'.root   done_ana/histossww_${YEAR}_50'${fidAnaName}'.root

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histossww_'${YEAR}'_303132'${fidAnaName}'.root","ssww_wwselnminus1_mll",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"p_{T}^{miss}","GeV","done_ana/histossww_'${YEAR}'_333435'${fidAnaName}'.root","ssww_wwselnminus1_met",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{jets}","","done_ana/histossww_'${YEAR}'_363738'${fidAnaName}'.root","ssww_wwselnminus1_njets",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"|#Delta#eta_{jj}|","","done_ana/histossww_'${YEAR}'_394041'${fidAnaName}'.root","ssww_wwselnminus1_detajj",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{jj}","GeV","done_ana/histossww_'${YEAR}'_424344'${fidAnaName}'.root","ssww_wwselnminus1_mjj",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"Max z^{*}","","done_ana/histossww_'${YEAR}'_45'${fidAnaName}'.root","ssww_wwselnminus1_zstar",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"z_{ll}^{*}","","done_ana/histossww_'${YEAR}'_46'${fidAnaName}'.root","ssww_wwsel_zvvstar",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"z_{l3}^{*}","","done_ana/histossww_'${YEAR}'_47'${fidAnaName}'.root","ssww_wzsel_zvvstar",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{b jets}","","done_ana/histossww_'${YEAR}'_484950'${fidAnaName}'.root","ssww_wwselnminus1_nbjets",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{#tau}","","done_ana/histossww_'${YEAR}'_51'${fidAnaName}'.root","ssww_wwselnminus1_ntau",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{jj}","GeV","done_ana/histossww_'${YEAR}'_54'${fidAnaName}'.root","ssww_presel_mjj",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#eta_{jj}","","done_ana/histossww_'${YEAR}'_55'${fidAnaName}'.root","ssww_presel_detajj",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"Max z^{*}","","done_ana/histossww_'${YEAR}'_56'${fidAnaName}'.root","ssww_presel_zstar",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{loose b jets}","","done_ana/histossww_'${YEAR}'_57'${fidAnaName}'.root","ssww_presel_nlbjets",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{medium b jets}","","done_ana/histossww_'${YEAR}'_58'${fidAnaName}'.root","ssww_presel_nmbjets",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{medium b jets}","","done_ana/histossww_'${YEAR}'_59'${fidAnaName}'.root","ssww_presel_nlbjetsgt0_nmbjets",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{j}","","done_ana/histossww_'${YEAR}'_60'${fidAnaName}'.root","ssww_presel_ptj",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#eta^{j}","","done_ana/histossww_'${YEAR}'_61'${fidAnaName}'.root","ssww_presel_etaj",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"p_{T}^{l}","GeV","done_ana/histossww_'${YEAR}'_62'${fidAnaName}'.root","ssww_presel_ptl",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"|#eta^{l}|","","done_ana/histossww_'${YEAR}'_63'${fidAnaName}'.root","ssww_presel_etal",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"B tag max","","done_ana/histossww_'${YEAR}'_64'${fidAnaName}'.root","ssww_presel_btagmax",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"B tag min","","done_ana/histossww_'${YEAR}'_65'${fidAnaName}'.root","ssww_presel_btagmin",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{ll}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_66'${fidAnaName}'.root","ssww_wwsel_mll",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{ll}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_67'${fidAnaName}'.root","ssww_btagsel_mll",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  hadd -f done_ana/histossww_${YEAR}_686970'${fidAnaName}'.root done_ana/histossww_${YEAR}_68'${fidAnaName}'.root  done_ana/histossww_${YEAR}_69'${fidAnaName}'.root	done_ana/histossww_${YEAR}_70'${fidAnaName}'.root
  hadd -f done_ana/histossww_${YEAR}_717273'${fidAnaName}'.root done_ana/histossww_${YEAR}_71'${fidAnaName}'.root  done_ana/histossww_${YEAR}_72'${fidAnaName}'.root	done_ana/histossww_${YEAR}_73'${fidAnaName}'.root
  hadd -f done_ana/histossww_${YEAR}_747576'${fidAnaName}'.root done_ana/histossww_${YEAR}_74'${fidAnaName}'.root  done_ana/histossww_${YEAR}_75'${fidAnaName}'.root	done_ana/histossww_${YEAR}_76'${fidAnaName}'.root
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{max}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_686970'${fidAnaName}'.root","ssww_wwsel_ptl1",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{min}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_71'${fidAnaName}'.root","ssww_wwsel_ptl2",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{max}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_72'${fidAnaName}'.root","ssww_wzsel_ptl1",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{W}"  ,"GeVBINBinWidth","done_ana/histossww_'${YEAR}'_73'${fidAnaName}'.root","ssww_wzsel_ptlw",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"m_{ll}","GeV","done_ana/histossww_'${YEAR}'_747576'${fidAnaName}'.root","ssww_zsel_mll",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeV","done_ana/histossww_'${YEAR}'_78'${fidAnaName}'.root","ssww_wzsel_mtwz",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeV","done_ana/histossww_'${YEAR}'_79'${fidAnaName}'.root","ssww_qcdwwsel_mjj"  ,0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeV","done_ana/histossww_'${YEAR}'_80'${fidAnaName}'.root","ssww_qcdbtagsel_mjj",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeV","done_ana/histossww_'${YEAR}'_81'${fidAnaName}'.root","ssww_qcdzzsel_mjj"  ,0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeV","done_ana/histossww_'${YEAR}'_82'${fidAnaName}'.root","ssww_qcdwzbsel_mjj" ,0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeV","done_ana/histossww_'${YEAR}'_83'${fidAnaName}'.root","ssww_qcdwzsel_mjj"  ,0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta#eta_{jj}","","done_ana/histossww_'${YEAR}'_84'${fidAnaName}'.root","ssww_qcdwwsel_detajj"  ,0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta#eta_{jj}","","done_ana/histossww_'${YEAR}'_85'${fidAnaName}'.root","ssww_qcdbtagsel_detajj",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta#eta_{jj}","","done_ana/histossww_'${YEAR}'_86'${fidAnaName}'.root","ssww_qcdzzsel_detajj"  ,0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta#eta_{jj}","","done_ana/histossww_'${YEAR}'_87'${fidAnaName}'.root","ssww_qcdwzbsel_detajj" ,0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta#eta_{jj}","","done_ana/histossww_'${YEAR}'_88'${fidAnaName}'.root","ssww_qcdwzsel_detajj"  ,0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#phi_{jj}","","done_ana/histossww_'${YEAR}'_92'${fidAnaName}'.root","ssww_wzsel_dphijj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#eta_{l^{W}-Z}","","done_ana/histossww_'${YEAR}'_93'${fidAnaName}'.root","ssww_wzsel_detawlz",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"WZ z^{*}","","done_ana/histossww_'${YEAR}'_94'${fidAnaName}'.root","ssww_wzsel_wzzep",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta R_{j1Z}","","done_ana/histossww_'${YEAR}'_95'${fidAnaName}'.root","ssww_wzsel_drj1z",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"Sum p^{vectorial}_{T} / p^{scalar}_{T}","","done_ana/histossww_'${YEAR}'_96'${fidAnaName}'.root","ssww_wzsel_ptotrel",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{jj}","GeV","done_ana/histossww_'${YEAR}'_97'${fidAnaName}'.root","ssww_ll_presel_mjj",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#eta_{jj}","","done_ana/histossww_'${YEAR}'_98'${fidAnaName}'.root","ssww_ll_presel_detajj",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"Max z^{*}","","done_ana/histossww_'${YEAR}'_99'${fidAnaName}'.root","ssww_ll_presel_zstar",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{j}","","done_ana/histossww_'${YEAR}'_100'${fidAnaName}'.root","ssww_ll_presel_ptj",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#eta^{j}","","done_ana/histossww_'${YEAR}'_101'${fidAnaName}'.root","ssww_ll_presel_etaj",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,10,"p_{T}^{l}","GeV","done_ana/histossww_'${YEAR}'_102'${fidAnaName}'.root","ssww_ll_presel_ptl",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"|#eta^{l}|","","done_ana/histossww_'${YEAR}'_103'${fidAnaName}'.root","ssww_ll_presel_etal",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}')';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Lepton type","","done_ana/histossww_'${YEAR}'_104'${fidAnaName}'.root","ssww_loosesel_leptype",                           0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{ll}","GeV","done_ana/histossww_'${YEAR}'_105'${fidAnaName}'.root","ssww_loosesel_mll",                                 0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{miss}","GeV","done_ana/histossww_'${YEAR}'_106'${fidAnaName}'.root","ssww_loosesel_met",                           0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{jet}","","done_ana/histossww_'${YEAR}'_107'${fidAnaName}'.root","ssww_loosesel_njet",                                  0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta#eta_{jj}","","done_ana/histossww_'${YEAR}'_108'${fidAnaName}'.root","ssww_loosesel_detajj",                        0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeV","done_ana/histossww_'${YEAR}'_109'${fidAnaName}'.root","ssww_loosesel_mjj",                                 0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{medium b jets}","","done_ana/histossww_'${YEAR}'_110'${fidAnaName}'.root","ssww_loosesel_nmbjets",                     0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}^{WW}","GeV","done_ana/histossww_'${YEAR}'_111'${fidAnaName}'.root","ssww_loosesel_mtww",                            0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Sum p^{vectorial}_{T} / p^{scalar}_{T}","","done_ana/histossww_'${YEAR}'_112'${fidAnaName}'.root","ssww_loosesel_ptotrel",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"z^{*}","","done_ana/histossww_'${YEAR}'_113'${fidAnaName}'.root","ssww_loosesel_zstar",                                   0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{j}","","done_ana/histossww_'${YEAR}'_114'${fidAnaName}'.root","ssww_loosesel_ptj",                                 0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#eta^{j}","","done_ana/histossww_'${YEAR}'_115'${fidAnaName}'.root","ssww_loosesel_etaj",                                 0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{l}","GeV","done_ana/histossww_'${YEAR}'_116'${fidAnaName}'.root","ssww_loosesel_ptl",                              0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"|#eta^{l}|","","done_ana/histossww_'${YEAR}'_117'${fidAnaName}'.root","ssww_loosesel_etal",                               0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}^{WW}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_118'${fidAnaName}'.root","ssww_wwsel_mjjall_mt",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,1,"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}^{WW}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_119'${fidAnaName}'.root","ssww_wwsel_mjjlow_mt",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,1,"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}^{WW}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_120'${fidAnaName}'.root","ssww_wwsel_mjjhigh_mt",0, '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,1,"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}^{WZ}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_121'${fidAnaName}'.root","ssww_wzsel_mjjall_mt",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,1,"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}^{WZ}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_122'${fidAnaName}'.root","ssww_wzsel_mjjlow_mt",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,1,"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}^{WZ}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_123'${fidAnaName}'.root","ssww_wzsel_mjjhigh_mt",0, '${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,1,"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta#phi_{jj}","","done_ana/histossww_'${YEAR}'_124'${fidAnaName}'.root","ssww_wwsel_dphijj",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{miss}","GeV","done_ana/histossww_'${YEAR}'_125'${fidAnaName}'.root","ssww_wwsel_met",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{ll}","","done_ana/histossww_'${YEAR}'_126'${fidAnaName}'.root","ssww_wwsel_ptll",0,'${YEAR}',"'${legendBSM}'",1.0,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta R_{j1,ll}","","done_ana/histossww_'${YEAR}'_127'${fidAnaName}'.root","ssww_wwsel_drj1z",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta R_{j2,ll}","","done_ana/histossww_'${YEAR}'_128'${fidAnaName}'.root","ssww_wwsel_drj2z",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Sum p^{vectorial}_{T} / p^{scalar}_{T}","","done_ana/histossww_'${YEAR}'_129'${fidAnaName}'.root","ssww_wwsel_ptotrel",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p^{scalar}_{T}","","done_ana/histossww_'${YEAR}'_130'${fidAnaName}'.root","ssww_wwsel_ptot",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta #phi_{ll}","","done_ana/histossww_'${YEAR}'_131'${fidAnaName}'.root","ssww_wwsel_dphill",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta R_{ll}","","done_ana/histossww_'${YEAR}'_132'${fidAnaName}'.root","ssww_wwsel_drll",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"(p^{l1}_{T}p^{l2}_{T})/(p^{j1}_{T}p^{j2}_{T})","","done_ana/histossww_'${YEAR}'_133'${fidAnaName}'.root","ssww_wwsel_pr",0,  '${YEAR}',"'${legendBSM}'",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{ll}"    ,"GeV","done_ana/histossww_'${YEAR}'_134'${fidAnaName}'.root","ssww_wwsel_aqgc_mll"     ,0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}^{WW}","GeV","done_ana/histossww_'${YEAR}'_135'${fidAnaName}'.root","ssww_wwsel_aqgc_fullmtww",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m^{WW}"    ,"GeV","done_ana/histossww_'${YEAR}'_136'${fidAnaName}'.root","ssww_wwsel_aqgc_fullmww" ,0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}^{WZ}","GeV","done_ana/histossww_'${YEAR}'_137'${fidAnaName}'.root","ssww_wzsel_aqgc_mtwz"    ,0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}^{WZ}","GeV","done_ana/histossww_'${YEAR}'_138'${fidAnaName}'.root","ssww_wzsel_aqgc_fullmtwz",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m^{WZ}"    ,"GeV","done_ana/histossww_'${YEAR}'_139'${fidAnaName}'.root","ssww_wzsel_aqgc_fullmwz" ,0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta#phi_{jj}","","done_ana/histossww_'${YEAR}'_140'${fidAnaName}'.root","ssww_btagsel_dphijj",                          0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{j}","","done_ana/histossww_'${YEAR}'_141'${fidAnaName}'.root","ssww_btagsel_ptj",                                   0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{miss}","GeV","done_ana/histossww_'${YEAR}'_142'${fidAnaName}'.root","ssww_btagsel_met",                             0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{ll}","","done_ana/histossww_'${YEAR}'_143'${fidAnaName}'.root","ssww_btagsel_ptll",                                 0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}^{WW}","GeV","done_ana/histossww_'${YEAR}'_144'${fidAnaName}'.root","ssww_btagsel_mtww",                              0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"z^{*}","","done_ana/histossww_'${YEAR}'_145'${fidAnaName}'.root","ssww_btagsel_zstar",                                     0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta R_{j,ll}","","done_ana/histossww_'${YEAR}'_146'${fidAnaName}'.root","ssww_btagsel_drjz",                            0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{l}","GeV","done_ana/histossww_'${YEAR}'_147'${fidAnaName}'.root","ssww_btagsel_ptl",                                0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta #phi_{ll}","","done_ana/histossww_'${YEAR}'_148'${fidAnaName}'.root","ssww_btagsel_dphill",                         0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"#Delta R_{ll}","","done_ana/histossww_'${YEAR}'_149'${fidAnaName}'.root","ssww_btagsel_drll",                              0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"(p^{l1}_{T}p^{l2}_{T})/(p^{j1}_{T}p^{j2}_{T})","","done_ana/histossww_'${YEAR}'_150'${fidAnaName}'.root","ssww_btagsel_pr",0,'${YEAR}',"'${legendBSM}'",1.0,'${isBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

elif [ $NSEL == 'llg' ]; then
  export sf_dy=1.0;

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0LLGStudy_'${YEAR}'_0.root","zllg_mllg0",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0LLGStudy_'${YEAR}'_1.root","zllg_mllg1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{#gamma}","GeV","done_dy/histoDY0LLGStudy_'${YEAR}'_2.root","zllg_ptg0",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{#gamma}","GeV","done_dy/histoDY0LLGStudy_'${YEAR}'_3.root","zllg_ptg1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';

elif [ $NSEL == 'zlg' ]; then
  export sf_dy=1.0;

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0MGStudy_'${YEAR}'_0.root","zmg_mmg",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{T}^{#mu#gamma}","GeV","done_dy/histoDY0MGStudy_'${YEAR}'_1.root","zmg_mt",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoDY0EGStudy_'${YEAR}'_0.root","zlg_mee",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{ll}","GeVBIN","done_dy/histoDY0EGStudy_'${YEAR}'_2.root","zlg_ptee",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{ll}","GeVBIN","done_dy/histoDY0EGStudy_'${YEAR}'_3.root","zlg_ptee_0",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{ll}","GeVBIN","done_dy/histoDY0EGStudy_'${YEAR}'_4.root","zlg_ptee_1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{ll}","GeVBIN","done_dy/histoDY0EGStudy_'${YEAR}'_5.root","zlg_ptee_2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{ll}","GeVBIN","done_dy/histoDY0EGStudy_'${YEAR}'_6.root","zlg_ptee_3",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{l#gamma}","GeV","done_dy/histoDY0EGStudy_'${YEAR}'_1.root","zlg_meg",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{ll}","GeVBIN","done_dy/histoDY0EGStudy_'${YEAR}'_7.root","zlg_pteg",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{ll}","GeVBIN","done_dy/histoDY0EGStudy_'${YEAR}'_8.root","zlg_pteg_0",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{ll}","GeVBIN","done_dy/histoDY0EGStudy_'${YEAR}'_9.root","zlg_pteg_1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{ll}","GeVBIN","done_dy/histoDY0EGStudy_'${YEAR}'_10.root","zlg_pteg_2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}^{ll}","GeVBIN","done_dy/histoDY0EGStudy_'${YEAR}'_11.root","zlg_pteg_3",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ee}"     ,"GeV","done_dy/histoDY0EGStudyMass_'${YEAR}'_0.root" ,"zlg_meg_0" ,0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ee}"     ,"GeV","done_dy/histoDY0EGStudyMass_'${YEAR}'_1.root" ,"zlg_meg_1" ,0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ee}"     ,"GeV","done_dy/histoDY0EGStudyMass_'${YEAR}'_2.root" ,"zlg_meg_2" ,0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ee}"     ,"GeV","done_dy/histoDY0EGStudyMass_'${YEAR}'_3.root" ,"zlg_meg_3" ,0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ee}"     ,"GeV","done_dy/histoDY0EGStudyMass_'${YEAR}'_4.root" ,"zlg_meg_4" ,0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ee}"     ,"GeV","done_dy/histoDY0EGStudyMass_'${YEAR}'_5.root" ,"zlg_meg_5" ,0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ee}"	,"GeV","done_dy/histoDY0EGStudyMass_'${YEAR}'_6.root" ,"zlg_meg_6" ,0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ee}"	,"GeV","done_dy/histoDY0EGStudyMass_'${YEAR}'_7.root" ,"zlg_meg_7" ,0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{l#gamma}","GeV","done_dy/histoDY0EGStudyMass_'${YEAR}'_8.root" ,"zlg_meg_8" ,0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{l#gamma}","GeV","done_dy/histoDY0EGStudyMass_'${YEAR}'_9.root" ,"zlg_meg_9" ,0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{l#gamma}","GeV","done_dy/histoDY0EGStudyMass_'${YEAR}'_10.root","zlg_meg_10",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{l#gamma}","GeV","done_dy/histoDY0EGStudyMass_'${YEAR}'_11.root","zlg_meg_11",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{l#gamma}","GeV","done_dy/histoDY0EGStudyMass_'${YEAR}'_12.root","zlg_meg_12",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{l#gamma}","GeV","done_dy/histoDY0EGStudyMass_'${YEAR}'_13.root","zlg_meg_13",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{l#gamma}","GeV","done_dy/histoDY0EGStudyMass_'${YEAR}'_14.root","zlg_meg_14",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{l#gamma}","GeV","done_dy/histoDY0EGStudyMass_'${YEAR}'_15.root","zlg_meg_15",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",0,'${APPLYSCALING}')';

elif [ $NSEL == 'zhem1516' ]; then
  export sf_dy=1.0;
  export YEAR=2018;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoHEMDY0zll_'${YEAR}'_0.root","zll_hem0_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"m_{ll}","GeV","done_dy/histoHEMDY0zll_'${YEAR}'_1.root","zll_hem1_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{l}","GeV","done_dy/histoHEMDY0zll_'${YEAR}'_2.root","zll_hem0_ptl",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{l}","GeV","done_dy/histoHEMDY0zll_'${YEAR}'_3.root","zll_hem1_ptl",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{miss}","GeV","done_dy/histoHEMDY0zll_'${YEAR}'_4.root","zll_hem0_met",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{miss}","GeV","done_dy/histoHEMDY0zll_'${YEAR}'_5.root","zll_hem1_met",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{jets}","","done_dy/histoHEMDY0zll_'${YEAR}'_6.root","zll_hem0_nj1_njets",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{jets}","","done_dy/histoHEMDY0zll_'${YEAR}'_7.root","zll_hem1_nj1_njets",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{miss}","GeV","done_dy/histoHEMDY0zll_'${YEAR}'_8.root","zll_hem0_nj1_met",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{miss}","GeV","done_dy/histoHEMDY0zll_'${YEAR}'_9.root","zll_hem1_nj1_met",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{j}","GeV","done_dy/histoHEMDY0zll_'${YEAR}'_10.root","zll_hem0_nj1_ptj",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{j}","GeV","done_dy/histoHEMDY0zll_'${YEAR}'_11.root","zll_hem1_nj1_ptj",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{l}","GeV","done_dy/histoHEMDY0zll_'${YEAR}'_12.root","zll_hem0_nj1_ptl",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"p_{T}^{l}","GeV","done_dy/histoHEMDY0zll_'${YEAR}'_13.root","zll_hem1_nj1_ptl",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#mu #phi","","done_dy/histoHEMDY0zll_'${YEAR}'_14.root","zll_hem_phi_m",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"e #phi","","done_dy/histoHEMDY0zll_'${YEAR}'_15.root","zll_hem_phi_e",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#gamma #phi","","done_dy/histoHEMDY0zll_'${YEAR}'_16.root","zll_hem_phi_p",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"Jet #phi","","done_dy/histoHEMDY0zll_'${YEAR}'_17.root","zll_hem_phi_j",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"Jet #phi","","done_dy/histoHEMDY0zll_'${YEAR}'_18.root","zll_hem0_met50_phi_j",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta #phi_{jet,p_{T}^{miss}}","","done_dy/histoHEMDY0zll_'${YEAR}'_19.root","zll_hem0_met50_dphijetmet",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"Jet #phi","","done_dy/histoHEMDY0zll_'${YEAR}'_20.root","zll_hem1_met50_phi_j",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"#Delta #phi_{jet,p_{T}^{miss}}","","done_dy/histoHEMDY0zll_'${YEAR}'_21.root","zll_hem1_met50_dphijetmet",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,2,"Jet #phi","","done_dy/histoHEMDY0zll_'${YEAR}'_22.root","zll_hem1_met50_dphijetmetgt2p6_phi_j",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';

elif [ $NSEL == 'ww' ]; then
  export sf_dy=1.0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_0.root","wwmm_0j_allbutmll_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_1.root","wwee_0j_allbutmll_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_2.root","wwem_0j_allbutmll_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_3.root","wwmm_1j_allbutmll_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_4.root","wwee_1j_allbutmll_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_5.root","wwem_1j_allbutmll_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_6.root","wwmm_2j_allbutmll_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_7.root","wwee_2j_allbutmll_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_8.root","wwem_2j_allbutmll_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"MINPMET","GeV","done_ana/histoWW_'${YEAR}'_9.root", "wwmm_0j_allbutminpmet_minpmet",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"MINPMET","GeV","done_ana/histoWW_'${YEAR}'_10.root","wwee_0j_allbutminpmet_minpmet",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"MINPMET","GeV","done_ana/histoWW_'${YEAR}'_11.root","wwem_0j_allbutminpmet_minpmet",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"MINPMET","GeV","done_ana/histoWW_'${YEAR}'_12.root","wwmm_1j_allbutminpmet_minpmet",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"MINPMET","GeV","done_ana/histoWW_'${YEAR}'_13.root","wwee_1j_allbutminpmet_minpmet",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"MINPMET","GeV","done_ana/histoWW_'${YEAR}'_14.root","wwem_1j_allbutminpmet_minpmet",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"MINPMET","GeV","done_ana/histoWW_'${YEAR}'_15.root","wwmm_2j_allbutminpmet_minpmet",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"MINPMET","GeV","done_ana/histoWW_'${YEAR}'_16.root","wwee_2j_allbutminpmet_minpmet",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"MINPMET","GeV","done_ana/histoWW_'${YEAR}'_17.root","wwem_2j_allbutminpmet_minpmet",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{miss}","GeV","done_ana/histoWW_'${YEAR}'_18.root","wwmm_0j_allbutminpmet_met",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{miss}","GeV","done_ana/histoWW_'${YEAR}'_19.root","wwee_0j_allbutminpmet_met",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{miss}","GeV","done_ana/histoWW_'${YEAR}'_20.root","wwem_0j_allbutminpmet_met",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{miss}","GeV","done_ana/histoWW_'${YEAR}'_21.root","wwmm_1j_allbutminpmet_met",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{miss}","GeV","done_ana/histoWW_'${YEAR}'_22.root","wwee_1j_allbutminpmet_met",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{miss}","GeV","done_ana/histoWW_'${YEAR}'_23.root","wwem_1j_allbutminpmet_met",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{miss}","GeV","done_ana/histoWW_'${YEAR}'_24.root","wwmm_2j_allbutminpmet_met",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{miss}","GeV","done_ana/histoWW_'${YEAR}'_25.root","wwee_2j_allbutminpmet_met",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{miss}","GeV","done_ana/histoWW_'${YEAR}'_26.root","wwem_2j_allbutminpmet_met",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_27.root","wwmm_0j_dysel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_28.root","wwee_0j_dysel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_29.root","wwem_0j_dysel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_30.root","wwmm_1j_dysel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_31.root","wwee_1j_dysel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_32.root","wwem_1j_dysel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_33.root","wwmm_2j_dysel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_34.root","wwee_2j_dysel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_35.root","wwem_2j_dysel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{ll}","GeV","done_ana/histoWW_'${YEAR}'_36.root","wwmm_0j_allbutptll_ptll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{ll}","GeV","done_ana/histoWW_'${YEAR}'_37.root","wwee_0j_allbutptll_ptll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{ll}","GeV","done_ana/histoWW_'${YEAR}'_38.root","wwem_0j_allbutptll_ptll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{ll}","GeV","done_ana/histoWW_'${YEAR}'_39.root","wwmm_1j_allbutptll_ptll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{ll}","GeV","done_ana/histoWW_'${YEAR}'_40.root","wwee_1j_allbutptll_ptll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{ll}","GeV","done_ana/histoWW_'${YEAR}'_41.root","wwem_1j_allbutptll_ptll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{ll}","GeV","done_ana/histoWW_'${YEAR}'_42.root","wwmm_2j_allbutptll_ptll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{ll}","GeV","done_ana/histoWW_'${YEAR}'_43.root","wwee_2j_allbutptll_ptll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{ll}","GeV","done_ana/histoWW_'${YEAR}'_44.root","wwem_2j_allbutptll_ptll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{b jets}","","done_ana/histoWW_'${YEAR}'_45.root","wwmm_0j_allbutbtag_nbtag",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{b jets}","","done_ana/histoWW_'${YEAR}'_46.root","wwee_0j_allbutbtag_nbtag",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{b jets}","","done_ana/histoWW_'${YEAR}'_47.root","wwem_0j_allbutbtag_nbtag",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{b jets}","","done_ana/histoWW_'${YEAR}'_48.root","wwmm_1j_allbutbtag_nbtag",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{b jets}","","done_ana/histoWW_'${YEAR}'_49.root","wwee_1j_allbutbtag_nbtag",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{b jets}","","done_ana/histoWW_'${YEAR}'_50.root","wwem_1j_allbutbtag_nbtag",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{b jets}","","done_ana/histoWW_'${YEAR}'_51.root","wwmm_2j_allbutbtag_nbtag",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{b jets}","","done_ana/histoWW_'${YEAR}'_52.root","wwee_2j_allbutbtag_nbtag",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{b jets}","","done_ana/histoWW_'${YEAR}'_53.root","wwem_2j_allbutbtag_nbtag",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_54.root","wwmm_0j_wwsel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_55.root","wwee_0j_wwsel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_56.root","wwem_0j_wwsel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_57.root","wwmm_1j_wwsel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_58.root","wwee_1j_wwsel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_59.root","wwem_1j_wwsel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_60.root","wwmm_2j_wwsel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_61.root","wwee_2j_wwsel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_62.root","wwem_2j_wwsel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_63.root","wwmm_0j_wwsel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_64.root","wwee_0j_wwsel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_65.root","wwem_0j_wwsel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_66.root","wwmm_1j_wwsel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_67.root","wwee_1j_wwsel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_68.root","wwem_1j_wwsel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_69.root","wwmm_2j_wwsel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_70.root","wwee_2j_wwsel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_71.root","wwem_2j_wwsel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_72.root","wwmm_0j_wwsel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_73.root","wwee_0j_wwsel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_74.root","wwem_0j_wwsel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_75.root","wwmm_1j_wwsel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_76.root","wwee_1j_wwsel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_77.root","wwem_1j_wwsel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_78.root","wwmm_2j_wwsel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_79.root","wwee_2j_wwsel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_80.root","wwem_2j_wwsel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_81.root","wwmm_0j_wwsel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_82.root","wwee_0j_wwsel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_83.root","wwem_0j_wwsel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_84.root","wwmm_1j_wwsel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_85.root","wwee_1j_wwsel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_86.root","wwem_1j_wwsel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_87.root","wwmm_2j_wwsel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_88.root","wwee_2j_wwsel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_89.root","wwem_2j_wwsel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_90.root","wwmm_0j_sssel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_91.root","wwee_0j_sssel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_92.root","wwem_0j_sssel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_93.root","wwmm_1j_sssel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_94.root","wwee_1j_sssel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_95.root","wwem_1j_sssel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_96.root","wwmm_2j_sssel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_97.root","wwee_2j_sssel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_98.root","wwem_2j_sssel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_99.root","wwmm_0j_sssel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_100.root","wwee_0j_sssel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_101.root","wwem_0j_sssel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_102.root","wwmm_1j_sssel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_103.root","wwee_1j_sssel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_104.root","wwem_1j_sssel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_105.root","wwmm_2j_sssel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_106.root","wwee_2j_sssel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_107.root","wwem_2j_sssel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_108.root","wwmm_0j_sssel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_109.root","wwee_0j_sssel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_110.root","wwem_0j_sssel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_111.root","wwmm_1j_sssel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_112.root","wwee_1j_sssel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_113.root","wwem_1j_sssel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_114.root","wwmm_2j_sssel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_115.root","wwee_2j_sssel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_116.root","wwem_2j_sssel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_117.root","wwmm_0j_sssel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_118.root","wwee_0j_sssel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_119.root","wwem_0j_sssel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_120.root","wwmm_1j_sssel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_121.root","wwee_1j_sssel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_122.root","wwem_1j_sssel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_123.root","wwmm_2j_sssel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_124.root","wwee_2j_sssel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_125.root","wwem_2j_sssel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_126.root","wwmm_0j_topsel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_127.root","wwee_0j_topsel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_128.root","wwem_0j_topsel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_129.root","wwmm_1j_topsel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_130.root","wwee_1j_topsel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_131.root","wwem_1j_topsel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_132.root","wwmm_2j_topsel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_133.root","wwee_2j_topsel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{leading}","GeV","done_ana/histoWW_'${YEAR}'_134.root","wwem_2j_topsel_ptl1",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_135.root","wwmm_0j_topsel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_136.root","wwee_0j_topsel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_137.root","wwem_0j_topsel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_138.root","wwmm_1j_topsel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_139.root","wwee_1j_topsel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_140.root","wwem_1j_topsel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_141.root","wwmm_2j_topsel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_142.root","wwee_2j_topsel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{trailing}","GeV","done_ana/histoWW_'${YEAR}'_143.root","wwem_2j_topsel_ptl2",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_144.root","wwmm_0j_topsel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_145.root","wwee_0j_topsel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_146.root","wwem_0j_topsel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_147.root","wwmm_1j_topsel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_148.root","wwee_1j_topsel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_149.root","wwem_1j_topsel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_150.root","wwmm_2j_topsel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_151.root","wwee_2j_topsel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"m_{ll}","GeV","done_ana/histoWW_'${YEAR}'_152.root","wwem_2j_topsel_mll",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_153.root","wwmm_0j_topsel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_154.root","wwee_0j_topsel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_155.root","wwem_0j_topsel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_156.root","wwmm_1j_topsel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_157.root","wwee_1j_topsel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_159.root","wwem_1j_topsel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_159.root","wwmm_2j_topsel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_160.root","wwee_2j_topsel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"#Delta#phi_{ll}","dg.","done_ana/histoWW_'${YEAR}'_161.root","wwem_2j_topsel_dphill",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{WW}","GeV","done_ana/histoWW_'${YEAR}'_162.root","wwmm_wwsel_ptww",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{WW}","GeV","done_ana/histoWW_'${YEAR}'_163.root","wwee_wwsel_ptww",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{WW}","GeV","done_ana/histoWW_'${YEAR}'_164.root","wwem_wwsel_ptww",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{WW}","GeV","done_ana/histoWW_'${YEAR}'_165.root","wwmm_topsel_ptww",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{WW}","GeV","done_ana/histoWW_'${YEAR}'_166.root","wwee_topsel_ptww",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,5,"p_{T}^{WW}","GeV","done_ana/histoWW_'${YEAR}'_167.root","wwem_topsel_ptww",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{j}","","done_ana/histoWW_'${YEAR}'_168.root","wwmm_zsel_njets",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{j}","","done_ana/histoWW_'${YEAR}'_169.root","wwee_zsel_njets",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"N_{j}","","done_ana/histoWW_'${YEAR}'_170.root","wwem_zsel_njets",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}')';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Channel","","done_ana/histoWW_'${YEAR}'_171.root","ww_datacard",0,'${YEAR}',"H_{125}",'${sf_dy}',0,"",1,'${APPLYSCALING}',"done_ana/../ana_ww/fitDiagnosticsww_'${YEAR}'_obs.root","ch1",1)';

elif [ $NSEL == 'ssww_hllhc' ]; then
  export isBlinded=1;
  export fidAnaName="_fiducial0_l3000_wwframe";
  export YEAR=2019;
  export APPLYSCALING=1;
  export mlfitResult="";
  export channelName="SSWW_"${YEAR};
  export legendBSM="";
  export YEAR2=3000;

  sed -i 's/writeExtraText = false/writeExtraText = true/' MitAnalysisRunII/panda/makePlots/CMS_lumi.h
  sed -i 's/extraText   = "Preliminary"/extraText   = "Phase-2 Projection"/' MitAnalysisRunII/panda/makePlots/CMS_lumi.h
  sed -i 's/lumiTextSize     = 0.6/lumiTextSize     = 0.45/' MitAnalysisRunII/panda/makePlots/CMS_lumi.h

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_ftr21001.C+'(0,1,"m_{jj}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_0'${fidAnaName}'.root","ssww_hllhc_wwsel_mjj",0,  '${YEAR2}',"'${legendBSM}'",1.0,'${isBlinded}',"WW signal region",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_ftr21001.C+'(0,1,"m_{jj}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_4'${fidAnaName}'.root","ssww_hllhc_wzsel_mjj",0,  '${YEAR2}',"'${legendBSM}'",1.0,'${isBlinded}',"WZ signal region",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_ftr21001.C+'(0,5,"p_{T}^{j}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_15'${fidAnaName}'.root","ssww_hllhc_wwsel_ptj",0,  '${YEAR2}',"'${legendBSM}'",1.0,'${isBlinded}',"WW signal region",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_ftr21001.C+'(0,5,"p_{T}^{j}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_19'${fidAnaName}'.root","ssww_hllhc_wzsel_ptj",0,  '${YEAR2}',"'${legendBSM}'",1.0,'${isBlinded}',"WZ signal region",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  sed -i 's/writeExtraText = true/writeExtraText = false/' MitAnalysisRunII/panda/makePlots/CMS_lumi.h
  sed -i 's/extraText   = "Supplementary"/extraText   = "Preliminary"/' MitAnalysisRunII/panda/makePlots/CMS_lumi.h
  sed -i 's/lumiTextSize     = 0.45/lumiTextSize     = 0.6/' MitAnalysisRunII/panda/makePlots/CMS_lumi.h

fi
