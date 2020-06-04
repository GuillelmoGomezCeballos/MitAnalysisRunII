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
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(15, "done_ana/histossww_2016_140.root", "ana_ssww/fitDiagnosticsssww_2016_wwwz_obs.root", "ch1")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_15.root histoDatacard_ssww_all_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(15, "done_ana/histossww_2017_140.root", "ana_ssww/fitDiagnosticsssww_2017_wwwz_obs.root", "ch1")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_15.root histoDatacard_ssww_all_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(15, "done_ana/histossww_2018_140.root", "ana_ssww/fitDiagnosticsssww_2018_wwwz_obs.root", "ch1")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_15.root histoDatacard_ssww_all_2018.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(15, "done_ana/histossww_2019_140.root", "comb/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_15.root histoDatacard_ssww_all_2019.root

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

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(10, "done_ana/histossww_2019_0.root", "comb/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_10.root histoDatacard_ssww_wwsr_2019.root

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

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(11, "done_ana/histossww_2019_1.root", "comb/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_11.root histoDatacard_ssww_btag_2019.root

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

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(12, "done_ana/histossww_2019_2.root", "comb/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_12.root histoDatacard_ssww_zz_2019.root

rm -f studyFitResults*.txt;
rm -f histoDatacard_*.root

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

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(13, "done_ana/histossww_2019_3.root", "comb/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_13.root histoDatacard_ssww_wzb_2019.root

rm -f studyFitResults*.txt;
rm -f histoDatacard_*.root

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

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(14, "done_ana/histossww_2019_77.root", "comb/fitDiagnosticsssww_comb_wwwz_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_14.root histoDatacard_ssww_wz_2019.root

rm -f studyFitResults*.txt;
rm -f histoDatacard_*.root

elif [ $NSEL == 'long' ]; then
echo "***************LONG All*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(35, "done_ana/histossww_2016_153_fiducial5.root", "ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root", "SSWW_2016")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_35.root histoDatacard_long_all_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(35, "done_ana/histossww_2017_153_fiducial5.root", "ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root", "SSWW_2017")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_35.root histoDatacard_long_all_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(35, "done_ana/histossww_2018_153_fiducial5.root", "ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root", "SSWW_2018")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_35.root histoDatacard_long_all_2018.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(35, "done_ana/histossww_2019_153_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_35.root histoDatacard_long_all_2019.root

rm -f studyFitResults*.txt;
rm -f histoDatacard_*.root

echo "***************LONG WW SR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(30, "done_ana/histossww_2016_0_fiducial5.root", "ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root", "SSWW_2016")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_30.root histoDatacard_long_wwsr_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(30, "done_ana/histossww_2017_0_fiducial5.root", "ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root", "SSWW_2017")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_30.root histoDatacard_long_wwsr_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(30, "done_ana/histossww_2018_0_fiducial5.root", "ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root", "SSWW_2018")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_30.root histoDatacard_long_wwsr_2018.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(30, "done_ana/histossww_2019_0_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_30.root histoDatacard_long_wwsr_2019.root

rm -f studyFitResults*.txt;
rm -f histoDatacard_*.root

echo "***************LONG BTAG CR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(31, "done_ana/histossww_2016_1_fiducial5.root", "ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root", "SSWW_2016")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_31.root histoDatacard_long_btag_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(31, "done_ana/histossww_2017_1_fiducial5.root", "ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root", "SSWW_2017")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_31.root histoDatacard_long_btag_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(31, "done_ana/histossww_2018_1_fiducial5.root", "ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root", "SSWW_2018")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_31.root histoDatacard_long_btag_2018.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(31, "done_ana/histossww_2019_1_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_31.root histoDatacard_long_btag_2019.root

rm -f studyFitResults*.txt;
rm -f histoDatacard_*.root

echo "***************LONG ZZ CR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(32, "done_ana/histossww_2016_2_fiducial5.root", "ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root", "SSWW_2016")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_32.root histoDatacard_long_zz_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(32, "done_ana/histossww_2017_2_fiducial5.root", "ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root", "SSWW_2017")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_32.root histoDatacard_long_zz_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(32, "done_ana/histossww_2018_2_fiducial5.root", "ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root", "SSWW_2018")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_32.root histoDatacard_long_zz_2018.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(32, "done_ana/histossww_2019_2_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_32.root histoDatacard_long_zz_2019.root

rm -f studyFitResults*.txt;

echo "***************LONG WZb CR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(33, "done_ana/histossww_2016_3_fiducial5.root", "ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root", "SSWW_2016")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_33.root histoDatacard_long_wzb_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(33, "done_ana/histossww_2017_3_fiducial5.root", "ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root", "SSWW_2017")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_33.root histoDatacard_long_wzb_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(33, "done_ana/histossww_2018_3_fiducial5.root", "ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root", "SSWW_2018")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_33.root histoDatacard_long_wzb_2018.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(33, "done_ana/histossww_2019_3_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_33.root histoDatacard_long_wzb_2019.root

rm -f studyFitResults*.txt;

echo "***************LONG WZ CR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(34, "done_ana/histossww_2016_4_fiducial5.root", "ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root", "SSWW_2016")';
mv studyFitResults.txt studyFitResults_2016.txt;
mv histoDatacard_34.root histoDatacard_long_wz_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(34, "done_ana/histossww_2017_4_fiducial5.root", "ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root", "SSWW_2017")';
mv studyFitResults.txt studyFitResults_2017.txt;
mv histoDatacard_34.root histoDatacard_long_wz_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(34, "done_ana/histossww_2018_4_fiducial5.root", "ana_long/fitDiagnosticsssww_2019_fiducial5_obs.root", "SSWW_2018")';
mv studyFitResults.txt studyFitResults_2018.txt;
mv histoDatacard_34.root histoDatacard_long_wz_2018.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(34, "done_ana/histossww_2019_4_fiducial5.root", "ana_long/fitDiagnosticsssww_comb_fiducial5_obs.root", "SSWW_2019")';
mv studyFitResults.txt studyFitResults_2019.txt;
mv histoDatacard_34.root histoDatacard_long_wz_2019.root

rm -f studyFitResults*.txt;


elif [ $NSEL == 'zh' ]; then
#grep -e POST -e background log|awk '{if($1=="POST"&&$3~"BSM")printf("%20s %6.1f pm %6.1f\n",$3,$16,$18);else if($1=="POST")printf("%20s %6.1f pm %6.1f\n",$3,$20,$22);else printf("\n%20s %6.1f pm %6.1f\n",$2,$10,$12);}'
echo "***************ZH SR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(21, "done_ana/histoZH_2016_0j_48.root", "ana_zh/fitDiagnosticszh_comb_obs.root", "ZH0_2016")';
mv studyFitResults.txt studyFitResults_0j_2016.txt;
mv histoDatacard_21.root histoDatacard_zh_0j_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(21, "done_ana/histoZH_2017_0j_48.root", "ana_zh/fitDiagnosticszh_comb_obs.root", "ZH0_2017")';
mv studyFitResults.txt studyFitResults_0j_2017.txt;
mv histoDatacard_21.root histoDatacard_zh_0j_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(21, "done_ana/histoZH_2018_0j_48.root", "ana_zh/fitDiagnosticszh_comb_obs.root", "ZH0_2018")';
mv studyFitResults.txt studyFitResults_0j_2018.txt;
mv histoDatacard_21.root histoDatacard_zh_0j_2018.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;
rm -f studyFitResults*.txt;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(21, "done_ana/histoZH_2019_0j_48.root", "comb/fitDiagnosticszh_comb_obs.root", "ZH0_2019")';
mv studyFitResults.txt studyFitResults_0j_2019.txt;
mv histoDatacard_21.root histoDatacard_zh_0j_2019.root

rm -f studyFitResults*.txt;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(22, "done_ana/histoZH_2016_1j_48.root", "ana_zh/fitDiagnosticszh_comb_obs.root", "ZH1_2016")';
mv studyFitResults.txt studyFitResults_1j_2016.txt;
mv histoDatacard_22.root histoDatacard_zh_1j_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(22, "done_ana/histoZH_2017_1j_48.root", "ana_zh/fitDiagnosticszh_comb_obs.root", "ZH1_2017")';
mv studyFitResults.txt studyFitResults_1j_2017.txt;
mv histoDatacard_22.root histoDatacard_zh_1j_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(22, "done_ana/histoZH_2018_1j_48.root", "ana_zh/fitDiagnosticszh_comb_obs.root", "ZH1_2018")';
mv studyFitResults.txt studyFitResults_1j_2018.txt;
mv histoDatacard_22.root histoDatacard_zh_1j_2018.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;
rm -f studyFitResults*.txt;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(22, "done_ana/histoZH_2019_1j_48.root", "comb/fitDiagnosticszh_comb_obs.root", "ZH1_2019")';
mv studyFitResults.txt studyFitResults_1j_2019.txt;
mv histoDatacard_22.root histoDatacard_zh_1j_2019.root

rm -f studyFitResults*.txt;

hadd -f histoDatacard_zh_0j_2019_merge.root histoDatacard_zh_0j_201?.root 
hadd -f histoDatacard_zh_1j_2019_merge.root histoDatacard_zh_1j_201?.root 
hadd -f histoDatacard_zh_nj_2019_merge.root histoDatacard_zh_?j_201?.root 

hadd -f histoDatacard_zh_nj_2019.root histoDatacard_zh_[0,1]j_2019.root 

echo "***************WZ CR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(99, "done_ana/histoWZ_2016_81.root", "ana_zh/fitDiagnosticszh_comb_obs.root", "WZ_2016")';
mv studyFitResults.txt studyFitResults_wz_2016.txt;
mv histoDatacard_99.root histoDatacard_wz_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(99, "done_ana/histoWZ_2017_81.root", "ana_zh/fitDiagnosticszh_comb_obs.root", "WZ_2017")';
mv studyFitResults.txt studyFitResults_wz_2017.txt;
mv histoDatacard_99.root histoDatacard_wz_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(99, "done_ana/histoWZ_2018_81.root", "ana_zh/fitDiagnosticszh_comb_obs.root", "WZ_2018")';
mv studyFitResults.txt studyFitResults_wz_2018.txt;
mv histoDatacard_99.root histoDatacard_wz_2018.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;
rm -f studyFitResults*.txt;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(99, "done_ana/histoWZ_2019_81.root", "comb/fitDiagnosticszh_comb_obs.root", "WZ_2019")';
mv studyFitResults.txt studyFitResults_wz_2019.txt;
mv histoDatacard_99.root histoDatacard_wz_2019.root

rm -f studyFitResults*.txt;

hadd -f histoDatacard_wz_2019_merge.root histoDatacard_wz_201?.root 

echo "***************zz CR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(99, "done_ana/histoZZ_2016_70.root", "ana_zh/fitDiagnosticszh_comb_obs.root", "ZZ_2016")';
mv studyFitResults.txt studyFitResults_zz_2016.txt;
mv histoDatacard_99.root histoDatacard_zz_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(99, "done_ana/histoZZ_2017_70.root", "ana_zh/fitDiagnosticszh_comb_obs.root", "ZZ_2017")';
mv studyFitResults.txt studyFitResults_zz_2017.txt;
mv histoDatacard_99.root histoDatacard_zz_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(99, "done_ana/histoZZ_2018_70.root", "ana_zh/fitDiagnosticszh_comb_obs.root", "ZZ_2018")';
mv studyFitResults.txt studyFitResults_zz_2018.txt;
mv histoDatacard_99.root histoDatacard_zz_2018.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;
rm -f studyFitResults*.txt;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults.C+'(99, "done_ana/histoZZ_2019_70.root", "comb/fitDiagnosticszh_comb_obs.root", "ZZ_2019")';
mv studyFitResults.txt studyFitResults_zz_2019.txt;
mv histoDatacard_99.root histoDatacard_zz_2019.root

rm -f studyFitResults*.txt;

hadd -f histoDatacard_zz_2019_merge.root histoDatacard_zz_201?.root 

elif [ $NSEL == 'vbfg' ]; then
rm -f studyFitResults*.txt;
#grep -e POST -e background log|awk '{if($1=="POST"&&$3~"BSM")printf("%20s %6.1f pm %6.1f\n",$3,$16,$18);else if($1=="POST")printf("%20s %6.1f pm %6.1f\n",$3,$20,$22);else printf("\n%20s %6.1f pm %6.1f\n",$2,$10,$12);}'
echo "***************VBFG SR*****"
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(99, "done_vbfg/histoVBFG_2016_trigger0_mH125_117.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2016_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_trigger0_2016.txt;
mv histoDatacard_99.root histoDatacard_vbfg_trigger0_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(99, "done_vbfg/histoVBFG_2017_trigger0_mH125_117.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2017_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_trigger0_2017.txt;
mv histoDatacard_99.root histoDatacard_vbfg_trigger0_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(99, "done_vbfg/histoVBFG_2017_trigger1_mH125_117.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2017_trigger1")';
mv studyFitResults.txt studyFitResults_vbfg_trigger1_2017.txt;
mv histoDatacard_99.root histoDatacard_vbfg_trigger1_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(99, "done_vbfg/histoVBFG_2018_trigger0_mH125_117.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2018_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_trigger0_2018.txt;
mv histoDatacard_99.root histoDatacard_vbfg_trigger0_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(99, "done_vbfg/histoVBFG_2018_trigger1_mH125_117.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2018_trigger1")';
mv studyFitResults.txt studyFitResults_vbfg_trigger1_2018.txt;
mv histoDatacard_99.root histoDatacard_vbfg_trigger1_2018.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

hadd -f histoDatacard_vbfg_trigger0_2019.root histoDatacard_vbfg_trigger0_201[6-8].root
hadd -f histoDatacard_vbfg_trigger1_2019.root histoDatacard_vbfg_trigger1_201[6-8].root

rm -f studyFitResults*.txt;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(40, "done_vbfg/histoVBFG_2016_trigger0_mH125_0.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2016_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_sr_mtg_mjj0_trigger0_2016.txt;
mv histoDatacard_40.root histoDatacard_vbfg_sr_mtg_mjj0_trigger0_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(41, "done_vbfg/histoVBFG_2016_trigger0_mH125_5.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2016_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_sr_mtg_mjj1_trigger0_2016.txt;
mv histoDatacard_41.root histoDatacard_vbfg_sr_mtg_mjj1_trigger0_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(40, "done_vbfg/histoVBFG_2017_trigger0_mH125_0.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2017_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_sr_mtg_mjj0_trigger0_2017.txt;
mv histoDatacard_40.root histoDatacard_vbfg_sr_mtg_mjj0_trigger0_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(41, "done_vbfg/histoVBFG_2017_trigger0_mH125_5.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2017_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_sr_mtg_mjj1_trigger0_2017.txt;
mv histoDatacard_41.root histoDatacard_vbfg_sr_mtg_mjj1_trigger0_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(42, "done_vbfg/histoVBFG_2017_trigger1_mH125_0.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2017_trigger1")';
mv studyFitResults.txt studyFitResults_vbfg_sr_mtg_mjj0_trigger1_2017.txt;
mv histoDatacard_42.root histoDatacard_vbfg_sr_mtg_mjj0_trigger1_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(43, "done_vbfg/histoVBFG_2017_trigger1_mH125_5.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2017_trigger1")';
mv studyFitResults.txt studyFitResults_vbfg_sr_mtg_mjj1_trigger1_2017.txt;
mv histoDatacard_43.root histoDatacard_vbfg_sr_mtg_mjj1_trigger1_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(40, "done_vbfg/histoVBFG_2018_trigger0_mH125_0.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2018_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_sr_mtg_mjj0_trigger0_2018.txt;
mv histoDatacard_40.root histoDatacard_vbfg_sr_mtg_mjj0_trigger0_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(41, "done_vbfg/histoVBFG_2018_trigger0_mH125_5.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2018_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_sr_mtg_mjj1_trigger0_2018.txt;
mv histoDatacard_41.root histoDatacard_vbfg_sr_mtg_mjj1_trigger0_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(42, "done_vbfg/histoVBFG_2018_trigger1_mH125_0.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2018_trigger1")';
mv studyFitResults.txt studyFitResults_vbfg_sr_mtg_mjj0_trigger1_2018.txt;
mv histoDatacard_42.root histoDatacard_vbfg_sr_mtg_mjj0_trigger1_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(43, "done_vbfg/histoVBFG_2018_trigger1_mH125_5.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2018_trigger1")';
mv studyFitResults.txt studyFitResults_vbfg_sr_mtg_mjj1_trigger1_2018.txt;
mv histoDatacard_43.root histoDatacard_vbfg_sr_mtg_mjj1_trigger1_2018.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

hadd -f histoDatacard_vbfg_sr_mtg_trigger2_2019.root histoDatacard_vbfg_sr_mtg_mjj?_trigger?_201[6-8].root

rm -f studyFitResults*.txt;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(50, "done_vbfg/histoVBFG_2016_trigger0_mH125_110.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2016_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_wj_mtg_mjj0_trigger0_2016.txt;
mv histoDatacard_50.root histoDatacard_vbfg_wj_mtg_mjj0_trigger0_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(51, "done_vbfg/histoVBFG_2016_trigger0_mH125_111.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2016_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_wj_mtg_mjj1_trigger0_2016.txt;
mv histoDatacard_51.root histoDatacard_vbfg_wj_mtg_mjj1_trigger0_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(50, "done_vbfg/histoVBFG_2017_trigger0_mH125_110.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2017_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_wj_mtg_mjj0_trigger0_2017.txt;
mv histoDatacard_50.root histoDatacard_vbfg_wj_mtg_mjj0_trigger0_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(51, "done_vbfg/histoVBFG_2017_trigger0_mH125_111.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2017_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_wj_mtg_mjj1_trigger0_2017.txt;
mv histoDatacard_51.root histoDatacard_vbfg_wj_mtg_mjj1_trigger0_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(52, "done_vbfg/histoVBFG_2017_trigger1_mH125_110.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2017_trigger1")';
mv studyFitResults.txt studyFitResults_vbfg_wj_mtg_mjj0_trigger1_2017.txt;
mv histoDatacard_52.root histoDatacard_vbfg_wj_mtg_mjj0_trigger1_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(53, "done_vbfg/histoVBFG_2017_trigger1_mH125_111.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2017_trigger1")';
mv studyFitResults.txt studyFitResults_vbfg_wj_mtg_mjj1_trigger1_2017.txt;
mv histoDatacard_53.root histoDatacard_vbfg_wj_mtg_mjj1_trigger1_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(50, "done_vbfg/histoVBFG_2018_trigger0_mH125_110.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2018_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_wj_mtg_mjj0_trigger0_2018.txt;
mv histoDatacard_50.root histoDatacard_vbfg_wj_mtg_mjj0_trigger0_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(51, "done_vbfg/histoVBFG_2018_trigger0_mH125_111.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2018_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_wj_mtg_mjj1_trigger0_2018.txt;
mv histoDatacard_51.root histoDatacard_vbfg_wj_mtg_mjj1_trigger0_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(52, "done_vbfg/histoVBFG_2018_trigger1_mH125_110.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2018_trigger1")';
mv studyFitResults.txt studyFitResults_vbfg_wj_mtg_mjj0_trigger1_2018.txt;
mv histoDatacard_52.root histoDatacard_vbfg_wj_mtg_mjj0_trigger1_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(53, "done_vbfg/histoVBFG_2018_trigger1_mH125_111.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2018_trigger1")';
mv studyFitResults.txt studyFitResults_vbfg_wj_mtg_mjj1_trigger1_2018.txt;
mv histoDatacard_53.root histoDatacard_vbfg_wj_mtg_mjj1_trigger1_2018.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

hadd -f histoDatacard_vbfg_wj_mtg_trigger2_2019.root histoDatacard_vbfg_wj_mtg_mjj?_trigger?_201[6-8].root

rm -f studyFitResults*.txt;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(60, "done_vbfg/histoVBFG_2016_trigger0_mH125_112.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2016_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_wg_mtg_mjj0_trigger0_2016.txt;
mv histoDatacard_60.root histoDatacard_vbfg_wg_mtg_mjj0_trigger0_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(60, "done_vbfg/histoVBFG_2017_trigger0_mH125_112.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2017_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_wg_mtg_mjj0_trigger0_2017.txt;
mv histoDatacard_60.root histoDatacard_vbfg_wg_mtg_mjj0_trigger0_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(61, "done_vbfg/histoVBFG_2017_trigger1_mH125_112.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2017_trigger1")';
mv studyFitResults.txt studyFitResults_vbfg_wg_mtg_mjj0_trigger1_2017.txt;
mv histoDatacard_61.root histoDatacard_vbfg_wg_mtg_mjj0_trigger1_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(60, "done_vbfg/histoVBFG_2018_trigger0_mH125_112.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2018_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_wg_mtg_mjj0_trigger0_2018.txt;
mv histoDatacard_60.root histoDatacard_vbfg_wg_mtg_mjj0_trigger0_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(61, "done_vbfg/histoVBFG_2018_trigger1_mH125_112.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2018_trigger1")';
mv studyFitResults.txt studyFitResults_vbfg_wg_mtg_mjj0_trigger1_2018.txt;
mv histoDatacard_61.root histoDatacard_vbfg_wg_mtg_mjj0_trigger1_2018.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

hadd -f histoDatacard_vbfg_wg_mtg_trigger2_2019.root histoDatacard_vbfg_wg_mtg_mjj?_trigger0_201[6-8].root

rm -f studyFitResults*.txt;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(70, "done_vbfg/histoVBFG_2016_trigger0_mH125_113.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2016_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_gj_mtg_mjj0_trigger0_2016.txt;
mv histoDatacard_70.root histoDatacard_vbfg_gj_mtg_mjj0_trigger0_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(70, "done_vbfg/histoVBFG_2017_trigger0_mH125_113.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2017_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_gj_mtg_mjj0_trigger0_2017.txt;
mv histoDatacard_70.root histoDatacard_vbfg_gj_mtg_mjj0_trigger0_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(71, "done_vbfg/histoVBFG_2017_trigger1_mH125_113.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2017_trigger1")';
mv studyFitResults.txt studyFitResults_vbfg_gj_mtg_mjj0_trigger1_2017.txt;
mv histoDatacard_71.root histoDatacard_vbfg_gj_mtg_mjj0_trigger1_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(70, "done_vbfg/histoVBFG_2018_trigger0_mH125_113.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2018_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_gj_mtg_mjj0_trigger0_2018.txt;
mv histoDatacard_70.root histoDatacard_vbfg_gj_mtg_mjj0_trigger0_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(71, "done_vbfg/histoVBFG_2018_trigger1_mH125_113.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2018_trigger1")';
mv studyFitResults.txt studyFitResults_vbfg_gj_mtg_mjj0_trigger1_2018.txt;
mv histoDatacard_71.root histoDatacard_vbfg_gj_mtg_mjj0_trigger1_2018.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

hadd -f histoDatacard_vbfg_gj_mtg_trigger2_2019.root histoDatacard_vbfg_gj_mtg_mjj?_trigger0_201[6-8].root

rm -f studyFitResults*.txt;

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(80, "done_vbfg/histoVBFG_2016_trigger0_mH125_114.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2016_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_zg_mtg_mjj0_trigger0_2016.txt;
mv histoDatacard_80.root histoDatacard_vbfg_zg_mtg_mjj0_trigger0_2016.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(80, "done_vbfg/histoVBFG_2017_trigger0_mH125_114.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2017_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_zg_mtg_mjj0_trigger0_2017.txt;
mv histoDatacard_80.root histoDatacard_vbfg_zg_mtg_mjj0_trigger0_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(81, "done_vbfg/histoVBFG_2017_trigger1_mH125_114.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2017_trigger1")';
mv studyFitResults.txt studyFitResults_vbfg_zg_mtg_mjj0_trigger1_2017.txt;
mv histoDatacard_81.root histoDatacard_vbfg_zg_mtg_mjj0_trigger1_2017.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(80, "done_vbfg/histoVBFG_2018_trigger0_mH125_114.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2018_trigger0")';
mv studyFitResults.txt studyFitResults_vbfg_zg_mtg_mjj0_trigger0_2018.txt;
mv histoDatacard_80.root histoDatacard_vbfg_zg_mtg_mjj0_trigger0_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_vbfg.C+'(81, "done_vbfg/histoVBFG_2018_trigger1_mH125_114.root", "done_vbfg/fitDiagnosticsvbfg125_obs.root", "VBFG_2018_trigger1")';
mv studyFitResults.txt studyFitResults_vbfg_zg_mtg_mjj0_trigger1_2018.txt;
mv histoDatacard_81.root histoDatacard_vbfg_zg_mtg_mjj0_trigger1_2018.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

hadd -f histoDatacard_vbfg_zg_mtg_trigger2_2019.root histoDatacard_vbfg_zg_mtg_mjj0_trigger?_201[6-8].root

rm -f studyFitResults*.txt;

elif [ $NSEL == 'zhmt' ]; then

rm -f studyFitResults*.txt;

#grep -e POST -e background log|awk '{if($1=="POST"&&$3~"BSM")printf("%20s %6.1f pm %6.1f\n",$3,$16,$18);else if($1=="POST")printf("%20s %6.1f pm %6.1f\n",$3,$20,$22);else printf("\n%20s %6.1f pm %6.1f\n",$2,$10,$12);}'

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_mt.C+'(2, "ana_zh_frozen/fitDiagnostics2HDM_MT.root", "chBSM2016")';
mv studyFitResults.txt studyFitResults_zhmt_0jBSM_2016.txt;
mv histoDatacard_2.root histoDatacard_zhmt_0jBSM_2016.root
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_mt.C+'(2, "ana_zh_frozen/fitDiagnostics2HDM_MT.root", "chBSM2017")';
mv studyFitResults.txt studyFitResults_zhmt_0jBSM_2017.txt;
mv histoDatacard_2.root histoDatacard_zhmt_0jBSM_2017.root
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_mt.C+'(2, "ana_zh_frozen/fitDiagnostics2HDM_MT.root", "chBSM2018")';
mv studyFitResults.txt studyFitResults_zhmt_0jBSM_2018.txt;
mv histoDatacard_2.root histoDatacard_zhmt_0jBSM_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_mt.C+'(3, "ana_zh_frozen/fitDiagnostics2HDM_MT.root", "chBSM2016")';
mv studyFitResults.txt studyFitResults_zhmt_1jBSM_2016.txt;
mv histoDatacard_3.root histoDatacard_zhmt_1jBSM_2016.root
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_mt.C+'(3, "ana_zh_frozen/fitDiagnostics2HDM_MT.root", "chBSM2017")';
mv studyFitResults.txt studyFitResults_zhmt_1jBSM_2017.txt;
mv histoDatacard_3.root histoDatacard_zhmt_1jBSM_2017.root
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_mt.C+'(3, "ana_zh_frozen/fitDiagnostics2HDM_MT.root", "chBSM2018")';
mv studyFitResults.txt studyFitResults_zhmt_1jBSM_2018.txt;
mv histoDatacard_3.root histoDatacard_zhmt_1jBSM_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_mt.C+'(1, "ana_zh_frozen/fitDiagnostics2HDM_MT.root", "cat3L2016")';
mv studyFitResults.txt studyFitResults_zhmt_cat3L_2016.txt;
mv histoDatacard_1.root histoDatacard_zhmt_cat3L_2016.root
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_mt.C+'(1, "ana_zh_frozen/fitDiagnostics2HDM_MT.root", "cat3L2017")';
mv studyFitResults.txt studyFitResults_zhmt_cat3L_2017.txt;
mv histoDatacard_1.root histoDatacard_zhmt_cat3L_2017.root
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_mt.C+'(1, "ana_zh_frozen/fitDiagnostics2HDM_MT.root", "cat3L2018")';
mv studyFitResults.txt studyFitResults_zhmt_cat3L_2018.txt;
mv histoDatacard_1.root histoDatacard_zhmt_cat3L_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_mt.C+'(1, "ana_zh_frozen/fitDiagnostics2HDM_MT.root", "cat4L2016")';
mv studyFitResults.txt studyFitResults_zhmt_cat4L_2016.txt;
mv histoDatacard_1.root histoDatacard_zhmt_cat4L_2016.root
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_mt.C+'(1, "ana_zh_frozen/fitDiagnostics2HDM_MT.root", "cat4L2017")';
mv studyFitResults.txt studyFitResults_zhmt_cat4L_2017.txt;
mv histoDatacard_1.root histoDatacard_zhmt_cat4L_2017.root
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_mt.C+'(1, "ana_zh_frozen/fitDiagnostics2HDM_MT.root", "cat4L2018")';
mv studyFitResults.txt studyFitResults_zhmt_cat4L_2018.txt;
mv histoDatacard_1.root histoDatacard_zhmt_cat4L_2018.root

root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_mt.C+'(0, "ana_zh_frozen/fitDiagnostics2HDM_MT.root", "catEM2016")';
mv studyFitResults.txt studyFitResults_zhmt_catEM_2016.txt;
mv histoDatacard_0.root histoDatacard_zhmt_catEM_2016.root
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_mt.C+'(0, "ana_zh_frozen/fitDiagnostics2HDM_MT.root", "catEM2017")';
mv studyFitResults.txt studyFitResults_zhmt_catEM_2017.txt;
mv histoDatacard_0.root histoDatacard_zhmt_catEM_2017.root
root -l -q -b MitAnalysisRunII/panda/makePlots/studyFitResults_mt.C+'(0, "ana_zh_frozen/fitDiagnostics2HDM_MT.root", "catEM2018")';
mv studyFitResults.txt studyFitResults_zhmt_catEM_2018.txt;
mv histoDatacard_0.root histoDatacard_zhmt_catEM_2018.root

python MitAnalysisRunII/panda/makePlots/studyFitResults.py;

hadd -f histoDatacard_zhmt_0jBSM_2019.root histoDatacard_zhmt_0jBSM_201[6-8].root
hadd -f histoDatacard_zhmt_1jBSM_2019.root histoDatacard_zhmt_1jBSM_201[6-8].root
hadd -f histoDatacard_zhmt_cat3L_2019.root histoDatacard_zhmt_cat3L_201[6-8].root
hadd -f histoDatacard_zhmt_cat4L_2019.root histoDatacard_zhmt_cat4L_201[6-8].root
hadd -f histoDatacard_zhmt_catEM_2019.root histoDatacard_zhmt_catEM_201[6-8].root

rm -f studyFitResults*.txt;

fi
