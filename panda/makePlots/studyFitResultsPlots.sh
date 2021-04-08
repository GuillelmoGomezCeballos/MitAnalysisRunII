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

  export YEAR=2019; export TRIG=2;
  hadd -f done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_05.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_0.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_5.root
  hadd -f done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_16.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_1.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_6.root
  hadd -f done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_27.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_2.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_7.root
  hadd -f done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_38.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_3.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_8.root
  hadd -f done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_49.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_4.root done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_9.root

  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_05.root","vbfg_trigger'${TRIG}'_sel05_mtg",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_16.root","vbfg_trigger'${TRIG}'_sel16_mtg",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_27.root","vbfg_trigger'${TRIG}'_sel27_mtg",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_38.root","vbfg_trigger'${TRIG}'_sel38_mtg",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_49.root","vbfg_trigger'${TRIG}'_sel49_mtg",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeVBINBinWidth","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_25.root","vbfg_trigger'${TRIG}'_sel0_mjj",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeVBINBinWidth","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_26.root","vbfg_trigger'${TRIG}'_sel1_mjj",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeVBINBinWidth","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_27.root","vbfg_trigger'${TRIG}'_sel2_mjj",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeVBINBinWidth","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_28.root","vbfg_trigger'${TRIG}'_sel3_mjj",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{jj}","GeVBINBinWidth","done_vbfg/histoVBFG_'${YEAR}'_trigger'${TRIG}'_mH125_29.root","vbfg_trigger'${TRIG}'_sel4_mjj",0,'${YEAR}',"H_{125} #rightarrow inv.+#gamma, #it{#Beta} = 0.05",1,0,"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'")';

elif [ $NSEL == 'zhmt' ]; then
  sed -i 's/writeExtraText = false/writeExtraText = true/' MitAnalysisRunII/panda/makePlots/CMS_lumi.h
  sed -i 's/extraText   = "Preliminary"/extraText   = "Supplementary"/' MitAnalysisRunII/panda/makePlots/CMS_lumi.h
  touch MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C
  export YEAR=2016;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"Emulated m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_cat3L_'${YEAR}'.root","zh_3l_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"3-lepton control region",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"Emulated m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_cat3L_'${YEAR}'.root","zh_3l_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"3-lepton control region",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"Emulated m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_cat3L_'${YEAR}'.root","zh_3l_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"3-lepton control region",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"Emulated m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_cat3L_'${YEAR}'.root","zh_3l_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"3-lepton control region",1,'${APPLYSCALING}',"","")';

  export YEAR=2016;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"Emulated m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_cat4L_'${YEAR}'.root","zh_4l_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"4-lepton control region",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"Emulated m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_cat4L_'${YEAR}'.root","zh_4l_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"4-lepton control region",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  #root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"Emulated m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_cat4L_'${YEAR}'.root","zh_4l_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"4-lepton control region",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C+'(0,1,"Emulated m_{T}","GeVBIN","done_datacards/histoDatacard_zhmt_cat4L_'${YEAR}'.root","zh_4l_mt",1,'${YEAR}',"m_{H} = 1200 GeV, m_{a} = 300 GeV",'${sf_dy}','${isBlinded}',"4-lepton control region",1,'${APPLYSCALING}',"","")';
  sed -i 's/writeExtraText = true/writeExtraText = false/' MitAnalysisRunII/panda/makePlots/CMS_lumi.h
  sed -i 's/extraText   = "Supplementary"/extraText   = "Preliminary"/' MitAnalysisRunII/panda/makePlots/CMS_lumi.h
  touch MitAnalysisRunII/panda/makePlots/finalPlot_exo19003.C

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

elif [ $NSEL == 'higgs' ]; then
  export YEAR=2019;
  export isNeverBlinded=0;
  export mlfitResult="done_ana/../ana_higgs/fitDiagnosticsssww_comb_fiducial6_mH500_obs.root";
  export fidAnaName="_fiducial6_mH500";
  export channelName="SSWW_2019"; 

  sed -i 's/SetMarkerSize(0.8)/SetMarkerSize(0.5)/' MitAnalysisRunII/panda/makePlots/finalPlot_hig20017.C
  sed -i 's/SetMarkerSize(0.8)/SetMarkerSize(0.5)/' MitAnalysisRunII/panda/makePlots/StandardPlot_hig20017.C
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_hig20017.C+'(0,1,"Bin",       "BINROOT",           "done_datacards/histoDatacard_hpp_hp'${fidAnaName}'_'${YEAR}'.root",  "ssww_datacardhiggs",1,       '${YEAR}',"H^{++}(500)#rightarrowW^{+}W^{+}, s_{H}=1",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"","",0,"","H^{+}(500)#rightarrowW^{+}Z, s_{H}=1")';
  sed -i 's/SetMarkerSize(0.5)/SetMarkerSize(0.8)/' MitAnalysisRunII/panda/makePlots/finalPlot_hig20017.C
  sed -i 's/SetMarkerSize(0.5)/SetMarkerSize(0.8)/' MitAnalysisRunII/panda/makePlots/StandardPlot_hig20017.C
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_hig20017.C+'(0,1,"m_{T}^{WW}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_135'${fidAnaName}'.root","ssww_wwsel_higgs_fullmtww",0,'${YEAR}',"H^{++}(500)#rightarrowW^{+}W^{+}, s_{H}=1",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'",0,"","H^{+}(500)#rightarrowW^{+}Z, s_{H}=1")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_hig20017.C+'(0,1,"m_{T}^{WZ}","GeVBINBinWidth","done_ana/histossww_'${YEAR}'_138'${fidAnaName}'.root","ssww_wzsel_higgs_fullmtwz",0,'${YEAR}',"H^{++}(500)#rightarrowW^{+}W^{+}, s_{H}=1",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'",0,"","H^{+}(500)#rightarrowW^{+}Z, s_{H}=1")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_hig20017.C+'(0,1,"m_{jj}"    ,"GeVBINBinWidth","done_ana/histossww_'${YEAR}'_0'${fidAnaName}'.root",  "ssww_wwsel_mjj",0,           '${YEAR}',"H^{++}(500)#rightarrowW^{+}W^{+}, s_{H}=1",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'",0,"","H^{+}(500)#rightarrowW^{+}Z, s_{H}=1")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_hig20017.C+'(0,2,"m_{jj}"    ,"GeVBINBinWidth","done_ana/histossww_'${YEAR}'_4'${fidAnaName}'.root",  "ssww_wzsel_mjj",0,           '${YEAR}',"H^{++}(500)#rightarrowW^{+}W^{+}, s_{H}=1",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'",0,"","H^{+}(500)#rightarrowW^{+}Z, s_{H}=1")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_hig20017.C+'(0,1,"m_{jj}"    ,"GeVBINBinWidth","done_ana/histossww_'${YEAR}'_79'${fidAnaName}'.root","ssww_qcdwwsel_mjj" ,0,        '${YEAR}',"H^{++}(500)#rightarrowW^{+}W^{+}, s_{H}=1",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'",0,"","H^{+}(500)#rightarrowW^{+}Z, s_{H}=1")';
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_hig20017.C+'(0,1,"m_{jj}"    ,"GeVBINBinWidth","done_ana/histossww_'${YEAR}'_83'${fidAnaName}'.root","ssww_qcdwzsel_mjj" ,0,        '${YEAR}',"H^{++}(500)#rightarrowW^{+}W^{+}, s_{H}=1",1.0,'${isNeverBlinded}',"",1,'${APPLYSCALING}',"'${mlfitResult}'","'${channelName}'",0,"","H^{+}(500)#rightarrowW^{+}Z, s_{H}=1")';


fi
