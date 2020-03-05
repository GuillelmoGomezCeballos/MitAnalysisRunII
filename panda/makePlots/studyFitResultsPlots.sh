#!/bin/sh

export NSEL=$1;
export APPLYSCALING=0;
export isBlinded=0;
export sf_dy=1;

if [ $NSEL == 'zhg' ]; then
  export YEAR=2016;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhg_etaglt1_'${YEAR}'.root","zhg_mt_etaglt1_mtg",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhg_etaglt1_'${YEAR}'.root","zhg_mt_etaglt1_mtg",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhg_etaglt1_'${YEAR}'.root","zhg_mt_etaglt1_mtg",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhg_etaglt1_'${YEAR}'.root","zhg_mt_etaglt1_mtg",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';

  export YEAR=2016;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhg_etaggt1_'${YEAR}'.root","zhg_mt_etaggt1_mtg",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhg_etaggt1_'${YEAR}'.root","zhg_mt_etaggt1_mtg",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhg_etaggt1_'${YEAR}'.root","zhg_mt_etaggt1_mtg",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"m_{T}","GeVBIN","done_datacards/histoDatacard_zhg_etaggt1_'${YEAR}'.root","zhg_mt_etaggt1_mtg",0,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';

elif [ $NSEL == 'zh' ]; then
  export YEAR=2016;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}","GeVBINBinWidth","done_datacards/histoDatacard_zh_0j_'${YEAR}'.root","zh_0j_met",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"0 jet category",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}","GeVBINBinWidth","done_datacards/histoDatacard_zh_0j_'${YEAR}'.root","zh_0j_met",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"0 jet category",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}","GeVBINBinWidth","done_datacards/histoDatacard_zh_0j_'${YEAR}'.root","zh_0j_met",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"0 jet category",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}","GeVBINBinWidth","done_datacards/histoDatacard_zh_0j_'${YEAR}'.root","zh_0j_met",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"0 jet category",1,'${APPLYSCALING}',"","")';

  export YEAR=2016;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}","GeVBINBinWidth","done_datacards/histoDatacard_zh_1j_'${YEAR}'.root","zh_1j_met",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"1 jet category",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}","GeVBINBinWidth","done_datacards/histoDatacard_zh_1j_'${YEAR}'.root","zh_1j_met",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"1 jet category",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}","GeVBINBinWidth","done_datacards/histoDatacard_zh_1j_'${YEAR}'.root","zh_1j_met",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"1 jet category",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}","GeVBINBinWidth","done_datacards/histoDatacard_zh_1j_'${YEAR}'.root","zh_1j_met",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"1 jet category",1,'${APPLYSCALING}',"","")';

  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"p_{T}","GeVBINBinWidth","done_datacards/histoDatacard_zh_nj_'${YEAR}'.root","zh_nj_met",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"",1,'${APPLYSCALING}',"","")';

  export YEAR=2016;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}","GeVBINBinWidth","done_datacards/histoDatacard_wz_'${YEAR}'.root","wz_met",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"WZ region",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}","GeVBINBinWidth","done_datacards/histoDatacard_wz_'${YEAR}'.root","wz_met",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"WZ region",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}","GeVBINBinWidth","done_datacards/histoDatacard_wz_'${YEAR}'.root","wz_met",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"WZ region",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}","GeVBINBinWidth","done_datacards/histoDatacard_wz_'${YEAR}'.root","wz_met",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"WZ region",1,'${APPLYSCALING}',"","")';

  export YEAR=2016;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}","GeVBINBinWidth","done_datacards/histoDatacard_zz_'${YEAR}'.root","zz_met",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"ZZ region",1,'${APPLYSCALING}',"","")';
  export YEAR=2017;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}","GeVBINBinWidth","done_datacards/histoDatacard_zz_'${YEAR}'.root","zz_met",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"ZZ region",1,'${APPLYSCALING}',"","")';
  export YEAR=2018;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}","GeVBINBinWidth","done_datacards/histoDatacard_zz_'${YEAR}'.root","zz_met",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"ZZ region",1,'${APPLYSCALING}',"","")';
  export YEAR=2019;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot.C+'(0,1,"Emulated p_{T}","GeVBINBinWidth","done_datacards/histoDatacard_zz_'${YEAR}'.root","zz_met",1,'${YEAR}',"Z(ll)H_{125}(inv.)",'${sf_dy}','${isBlinded}',"ZZ region",1,'${APPLYSCALING}',"","")';

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
  export isBlinded=1;
  export YEAR=2016; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"card","","done_datacards/histoDatacard_vbfg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_trigger'${TRIG}'_sel_card",1,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"card","","done_datacards/histoDatacard_vbfg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_trigger'${TRIG}'_sel_card",1,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"card","","done_datacards/histoDatacard_vbfg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_trigger'${TRIG}'_sel_card",1,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"card","","done_datacards/histoDatacard_vbfg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_trigger'${TRIG}'_sel_card",1,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"card","","done_datacards/histoDatacard_vbfg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_trigger'${TRIG}'_sel_card",1,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2019; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"card","","done_datacards/histoDatacard_vbfg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_trigger'${TRIG}'_sel_card",1,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2019; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"card","","done_datacards/histoDatacard_vbfg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_trigger'${TRIG}'_sel_card",1,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';

  export YEAR=2016; export MJJ=0; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2016; export MJJ=1; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=0; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=1; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=0; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=1; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=0; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=1; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=0; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=1; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2019; export MJJ=0; export TRIG=2;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_sr_mtg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_sr_mtg_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export isBlinded=0;

  export YEAR=2016; export MJJ=0; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2016; export MJJ=1; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=0; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=1; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=0; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=1; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=0; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=1; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=0; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=1; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2019; export MJJ=0; export TRIG=2;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wj_mtg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wj_mtg_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';

  export YEAR=2016; export MJJ=0; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2016; export MJJ=1; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=0; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=1; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=0; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=1; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=0; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=1; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=0; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=1; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wg_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2019; export MJJ=0; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wg_mtg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wg_mtg_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2019; export MJJ=0; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_wg_mtg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_wg_mtg_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';

  export YEAR=2016; export MJJ=0; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2016; export MJJ=1; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=0; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=1; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=0; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2017; export MJJ=1; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=0; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=1; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=0; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2018; export MJJ=1; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'_'${YEAR}'.root","vbfg_gj_mtg_mjj'${MJJ}'_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2019; export MJJ=0; export TRIG=0;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_gj_mtg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_gj_mtg_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';
  export YEAR=2019; export MJJ=0; export TRIG=1;
  root -q -b -l MitAnalysisRunII/panda/makePlots/finalPlot_vbfg.C+'(0,1,"m_{T}","GeVBINBinWidth","done_datacards/histoDatacard_vbfg_gj_mtg_trigger'${TRIG}'_'${YEAR}'.root","vbfg_gj_mtg_trigger'${TRIG}'",0,'${YEAR}',"qqH_{125}(inv.+#gamma)",1,'${isBlinded}',"",1,'${APPLYSCALING}')';

fi
