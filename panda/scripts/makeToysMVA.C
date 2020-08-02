#include <iostream>
#include <vector>
#include "TROOT.h"
#include "TRandom.h"
#include "TFile.h"
#include "TF1.h"
#include "TH1D.h"

void makeToysMVA(int fidAna = 0){
  const int nBinOpt0 = 10; Float_t xbinsOpt0[nBinOpt0+1] = {0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0};
  const int nBinOpt1 = 10; Float_t xbinsOpt1[nBinOpt1+1] = {0,0.313,0.449,0.547,0.627,0.697,0.762,0.823,0.882,0.941,1.0};
  const int nBinOpt2 = 20; Float_t xbinsOpt2[nBinOpt2+1] = {0,0.05,0.10,0.15,0.20,0.25,0.30,0.35,0.40,0.45,0.50,0.55,0.60,0.65,0.70,0.75,0.80,0.85,0.90,0.95,1.0};
  const int nBinOpt3 = 20; Float_t xbinsOpt3[nBinOpt3+1] = {0,0.207,0.313,0.389,0.449,0.501,0.547,0.588,0.627,0.663,0.697,0.730,0.762,0.792,0.823,0.852,0.882,0.911,0.941,0.970,1.0};
  const int nBinOpt4 =  5; Float_t xbinsOpt4[nBinOpt4+1] = {0,0.2,0.4,0.6,0.8,1.0};
  const int nBinOpt5 =  5; Float_t xbinsOpt5[nBinOpt5+1] = {0,0.449,0.627,0.762,0.882,1.0};
  int nBinMVAAux = 0;
  if	 (fidAna == 0) nBinMVAAux = nBinOpt0;
  else if(fidAna == 1) nBinMVAAux = nBinOpt1;
  else if(fidAna == 2) nBinMVAAux = nBinOpt2;
  else if(fidAna == 3) nBinMVAAux = nBinOpt3;
  else if(fidAna == 4) nBinMVAAux = nBinOpt4;
  else if(fidAna == 5) nBinMVAAux = nBinOpt5;
  const int nBinMVA = nBinMVAAux; Float_t xbins[nBinMVA+1];
  if	 (fidAna == 0) for(int nb=0; nb<=nBinMVA; nb++) xbins[nb] = xbinsOpt0[nb];
  else if(fidAna == 1) for(int nb=0; nb<=nBinMVA; nb++) xbins[nb] = xbinsOpt1[nb];
  else if(fidAna == 2) for(int nb=0; nb<=nBinMVA; nb++) xbins[nb] = xbinsOpt2[nb];
  else if(fidAna == 3) for(int nb=0; nb<=nBinMVA; nb++) xbins[nb] = xbinsOpt3[nb];
  else if(fidAna == 4) for(int nb=0; nb<=nBinMVA; nb++) xbins[nb] = xbinsOpt4[nb];
  else if(fidAna == 5) for(int nb=0; nb<=nBinMVA; nb++) xbins[nb] = xbinsOpt5[nb];

  TH1D* histo_MVA = new TH1D("histo_MVA", "histo_MVA", nBinMVA, xbins);
  //TH1D* histo_MVA = new TH1D("histo_MVA", "histo_MVA", 1000, 0, 1);
  TH1D* histo_Data = (TH1D*)histo_MVA->Clone(Form("histo_Data"));
  TH1D* histo_Bck  = (TH1D*)histo_MVA->Clone(Form("histo_Bck"));
  TH1D* histo_Sig  = (TH1D*)histo_MVA->Clone(Form("histo_Sig"));

  double nSig = 30;
  double nBck = 100;

  gRandom->SetSeed(666); double nevt;
  for(int i=0; i<10000000; i++){
    nevt = -1;
    while(nevt <= 0 || nevt >= 1){
      nevt = gRandom->Landau(0.1,0.1);
    }
    histo_Bck->Fill(nevt);
    nevt = -1;
    while(nevt <= 0 || nevt >= 1){
      nevt = gRandom->Gaus(0.9,0.4);
    }
    histo_Sig->Fill(nevt);
  }
  histo_Bck->Scale(nBck/histo_Bck->GetSumOfWeights());
  histo_Sig->Scale(nSig/histo_Sig->GetSumOfWeights());

  histo_Data->Add(histo_Bck);
  histo_Data->Add(histo_Sig);

  histo_Bck->SetMinimum(0);

  histo_Bck->Draw();
  histo_Sig->Draw("hist,same");

  char outputLimits[200];
  sprintf(outputLimits,"mva_fidAna%d_input.root",fidAna);
  TFile* outFileLimits = new TFile(outputLimits,"recreate");
  outFileLimits->cd();
  histo_Data->Write();
  histo_Sig->Write();
  histo_Bck->Write();
  outFileLimits->Close();

  char outputLimitsCard[200];                                     
  sprintf(outputLimitsCard,"datacard_mva_%d.txt",fidAna);
  ofstream newcardShape;
  newcardShape.open(outputLimitsCard);
  newcardShape << Form("imax * number of channels\n");
  newcardShape << Form("jmax * number of background minus 1\n");
  newcardShape << Form("kmax * number of nuisance parameters\n");

  newcardShape << Form("shapes    *   *   %s  histo_$PROCESS histo_$PROCESS_$SYSTEMATIC\n",outputLimits);
  newcardShape << Form("shapes data_obs * %s  histo_Data\n",outputLimits);

  newcardShape << Form("Observation %f\n",histo_Data->GetSumOfWeights());

  newcardShape << Form("bin   ");
  newcardShape << Form("ch1  ");
  newcardShape << Form("ch1  ");
  newcardShape << Form("\n");
 
  newcardShape << Form("process  ");
    newcardShape << Form("Sig ");
    newcardShape << Form("Bck ");
  newcardShape << Form("\n");

  newcardShape << Form("process  ");
    newcardShape << Form("%d  ", 0);
    newcardShape << Form("%d  ", 1);
  newcardShape << Form("\n");
 
  newcardShape << Form("rate  ");
    newcardShape << Form("%f  ", histo_Sig->GetSumOfWeights());
    newcardShape << Form("%f  ", histo_Bck->GetSumOfWeights());
  newcardShape << Form("\n");

  newcardShape << Form("CMS_sig    lnN     ");
    newcardShape << Form("%6.3f ",1.05);
    newcardShape << Form("- ");
  newcardShape << Form("\n");

  newcardShape << Form("CMS_bck    lnN     ");
    newcardShape << Form("- ");
    newcardShape << Form("%6.3f ",1.20);
  newcardShape << Form("\n");

  newcardShape << Form("ch1 autoMCStats 0\n");

  newcardShape.close();
}
