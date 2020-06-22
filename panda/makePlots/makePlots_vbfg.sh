 #!/bin/sh

export NSEL=$1;
export APPLYSCALING=$2;
export YEAR=$3;
export TRIG=$4;
export USEPOSTFIT=$5;

if [ $NSEL == 'vbfg' ]; then
  export mlfitResult="";
  export channelName=""; 
  if [ $# == 5 ] && [ $USEPOSTFIT == 1 ] && [ $YEAR != 2019 ]; then
  export mlfitResult="done_vbfg/fitDiagnosticsvbfg125_obs.root";
  export channelName=VBFG_${YEAR}_trigger${TRIG};
  #elif [ $# == 5 ] && [ $USEPOSTFIT == 1 ]; then
  #export APPLYSCALING=1;
  fi


  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeV","done_vbfg/histoVBFGMTGMETMJJ_'${YEAR}'_trigger'${TRIG}'_mH125_0.root","vbfg_trigger'${TRIG}'_sel_mtg0",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeV","done_vbfg/histoVBFGMTGMETMJJ_'${YEAR}'_trigger'${TRIG}'_mH125_1.root","vbfg_trigger'${TRIG}'_sel_mtg1",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"card","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_117.root","vbfg_trigger'${TRIG}'_sel_card",1,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_110.root","vbfg_trigger'${TRIG}'_wen_mjj0_mtg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_111.root","vbfg_trigger'${TRIG}'_wen_mjj1_mtg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_115.root","vbfg_trigger'${TRIG}'_wmn_mjj0_mtg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_116.root","vbfg_trigger'${TRIG}'_wmn_mjj1_mtg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_0.root","vbfg_trigger'${TRIG}'_sel0_mtg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_1.root","vbfg_trigger'${TRIG}'_sel1_mtg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_2.root","vbfg_trigger'${TRIG}'_sel2_mtg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_3.root","vbfg_trigger'${TRIG}'_sel3_mtg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_4.root","vbfg_trigger'${TRIG}'_sel4_mtg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_5.root","vbfg_trigger'${TRIG}'_sel5_mtg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_6.root","vbfg_trigger'${TRIG}'_sel6_mtg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_7.root","vbfg_trigger'${TRIG}'_sel7_mtg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_8.root","vbfg_trigger'${TRIG}'_sel8_mtg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_9.root","vbfg_trigger'${TRIG}'_sel9_mtg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{miss}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_10.root","vbfg_trigger'${TRIG}'_sel0_met",1,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{miss}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_11.root","vbfg_trigger'${TRIG}'_sel1_met",1,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{miss}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_12.root","vbfg_trigger'${TRIG}'_sel2_met",1,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{miss}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_13.root","vbfg_trigger'${TRIG}'_sel3_met",1,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{miss}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_14.root","vbfg_trigger'${TRIG}'_sel4_met",1,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"N_{j}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_15.root","vbfg_trigger'${TRIG}'_sel0_njets",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"N_{j}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_16.root","vbfg_trigger'${TRIG}'_sel1_njets",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"N_{j}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_17.root","vbfg_trigger'${TRIG}'_sel2_njets",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"N_{j}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_18.root","vbfg_trigger'${TRIG}'_sel3_njets",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"N_{j}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_19.root","vbfg_trigger'${TRIG}'_sel4_njets",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(jet-p_{T}^{miss})","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_20.root","vbfg_trigger'${TRIG}'_sel0_dphijmet",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(jet-p_{T}^{miss})","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_21.root","vbfg_trigger'${TRIG}'_sel1_dphijmet",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(jet-p_{T}^{miss})","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_22.root","vbfg_trigger'${TRIG}'_sel2_dphijmet",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(jet-p_{T}^{miss})","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_23.root","vbfg_trigger'${TRIG}'_sel3_dphijmet",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(jet-p_{T}^{miss})","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_24.root","vbfg_trigger'${TRIG}'_sel4_dphijmet",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_25.root","vbfg_trigger'${TRIG}'_sel0_mjj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_26.root","vbfg_trigger'${TRIG}'_sel1_mjj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_27.root","vbfg_trigger'${TRIG}'_sel2_mjj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_28.root","vbfg_trigger'${TRIG}'_sel3_mjj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_29.root","vbfg_trigger'${TRIG}'_sel4_mjj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta #eta_{jj}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_30.root","vbfg_trigger'${TRIG}'_sel0_detajj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta #eta_{jj}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_31.root","vbfg_trigger'${TRIG}'_sel1_detajj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta #eta_{jj}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_32.root","vbfg_trigger'${TRIG}'_sel2_detajj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta #eta_{jj}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_33.root","vbfg_trigger'${TRIG}'_sel3_detajj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta #eta_{jj}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_34.root","vbfg_trigger'${TRIG}'_sel4_detajj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"z^{*}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_35.root","vbfg_trigger'${TRIG}'_sel0_gzep",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"z^{*}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_36.root","vbfg_trigger'${TRIG}'_sel1_gzep",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"z^{*}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_37.root","vbfg_trigger'${TRIG}'_sel2_gzep",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"z^{*}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_38.root","vbfg_trigger'${TRIG}'_sel3_gzep",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"z^{*}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_39.root","vbfg_trigger'${TRIG}'_sel4_gzep",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{tot}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_40.root","vbfg_trigger'${TRIG}'_sel0_pttot",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{tot}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_41.root","vbfg_trigger'${TRIG}'_sel1_pttot",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{tot}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_42.root","vbfg_trigger'${TRIG}'_sel2_pttot",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{tot}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_43.root","vbfg_trigger'${TRIG}'_sel3_pttot",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{tot}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_44.root","vbfg_trigger'${TRIG}'_sel4_pttot",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"Cut evolution","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_45.root","vbfg_trigger'${TRIG}'_sel0_cutevol",1,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,0,"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"Cut evolution","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_46.root","vbfg_trigger'${TRIG}'_sel1_cutevol",1,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,0,"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"Cut evolution","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_47.root","vbfg_trigger'${TRIG}'_sel2_cutevol",1,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,0,"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"Cut evolution","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_48.root","vbfg_trigger'${TRIG}'_sel3_cutevol",1,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,0,"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"Cut evolution","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_49.root","vbfg_trigger'${TRIG}'_sel4_cutevol",1,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,0,"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"|#eta^{#gamma}|","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_50.root","vbfg_trigger'${TRIG}'_sel0_etag",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"|#eta^{#gamma}|","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_51.root","vbfg_trigger'${TRIG}'_sel1_etag",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"|#eta^{#gamma}|","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_52.root","vbfg_trigger'${TRIG}'_sel2_etag",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"|#eta^{#gamma}|","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_53.root","vbfg_trigger'${TRIG}'_sel3_etag",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"|#eta^{#gamma}|","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_54.root","vbfg_trigger'${TRIG}'_sel4_etag",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{#gamma}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_55.root","vbfg_trigger'${TRIG}'_sel0_ptg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{#gamma}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_56.root","vbfg_trigger'${TRIG}'_sel1_ptg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{#gamma}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_57.root","vbfg_trigger'${TRIG}'_sel2_ptg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{#gamma}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_58.root","vbfg_trigger'${TRIG}'_sel3_ptg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{#gamma}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_59.root","vbfg_trigger'${TRIG}'_sel4_ptg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(jet-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_60.root","vbfg_trigger'${TRIG}'_sel0_dphijg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(jet-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_61.root","vbfg_trigger'${TRIG}'_sel1_dphijg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(jet-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_62.root","vbfg_trigger'${TRIG}'_sel2_dphijg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(jet-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_63.root","vbfg_trigger'${TRIG}'_sel3_dphijg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(jet-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_64.root","vbfg_trigger'${TRIG}'_sel4_dphijg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#DeltaR(jet-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_65.root","vbfg_trigger'${TRIG}'_sel0_drjg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#DeltaR(jet-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_66.root","vbfg_trigger'${TRIG}'_sel1_drjg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#DeltaR(jet-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_67.root","vbfg_trigger'${TRIG}'_sel2_drjg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#DeltaR(jet-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_68.root","vbfg_trigger'${TRIG}'_sel3_drjg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#DeltaR(jet-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_69.root","vbfg_trigger'${TRIG}'_sel4_drjg",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  hadd -f done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_7075.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_70.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_75.root
  hadd -f done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_7176.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_71.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_76.root
  hadd -f done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_7277.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_72.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_77.root
  hadd -f done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_7378.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_73.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_78.root
  hadd -f done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_7479.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_74.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_79.root
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(p_{T}^{miss}-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_7075.root","vbfg_trigger'${TRIG}'_sel0_dphigmet",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(p_{T}^{miss}-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_7176.root","vbfg_trigger'${TRIG}'_sel1_dphigmet",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(p_{T}^{miss}-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_7277.root","vbfg_trigger'${TRIG}'_sel2_dphigmet",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(p_{T}^{miss}-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_7378.root","vbfg_trigger'${TRIG}'_sel3_dphigmet",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(p_{T}^{miss}-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_7479.root","vbfg_trigger'${TRIG}'_sel4_dphigmet",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(p_{T}^{miss}-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_75.root","vbfg_trigger'${TRIG}'_sel5_dphigmet",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(p_{T}^{miss}-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_76.root","vbfg_trigger'${TRIG}'_sel6_dphigmet",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(p_{T}^{miss}-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_77.root","vbfg_trigger'${TRIG}'_sel7_dphigmet",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(p_{T}^{miss}-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_78.root","vbfg_trigger'${TRIG}'_sel8_dphigmet",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#Delta#phi(p_{T}^{miss}-#gamma)","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_79.root","vbfg_trigger'${TRIG}'_sel9_dphigmet",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"|#eta_{j}|","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_80.root","vbfg_trigger'${TRIG}'_sel0_etaj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"|#eta_{j}|","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_81.root","vbfg_trigger'${TRIG}'_sel1_etaj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"|#eta_{j}|","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_82.root","vbfg_trigger'${TRIG}'_sel2_etaj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"|#eta_{j}|","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_83.root","vbfg_trigger'${TRIG}'_sel3_etaj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"|#eta_{j}|","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_84.root","vbfg_trigger'${TRIG}'_sel4_etaj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{j}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_85.root","vbfg_trigger'${TRIG}'_sel0_ptj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{j}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_86.root","vbfg_trigger'${TRIG}'_sel1_ptj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{j}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_87.root","vbfg_trigger'${TRIG}'_sel2_ptj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{j}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_88.root","vbfg_trigger'${TRIG}'_sel3_ptj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"p_{T}^{j}","GeV","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_89.root","vbfg_trigger'${TRIG}'_sel4_ptj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"n_{PV}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_90.root","vbfg_trigger'${TRIG}'_npv_def",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,1,"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"n_{PV}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_91.root","vbfg_trigger'${TRIG}'_npv_now",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,1,"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"n_{PV}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_92.root","vbfg_trigger'${TRIG}'_npv_std",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,1,"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#phi^{#gamma}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_93.root","vbfg_trigger'${TRIG}'_sel0_phig",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,1,"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#phi^{#gamma}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_94.root","vbfg_trigger'${TRIG}'_sel1_phig",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,1,"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"R_{9}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_95.root","vbfg_trigger'${TRIG}'_sel0_r9",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"R_{9}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_96.root","vbfg_trigger'${TRIG}'_sel1_r9",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"R_{9}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_97.root","vbfg_trigger'${TRIG}'_sel2_r9",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"R_{9}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_98.root","vbfg_trigger'${TRIG}'_sel3_r9",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"R_{9}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_99.root","vbfg_trigger'${TRIG}'_sel4_r9",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"jetPt/HT","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_100.root","vbfg_trigger'${TRIG}'_sel0_jetptoverht",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"jetPt/HT","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_101.root","vbfg_trigger'${TRIG}'_sel1_jetptoverht",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"jetPt/HT","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_102.root","vbfg_trigger'${TRIG}'_sel2_jetptoverht",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"jetPt/HT","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_103.root","vbfg_trigger'${TRIG}'_sel3_jetptoverht",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"jetPt/HT","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_104.root","vbfg_trigger'${TRIG}'_sel4_jetptoverht",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"|p_{T}^{miss}-trk p_{T}^{miss}|/p_{T}^{miss}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_105.root","vbfg_trigger'${TRIG}'_sel0_metbalance",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"|p_{T}^{miss}-trk p_{T}^{miss}|/p_{T}^{miss}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_106.root","vbfg_trigger'${TRIG}'_sel1_metbalance",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"|p_{T}^{miss}-trk p_{T}^{miss}|/p_{T}^{miss}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_107.root","vbfg_trigger'${TRIG}'_sel2_metbalance",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"|p_{T}^{miss}-trk p_{T}^{miss}|/p_{T}^{miss}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_108.root","vbfg_trigger'${TRIG}'_sel3_metbalance",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"|p_{T}^{miss}-trk p_{T}^{miss}|/p_{T}^{miss}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_109.root","vbfg_trigger'${TRIG}'_sel4_metbalance",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#phi_{j}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_117.root","vbfg_trigger'${TRIG}'_nohemcut_sel0_phij",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#phi_{j}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_118.root","vbfg_trigger'${TRIG}'_nohemcut_sel3_phij",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#phi_{j}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_119.root","vbfg_trigger'${TRIG}'_nohemcut_sel1_phij",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#eta_{j}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_120.root","vbfg_trigger'${TRIG}'_nohemcut_sel0_etaj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#eta_{j}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_121.root","vbfg_trigger'${TRIG}'_nohemcut_sel3_etaj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"#eta_{j}","","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_122.root","vbfg_trigger'${TRIG}'_nohemcut_sel1_etaj",0,'${YEAR}',"qqH_{125}(inv.+#gamma) x 0.1",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
fi
