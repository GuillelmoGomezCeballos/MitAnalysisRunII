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
#include "TLorentzVector.h"

#include "MitAnalysisRunII/panda/macros/80x/pandaFlat.C"
#include "MitAnalysisRunII/panda/macros/80x/common.h"

const int nTrgBinPt1  =  4; Float_t xTrgBinPt1[nTrgBinPt1+1]   = {25,30,35,50,10000};
const int nTrgBinPt2  =  4; Float_t xTrgBinPt2[nTrgBinPt2+1]   = {15,25,30,50,10000};
const int nTrgBinEta1 =  2; Float_t xTrgBinEta1[nTrgBinEta1+1] = {0.0,1.5,2.5};
const int nTrgBinEta2 =  2; Float_t xTrgBinEta2[nTrgBinEta2+1] = {0.0,1.5,2.5};
TH1D *hDTrgBinPt1  = new TH1D(Form("hDTrgBinPt1"),  Form("hDTrgBinPt1"),  nTrgBinPt1,  xTrgBinPt1);
TH1D *hDTrgBinPt2  = new TH1D(Form("hDTrgBinPt2"),  Form("hDTrgBinPt2"),  nTrgBinPt2,  xTrgBinPt2);
TH1D *hDTrgBinEta1 = new TH1D(Form("hDTrgBinEta1"), Form("hDTrgBinEta1"), nTrgBinEta1, xTrgBinEta1);
TH1D *hDTrgBinEta2 = new TH1D(Form("hDTrgBinEta2"), Form("hDTrgBinEta2"), nTrgBinEta2, xTrgBinEta2);

void triggerAnalysis(
int typeAna = 0,
int whichLepSel = 1
){

  //*******************************************************
  //Input Files
  //*******************************************************
  TString filesPathOld = "/data/t3home000/ceballos/panda/v_001_0/";
  TString filesPath    = "/data/t3home000/ceballos/panda/v_001_0/";
  vector<TString> infileName_;
  vector<int> infileCat_;

  if     (typeAna == 0 || typeAna == 1){
    infileName_.push_back(Form("%sMET.root",filesPath.Data()));		                   infileCat_.push_back(0);
  }

  if(typeAna == 0 || typeAna == 2){
    infileName_.push_back(Form("%sqqWW.root" ,filesPath.Data()));		           infileCat_.push_back(1);
    infileName_.push_back(Form("%sggWW.root" ,filesPath.Data()));		           infileCat_.push_back(1);
    infileName_.push_back(Form("%sTT2L.root" ,filesPath.Data()));		           infileCat_.push_back(1);
    infileName_.push_back(Form("%sTW.root" ,filesPath.Data()));		                   infileCat_.push_back(1);
    infileName_.push_back(Form("%sDYJetsToLL_M-10to50.root" ,filesPath.Data()));           infileCat_.push_back(1);
    infileName_.push_back(Form("%sDYJetsToLL_Pt0To50.root" ,filesPath.Data()));            infileCat_.push_back(1);
    infileName_.push_back(Form("%sDYJetsToLL_Pt100To250.root" ,filesPath.Data()));         infileCat_.push_back(1);
    infileName_.push_back(Form("%sDYJetsToLL_Pt250To400.root" ,filesPath.Data()));         infileCat_.push_back(1);
    infileName_.push_back(Form("%sDYJetsToLL_Pt400To650.root" ,filesPath.Data()));         infileCat_.push_back(1);
    infileName_.push_back(Form("%sDYJetsToLL_Pt50To100.root" ,filesPath.Data()));          infileCat_.push_back(1);
    infileName_.push_back(Form("%sDYJetsToLL_M-50_NLO.root",filesPath.Data()));            infileCat_.push_back(1);
  }

  TFile *fLepton_Eta_SF = TFile::Open(Form("MitAnalysisRunII/data/80x/scalefactors_80x_eta_sf_37ifb_period0.root"));
  TH1D* scalefactors_Muon_Eta = (TH1D*)fLepton_Eta_SF->Get("scalefactors_Muon_Eta"); scalefactors_Muon_Eta->SetDirectory(0);
  TH1D* scalefactors_Electron_Eta = (TH1D*)fLepton_Eta_SF->Get("scalefactors_Electron_Eta"); scalefactors_Electron_Eta->SetDirectory(0);
  fLepton_Eta_SF->Close();

  TFile *fLepton_SF_mu_central = TFile::Open(Form("MitAnalysisRunII/data/80x/scalefactors_80x_dylan_MediumIdOnly_period0.root"));
  TH2D* scalefactors_Medium_Muon = (TH2D*)fLepton_SF_mu_central->Get("scalefactors_Medium_Muon"); scalefactors_Medium_Muon->SetDirectory(0);
  fLepton_SF_mu_central->Close();

  TFile *fLepton_SF_el_central = TFile::Open(Form("MitAnalysisRunII/data/80x/scalefactors_80x_dylan_MediumIdOnly_period0.root"));
  TH2D* scalefactors_Medium_Electron = (TH2D*)fLepton_SF_el_central->Get("scalefactors_Medium_Electron"); scalefactors_Medium_Electron->SetDirectory(0);
  fLepton_SF_el_central->Close();

  double getMaxPtForSFs[2] = {scalefactors_Medium_Muon                  ->GetYaxis()->GetBinCenter(scalefactors_Medium_Muon		     ->GetNbinsY()),
                              scalefactors_Medium_Electron              ->GetYaxis()->GetBinCenter(scalefactors_Medium_Electron		     ->GetNbinsY())
		              };

  double trgEffDen[2][4][nTrgBinPt1][nTrgBinPt2][nTrgBinEta1][nTrgBinEta2];
  memset(trgEffDen, 0.0, 2 * 4 * nTrgBinPt1 * nTrgBinPt2 * nTrgBinEta1 * nTrgBinEta2 * sizeof(double));
  double trgEffNum[2][4][nTrgBinPt1][nTrgBinPt2][nTrgBinEta1][nTrgBinEta2];
  memset(trgEffNum, 0.0, 2 * 4 * nTrgBinPt1 * nTrgBinPt2 * nTrgBinEta1 * nTrgBinEta2 * sizeof(double));

  double xminPlot = 0.0;
  double xmaxPlot = 1.0;
  int nBinPlot = 200;
  const int allCategories = 2; // processes (data and MC)
  const int histBins = 4; // final states (mm, ee, me, em)
  const int allPlots = 12; // plots
  TH1D* histo[allCategories][histBins][allPlots];

  for(int thePlot=0; thePlot<allPlots; thePlot++){
    if     (thePlot >=  0 && thePlot <=  1) {nBinPlot = 60; xminPlot =-0.5; xmaxPlot = 59.5;}
    else if(thePlot >=  2 && thePlot <=  7) {nBinPlot = 200; xminPlot = 0.0; xmaxPlot = 400.0;}
    else if(thePlot >=  8 && thePlot <= 11) {nBinPlot =  20; xminPlot = -2.5; xmaxPlot = 2.5;}
    TH1D* histos = new TH1D("histos", "histos", nBinPlot, xminPlot, xmaxPlot);
    histos->Sumw2();
    for(int i=0; i<histBins; i++) {
      for(int j=0; j<allCategories; j++) {
        histo[j][i][thePlot] = (TH1D*) histos->Clone(Form("histo_%d_%d_%d",j,i,thePlot));
      }
    }
    histos->Clear();
  }

  //*******************************************************
  // Chain Loop
  //*******************************************************
  for(UInt_t ifile=0; ifile<infileName_.size(); ifile++) {
    printf("sampleNames(%d): %s\n",ifile,infileName_[ifile].Data());
    TFile *the_input_file = TFile::Open(infileName_[ifile].Data());
    TTree *the_input_tree = (TTree*)the_input_file->FindObjectAny("events");
    
    pandaFlat thePandaFlat(the_input_tree);
    Long64_t nentries = thePandaFlat.fChain->GetEntriesFast();
    Long64_t nbytes = 0, nb = 0;
    for (Long64_t jentry=0; jentry<nentries;jentry++) {
      Long64_t ientry = thePandaFlat.LoadTree(jentry);
      if (ientry < 0) break;
      nb = thePandaFlat.fChain->GetEntry(jentry);   nbytes += nb;
      if (jentry%1000000 == 0) printf("--- reading event %8lld (%8lld) of %8lld\n",jentry,ientry,nentries);

      if(thePandaFlat.nLooseLep != 2) continue;

      if(TMath::Abs(thePandaFlat.looseLep1Eta) >= 2.5 || TMath::Abs(thePandaFlat.looseLep2Eta) >= 2.5) continue;

      bool passLepId = false;
      if     (whichLepSel == 0) passLepId = ((thePandaFlat.looseLep1SelBit & kFake)   == kFake  ) && ((thePandaFlat.looseLep2SelBit & kFake  ) == kFake  );
      else if(whichLepSel == 1) passLepId = ((thePandaFlat.looseLep1SelBit & kMedium) == kMedium) && ((thePandaFlat.looseLep2SelBit & kMedium) == kMedium);
      if(passLepId == false) continue;

      int lepType = -1;
      if     (TMath::Abs(thePandaFlat.looseLep1PdgId)==13&&TMath::Abs(thePandaFlat.looseLep2PdgId)==13) {lepType = 0;}
      else if(TMath::Abs(thePandaFlat.looseLep1PdgId)==11&&TMath::Abs(thePandaFlat.looseLep2PdgId)==11) {lepType = 1;}
      else if(TMath::Abs(thePandaFlat.looseLep1PdgId)==13&&TMath::Abs(thePandaFlat.looseLep2PdgId)==11) {lepType = 2;}
      else if(TMath::Abs(thePandaFlat.looseLep1PdgId)==11&&TMath::Abs(thePandaFlat.looseLep2PdgId)==13) {lepType = 3;}
      else {assert(1); return;}

      double thePDGMass[2] = {mass_mu, mass_mu};
      if     (lepType == 1) {thePDGMass[0] = mass_el; thePDGMass[1] = mass_el;}
      else if(lepType == 2) {thePDGMass[1] = mass_el;}
      else if(lepType == 3) {thePDGMass[0] = mass_el; lepType = 2;}
      TLorentzVector vLoose1,vLoose2,metP4;
      vLoose1.SetPtEtaPhiM(thePandaFlat.looseLep1Pt,thePandaFlat.looseLep1Eta,thePandaFlat.looseLep1Phi,thePDGMass[0]);
      vLoose2.SetPtEtaPhiM(thePandaFlat.looseLep2Pt,thePandaFlat.looseLep2Eta,thePandaFlat.looseLep2Phi,thePDGMass[1]);
      TLorentzVector dilep = vLoose1+vLoose2;

      if(vLoose1.Pt() <= 25 || vLoose2.Pt() <= 15 || dilep.M() <= 12) continue;

      int npt1  = hDTrgBinPt1 ->GetXaxis()->FindFixBin(vLoose1.Pt())-1;
      int npt2  = hDTrgBinPt2 ->GetXaxis()->FindFixBin(vLoose2.Pt())-1;
      int neta1 = hDTrgBinEta1->GetXaxis()->FindFixBin(TMath::Abs(vLoose1.Eta()))-1;
      int neta2 = hDTrgBinEta2->GetXaxis()->FindFixBin(TMath::Abs(vLoose2.Eta()))-1;

      if(npt1 == -1 || npt2 == -1 || neta1 == -1 || neta2 == -1) printf("PROBLEM %d %d %d %d\n",npt1,npt2,neta1,neta2);

      int theCategory = infileCat_[ifile];
      double totalWeight = 1.0;
      if(theCategory != 0){

        double sfWeightLepEff[2] = {1.0, 1.0};
        if(abs(thePandaFlat.looseLep1PdgId)==13){
          double etal = thePandaFlat.looseLep1Eta; if(etal >= 2.4) etal = 2.3999; else if(etal <= -2.4) etal = -2.3999;
          int binXT   = scalefactors_Medium_Muon->GetXaxis()->FindFixBin(etal);
          int binYT_c = scalefactors_Medium_Muon->GetYaxis()->FindFixBin(TMath::Min((double)thePandaFlat.looseLep1Pt,getMaxPtForSFs[0]));
	  sfWeightLepEff[0]        = scalefactors_Medium_Muon                   ->GetBinContent(binXT,binYT_c);
        } else {
          double etal = thePandaFlat.looseLep1Eta; if(etal >= 2.4) etal = 2.3999; else if(etal <= -2.4) etal = -2.3999;
          int binXT   = scalefactors_Medium_Electron->GetXaxis()->FindFixBin(etal);
          int binYT_c = scalefactors_Medium_Electron->GetYaxis()->FindFixBin(TMath::Min((double)thePandaFlat.looseLep1Pt,getMaxPtForSFs[1]));
	  sfWeightLepEff[0]        = scalefactors_Medium_Electron                   ->GetBinContent(binXT,binYT_c);
        }
        if(abs(thePandaFlat.looseLep2PdgId)==13){
          double etal = thePandaFlat.looseLep2Eta; if(etal >= 2.4) etal = 2.3999; else if(etal <= -2.4) etal = -2.3999;
          int binXT   = scalefactors_Medium_Muon->GetXaxis()->FindFixBin(etal);
          int binYT_c = scalefactors_Medium_Muon->GetYaxis()->FindFixBin(TMath::Min((double)thePandaFlat.looseLep2Pt,getMaxPtForSFs[0]));
	  sfWeightLepEff[1]        = scalefactors_Medium_Muon                   ->GetBinContent(binXT,binYT_c);
        } else {
          double etal = thePandaFlat.looseLep2Eta; if(etal >= 2.4) etal = 2.3999; else if(etal <= -2.4) etal = -2.3999;
          int binXT   = scalefactors_Medium_Electron->GetXaxis()->FindFixBin(etal);
          int binYT_c = scalefactors_Medium_Electron->GetYaxis()->FindFixBin(TMath::Min((double)thePandaFlat.looseLep2Pt,getMaxPtForSFs[1]));
	  sfWeightLepEff[1]        = scalefactors_Medium_Electron                   ->GetBinContent(binXT,binYT_c);
        }

        double the_eta_sf[2] = {1.0, 1.0};
        if(abs(thePandaFlat.looseLep1PdgId)==13){
          double etal = thePandaFlat.looseLep1Eta; if(etal >= 2.4) etal = 2.3999; else if(etal <= -2.4) etal = -2.3999;
          int binEta = scalefactors_Muon_Eta->GetXaxis()->FindFixBin(etal);
          the_eta_sf[0] = scalefactors_Muon_Eta->GetBinContent(binEta);
        } else {
          double etal = thePandaFlat.looseLep1Eta; if(etal >= 2.4) etal = 2.3999; else if(etal <= -2.4) etal = -2.3999;
          int binEta = scalefactors_Electron_Eta->GetXaxis()->FindFixBin(etal);
          the_eta_sf[0] = scalefactors_Electron_Eta->GetBinContent(binEta);
        }        
        if(abs(thePandaFlat.looseLep2PdgId)==13){
          double etal = thePandaFlat.looseLep2Eta; if(etal >= 2.4) etal = 2.3999; else if(etal <= -2.4) etal = -2.3999;
          int binEta = scalefactors_Muon_Eta->GetXaxis()->FindFixBin(etal);
          the_eta_sf[1] = scalefactors_Muon_Eta->GetBinContent(binEta);
        } else {
          double etal = thePandaFlat.looseLep2Eta; if(etal >= 2.4) etal = 2.3999; else if(etal <= -2.4) etal = -2.3999;
          int binEta = scalefactors_Electron_Eta->GetXaxis()->FindFixBin(etal);
          the_eta_sf[1] = scalefactors_Electron_Eta->GetBinContent(binEta);
        }

        totalWeight = thePandaFlat.sf_pu *
		      the_eta_sf[0] * sfWeightLepEff[0] *
		      the_eta_sf[1] * sfWeightLepEff[1]
		      ;
      }

      trgEffDen[theCategory][lepType][npt1][npt2][neta1][neta2] = trgEffDen[theCategory][lepType][npt1][npt2][neta1][neta2] + totalWeight;
      histo[theCategory][lepType][ 0]->Fill(1.0,totalWeight);
      histo[theCategory][lepType][ 2]->Fill(TMath::Min(vLoose1.Pt(),399.999),totalWeight);
      histo[theCategory][lepType][ 4]->Fill(TMath::Min(vLoose2.Pt(),399.999),totalWeight);
      histo[theCategory][lepType][ 5]->Fill(TMath::Min(dilep.Pt(),399.999),totalWeight);
      histo[theCategory][lepType][ 8]->Fill(vLoose1.Eta(),totalWeight);
      histo[theCategory][lepType][10]->Fill(vLoose2.Eta(),totalWeight);

      bool passFilter = (thePandaFlat.trigger & kMuEGTrig) == kMuEGTrig || (thePandaFlat.trigger & kMuMuTrig) == kMuMuTrig ||
                        (thePandaFlat.trigger & kMuTrig)   == kMuTrig   || (thePandaFlat.trigger & kEGEGTrig) == kEGEGTrig ||
		        (thePandaFlat.trigger & kEGTrig)   == kEGTrig;

      if(passFilter){
        trgEffNum[theCategory][lepType][npt1][npt2][neta1][neta2] = trgEffNum[theCategory][lepType][npt1][npt2][neta1][neta2] + totalWeight;
        histo[theCategory][lepType][ 1]->Fill(1.0,totalWeight);
        histo[theCategory][lepType][ 3]->Fill(TMath::Min(vLoose1.Pt(),399.999),totalWeight);
        histo[theCategory][lepType][ 5]->Fill(TMath::Min(vLoose2.Pt(),399.999),totalWeight);
        histo[theCategory][lepType][ 7]->Fill(TMath::Min(dilep.Pt(),399.999),totalWeight);
        histo[theCategory][lepType][ 9]->Fill(vLoose1.Eta(),totalWeight);
        histo[theCategory][lepType][11]->Fill(vLoose2.Eta(),totalWeight);
      }
    } // end events loop
    the_input_file->Close();
  } // end chain loop

  double eff, unc;
  for(int ntypel=0; ntypel<4; ntypel++){
    for(int npt1=0; npt1<nTrgBinPt1; npt1++){
      for(int npt2=0; npt2<nTrgBinPt2; npt2++){
    	for(int neta1=0; neta1<nTrgBinEta1; neta1++){
    	  for(int neta2=0; neta2<nTrgBinEta2; neta2++){
            double eff0 = 1.0; double unc0 = 1.0;
            if(trgEffDen[0][ntypel][npt1][npt2][neta1][neta2] > 0) {
              eff0 = trgEffNum[0][ntypel][npt1][npt2][neta1][neta2]/
	             trgEffDen[0][ntypel][npt1][npt2][neta1][neta2];
              unc0 = sqrt(eff0*(1-eff0)/trgEffDen[0][ntypel][npt1][npt2][neta1][neta2])/5.0;
	      if(eff0 == 1) unc0 = 1./sqrt(trgEffDen[0][ntypel][npt1][npt2][neta1][neta2])/5.0;
            }
            double eff1 = 1.0; double unc1 = 1.0;
            if(trgEffDen[1][ntypel][npt1][npt2][neta1][neta2] > 0) {
              eff1 = trgEffNum[1][ntypel][npt1][npt2][neta1][neta2]/
	             trgEffDen[1][ntypel][npt1][npt2][neta1][neta2];
              unc1 = sqrt(eff1*(1-eff1)/trgEffDen[1][ntypel][npt1][npt2][neta1][neta2])/5.0;
	      if(eff1 == 1) unc1 = 1./sqrt(trgEffDen[1][ntypel][npt1][npt2][neta1][neta2])/5.0;
            }
	    if(trgEffDen[0][ntypel][npt1][npt2][neta1][neta2] > 0) {
    	      printf("trgEff[%d][%d][%d][%d][%d] = %8.5f +/- %8.5f;| %8.5f +/- %8.5f = %8.5f +/- %8.5f (%8.5f)\n",ntypel,npt1,npt2,neta1,neta2,eff0,unc0,eff1,unc1,eff0/eff1,unc0/eff1,eff0/eff1*sqrt(unc0/eff0*unc0/eff0+unc1/eff1*unc1/eff1));
	    }
    	  }
        }
      }
    }
  }

  char output[200];
  sprintf(output,"histo_trigger2016_histos_sel%d_ana%d.root",whichLepSel,typeAna);	
  TFile* outFilePlotsHistos = new TFile(output,"recreate");
  outFilePlotsHistos->cd();
  for(int thePlot=0; thePlot<allPlots; thePlot++){
    for(int i=0; i<histBins; i++) {
      for(int j=0; j<allCategories; j++) {
        histo[j][i][thePlot]->Write();
        //printf("aaa %d %d %d %f\n",j,i,thePlot,histo[j][i][thePlot]->GetSumOfWeights());
      }
    }
  }
  outFilePlotsHistos->Close();

  for(int thePlot=0; thePlot<allPlots/2; thePlot++){
    for(int theCat=0; theCat<allCategories; theCat++){
      for(int theType=0; theType<histBins; theType++){
        for(int i=1; i<=histo[theCat][theType][2*thePlot+1]->GetNbinsX(); i++){
	  eff = 1; unc = 1;
	  if(histo[theCat][theType][2*thePlot]->GetBinContent(i) > 0){
            eff = histo[theCat][theType][2*thePlot+1]->GetBinContent(i)/histo[theCat][theType][2*thePlot]->GetBinContent(i);
            unc =sqrt(eff*(1-eff)/histo[theCat][theType][2*thePlot]->GetBinContent(i));
	  }
	  histo[theCat][theType][2*thePlot+1]->SetBinContent(i,eff);
	  histo[theCat][theType][2*thePlot+1]->SetBinError(i,unc);
        }
      }
    }
  }

  sprintf(output,"histo_trigger2016_eff_sel%d_ana%d.root",whichLepSel,typeAna);	
  TFile* outFilePlotsEff = new TFile(output,"recreate");
  outFilePlotsEff->cd();
  for(int theCat=0; theCat<allCategories; theCat++){
    for(int theType=0; theType<histBins; theType++){
      histo[theCat][theType][ 1]->Write();
      histo[theCat][theType][ 3]->Write();
      histo[theCat][theType][ 5]->Write();
      histo[theCat][theType][ 7]->Write();
      histo[theCat][theType][ 9]->Write();
      histo[theCat][theType][11]->Write();
    }
  }
  outFilePlotsEff->Close();
}
