#!/bin/sh

export NSEL=$1;
export APPLYSCALING=1;
export isBlinded=0;
export sf_dy=1;

if [ $NSEL == 'zhg' ]; then
  export YEAR=2016;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhg_etaglt1_'${YEAR}'.root","zhg_mt_etaglt1_mtg",0,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhg_etaglt1_'${YEAR}'.root","zhg_mt_etaglt1_mtg",0,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhg_etaglt1_'${YEAR}'.root","zhg_mt_etaglt1_mtg",0,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhg_etaglt1_'${YEAR}'.root","zhg_mt_etaglt1_mtg",0,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';

  export YEAR=2016;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhg_etaggt1_'${YEAR}'.root","zhg_mt_etaggt1_mtg",0,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhg_etaggt1_'${YEAR}'.root","zhg_mt_etaggt1_mtg",0,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhg_etaggt1_'${YEAR}'.root","zhg_mt_etaggt1_mtg",0,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhg_etaggt1_'${YEAR}'.root","zhg_mt_etaggt1_mtg",0,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';

elif [ $NSEL == 'zh' ]; then
  export YEAR=2016;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"p_{T}^{miss}","GeVBINBinWidth","done_datacards/histoDatacard_zh_0j_'${YEAR}'.root","zh_0j_met",1,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"0-jet category",1,'${APPLYSCALING}',"","",0,"ana_zh_frozen/histoZH_2016_0j_ADDMonoZ_MD_2_d_4.root","ADD n = 4, M_{D} = 2 TeV")';
  export YEAR=2017;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"p_{T}^{miss}","GeVBINBinWidth","done_datacards/histoDatacard_zh_0j_'${YEAR}'.root","zh_0j_met",1,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"0-jet category",1,'${APPLYSCALING}',"","",0,"ana_zh_frozen/histoZH_2017_0j_ADDMonoZ_MD_2_d_4.root","ADD n = 4, M_{D} = 2 TeV")';
  export YEAR=2018;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"p_{T}^{miss}","GeVBINBinWidth","done_datacards/histoDatacard_zh_0j_'${YEAR}'.root","zh_0j_met",1,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"0-jet category",1,'${APPLYSCALING}',"","",0,"ana_zh_frozen/histoZH_2018_0j_ADDMonoZ_MD_2_d_4.root","ADD n = 4, M_{D} = 2 TeV")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"p_{T}^{miss}","GeVBINBinWidth","done_datacards/histoDatacard_zh_0j_'${YEAR}'.root","zh_0j_met",1,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"0-jet category",1,'${APPLYSCALING}',"","",0,"ana_zh_frozen/histoZH_2019_0j_ADDMonoZ_MD_2_d_4.root","ADD n = 4, M_{D} = 2 TeV")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"p_{T}^{miss}","GeVBINBinWidthStack","done_datacards/histoDatacard_zh_0j_'${YEAR}'.root","zh_0j_met_stack",1,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"0-jet category",1,'${APPLYSCALING}',"","",0,"ana_zh_frozen/histoZH_2019_0j_ADDMonoZ_MD_2_d_4.root","ADD n = 4, M_{D} = 2 TeV")';

  export YEAR=2016;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"p_{T}^{miss}","GeVBINBinWidth","done_datacards/histoDatacard_zh_1j_'${YEAR}'.root","zh_1j_met",1,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"1-jet category",1,'${APPLYSCALING}',"","",0,"ana_zh_frozen/histoZH_2016_1j_ADDMonoZ_MD_2_d_4.root","ADD n = 4, M_{D} = 2 TeV")';
  export YEAR=2017;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"p_{T}^{miss}","GeVBINBinWidth","done_datacards/histoDatacard_zh_1j_'${YEAR}'.root","zh_1j_met",1,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"1-jet category",1,'${APPLYSCALING}',"","",0,"ana_zh_frozen/histoZH_2017_1j_ADDMonoZ_MD_2_d_4.root","ADD n = 4, M_{D} = 2 TeV")';
  export YEAR=2018;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"p_{T}^{miss}","GeVBINBinWidth","done_datacards/histoDatacard_zh_1j_'${YEAR}'.root","zh_1j_met",1,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"1-jet category",1,'${APPLYSCALING}',"","",0,"ana_zh_frozen/histoZH_2018_1j_ADDMonoZ_MD_2_d_4.root","ADD n = 4, M_{D} = 2 TeV")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"p_{T}^{miss}","GeVBINBinWidth","done_datacards/histoDatacard_zh_1j_'${YEAR}'.root","zh_1j_met",1,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"1-jet category",1,'${APPLYSCALING}',"","",0,"ana_zh_frozen/histoZH_2019_1j_ADDMonoZ_MD_2_d_4.root","ADD n = 4, M_{D} = 2 TeV")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"p_{T}^{miss}","GeVBINBinWidthStack","done_datacards/histoDatacard_zh_1j_'${YEAR}'.root","zh_1j_met_stack",1,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"1-jet category",1,'${APPLYSCALING}',"","",0,"ana_zh_frozen/histoZH_2019_1j_ADDMonoZ_MD_2_d_4.root","ADD n = 4, M_{D} = 2 TeV")';

  export YEAR=2019;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"p_{T}^{miss}","GeVBINBinWidth","done_datacards/histoDatacard_zh_nj_'${YEAR}'.root","zh_nj_met",1,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","",0,"ana_zh_frozen/histoZH_2019_nj_ADDMonoZ_MD_2_d_4.root","ADD n = 4, M_{D} = 2 TeV")';

  export YEAR=2016;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"Emulated p_{T}^{miss}","GeVBINBinWidth","done_datacards/histoDatacard_wz_'${YEAR}'.root","wz_met",1,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"3-lepton control region",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"Emulated p_{T}^{miss}","GeVBINBinWidth","done_datacards/histoDatacard_wz_'${YEAR}'.root","wz_met",1,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"3-lepton control region",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"Emulated p_{T}^{miss}","GeVBINBinWidth","done_datacards/histoDatacard_wz_'${YEAR}'.root","wz_met",1,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"3-lepton control region",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"Emulated p_{T}^{miss}","GeVBINBinWidth","done_datacards/histoDatacard_wz_'${YEAR}'.root","wz_met",1,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"3-lepton control region",1,'${APPLYSCALING}',"","")';

  export YEAR=2016;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"Emulated p_{T}^{miss}","GeVBINBinWidth","done_datacards/histoDatacard_zz_'${YEAR}'.root","zz_met",1,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"4-lepton control region",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"Emulated p_{T}^{miss}","GeVBINBinWidth","done_datacards/histoDatacard_zz_'${YEAR}'.root","zz_met",1,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"4-lepton control region",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"Emulated p_{T}^{miss}","GeVBINBinWidth","done_datacards/histoDatacard_zz_'${YEAR}'.root","zz_met",1,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"4-lepton control region",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"Emulated p_{T}^{miss}","GeVBINBinWidth","done_datacards/histoDatacard_zz_'${YEAR}'.root","zz_met",1,'${YEAR}',"Z(ll)h_{125}(inv.)",'${sf_dy}','${isBlinded}',"4-lepton control region",1,'${APPLYSCALING}',"","")';

elif [ $NSEL == 'long' ]; then
  export YEAR=2016;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Bin","","done_datacards/histoDatacard_long_all_'${YEAR}'.root","ssww_datacard",1,'${YEAR}',"X",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Bin","","done_datacards/histoDatacard_long_all_'${YEAR}'.root","ssww_datacard",1,'${YEAR}',"X",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Bin","","done_datacards/histoDatacard_long_all_'${YEAR}'.root","ssww_datacard",1,'${YEAR}',"X",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Bin","","done_datacards/histoDatacard_long_all_'${YEAR}'.root","ssww_datacard",1,'${YEAR}',"X",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';

elif [ $NSEL == 'ssww' ]; then
  export YEAR=2016;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeVBIN","done_datacards/histoDatacard_ssww_zz_'${YEAR}'.root","ssww_zzcr_mjj",0,'${YEAR}',"X",'${sf_dy}','${isBlinded}',"ZZ category",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeVBIN","done_datacards/histoDatacard_ssww_zz_'${YEAR}'.root","ssww_zzcr_mjj",0,'${YEAR}',"X",'${sf_dy}','${isBlinded}',"ZZ category",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeVBIN","done_datacards/histoDatacard_ssww_zz_'${YEAR}'.root","ssww_zzcr_mjj",0,'${YEAR}',"X",'${sf_dy}','${isBlinded}',"ZZ category",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeVBIN","done_datacards/histoDatacard_ssww_zz_'${YEAR}'.root","ssww_zzcr_mjj",0,'${YEAR}',"X",'${sf_dy}','${isBlinded}',"ZZ category",1,'${APPLYSCALING}',"","")';

  export YEAR=2016;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeVBIN","done_datacards/histoDatacard_ssww_wzb_'${YEAR}'.root","ssww_wzbcr_mjj",0,'${YEAR}',"X",'${sf_dy}','${isBlinded}',"WZb category",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeVBIN","done_datacards/histoDatacard_ssww_wzb_'${YEAR}'.root","ssww_wzbcr_mjj",0,'${YEAR}',"X",'${sf_dy}','${isBlinded}',"WZb category",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeVBIN","done_datacards/histoDatacard_ssww_wzb_'${YEAR}'.root","ssww_wzbcr_mjj",0,'${YEAR}',"X",'${sf_dy}','${isBlinded}',"WZb category",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{jj}","GeVBIN","done_datacards/histoDatacard_ssww_wzb_'${YEAR}'.root","ssww_wzbcr_mjj",0,'${YEAR}',"X",'${sf_dy}','${isBlinded}',"WZb category",1,'${APPLYSCALING}',"","")';

  export YEAR=2016;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Output","","done_datacards/histoDatacard_ssww_wz_'${YEAR}'.root","ssww_wz_bdt",0,'${YEAR}',"X",'${sf_dy}','${isBlinded}',"WZ category",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Output","","done_datacards/histoDatacard_ssww_wz_'${YEAR}'.root","ssww_wz_bdt",0,'${YEAR}',"X",'${sf_dy}','${isBlinded}',"WZ category",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Output","","done_datacards/histoDatacard_ssww_wz_'${YEAR}'.root","ssww_wz_bdt",0,'${YEAR}',"X",'${sf_dy}','${isBlinded}',"WZ category",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Output","","done_datacards/histoDatacard_ssww_wz_'${YEAR}'.root","ssww_wz_bdt",0,'${YEAR}',"X",'${sf_dy}','${isBlinded}',"WZ category",1,'${APPLYSCALING}',"","")';

elif [ $NSEL == 'vbfg' ]; then
  #hadd -f done_vbfg/histoVBFG_2019_trigger2_mH125_05.root done_vbfg/histoVBFG_201?_trigger?_mH1000_[0,5].root;
  export isBlinded=0;
  export YEAR=2016; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"card","","done_datacards/histoDatacard_vbfg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_trigger'${TRIG}'_sel_card",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"card","","done_datacards/histoDatacard_vbfg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_trigger'${TRIG}'_sel_card",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export TRIG=1;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"card","","done_datacards/histoDatacard_vbfg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_trigger'${TRIG}'_sel_card",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"card","","done_datacards/histoDatacard_vbfg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_trigger'${TRIG}'_sel_card",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export TRIG=1;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"card","","done_datacards/histoDatacard_vbfg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_trigger'${TRIG}'_sel_card",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2019; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"card","","done_datacards/histoDatacard_vbfg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_trigger'${TRIG}'_sel_card",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2019; export TRIG=1;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"card","","done_datacards/histoDatacard_vbfg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_trigger'${TRIG}'_sel_card",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';

  export YEAR=2016; export MJJ=0; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2016; export MJJ=1; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=0; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=1; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=0; export TRIG=1;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=1; export TRIG=1;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=0; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=1; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=0; export TRIG=1;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=1; export TRIG=1;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2019; export MJJ=0; export TRIG=2;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_125_1000_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}',"","",0,"done_vbfg/histoVBFG_2019_trigger2_mH125_05.root","qqH_{1000}(inv.+#gamma)")';
  export YEAR=2019; export MJJ=0; export TRIG=2;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"#splitline{SR}{m_{jj} < 1500 GeV}",1,'${APPLYSCALING}')';
  export YEAR=2019; export MJJ=1; export TRIG=2;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"#splitline{SR}{m_{jj} > 1500 GeV}",1,'${APPLYSCALING}')';

  export isBlinded=0;

  export YEAR=2016; export MJJ=0; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2016; export MJJ=1; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=0; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=1; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=0; export TRIG=1;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=1; export TRIG=1;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=0; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=1; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=0; export TRIG=1;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=1; export TRIG=1;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2019; export MJJ=0; export TRIG=2;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_trigger'${TRIG}'",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2019; export MJJ=0; export TRIG=2;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"#splitline{W+jets CR}{m_{jj} < 1500 GeV}",1,'${APPLYSCALING}')';
  export YEAR=2019; export MJJ=1; export TRIG=2;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",1,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"#splitline{W+jets CR}{m_{jj} > 1500 GeV}",1,'${APPLYSCALING}')';

  export YEAR=2016; export MJJ=0; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_datacards/histoDatacard_vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=0; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_datacards/histoDatacard_vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=0; export TRIG=1;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_datacards/histoDatacard_vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=0; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_datacards/histoDatacard_vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=0; export TRIG=1;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_datacards/histoDatacard_vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2019; export MJJ=0; export TRIG=2;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_datacards/histoDatacard_vbfg_wg_mtg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wg_mtg_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"W#gamma CR",1,'${APPLYSCALING}')';

  export YEAR=2016; export MJJ=0; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_datacards/histoDatacard_vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=0; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_datacards/histoDatacard_vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=0; export TRIG=1;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_datacards/histoDatacard_vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=0; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_datacards/histoDatacard_vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=0; export TRIG=1;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_datacards/histoDatacard_vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2019; export MJJ=0; export TRIG=2;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_datacards/histoDatacard_vbfg_gj_mtg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_gj_mtg_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"#gamma+jets CR",1,'${APPLYSCALING}')';

  export YEAR=2016; export MJJ=0; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_datacards/histoDatacard_vbfg_zg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_zg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=0; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_datacards/histoDatacard_vbfg_zg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_zg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=0; export TRIG=1;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_datacards/histoDatacard_vbfg_zg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_zg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=0; export TRIG=0;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_datacards/histoDatacard_vbfg_zg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_zg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=0; export TRIG=1;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_datacards/histoDatacard_vbfg_zg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_zg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2019; export MJJ=0; export TRIG=2;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeV","done_datacards/histoDatacard_vbfg_zg_mtg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_zg_mtg_trigger'${TRIG}'",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,'${isBlinded}',"Z#gamma CR",1,'${APPLYSCALING}')';

elif [ $NSEL == 'zhmt' ]; then
  export YEAR=2016;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_cat3L_'${YEAR}'.root","zh_3l_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"3-lepton control region",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_cat3L_'${YEAR}'.root","zh_3l_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"3-lepton control region",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_cat3L_'${YEAR}'.root","zh_3l_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"3-lepton control region",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_cat3L_'${YEAR}'.root","zh_3l_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"3-lepton control region",1,'${APPLYSCALING}',"","")';

  export YEAR=2016;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_cat4L_'${YEAR}'.root","zh_4l_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"4-lepton control region",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_cat4L_'${YEAR}'.root","zh_4l_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"4-lepton control region",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_cat4L_'${YEAR}'.root","zh_4l_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"4-lepton control region",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_cat4L_'${YEAR}'.root","zh_4l_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"4-lepton control region",1,'${APPLYSCALING}',"","")';

  export YEAR=2016;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_catEM_'${YEAR}'.root","zh_em_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"e#mu category",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_catEM_'${YEAR}'.root","zh_em_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"e#mu category",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_catEM_'${YEAR}'.root","zh_em_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"e#mu category",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_catEM_'${YEAR}'.root","zh_em_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"e#mu category",1,'${APPLYSCALING}',"","")';

  export YEAR=2016;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_0jBSM_'${YEAR}'.root","zh_0jsignal_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"0-jet signal category",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_0jBSM_'${YEAR}'.root","zh_0jsignal_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"0-jet signal category",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_0jBSM_'${YEAR}'.root","zh_0jsignal_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"0-jet signal category",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_0jBSM_'${YEAR}'.root","zh_0jsignal_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"0-jet signal category",1,'${APPLYSCALING}',"","")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBINStack","done_datacards/histoDatacard_zhmt_0jBSM_'${YEAR}'.root","zh_0jsignal_mt_stack",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"0-jet signal category",1,'${APPLYSCALING}',"","")';

  export YEAR=2016;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_1jBSM_'${YEAR}'.root","zh_1jsignal_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"1-jet signal category",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_1jBSM_'${YEAR}'.root","zh_1jsignal_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"1-jet signal category",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_1jBSM_'${YEAR}'.root","zh_1jsignal_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"1-jet signal category",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_1jBSM_'${YEAR}'.root","zh_1jsignal_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"1-jet signal category",1,'${APPLYSCALING}',"","")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"m_{T}","GeVBINStack","done_datacards/histoDatacard_zhmt_1jBSM_'${YEAR}'.root","zh_1jsignal_mt_stack",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"1-jet signal category",1,'${APPLYSCALING}',"","")';

fi
