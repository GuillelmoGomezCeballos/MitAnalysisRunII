#!/bin/sh

#root -q -b -l MitAnalysisRunII/panda/makePlots/make2DPlots.C+'(2016,"pdf")';
#root -q -b -l MitAnalysisRunII/panda/makePlots/make2DPlots.C+'(2017,"pdf")';
#root -q -b -l MitAnalysisRunII/panda/makePlots/make2DPlots.C+'(2018,"pdf")';

#./MitAnalysisRunII/panda/makePlots/mergeHistograms.sh;

export NSEL=$1;

if [ $NSEL == 'zh' ]; then
./MitAnalysisRunII/panda/makePlots/makePlots.sh wz 1 2016;
./MitAnalysisRunII/panda/makePlots/makePlots.sh wz 1 2017;
./MitAnalysisRunII/panda/makePlots/makePlots.sh wz 1 2018;
./MitAnalysisRunII/panda/makePlots/makePlots.sh wz 1 2019;

./MitAnalysisRunII/panda/makePlots/makePlots.sh zz 1 2016;
./MitAnalysisRunII/panda/makePlots/makePlots.sh zz 1 2017;
./MitAnalysisRunII/panda/makePlots/makePlots.sh zz 1 2018;
./MitAnalysisRunII/panda/makePlots/makePlots.sh zz 1 2019;

./MitAnalysisRunII/panda/makePlots/makePlots.sh zh 1 2016;
./MitAnalysisRunII/panda/makePlots/makePlots.sh zh 1 2017;
./MitAnalysisRunII/panda/makePlots/makePlots.sh zh 1 2018;
./MitAnalysisRunII/panda/makePlots/makePlots.sh zh 1 2019;

./MitAnalysisRunII/panda/makePlots/makePlots.sh zhpaper 1 2016 0;

elif [ $NSEL == 'zhg' ]; then
./MitAnalysisRunII/panda/makePlots/makePlots.sh zhg 0 2016;
./MitAnalysisRunII/panda/makePlots/makePlots.sh zhg 0 2017;
./MitAnalysisRunII/panda/makePlots/makePlots.sh zhg 0 2018;
./MitAnalysisRunII/panda/makePlots/makePlots.sh zhg 0 2019;
./MitAnalysisRunII/panda/makePlots/makePlots.sh zhgpaper 0 2019;

elif [ $NSEL == 'ssww' ] || [ $NSEL == 'sswwll' ] || [ $NSEL == 'sswwlx' ] || [ $NSEL == 'higgs' ]; then
./MitAnalysisRunII/panda/makePlots/makePlots.sh $NSEL 1 2016 $2;
./MitAnalysisRunII/panda/makePlots/makePlots.sh $NSEL 1 2017 $2;
./MitAnalysisRunII/panda/makePlots/makePlots.sh $NSEL 1 2018 $2;
./MitAnalysisRunII/panda/makePlots/makePlots.sh $NSEL 1 2019 $2;

elif [ $NSEL == 'z' ]; then
./MitAnalysisRunII/panda/makePlots/makePlots.sh z 1 2016;
./MitAnalysisRunII/panda/makePlots/makePlots.sh z 1 2017;
./MitAnalysisRunII/panda/makePlots/makePlots.sh z 1 2018;

elif [ $NSEL == 'ww' ]; then
./MitAnalysisRunII/panda/makePlots/makePlots.sh ww 0 2016;
./MitAnalysisRunII/panda/makePlots/makePlots.sh ww 0 2017;
./MitAnalysisRunII/panda/makePlots/makePlots.sh ww 0 2018;

elif [ $NSEL == 'vbfg' ]; then
./MitAnalysisRunII/panda/makePlots/makePlots_vbfg.sh vbfg 1 2016 0 1
./MitAnalysisRunII/panda/makePlots/makePlots_vbfg.sh vbfg 1 2017 0 1
./MitAnalysisRunII/panda/makePlots/makePlots_vbfg.sh vbfg 1 2017 1 1
./MitAnalysisRunII/panda/makePlots/makePlots_vbfg.sh vbfg 1 2018 0 1
./MitAnalysisRunII/panda/makePlots/makePlots_vbfg.sh vbfg 1 2018 1 1
./MitAnalysisRunII/panda/makePlots/mergeHistograms.sh vbfg 125
./MitAnalysisRunII/panda/makePlots/makePlots_vbfg.sh vbfg 1 2019 2 1

fi
