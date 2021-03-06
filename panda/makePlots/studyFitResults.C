#include "TROOT.h"
#include "Math/ProbFuncMathCore.h"
#include "TInterpreter.h"
#include "TFile.h"
#include "TCanvas.h"
#include "TH1F.h"
#include "TStyle.h"
#include "TPad.h"
#include "Math/QuantFuncMathCore.h"
#include "TMath.h"
#include "TGraphAsymmErrors.h"
#include "TSystem.h"
#include "CMS_lumi.C"
#include "TRandom.h"
#include <fstream>
#include "MitAnalysisRunII/panda/macros/9x/common.h"

void studyFitResults(int nsel = 0,  TString plotName = "done_ana/histoZHG_mH125_2019_0001.root", TString mlfitResult = "comb/fitDiagnosticszhg_comb_125.root", TString channelName = "ZHG_2019_125") {

  TFile* file = new TFile(plotName, "read");  if(!file) {printf("File %s does not exist\n",plotName.Data()); return;}

  TH1F* _hist[nPlotCategories];
  TH1F* _histPostFit[nPlotCategories];
  TFile *mlfit=0;
  if(mlfitResult!="") {
    mlfit=TFile::Open(mlfitResult); assert(mlfit);
  }
  double SF_yieldB[nPlotCategories]; 
  double SF_yieldB_unc[nPlotCategories];
  double SF_yieldSB[nPlotCategories]; 
  double SF_yieldSB_unc[nPlotCategories];

  bool isAllBkgConsidered = false;
  int binToCount = -1;
  const int allExcludeBins = 60;
  int excludeBins[allExcludeBins];
  for(int i=0; i<allExcludeBins; i++) excludeBins[i] = -1;
  if     (nsel == 0){ // ZHG SR
    excludeBins[0] =  1;excludeBins[1] = 12;excludeBins[2] = 13;
    excludeBins[3] = 14;excludeBins[4] = 15;
  }
  else if(nsel == 1){ // ZHG EM CR
    for(int i=0; i<14; i++) excludeBins[i] = i+2;
  }
  else if(nsel == 2){ // ZHG WZ CR
    for(int i=0; i<11; i++) excludeBins[i] = i+1;
    excludeBins[12] = 14;excludeBins[13] = 15;
  }
  else if(nsel == 3){ // ZHG ZZ CR
    for(int i=0; i<13; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 4){ // ZHG SR low eta
    excludeBins[0] =  1;
    for(int i=6; i<15; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 5){ // ZHG SR high eta
    for(int i=0; i<6; i++) excludeBins[i] = i+1;
    for(int i=11; i<15; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 10){ // SSWW SR
    for(int i=32; i<52; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 11){ // btagged CR
    for(int i=0; i<32; i++) excludeBins[i] = i+1;
    for(int i=36; i<52; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 12){ // ZZ CR
    for(int i=0; i<36; i++) excludeBins[i] = i+1;
    for(int i=40; i<52; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 13){ // WZb CR
    for(int i=0; i<40; i++) excludeBins[i] = i+1;
    for(int i=44; i<52; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 14){ // WZ CR
    for(int i=0; i<44; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 15){ // all regions
  }
  else if(nsel == 21){ // ZH SR 0j
    for(int i=0; i<1; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 22){ // ZH SR 1 
    for(int i=0; i<1; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 30){ // long SR
    for(int i=25; i<41; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 31){ // long btagged CR
    for(int i=0; i<25; i++) excludeBins[i] = i+1;
    for(int i=29; i<41; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 32){ // long ZZ CR
    for(int i=0; i<29; i++) excludeBins[i] = i+1;
    for(int i=33; i<41; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 33){ // long WZb CR
    for(int i=0; i<33; i++) excludeBins[i] = i+1;
    for(int i=37; i<41; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 34){ // long WZ CR
    for(int i=0; i<37; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 35){ // long all regions
  }
  else if(nsel == 40){ // higgs WW SR
    for(int i=32; i<58; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 41){ // higgs WZ CR
    for(int i=0; i<32; i++) excludeBins[i] = i+1;
    for(int i=46; i<58; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 42){ // higgs btagged CR
    for(int i=0; i<46; i++) excludeBins[i] = i+1;
    for(int i=50; i<58; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 43){ // higgs WZb CR
    for(int i=0; i<50; i++) excludeBins[i] = i+1;
    for(int i=54; i<58; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 44){ // higgs ZZ SR
    for(int i=0; i<54; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 99){ // no region to exclude
  }
  printf("Bins to exclude:");
  for(int i=0; i<allExcludeBins; i++) if(excludeBins[i] != -1) printf(" %d",excludeBins[i]);
  printf("\n");

  double totalSum[4]    = {0.0, 0.0, 0.0, 0.0};
  double totalSysUnc[4] = {0.0, 0.0, 0.0, 0.0};
  double totalStaUnc[4] = {0.0, 0.0, 0.0, 0.0};

  char outputLimitsCard[200];  					  
  sprintf(outputLimitsCard,"studyFitResults.txt");
  ofstream newcardShape;
  newcardShape.open(outputLimitsCard);

  int isType = 0;
  if(plotName.Contains("fiducial6")) isType = 1;

  for(int ic=0; ic<nPlotCategories; ic++){
    _hist[ic] = (TH1F*)file->Get(Form("histo%d",ic));
    _histPostFit[ic] = (TH1F*)_hist[ic]->Clone(Form("histoPostFit%d",ic));
    if(!((TH1F*)mlfit->Get(Form("shapes_prefit/%s/%s",channelName.Data(),plotBaseNames[ic].Data())))) continue;
    if(ic == kPlotData || ((TH1F*)mlfit->Get(Form("shapes_prefit/%s/%s",channelName.Data(),plotBaseNames[ic].Data())))->GetSumOfWeights() <= 0) continue;
    if(mlfitResult!="" && ic != kPlotData) {
      double sum[6] = {0, 0, 0, 0, 0, 0};
      if     ((TH1F*)mlfit->Get(Form("shapes_prefit/%s/%s",channelName.Data(),plotBaseNames[ic].Data()))) {
        int countUsedBins = 0;
        for(int i=1; i<=((TH1F*)mlfit->Get(Form("shapes_fit_b/%s/%s",channelName.Data(),plotBaseNames[ic].Data())))->GetNbinsX(); i++){
	  bool binToExclude = false;
	  for(int nb=0; nb<allExcludeBins; nb++) if(i == excludeBins[nb]) binToExclude = true;
	  if(binToExclude == true) continue;
	  countUsedBins++;
	  if      (ic == kPlotBSM || (isType == 1 && ic == kPlotSignal1)){
	    _histPostFit[ic]->SetBinContent(countUsedBins,((TH1F*)mlfit->Get(Form("shapes_prefit/%s/%s",channelName.Data(),plotBaseNames[ic].Data())))->GetBinContent(i));
	    _histPostFit[ic]->SetBinError  (countUsedBins,((TH1F*)mlfit->Get(Form("shapes_prefit/%s/%s",channelName.Data(),plotBaseNames[ic].Data())))->GetBinError  (i));
	  }
	  else if((nsel >= 10 && nsel < 20) || (nsel >= 30 && nsel < 40)){
	    _histPostFit[ic]->SetBinContent(countUsedBins,((TH1F*)mlfit->Get(Form("shapes_fit_s/%s/%s",channelName.Data(),plotBaseNames[ic].Data())))->GetBinContent(i));
	    _histPostFit[ic]->SetBinError  (countUsedBins,((TH1F*)mlfit->Get(Form("shapes_fit_s/%s/%s",channelName.Data(),plotBaseNames[ic].Data())))->GetBinError  (i));
	  }
	  else {
	    _histPostFit[ic]->SetBinContent(countUsedBins,((TH1F*)mlfit->Get(Form("shapes_fit_b/%s/%s",channelName.Data(),plotBaseNames[ic].Data())))->GetBinContent(i));
	    _histPostFit[ic]->SetBinError  (countUsedBins,((TH1F*)mlfit->Get(Form("shapes_fit_b/%s/%s",channelName.Data(),plotBaseNames[ic].Data())))->GetBinError  (i));
	  }
	  sum[0] = sum[0] + ((TH1F*)mlfit->Get(Form("shapes_prefit/%s/%s",channelName.Data(),plotBaseNames[ic].Data())))->GetBinContent(i);
	  sum[1] = sum[1] + ((TH1F*)mlfit->Get(Form("shapes_prefit/%s/%s",channelName.Data(),plotBaseNames[ic].Data())))->GetBinError  (i);
          sum[2] = sum[2] + ((TH1F*)mlfit->Get(Form("shapes_fit_b/%s/%s", channelName.Data(),plotBaseNames[ic].Data())))->GetBinContent(i);
	  sum[3] = sum[3] + ((TH1F*)mlfit->Get(Form("shapes_fit_b/%s/%s", channelName.Data(),plotBaseNames[ic].Data())))->GetBinError  (i);
          sum[4] = sum[4] + ((TH1F*)mlfit->Get(Form("shapes_fit_s/%s/%s", channelName.Data(),plotBaseNames[ic].Data())))->GetBinContent(i);
	  sum[5] = sum[5] + ((TH1F*)mlfit->Get(Form("shapes_fit_s/%s/%s", channelName.Data(),plotBaseNames[ic].Data())))->GetBinError  (i);
          if(isAllBkgConsidered == true && ic != binToCount) continue; // Trick to go through just once
          isAllBkgConsidered = true; binToCount = ic;
	  totalSum[0]    = totalSum[0]    + ((TH1F*)mlfit->Get(Form("shapes_prefit/%s/total_background",channelName.Data())))->GetBinContent(i);
	  totalSysUnc[0] = totalSysUnc[0] + ((TH1F*)mlfit->Get(Form("shapes_prefit/%s/total_background",channelName.Data())))->GetBinError  (i);
          totalSum[1]    = totalSum[1]    + ((TH1F*)mlfit->Get(Form("shapes_fit_b/%s/total_background" ,channelName.Data())))->GetBinContent(i);
	  totalSysUnc[1] = totalSysUnc[1] + ((TH1F*)mlfit->Get(Form("shapes_fit_b/%s/total_background" ,channelName.Data())))->GetBinError  (i);
          totalSum[2]    = totalSum[2]    + ((TH1F*)mlfit->Get(Form("shapes_fit_s/%s/total_background" ,channelName.Data())))->GetBinContent(i);
	  totalSysUnc[2] = totalSysUnc[2] + ((TH1F*)mlfit->Get(Form("shapes_fit_s/%s/total_background" ,channelName.Data())))->GetBinError  (i);
          totalSum[3]    = totalSum[3]    + ((TH1F*)mlfit->Get(Form("shapes_fit_s/%s/total"            ,channelName.Data())))->GetBinContent(i);
	  totalSysUnc[3] = totalSysUnc[3] + ((TH1F*)mlfit->Get(Form("shapes_fit_s/%s/total"            ,channelName.Data())))->GetBinError  (i);
        }
        SF_yieldB[ic]      = sum[2] / sum[0];
        SF_yieldB_unc[ic]  = sum[3] / sum[2];
        SF_yieldSB[ic]     = sum[4] / sum[0];
        SF_yieldSB_unc[ic] = sum[5] / sum[2];
        printf("POST FIT SFs[%s]: SFB = %.3f +/- %.3f | SFSB = %.3f +/- %.3f | ",plotBaseNames[ic].Data(),SF_yieldB[ic],SF_yieldB_unc[ic],SF_yieldSB[ic],SF_yieldSB_unc[ic]);
        printf("%.3f +/- %.3f | %.3f +/- %.3f | %.3f +/- %.3f\n",sum[0],sum[1],sum[2],sum[3],sum[4],sum[5]);
      }
      newcardShape << Form("%s %f %f %f %f %f %f ",plotBaseNames[ic].Data(),sum[0],sum[1],sum[2],sum[3],sum[4],sum[5]);
      
    } // mltFit result
    double sum[6] = {0, 0, 0, 0, 0, 0};
    for(int i=1; i<=_hist[ic]->GetNbinsX(); i++){
      if(_hist[ic]->GetBinContent(i) <= 0) continue;
      sum[0] = sum[0] + _hist[ic]->GetBinContent(i);
      sum[1] = sum[1] + TMath::Power(_hist[ic]->GetBinError(i),2);
      sum[2] = sum[2] +  _hist[ic]->GetBinContent(i)*SF_yieldB[ic];
      sum[3] = sum[3] + TMath::Power(_hist[ic]->GetBinError(i)*SF_yieldB[ic],2);
      sum[4] = sum[4] +  _hist[ic]->GetBinContent(i)*SF_yieldSB[ic];
      sum[5] = sum[5] + TMath::Power(_hist[ic]->GetBinError(i)*SF_yieldSB[ic],2);
    }
    if(!(ic == kPlotBSM || (isType == 1 && ic == kPlotSignal1))) {
      totalStaUnc[0] = totalStaUnc[0] + sum[1];
      totalStaUnc[1] = totalStaUnc[1] + sum[3];
      totalStaUnc[2] = totalStaUnc[2] + sum[5];
      totalStaUnc[3] = totalStaUnc[3] + sum[5];
    }
    printf("Statistical[%s] (prefit/B/SB) = %.3f +/- %.3f | %.3f +/- %.3f | %.3f +/- %.3f\n",plotBaseNames[ic].Data(),sum[0],sqrt(sum[1]),sum[2],sqrt(sum[3]),sum[4],sqrt(sum[5]));
    newcardShape << Form("%f %f %f\n",sqrt(sum[1]),sqrt(sum[3]),sqrt(sum[5]));
  }
  printf("Total background (prefit/B/SB/all) = %.3f +/- %.3f (%.3f) | %.3f +/- %.3f (%.3f) | %.3f +/- %.3f (%.3f) | %.3f +/- %.3f (%.3f)\n",totalSum[0],totalSysUnc[0],sqrt(totalStaUnc[0]),totalSum[1],totalSysUnc[1],sqrt(totalStaUnc[1]),totalSum[2],totalSysUnc[2],sqrt(totalStaUnc[2]),totalSum[3],totalSysUnc[3],sqrt(totalStaUnc[3]));
  newcardShape << Form("Background %f %f %f %f %f %f %f %f %f\n",totalSum[0],totalSysUnc[0],sqrt(totalStaUnc[0]),totalSum[1],totalSysUnc[1],sqrt(totalStaUnc[1]),totalSum[2],totalSysUnc[2],sqrt(totalStaUnc[2]));
  newcardShape.close();
  char output[200];
  sprintf(output,"histoDatacard_%d.root",nsel);	
  TFile* outFilePlotsNote = new TFile(output,"recreate");
  outFilePlotsNote->cd();
  double totBck = 0;
  for(int i=1; i<nPlotCategories; i++) if(!(i == kPlotBSM || (isType == 1 && i == kPlotSignal1))) totBck = totBck + _histPostFit[i]->GetSumOfWeights();
  printf("(Datacard) %7.1f vs. %7.1f ",_histPostFit[0]->GetSumOfWeights(),totBck);
  printf("(");
  for(int i=1; i<nPlotCategories; i++) printf("%7.1f ",_histPostFit[i]->GetSumOfWeights());
  printf(")\n");
  if(nsel == 22) for(int np=0; np<nPlotCategories; np++) if(np != kPlotBSM && np != kPlotData) {_histPostFit[np]->SetBinContent(3,_histPostFit[np]->GetBinContent(3)*1.15);}
  if((nsel == 21 || nsel == 22) && plotName.Contains("2016")) for(int np=0; np<nPlotCategories; np++) if(np != kPlotBSM && np != kPlotData) {_histPostFit[np]->SetBinContent(2,_histPostFit[np]->GetBinContent(2)*1.09);}
  for(int np=0; np<nPlotCategories; np++) {_histPostFit[np]->SetNameTitle(Form("histo%d",np),Form("histo%d",np));_histPostFit[np]->Write();}
  outFilePlotsNote->Close();
}
