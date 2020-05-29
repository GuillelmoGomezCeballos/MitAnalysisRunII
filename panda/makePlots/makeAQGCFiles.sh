#!/bin/sh

export NSEL=$1;

if [ $# -lt 1 ]; then
   echo "TOO FEW PARAMETERS";
   exit;
fi

if [ $NSEL == 0 ]; then
cp done_ana/histossww_2016_134.root ana_ssww_frozen/ 
cp done_ana/histossww_2016_135.root ana_ssww_frozen/ 
cp done_ana/histossww_2016_136.root ana_ssww_frozen/ 
cp done_ana/histossww_2016_137.root ana_ssww_frozen/ 
cp done_ana/histossww_2016_138.root ana_ssww_frozen/ 
cp done_ana/histossww_2016_139.root ana_ssww_frozen/ 
cp done_ana/histossww_2017_134.root ana_ssww_frozen/ 
cp done_ana/histossww_2017_135.root ana_ssww_frozen/ 
cp done_ana/histossww_2017_136.root ana_ssww_frozen/ 
cp done_ana/histossww_2017_137.root ana_ssww_frozen/ 
cp done_ana/histossww_2017_138.root ana_ssww_frozen/ 
cp done_ana/histossww_2017_139.root ana_ssww_frozen/ 
cp done_ana/histossww_2018_134.root ana_ssww_frozen/ 
cp done_ana/histossww_2018_135.root ana_ssww_frozen/ 
cp done_ana/histossww_2018_136.root ana_ssww_frozen/ 
cp done_ana/histossww_2018_137.root ana_ssww_frozen/ 
cp done_ana/histossww_2018_138.root ana_ssww_frozen/ 
cp done_ana/histossww_2018_139.root ana_ssww_frozen/ 
hadd -f ana_ssww_frozen/histossww_2019_134.root ana_ssww_frozen/histossww_201[6-8]_134.root 
hadd -f ana_ssww_frozen/histossww_2019_135.root ana_ssww_frozen/histossww_201[6-8]_135.root 
hadd -f ana_ssww_frozen/histossww_2019_136.root ana_ssww_frozen/histossww_201[6-8]_136.root 
hadd -f ana_ssww_frozen/histossww_2019_137.root ana_ssww_frozen/histossww_201[6-8]_137.root 
hadd -f ana_ssww_frozen/histossww_2019_138.root ana_ssww_frozen/histossww_201[6-8]_138.root 
hadd -f ana_ssww_frozen/histossww_2019_139.root ana_ssww_frozen/histossww_201[6-8]_139.root 

elif [ $NSEL == 1 ]; then
mv histossww_2016_134.root histossww_2016_134_t2_2p9.root
mv histossww_2016_135.root histossww_2016_135_t2_2p9.root
mv histossww_2016_136.root histossww_2016_136_t2_2p9.root
mv histossww_2016_137.root histossww_2016_137_t2_2p9.root
mv histossww_2016_138.root histossww_2016_138_t2_2p9.root
mv histossww_2016_139.root histossww_2016_139_t2_2p9.root
mv histossww_2017_134.root histossww_2017_134_t2_2p9.root
mv histossww_2017_135.root histossww_2017_135_t2_2p9.root
mv histossww_2017_136.root histossww_2017_136_t2_2p9.root
mv histossww_2017_137.root histossww_2017_137_t2_2p9.root
mv histossww_2017_138.root histossww_2017_138_t2_2p9.root
mv histossww_2017_139.root histossww_2017_139_t2_2p9.root
mv histossww_2018_134.root histossww_2018_134_t2_2p9.root
mv histossww_2018_135.root histossww_2018_135_t2_2p9.root
mv histossww_2018_136.root histossww_2018_136_t2_2p9.root
mv histossww_2018_137.root histossww_2018_137_t2_2p9.root
mv histossww_2018_138.root histossww_2018_138_t2_2p9.root
mv histossww_2018_139.root histossww_2018_139_t2_2p9.root
hadd -f histossww_2019_134_t2_2p9.root histossww_201[6-8]_134_t2_2p9.root
hadd -f histossww_2019_135_t2_2p9.root histossww_201[6-8]_135_t2_2p9.root
hadd -f histossww_2019_136_t2_2p9.root histossww_201[6-8]_136_t2_2p9.root
hadd -f histossww_2019_137_t2_2p9.root histossww_201[6-8]_137_t2_2p9.root
hadd -f histossww_2019_138_t2_2p9.root histossww_201[6-8]_138_t2_2p9.root
hadd -f histossww_2019_139_t2_2p9.root histossww_201[6-8]_139_t2_2p9.root
mv *t2_2p9.root ana_ssww_frozen/

elif [ $NSEL == 2 ]; then
mv histossww_2016_134.root histossww_2016_134_s0_20.root
mv histossww_2016_135.root histossww_2016_135_s0_20.root
mv histossww_2016_136.root histossww_2016_136_s0_20.root
mv histossww_2016_137.root histossww_2016_137_s0_20.root
mv histossww_2016_138.root histossww_2016_138_s0_20.root
mv histossww_2016_139.root histossww_2016_139_s0_20.root
mv histossww_2017_134.root histossww_2017_134_s0_20.root
mv histossww_2017_135.root histossww_2017_135_s0_20.root
mv histossww_2017_136.root histossww_2017_136_s0_20.root
mv histossww_2017_137.root histossww_2017_137_s0_20.root
mv histossww_2017_138.root histossww_2017_138_s0_20.root
mv histossww_2017_139.root histossww_2017_139_s0_20.root
mv histossww_2018_134.root histossww_2018_134_s0_20.root
mv histossww_2018_135.root histossww_2018_135_s0_20.root
mv histossww_2018_136.root histossww_2018_136_s0_20.root
mv histossww_2018_137.root histossww_2018_137_s0_20.root
mv histossww_2018_138.root histossww_2018_138_s0_20.root
mv histossww_2018_139.root histossww_2018_139_s0_20.root
hadd -f histossww_2019_134_s0_20.root histossww_201[6-8]_134_s0_20.root
hadd -f histossww_2019_135_s0_20.root histossww_201[6-8]_135_s0_20.root
hadd -f histossww_2019_136_s0_20.root histossww_201[6-8]_136_s0_20.root
hadd -f histossww_2019_137_s0_20.root histossww_201[6-8]_137_s0_20.root
hadd -f histossww_2019_138_s0_20.root histossww_201[6-8]_138_s0_20.root
hadd -f histossww_2019_139_s0_20.root histossww_201[6-8]_139_s0_20.root
mv *s0_20.root ana_ssww_frozen/

elif [ $NSEL == 3 ]; then
hadd -f ana_ssww_frozen/histossww_2019_134_aqgc.root ana_ssww_frozen/histossww_2019_134.root ana_ssww_frozen/histossww_2019_134_t2_2p9.root
hadd -f ana_ssww_frozen/histossww_2019_135_aqgc.root ana_ssww_frozen/histossww_2019_135.root ana_ssww_frozen/histossww_2019_135_t2_2p9.root
hadd -f ana_ssww_frozen/histossww_2019_136_aqgc.root ana_ssww_frozen/histossww_2019_136.root ana_ssww_frozen/histossww_2019_136_t2_2p9.root
hadd -f ana_ssww_frozen/histossww_2019_137_aqgc.root ana_ssww_frozen/histossww_2019_137.root ana_ssww_frozen/histossww_2019_137_t2_2p9.root
hadd -f ana_ssww_frozen/histossww_2019_138_aqgc.root ana_ssww_frozen/histossww_2019_138.root ana_ssww_frozen/histossww_2019_138_t2_2p9.root
hadd -f ana_ssww_frozen/histossww_2019_139_aqgc.root ana_ssww_frozen/histossww_2019_139.root ana_ssww_frozen/histossww_2019_139_t2_2p9.root

fi
