#!/bin/sh

export NSEL=$1
 
if [ $NSEL == 'zhg' ]; then
echo "***************ZHG*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(0, "done_ana/histoZHG_mH125_2016_0001.root", "ana_zhg/fitDiagnosticszhg_comb_125_obs.root", "ZHG_2016_125")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_0.root histoDatacard_zhg_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(0, "done_ana/histoZHG_mH125_2017_0001.root", "ana_zhg/fitDiagnosticszhg_comb_125_obs.root", "ZHG_2017_125")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_0.root histoDatacard_zhg_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(0, "done_ana/histoZHG_mH125_2018_0001.root", "ana_zhg/fitDiagnosticszhg_comb_125_obs.root", "ZHG_2018_125")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_0.root histoDatacard_zhg_2018.root

hadd -f histoDatacard_zhg_2019.root histoDatacard_zhg_201[6-8].root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(0, "done_ana/histoZHG_mH125_2019_0001.root", "comb/fitDiagnosticszhg_comb_125_obs.root", "ZHG_2019_125")';
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(1, "done_ana/histoZHG_mH125_2019_2.root", "comb/fitDiagnosticszhg_comb_125_obs.root", "ZHG_2019_125")';
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(2, "done_ana/histoZHG_mH125_2019_09101112.root", "comb/fitDiagnosticszhg_comb_125_obs.root", "ZHG_2019_125")';
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(3, "done_ana/histoZHG_mH125_2019_171819.root", "comb/fitDiagnosticszhg_comb_125_obs.root", "ZHG_2019_125")';
rm -f studyFitResults*.txt;
rm -f histoDatacard_*.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(4, "done_ana/histoZHG_mH125_2016_54.root", "ana_zhg/fitDiagnosticszhg_comb_125_obs.root", "ZHG_2016_125")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_4.root histoDatacard_zhg_etaglt1_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(4, "done_ana/histoZHG_mH125_2017_54.root", "ana_zhg/fitDiagnosticszhg_comb_125_obs.root", "ZHG_2017_125")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_4.root histoDatacard_zhg_etaglt1_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(4, "done_ana/histoZHG_mH125_2018_54.root", "ana_zhg/fitDiagnosticszhg_comb_125_obs.root", "ZHG_2018_125")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_4.root histoDatacard_zhg_etaglt1_2018.root

hadd -f histoDatacard_zhg_etaglt1_2019.root histoDatacard_zhg_etaglt1_201[6-8].root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;
rm -f studyFitResults*.txt;
rm -f histoDatacard_?.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(5, "done_ana/histoZHG_mH125_2016_55.root", "ana_zhg/fitDiagnosticszhg_comb_125_obs.root", "ZHG_2016_125")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_5.root histoDatacard_zhg_etaggt1_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(5, "done_ana/histoZHG_mH125_2017_55.root", "ana_zhg/fitDiagnosticszhg_comb_125_obs.root", "ZHG_2017_125")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_5.root histoDatacard_zhg_etaggt1_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(5, "done_ana/histoZHG_mH125_2018_55.root", "ana_zhg/fitDiagnosticszhg_comb_125_obs.root", "ZHG_2018_125")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_5.root histoDatacard_zhg_etaggt1_2018.root

hadd -f histoDatacard_zhg_etaggt1_2019.root histoDatacard_zhg_etaggt1_201[6-8].root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;
rm -f studyFitResults*.txt;
rm -f histoDatacard_?.root

elif [ $NSEL == 'ssww' ]; then
echo "***************SSWW All*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(15, "done_ana/histossww_2016_136.root", "ana_ssww/fitDiagnosticsssww_2016_wwwz_obs.root", "ch1")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_15.root histoDatacard_ssww_all_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(15, "done_ana/histossww_2017_136.root", "ana_ssww/fitDiagnosticsssww_2017_wwwz_obs.root", "ch1")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_15.root histoDatacard_ssww_all_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(15, "done_ana/histossww_2018_136.root", "ana_ssww/fitDiagnosticsssww_2018_wwwz_obs.root", "ch1")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_15.root histoDatacard_ssww_all_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(15, "done_ana/histossww_2019_136.root", "comb/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_15.root histoDatacard_ssww_all_2019.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;
rm -f studyFitResults*.txt;
rm -f histoDatacard_*.root

echo "***************SSWW WW SR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(10, "done_ana/histossww_2016_0.root", "ana_ssww/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2016")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_10.root histoDatacard_ssww_wwsr_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(10, "done_ana/histossww_2017_0.root", "ana_ssww/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2017")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_10.root histoDatacard_ssww_wwsr_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(10, "done_ana/histossww_2018_0.root", "ana_ssww/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2018")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_10.root histoDatacard_ssww_wwsr_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(10, "done_ana/histossww_2019_0.root", "comb/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_10.root histoDatacard_ssww_wwsr_2019.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;
rm -f studyFitResults*.txt;
rm -f histoDatacard_*.root

echo "***************SSWW BTAG CR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(11, "done_ana/histossww_2016_1.root", "ana_ssww/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2016")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_11.root histoDatacard_ssww_btag_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(11, "done_ana/histossww_2017_1.root", "ana_ssww/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2017")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_11.root histoDatacard_ssww_btag_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(11, "done_ana/histossww_2018_1.root", "ana_ssww/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2018")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_11.root histoDatacard_ssww_btag_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(11, "done_ana/histossww_2019_1.root", "comb/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_11.root histoDatacard_ssww_btag_2019.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;
rm -f studyFitResults*.txt;
rm -f histoDatacard_*.root

echo "***************SSWW ZZ CR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(12, "done_ana/histossww_2016_2.root", "ana_ssww/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2016")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_12.root histoDatacard_ssww_zz_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(12, "done_ana/histossww_2017_2.root", "ana_ssww/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2017")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_12.root histoDatacard_ssww_zz_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(12, "done_ana/histossww_2018_2.root", "ana_ssww/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2018")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_12.root histoDatacard_ssww_zz_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(12, "done_ana/histossww_2019_2.root", "comb/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_12.root histoDatacard_ssww_zz_2019.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;
rm -f studyFitResults*.txt;

echo "***************SSWW WZb CR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(13, "done_ana/histossww_2016_3.root", "ana_ssww/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2016")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_13.root histoDatacard_ssww_wzb_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(13, "done_ana/histossww_2017_3.root", "ana_ssww/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2017")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_13.root histoDatacard_ssww_wzb_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(13, "done_ana/histossww_2018_3.root", "ana_ssww/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2018")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_13.root histoDatacard_ssww_wzb_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(13, "done_ana/histossww_2019_3.root", "comb/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_13.root histoDatacard_ssww_wzb_2019.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;
rm -f studyFitResults*.txt;

echo "***************SSWW WZ SR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(14, "done_ana/histossww_2016_77.root", "ana_ssww/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2016")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_14.root histoDatacard_ssww_wz_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(14, "done_ana/histossww_2017_77.root", "ana_ssww/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2017")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_14.root histoDatacard_ssww_wz_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(14, "done_ana/histossww_2018_77.root", "ana_ssww/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2018")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_14.root histoDatacard_ssww_wz_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(14, "done_ana/histossww_2019_77.root", "comb/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_14.root histoDatacard_ssww_wz_2019.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;
rm -f studyFitResults*.txt;



elif [ $NSEL == 'long' ]; then
echo "***************LONG All*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(35, "done_ana/histossww_2016_136_fiducial5.root", "ana_long/fitDiagnosticsssww_2016_fiducial5_obs.root", "ch1")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_35.root histoDatacard_long_all_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(35, "done_ana/histossww_2017_136_fiducial5.root", "ana_long/fitDiagnosticsssww_2017_fiducial5_obs.root", "ch1")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_35.root histoDatacard_long_all_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(35, "done_ana/histossww_2018_136_fiducial5.root", "ana_long/fitDiagnosticsssww_2018_fiducial5_obs.root", "ch1")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_35.root histoDatacard_long_all_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(35, "done_ana/histossww_2019_136_fiducial5.root", "comb/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_35.root histoDatacard_long_all_2019.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;
rm -f studyFitResults*.txt;
rm -f histoDatacard_*.root

echo "***************LONG WW SR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(30, "done_ana/histossww_2016_0_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2016")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_30.root histoDatacard_long_wwsr_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(30, "done_ana/histossww_2017_0_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2017")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_30.root histoDatacard_long_wwsr_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(30, "done_ana/histossww_2018_0_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2018")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_30.root histoDatacard_long_wwsr_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(30, "done_ana/histossww_2019_0_fiducial5.root", "comb/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_30.root histoDatacard_long_wwsr_2019.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;
rm -f studyFitResults*.txt;
rm -f histoDatacard_*.root

echo "***************LONG BTAG CR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(31, "done_ana/histossww_2016_1_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2016")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_31.root histoDatacard_long_btag_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(31, "done_ana/histossww_2017_1_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2017")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_31.root histoDatacard_long_btag_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(31, "done_ana/histossww_2018_1_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2018")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_31.root histoDatacard_long_btag_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(31, "done_ana/histossww_2019_1_fiducial5.root", "comb/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_31.root histoDatacard_long_btag_2019.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;
rm -f studyFitResults*.txt;
rm -f histoDatacard_*.root

echo "***************LONG ZZ CR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(32, "done_ana/histossww_2016_2_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2016")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_32.root histoDatacard_long_zz_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(32, "done_ana/histossww_2017_2_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2017")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_32.root histoDatacard_long_zz_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(32, "done_ana/histossww_2018_2_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2018")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_32.root histoDatacard_long_zz_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(32, "done_ana/histossww_2019_2_fiducial5.root", "comb/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_32.root histoDatacard_long_zz_2019.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;
rm -f studyFitResults*.txt;

echo "***************LONG WZb CR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(33, "done_ana/histossww_2016_3_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2016")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_33.root histoDatacard_long_wzb_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(33, "done_ana/histossww_2017_3_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2017")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_33.root histoDatacard_long_wzb_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(33, "done_ana/histossww_2018_3_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2018")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_33.root histoDatacard_long_wzb_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(33, "done_ana/histossww_2019_3_fiducial5.root", "comb/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_33.root histoDatacard_long_wzb_2019.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;
rm -f studyFitResults*.txt;

echo "***************LONG WZ CR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(34, "done_ana/histossww_2016_77_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2016")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_34.root histoDatacard_long_wz_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(34, "done_ana/histossww_2017_77_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2017")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_34.root histoDatacard_long_wz_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(34, "done_ana/histossww_2018_77_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2018")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_34.root histoDatacard_long_wz_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(34, "done_ana/histossww_2019_77_fiducial5.root", "comb/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_34.root histoDatacard_long_wz_2019.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;
rm -f studyFitResults*.txt;


elif [ $NSEL == 'zh' ]; then
#grep -e POST -e background log|awk '{if($1=="POST"&&$3~"BSM")printf("%20s %6.1f pm %6.1f\n",$3,$16,$18);else if($1=="POST")printf("%20s %6.1f pm %6.1f\n",$3,$20,$22);else printf("\n%20s %6.1f pm %6.1f\n",$2,$10,$12);}'
echo "***************ZH SR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(21, "done_ana/histoZH_2016_0j_48.root", "ana_zh/fitDiagnosticszh_comb_obs.root", "ZH0_2016")';
mv studyFitResults.txt studyFitResults_0j_2016.txt;
mv histoDatacard_21.root histoDatacard_zh_0j_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(22, "done_ana/histoZH_2016_1j_50.root", "ana_zh/fitDiagnosticszh_comb_obs.root", "ZH1_2016")';
mv studyFitResults.txt studyFitResults_1j_2016.txt;
mv histoDatacard_22.root histoDatacard_zh_1j_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(21, "done_ana/histoZH_2017_0j_48.root", "ana_zh/fitDiagnosticszh_comb_obs.root", "ZH0_2017")';
mv studyFitResults.txt studyFitResults_0j_2017.txt;
mv histoDatacard_21.root histoDatacard_zh_0j_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(22, "done_ana/histoZH_2017_1j_50.root", "ana_zh/fitDiagnosticszh_comb_obs.root", "ZH1_2017")';
mv studyFitResults.txt studyFitResults_1j_2017.txt;
mv histoDatacard_22.root histoDatacard_zh_1j_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(21, "done_ana/histoZH_2018_0j_48.root", "ana_zh/fitDiagnosticszh_comb_obs.root", "ZH0_2018")';
mv studyFitResults.txt studyFitResults_0j_2018.txt;
mv histoDatacard_21.root histoDatacard_zh_0j_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(22, "done_ana/histoZH_2018_1j_50.root", "ana_zh/fitDiagnosticszh_comb_obs.root", "ZH1_2018")';
mv studyFitResults.txt studyFitResults_1j_2018.txt;
mv histoDatacard_22.root histoDatacard_zh_1j_2018.root

hadd -f histoDatacard_zh_0j_2019.root histoDatacard_zh_0j_201[6-8].root
hadd -f histoDatacard_zh_1j_2019.root histoDatacard_zh_1j_201[6-8].root
hadd -f histoDatacard_zh_nj_2019.root histoDatacard_zh_?j_201[6-8].root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;
rm -f studyFitResults*.txt;
rm -f histoDatacard_??.root
fi
