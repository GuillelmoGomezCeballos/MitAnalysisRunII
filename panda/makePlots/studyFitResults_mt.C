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

enum cPlotCategory {
  cPlotData        , // 0
  cPlotWW          , // 1
  cPlotTop         , // 2
  cPlotDY          , // 3
  cPlotWZ          , // 4
  cPlotZZ          , // 5
  cPlotVVV         , // 6
  cPlotSignal      , // 7
  cPlotCategories
};

std::map<int, TString> cPlotBaseNames={
  { cPlotData	     , "data" },
  { cPlotWW	     , "WW" },
  { cPlotTop	     , "TOP" },
  { cPlotDY	     , "DY" },
  { cPlotWZ	     , "WZ" },
  { cPlotZZ	     , "ZZ" },
  { cPlotVVV	     , "VVV" },
  { cPlotSignal      , "Signal" },
}; 

std::map<int, int> cTokPlotBase={
  { kPlotData	     , cPlotData },
  { kPlotqqWW	     , cPlotWW },
  { kPlotEM	     , cPlotTop },
  { kPlotDY	     , cPlotDY },
  { kPlotWZ	     , cPlotWZ },
  { kPlotZZ	     , cPlotZZ },
  { kPlotVVV	     , cPlotVVV },
  { kPlotBSM         , cPlotSignal },
}; 

void studyFitResults_mt(int nsel = 0,  TString mlfitResult = "comb/fitDiagnostics2HDM_MT.root", TString channelName = "chBSM2016") {

  const int nBinMT0 = 11; Float_t xbinsMT0[nBinMT0+1] = {0,100,200,250,300,350,400,500,600,700,1000,2000};
  const int nBinMT1 = 10; Float_t xbinsMT1[nBinMT1+1] = {  100,200,250,300,350,400,500,600,700,1000,2000};

  int nBinMVAAux = 0;
  if     (nsel == 0) nBinMVAAux = nBinMT0;
  else if(nsel == 1) nBinMVAAux = nBinMT0;
  else if(nsel == 2) nBinMVAAux = nBinMT1;

  const int nBinMVA = nBinMVAAux; Float_t xbins[nBinMVA+1];
  if     (nsel == 0) for(int nb=0; nb<=nBinMVA; nb++) xbins[nb] = xbinsMT0[nb];
  else if(nsel == 1) for(int nb=0; nb<=nBinMVA; nb++) xbins[nb] = xbinsMT0[nb];
  else if(nsel == 2) for(int nb=0; nb<=nBinMVA; nb++) xbins[nb] = xbinsMT1[nb];
  

  TH1F* _histPostFit[nPlotCategories];
  for(int i=0; i<nPlotCategories; i++) _histPostFit[i] = new TH1F(Form("histoPostFit%d",i), Form("histoPostFit%d",i), nBinMVA, xbins);
  TH1F* _hist[nPlotCategories];
  for(int i=0; i<nPlotCategories; i++) _hist[i] = new TH1F(Form("histo%d",i), Form("histo%d",i), nBinMVA, xbins);

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
  if     (nsel == 0){ // 0j SR and EM CR
    for(int i=11; i<22; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 1){ // 1j SR
    for(int i=0; i<11; i++) excludeBins[i] = i+1;
  }
  else if(nsel == 2){ // CR
    for(int i=0; i<1; i++) excludeBins[i] = i+1;
    for(int i=11; i<22; i++) excludeBins[i] = i+1;
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

  TGraphAsymmErrors *graphData = (TGraphAsymmErrors*)mlfit->Get(Form("shapes_fit_b/%s/%s",channelName.Data(),cPlotBaseNames[cTokPlotBase[0]].Data()));
  int countUsedBins = 0;
  for(int i=0; i <graphData->GetN(); ++i) {
     bool binToExclude = false;
     for(int nb=0; nb<allExcludeBins; nb++) if(i == excludeBins[nb]-1) binToExclude = true;
     if(binToExclude == true) continue;
     countUsedBins++;
     double x,y;
     graphData->GetPoint(i, x, y);
     _hist[kPlotData]->SetBinContent(countUsedBins,y);
     _hist[kPlotData]->SetBinError(countUsedBins,TMath::Sqrt(TMath::Max(y,1.)));
     _histPostFit[kPlotData]->SetBinContent(countUsedBins,y);
     _histPostFit[kPlotData]->SetBinError(countUsedBins,TMath::Sqrt(TMath::Max(y,1.)));
  }

  for(int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData) continue;
    if(cPlotBaseNames[cTokPlotBase[ic]] == cPlotBaseNames[cTokPlotBase[0]]) continue;
    if(mlfitResult!="") {
      double sum[6] = {0, 0, 0, 0, 0, 0};
      if     ((TH1F*)mlfit->Get(Form("shapes_fit_b/%s/%s",channelName.Data(),cPlotBaseNames[cTokPlotBase[ic]].Data()))) {
        int countUsedBins = 0;
        for(int i=1; i<=((TH1F*)mlfit->Get(Form("shapes_fit_b/%s/%s",channelName.Data(),cPlotBaseNames[cTokPlotBase[ic]].Data())))->GetNbinsX(); i++){
	  bool binToExclude = false;
	  for(int nb=0; nb<allExcludeBins; nb++) if(i == excludeBins[nb]) binToExclude = true;
	  if(binToExclude == true) continue;
	  countUsedBins++;
	  _hist[ic]->SetBinContent(countUsedBins,((TH1F*)mlfit->Get(Form("shapes_prefit/%s/%s",channelName.Data(),cPlotBaseNames[cTokPlotBase[ic]].Data())))->GetBinContent(i));
	  _hist[ic]->SetBinError  (countUsedBins,((TH1F*)mlfit->Get(Form("shapes_prefit/%s/%s",channelName.Data(),cPlotBaseNames[cTokPlotBase[ic]].Data())))->GetBinError  (i));
	  if      (ic == kPlotBSM){
	    _histPostFit[ic]->SetBinContent(countUsedBins,((TH1F*)mlfit->Get(Form("shapes_prefit/%s/%s",channelName.Data(),cPlotBaseNames[cTokPlotBase[ic]].Data())))->GetBinContent(i));
	    _histPostFit[ic]->SetBinError  (countUsedBins,((TH1F*)mlfit->Get(Form("shapes_prefit/%s/%s",channelName.Data(),cPlotBaseNames[cTokPlotBase[ic]].Data())))->GetBinError  (i));
	  }
	  else if(nsel >= 10 && nsel < 20){
	    _histPostFit[ic]->SetBinContent(countUsedBins,((TH1F*)mlfit->Get(Form("shapes_fit_s/%s/%s",channelName.Data(),cPlotBaseNames[cTokPlotBase[ic]].Data())))->GetBinContent(i));
	    _histPostFit[ic]->SetBinError  (countUsedBins,((TH1F*)mlfit->Get(Form("shapes_fit_s/%s/%s",channelName.Data(),cPlotBaseNames[cTokPlotBase[ic]].Data())))->GetBinError  (i));
	  }
	  else {
	    _histPostFit[ic]->SetBinContent(countUsedBins,((TH1F*)mlfit->Get(Form("shapes_fit_b/%s/%s",channelName.Data(),cPlotBaseNames[cTokPlotBase[ic]].Data())))->GetBinContent(i));
	    _histPostFit[ic]->SetBinError  (countUsedBins,((TH1F*)mlfit->Get(Form("shapes_fit_b/%s/%s",channelName.Data(),cPlotBaseNames[cTokPlotBase[ic]].Data())))->GetBinError  (i));
	  }
	  sum[0] = sum[0] + ((TH1F*)mlfit->Get(Form("shapes_prefit/%s/%s",channelName.Data(),cPlotBaseNames[cTokPlotBase[ic]].Data())))->GetBinContent(i);
	  sum[1] = sum[1] + ((TH1F*)mlfit->Get(Form("shapes_prefit/%s/%s",channelName.Data(),cPlotBaseNames[cTokPlotBase[ic]].Data())))->GetBinError  (i);
          sum[2] = sum[2] + ((TH1F*)mlfit->Get(Form("shapes_fit_b/%s/%s", channelName.Data(),cPlotBaseNames[cTokPlotBase[ic]].Data())))->GetBinContent(i);
	  sum[3] = sum[3] + ((TH1F*)mlfit->Get(Form("shapes_fit_b/%s/%s", channelName.Data(),cPlotBaseNames[cTokPlotBase[ic]].Data())))->GetBinError  (i);
          sum[4] = sum[4] + ((TH1F*)mlfit->Get(Form("shapes_fit_s/%s/%s", channelName.Data(),cPlotBaseNames[cTokPlotBase[ic]].Data())))->GetBinContent(i);
	  sum[5] = sum[5] + ((TH1F*)mlfit->Get(Form("shapes_fit_s/%s/%s", channelName.Data(),cPlotBaseNames[cTokPlotBase[ic]].Data())))->GetBinError  (i);
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
        printf("POST FIT SFs[%s]: SFB = %.3f +/- %.3f | SFSB = %.3f +/- %.3f | ",cPlotBaseNames[cTokPlotBase[ic]].Data(),SF_yieldB[ic],SF_yieldB_unc[ic],SF_yieldSB[ic],SF_yieldSB_unc[ic]);
        printf("%.3f +/- %.3f | %.3f +/- %.3f | %.3f +/- %.3f\n",sum[0],sum[1],sum[2],sum[3],sum[4],sum[5]);
        newcardShape << Form("%s %f %f %f %f %f %f ",cPlotBaseNames[cTokPlotBase[ic]].Data(),sum[0],sum[1],sum[2],sum[3],sum[4],sum[5]);
      }
      
    } // mltFit result
    if(ic == kPlotData || _hist[ic]->GetSumOfWeights() <= 0) continue;
    double sum[6] = {0, 0, 0, 0, 0, 0};
    for(int i=1; i<=_hist[ic]->GetNbinsX(); i++){
      if(_hist[ic]->GetBinContent(i) <= 0) continue;
      sum[0] = sum[0] + _hist[ic]->GetBinContent(i);
      sum[1] = sum[1] + 0;
      sum[2] = sum[2] +  _hist[ic]->GetBinContent(i)*SF_yieldB[ic];
      sum[3] = sum[3] + 0;
      sum[4] = sum[4] +  _hist[ic]->GetBinContent(i)*SF_yieldSB[ic];
      sum[5] = sum[5] + 0;
    }
    if(ic != kPlotBSM) {
      totalStaUnc[0] = totalStaUnc[0] + sum[1];
      totalStaUnc[1] = totalStaUnc[1] + sum[3];
      totalStaUnc[2] = totalStaUnc[2] + sum[5];
      totalStaUnc[3] = totalStaUnc[3] + sum[5];
    }
    printf("Statistical[%s] (prefit/B/SB) = %.3f +/- %.3f | %.3f +/- %.3f | %.3f +/- %.3f\n",cPlotBaseNames[cTokPlotBase[ic]].Data(),sum[0],sqrt(sum[1]),sum[2],sqrt(sum[3]),sum[4],sqrt(sum[5]));
    newcardShape << Form("%f %f %f\n",sqrt(sum[1]),sqrt(sum[3]),sqrt(sum[5]));
  }
  printf("Total background (prefit/B/SB/all) = %.3f +/- %.3f (%.3f) | %.3f +/- %.3f (%.3f) | %.3f +/- %.3f (%.3f) | %.3f +/- %.3f (%.3f)\n",totalSum[0],totalSysUnc[0],sqrt(totalStaUnc[0]),totalSum[1],totalSysUnc[1],sqrt(totalStaUnc[1]),totalSum[2],totalSysUnc[2],sqrt(totalStaUnc[2]),totalSum[3],totalSysUnc[3],sqrt(totalStaUnc[3]));
  newcardShape << Form("Background %f %f %f %f %f %f %f %f %f\n",totalSum[0],totalSysUnc[0],sqrt(totalStaUnc[0]),totalSum[1],totalSysUnc[1],sqrt(totalStaUnc[1]),totalSum[2],totalSysUnc[2],sqrt(totalStaUnc[2]));
  newcardShape.close();
  
  _histPostFit[kPlotEM]->Add(_histPostFit[kPlotqqWW]); _histPostFit[kPlotqqWW]->Scale(0);
  if(channelName.Contains("3L") || channelName.Contains("4L")) _histPostFit[kPlotBSM]->Scale(0);
  
  char output[200];
  sprintf(output,"histoDatacard_%d.root",nsel);	
  TFile* outFilePlotsNote = new TFile(output,"recreate");
  outFilePlotsNote->cd();
  double totBck = 0;
  for(int i=1; i<nPlotCategories; i++) if(i != kPlotBSM) totBck = totBck + _histPostFit[i]->GetSumOfWeights();
  printf("(Datacard) %7.1f vs. %7.1f ",_histPostFit[0]->GetSumOfWeights(),totBck);
  printf("(");
  for(int i=1; i<nPlotCategories; i++) printf("%7.1f ",_histPostFit[i]->GetSumOfWeights());
  printf(")\n");
  for(int np=0; np<nPlotCategories; np++) {_histPostFit[np]->SetNameTitle(Form("histo%d",np),Form("histo%d",np));_histPostFit[np]->Write();}
  outFilePlotsNote->Close();
}
