#include <TROOT.h>
#include <TFile.h>
#include <TTree.h>
#include <TSystem.h>
#include <TString.h>
#include <TH1D.h>
#include <TH2D.h>
#include <TMath.h>
#include <iostream>
#include <fstream>
#include "TRandom.h"
#include "TLorentzVector.h"

#include "MitAnalysisRunII/panda/macros/9x/pandaFlat.C"
#include "MitAnalysisRunII/panda/macros/9x/common.h"
#include "MitAnalysisRunII/panda/macros/9x/applyCorrections.h"

void skimmingWGstarAnalysis(int year, int specialMC = 0)
{

  vector<TString> infileName_;
  TString inpPath;
  TString outPath;
  if     (year == 2018){
    inpPath = "/data/t3home000/ceballos/panda/v_006_1/";
    outPath = "/data/t3home000/ceballos/panda/v_006_1/";
  }
  else if(year == 2017) {
    inpPath = "/data/t3home000/ceballos/panda/v_004_1/";
    outPath = "/data/t3home000/ceballos/panda/v_004_1/";
  }
  else if(year == 2016) {
    inpPath = "/data/t3home000/ceballos/panda/v_002_1/";
    outPath = "/data/t3home000/ceballos/panda/v_002_1/";
  }
  else {
    return;
  }

  if     (specialMC == 0){
    //infileName_.push_back(Form("WGstar"));
    infileName_.push_back(Form("WZ3l_powheg_mll1"));
    //infileName_.push_back(Form("WZ3l_powheg"));
    //infileName_.push_back(Form("WZ3l_amcnlo"));
    //infileName_.push_back(Form("WZ3l_MG_QCD"));
  }

  for(UInt_t ifile=0; ifile<infileName_.size(); ifile++) {
    printf("sampleNames(%d): %s\n",ifile,infileName_[ifile].Data());
    TFile *the_input_file = TFile::Open(Form("%s%s.root",inpPath.Data(),infileName_[ifile].Data()));
    if(!the_input_file) continue;
    TTree *the_input_tree = (TTree*)the_input_file->FindObjectAny("events");
    
    TFile *outputFile = new TFile(Form("%s%s_wgstar.root",outPath.Data(),infileName_[ifile].Data()), "RECREATE");
    outputFile->cd();
    outputFile->SaveSelf(kTRUE);
    TTree *normalizedTree = the_input_tree->CloneTree(0);

    UInt_t N_pass[1] = {0};
    pandaFlat thePandaFlat(the_input_tree);
    Long64_t nentries = thePandaFlat.fChain->GetEntriesFast();
    Long64_t nbytes = 0, nb = 0;
    for (Long64_t jentry=0; jentry<nentries;jentry++) {
      Long64_t ientry = thePandaFlat.LoadTree(jentry);
      if (ientry < 0) break;
      nb = thePandaFlat.fChain->GetEntry(jentry);   nbytes += nb;
      if (jentry%1000000 == 0) printf("--- reading event %8lld (%8lld) of %8lld\n",jentry,ientry,nentries);

      int skimFilter = -1;

      TLorentzVector vGen1,vGen2,vGen3;
      double thePDGMass;

      if(thePandaFlat.genLep1Pt > 0){
        thePDGMass = mass_mu;
        if(abs(thePandaFlat.genLep1PdgId)==11) thePDGMass = mass_el;
        vGen1.SetPtEtaPhiM(thePandaFlat.genLep1Pt,thePandaFlat.genLep1Eta,thePandaFlat.genLep1Phi,thePDGMass);
      }

      if(thePandaFlat.genLep2Pt > 0){
        thePDGMass = mass_mu;
        if(abs(thePandaFlat.genLep2PdgId)==11) thePDGMass = mass_el;
        vGen2.SetPtEtaPhiM(thePandaFlat.genLep2Pt,thePandaFlat.genLep2Eta,thePandaFlat.genLep2Phi,thePDGMass);
      }

      if(thePandaFlat.genLep3Pt > 0){
        thePDGMass = mass_mu;
        if(abs(thePandaFlat.genLep3PdgId)==11) thePDGMass = mass_el;
        vGen3.SetPtEtaPhiM(thePandaFlat.genLep3Pt,thePandaFlat.genLep3Eta,thePandaFlat.genLep3Phi,thePDGMass);
      }

      double MLLGen[3] = {999, 999, 999};
      if(thePandaFlat.genLep1Pt*thePandaFlat.genLep2Pt > 0 && thePandaFlat.genLep1PdgId/thePandaFlat.genLep2PdgId == -1) MLLGen[0] = (vGen1+vGen2).M();
      if(thePandaFlat.genLep1Pt*thePandaFlat.genLep3Pt > 0 && thePandaFlat.genLep1PdgId/thePandaFlat.genLep3PdgId == -1) MLLGen[1] = (vGen1+vGen3).M();
      if(thePandaFlat.genLep3Pt*thePandaFlat.genLep2Pt > 0 && thePandaFlat.genLep3PdgId/thePandaFlat.genLep2PdgId == -1) MLLGen[2] = (vGen3+vGen2).M();

       double MLLMinGen = MLLGen[0];
       if(MLLGen[1] < MLLMinGen) MLLMinGen = MLLGen[1];
       if(MLLGen[2] < MLLMinGen) MLLMinGen = MLLGen[2];
       if(MLLMinGen < 4) skimFilter = 0;

      if(skimFilter == -1) continue;

      N_pass[skimFilter]++;
      normalizedTree->Fill();
    } // end event loop
    normalizedTree->Write();
    outputFile->Close();
    printf("Filter efficiency: %.3f\n",(double)N_pass[0]/nentries);
  } // end samples loop
}
