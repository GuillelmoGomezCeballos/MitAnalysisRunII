#include <TROOT.h>
#include <TFile.h>
#include <TTree.h>
#include <TSystem.h>
#include <TString.h>
#include <TRandom.h>
#include <TH1D.h>
#include <TH2D.h>
#include <TMath.h>
#include <iostream>
#include <fstream>
#include "TLorentzVector.h"

#include "MitAnalysisRunII/panda/macros/10x_g/pandaFlat.C"
#include "MitAnalysisRunII/panda/macros/10x_g/common.h"
#include "MitAnalysisRunII/panda/macros/9x/applyCorrections.h"

const int debug = 0;
const bool showSyst = true;
enum selType                     { VBFGSEL,   ESEL,   MGSEL,   GJSEL,   MMGSEL,   MSEL, nSelTypes};
TString selTypeName[nSelTypes]=  {"VBFGSEL", "ESEL", "MGSEL", "GJSEL", "MMGSEL", "MSEL"};
enum systType                     {JESUP=0, JESDOWN, nSystTypes};
TString systTypeName[nSystTypes]= {"JESUP","JESDOWN"};
const bool makeUseNorm = true;

const double pdfUncs[3] = {1.010, 1.019, 1.032}; // bkg, VBF, ggH

void vbfgAnalysis(
int year, int triggerCat, int mH = 125
){
  double ptMin = 0;
  if     (triggerCat == 0) ptMin = 80;
  else if(triggerCat == 1) ptMin = 200;
  else {printf("bad choice\n"); return;}

  if(year == 2016 && triggerCat == 1) return;

  int whichYear = -1;
  if     (year == 2016) {whichYear = Y2016;}
  else if(year == 2017) {whichYear = Y2017;}
  else if(year == 2018) {whichYear = Y2018;}
  else {printf("Wrong year (%d)!\n",year); return;}

  double mjjSplit = 1500;
  double mtgSplit0 =  90;
  double mtgSplit1 = 250;

  bool isHVBFGAna = false;
  if(mH==115) isHVBFGAna = true;
  if(isHVBFGAna == true){ // mjj and detajj
    printf("isHVBFGAna!\n");
    mjjSplit = 1500;
    mtgSplit0 = 4.5*100;
    mtgSplit1 = 499.99999;
  }

  //*******************************************************
  //Inputs
  //*******************************************************
  vector<TString> infileName_;
  vector<int> infileCat_;

  TString filesPath;
  TString fLepton_FakesName = Form("MitAnalysisRunII/data/90x/fakes/histoFakeEtaPt_%d.root",year);
  TString puPath = Form("MitAnalysisRunII/data/90x/pu/puWeights_90x_%d.root",year);
  TString puPathStd = Form("MitAnalysisRunII/data/90x/pu/puWeights_90x_%d.root",year);
  TString photonSFPath = Form("MitAnalysisRunII/data/90x/eff/photon_scalefactors_%d.root",year);
  TString elephoSFPathDef = Form("MitAnalysisRunII/data/90x/eff/histoDY0HighPtDefLGSF_%d.root",year);
  TString elephoSFPathAlt = Form("MitAnalysisRunII/data/90x/eff/histoDY0HighPtAltLGSF_%d.root",year);
  TString trgSFPath = Form("MitAnalysisRunII/data/10x_g/histoTriggerSFVBFG_%d.root",year);
  TString effSFPath = Form("MitAnalysisRunII/data/90x/eff/histoDY0EffSFStudy_%d.root",year);
  //TString npvPath = Form("MitAnalysisRunII/data/90x/pu/npvWeights_%d.root",year);
  if(year == 2018) {
    filesPath = Form("/local/bmaier/darkg/2018/vbfg_v_013_v21/");

    infileName_.push_back(Form("%sData.root" ,filesPath.Data()));                     infileCat_.push_back(kPlotData);
    infileName_.push_back(Form("%sData.root" ,filesPath.Data()));                     infileCat_.push_back(kPlotNonPrompt);

    infileName_.push_back(Form("%sDiboson_ww_CP5.root" ,filesPath.Data()));           infileCat_.push_back(kPlotVV);

    infileName_.push_back(Form("%sDiboson_wz_CP5.root" ,filesPath.Data()));           infileCat_.push_back(kPlotVV);

    infileName_.push_back(Form("%sDiboson_zz_CP5.root" ,filesPath.Data()));           infileCat_.push_back(kPlotVV);

    infileName_.push_back(Form("%sWJets_ht100to200_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_ht200to400_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_ht400to600_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_ht600to800_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_ht800to1200_CP5.root" ,filesPath.Data()));    infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_ht1200to2500_CP5.root" ,filesPath.Data()));   infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_ht2500toinf_CP5.root" ,filesPath.Data()));    infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_EWKWPlus.root" ,filesPath.Data()));           infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_EWKWMinus.root" ,filesPath.Data()));          infileCat_.push_back(kPlotWJ0);

    infileName_.push_back(Form("%sZJets_ht100to200_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_ht200to400_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_ht400to600_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_ht600to800_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_ht800to1200_CP5.root" ,filesPath.Data()));    infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_ht1200to2500_CP5.root" ,filesPath.Data()));   infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_ht2500toinf_CP5.root" ,filesPath.Data()));    infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_EWK.root" ,filesPath.Data()));                infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht100to200_CP5.root" ,filesPath.Data()));   infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht200to400_CP5.root" ,filesPath.Data()));   infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht400to600_CP5.root" ,filesPath.Data()));   infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht600to800_CP5.root" ,filesPath.Data()));   infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht800to1200_CP5.root" ,filesPath.Data()));  infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht1200to2500_CP5.root" ,filesPath.Data())); infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht2500toinf_CP5.root" ,filesPath.Data()));  infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_EWK.root" ,filesPath.Data()));              infileCat_.push_back(kPlotDY);

    infileName_.push_back(Form("%sTTbar_GJets_CP5.root" ,filesPath.Data()));          infileCat_.push_back(kPlotTop);
    infileName_.push_back(Form("%sSingleTop_tG_CP5.root" ,filesPath.Data()));         infileCat_.push_back(kPlotTop);

    infileName_.push_back(Form("%sWZG.root" ,filesPath.Data()));		      infileCat_.push_back(kPlotVVV);

    infileName_.push_back(Form("%sWGtoLNuG_nlo.root" ,filesPath.Data())); 	      infileCat_.push_back(kPlotWG);
    infileName_.push_back(Form("%sWGtoLNuG_lo_EWK_CP5.root" ,filesPath.Data()));      infileCat_.push_back(kPlotWG);

    infileName_.push_back(Form("%sZGToNuNuG_nlo_CP5.root" ,filesPath.Data())); 	      infileCat_.push_back(kPlotZG);
    infileName_.push_back(Form("%sZGTo2LG_nlo.root" ,filesPath.Data())); 	      infileCat_.push_back(kPlotZG);
    infileName_.push_back(Form("%sZGToNuNuG_lo_EWK_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotZG);
    infileName_.push_back(Form("%sZGTo2LG_lo_EWK_CP5.root" ,filesPath.Data()));       infileCat_.push_back(kPlotZG);

    //infileName_.push_back(Form("%sGJets_ht100to200_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotGJ0);
    infileName_.push_back(Form("%sGJets_ht200to400_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotGJ0);
    infileName_.push_back(Form("%sGJets_ht400to600_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotGJ0);
    infileName_.push_back(Form("%sGJets_ht600toinf_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotGJ0);

    if(mH == 120){
    infileName_.push_back(Form("%sDarkPhotonVBFHM%d.root" ,filesPath.Data(),125)); infileCat_.push_back(kPlotBSM);
    infileName_.push_back(Form("%sDarkPhotonggHM%d.root" ,filesPath.Data(),125));  infileCat_.push_back(kPlotSignal1);
    }
    else if(isHVBFGAna == false){
    infileName_.push_back(Form("%sDarkPhotonVBFHM%d.root" ,filesPath.Data(),mH)); infileCat_.push_back(kPlotBSM);
    }
    else {
    infileName_.push_back(Form("%sVBF_HinvG_125.root" ,filesPath.Data()));        infileCat_.push_back(kPlotBSM);
    }
  }
  else if(year == 2017) {
    filesPath = Form("/local/bmaier/darkg/2017/vbfg_v_012_v21/");

    infileName_.push_back(Form("%sData.root" ,filesPath.Data()));                     infileCat_.push_back(kPlotData);
    infileName_.push_back(Form("%sData.root" ,filesPath.Data()));                     infileCat_.push_back(kPlotNonPrompt);

    infileName_.push_back(Form("%sDiboson_ww_CP5.root" ,filesPath.Data()));           infileCat_.push_back(kPlotVV);

    infileName_.push_back(Form("%sDiboson_wz_CP5.root" ,filesPath.Data()));           infileCat_.push_back(kPlotVV);

    infileName_.push_back(Form("%sDiboson_zz_CP5.root" ,filesPath.Data()));           infileCat_.push_back(kPlotVV);

    infileName_.push_back(Form("%sWJets_ht100to200_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_ht200to400_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_ht400to600_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_ht600to800_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_ht800to1200_CP5.root" ,filesPath.Data()));    infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_ht1200to2500_CP5.root" ,filesPath.Data()));   infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_ht2500toinf_CP5.root" ,filesPath.Data()));    infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_EWKWPlus.root" ,filesPath.Data()));           infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_EWKWMinus.root" ,filesPath.Data()));          infileCat_.push_back(kPlotWJ0);

    infileName_.push_back(Form("%sZJets_ht100to200_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_ht200to400_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_ht400to600_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_ht600to800_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_ht800to1200_CP5.root" ,filesPath.Data()));    infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_ht1200to2500_CP5.root" ,filesPath.Data()));   infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_ht2500toinf_CP5.root" ,filesPath.Data()));    infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_EWK.root" ,filesPath.Data()));                infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht100to200_CP5.root" ,filesPath.Data()));   infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht200to400_CP5.root" ,filesPath.Data()));   infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht400to600_CP5.root" ,filesPath.Data()));   infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht600to800_CP5.root" ,filesPath.Data()));   infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht800to1200_CP5.root" ,filesPath.Data()));  infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht1200to2500_CP5.root" ,filesPath.Data())); infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht2500toinf_CP5.root" ,filesPath.Data()));  infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_EWK_CP5.root" ,filesPath.Data()));          infileCat_.push_back(kPlotDY);

    infileName_.push_back(Form("%sTTbar_GJets_CP5.root" ,filesPath.Data()));          infileCat_.push_back(kPlotTop);
    infileName_.push_back(Form("%sSingleTop_tG_CP5.root" ,filesPath.Data()));         infileCat_.push_back(kPlotTop);

    infileName_.push_back(Form("%sWZG.root" ,filesPath.Data()));		      infileCat_.push_back(kPlotVVV);

    infileName_.push_back(Form("%sWGtoLNuG_nlo.root" ,filesPath.Data())); 	      infileCat_.push_back(kPlotWG);
    infileName_.push_back(Form("%sWGtoLNuG_lo_EWK_CP5.root" ,filesPath.Data()));      infileCat_.push_back(kPlotWG);

    infileName_.push_back(Form("%sZGToNuNuG_nlo.root" ,filesPath.Data()));            infileCat_.push_back(kPlotZG);
    infileName_.push_back(Form("%sZGTo2LG_nlo.root" ,filesPath.Data())); 	      infileCat_.push_back(kPlotZG);
    infileName_.push_back(Form("%sZGToNuNuG_lo_EWK_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotZG);
    infileName_.push_back(Form("%sZGTo2LG_lo_EWK_CP5.root" ,filesPath.Data()));       infileCat_.push_back(kPlotZG);

    //infileName_.push_back(Form("%sGJets_ht100to200_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotGJ0);
    infileName_.push_back(Form("%sGJets_ht200to400_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotGJ0);
    infileName_.push_back(Form("%sGJets_ht400to600_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotGJ0);
    infileName_.push_back(Form("%sGJets_ht600toinf_CP5.root" ,filesPath.Data()));     infileCat_.push_back(kPlotGJ0);

    if(mH == 120){
    infileName_.push_back(Form("%sDarkPhotonVBFHM%d.root" ,filesPath.Data(),125)); infileCat_.push_back(kPlotBSM);
    infileName_.push_back(Form("%sDarkPhotonggHM%d.root" ,filesPath.Data(),125));  infileCat_.push_back(kPlotSignal1);
    }
    else if(isHVBFGAna == false){
    infileName_.push_back(Form("%sDarkPhotonVBFHM%d.root" ,filesPath.Data(),mH)); infileCat_.push_back(kPlotBSM);
    }
    else {
    infileName_.push_back(Form("%sVBF_HinvG_125.root" ,filesPath.Data()));        infileCat_.push_back(kPlotBSM);
    }
  }
  else if(year == 2016) {
    puPath = Form("MitAnalysisRunII/data/90x/pu/puWeights_90x_vbfg%d.root",year);
    filesPath = Form("/local/bmaier/darkg/2016/vbfg_v_009_v21/");

    infileName_.push_back(Form("%sData.root" ,filesPath.Data()));                 infileCat_.push_back(kPlotData);
    infileName_.push_back(Form("%sData.root" ,filesPath.Data()));                 infileCat_.push_back(kPlotNonPrompt);

    infileName_.push_back(Form("%sDiboson_ww.root" ,filesPath.Data()));           infileCat_.push_back(kPlotVV);

    infileName_.push_back(Form("%sDiboson_wz.root" ,filesPath.Data()));           infileCat_.push_back(kPlotVV);

    infileName_.push_back(Form("%sDiboson_zz.root" ,filesPath.Data()));           infileCat_.push_back(kPlotVV);

    infileName_.push_back(Form("%sWJets_ht100to200.root" ,filesPath.Data()));     infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_ht200to400.root" ,filesPath.Data()));     infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_ht400to600.root" ,filesPath.Data()));     infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_ht600to800.root" ,filesPath.Data()));     infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_ht800to1200.root" ,filesPath.Data()));    infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_ht1200to2500.root" ,filesPath.Data()));   infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_ht2500toinf.root" ,filesPath.Data()));    infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_EWKWPlus.root" ,filesPath.Data()));       infileCat_.push_back(kPlotWJ0);
    infileName_.push_back(Form("%sWJets_EWKWMinus.root" ,filesPath.Data()));      infileCat_.push_back(kPlotWJ0);

    infileName_.push_back(Form("%sZJets_ht100to200.root" ,filesPath.Data()));     infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_ht200to400.root" ,filesPath.Data()));     infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_ht400to600.root" ,filesPath.Data()));     infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_ht600to800.root" ,filesPath.Data()));     infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_ht800to1200.root" ,filesPath.Data()));    infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_ht1200to2500.root" ,filesPath.Data()));   infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_ht2500toinf.root" ,filesPath.Data()));    infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZJets_EWK.root" ,filesPath.Data()));            infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht100to200.root" ,filesPath.Data()));   infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht200to400.root" ,filesPath.Data()));   infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht400to600.root" ,filesPath.Data()));   infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht600to800.root" ,filesPath.Data()));   infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht800to1200.root" ,filesPath.Data()));  infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht1200to2500.root" ,filesPath.Data())); infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_ht2500toinf.root" ,filesPath.Data()));  infileCat_.push_back(kPlotDY);
    infileName_.push_back(Form("%sZtoNuNu_EWK.root" ,filesPath.Data()));          infileCat_.push_back(kPlotDY);

    infileName_.push_back(Form("%sTTbar_GJets.root" ,filesPath.Data()));          infileCat_.push_back(kPlotTop);
    infileName_.push_back(Form("%sSingleTop_tG.root" ,filesPath.Data()));         infileCat_.push_back(kPlotTop);

    infileName_.push_back(Form("%sWZG.root" ,filesPath.Data()));		  infileCat_.push_back(kPlotVVV);

    infileName_.push_back(Form("%sWGtoLNuG_nlo.root" ,filesPath.Data())); 	  infileCat_.push_back(kPlotWG);
    infileName_.push_back(Form("%sWGtoLNuG_lo_EWK.root" ,filesPath.Data())); 	  infileCat_.push_back(kPlotWG);

    infileName_.push_back(Form("%sZGToNuNuG_nlo.root" ,filesPath.Data()));        infileCat_.push_back(kPlotZG);
    infileName_.push_back(Form("%sZGTo2LG_nlo.root" ,filesPath.Data()));          infileCat_.push_back(kPlotZG);
    infileName_.push_back(Form("%sZGToNuNuG_lo_EWK.root" ,filesPath.Data()));     infileCat_.push_back(kPlotZG);
    infileName_.push_back(Form("%sZGTo2LG_lo_EWK.root" ,filesPath.Data()));       infileCat_.push_back(kPlotZG);

    //infileName_.push_back(Form("%sGJets_ht100to200.root" ,filesPath.Data()));     infileCat_.push_back(kPlotGJ0);
    infileName_.push_back(Form("%sGJets_ht200to400.root" ,filesPath.Data()));     infileCat_.push_back(kPlotGJ0);
    infileName_.push_back(Form("%sGJets_ht400to600.root" ,filesPath.Data()));     infileCat_.push_back(kPlotGJ0);
    infileName_.push_back(Form("%sGJets_ht600toinf.root" ,filesPath.Data()));     infileCat_.push_back(kPlotGJ0);

    if(mH == 120){
    infileName_.push_back(Form("%sDarkPhotonVBFHM%d.root" ,filesPath.Data(),125)); infileCat_.push_back(kPlotBSM);
    infileName_.push_back(Form("%sDarkPhotonggHM%d.root" ,filesPath.Data(),125));  infileCat_.push_back(kPlotSignal1);
    }
    else if(isHVBFGAna == false){
    infileName_.push_back(Form("%sDarkPhotonVBFHM%d.root" ,filesPath.Data(),mH)); infileCat_.push_back(kPlotBSM);
    }
    else {
    infileName_.push_back(Form("%sVBF_HinvG_125.root" ,filesPath.Data()));        infileCat_.push_back(kPlotBSM);
    }
  }
  else {
    return;
  }

  //infileName_.clear();infileCat_.clear();
  //infileName_.push_back(Form("%sDarkPhotonVBFHM%d.root" ,filesPath.Data(),mH));     infileCat_.push_back(kPlotBSM);
  //infileName_.push_back(Form("%sGJets_ht100to200.root" ,filesPath.Data()));   infileCat_.push_back(kPlotGJ0);
  //infileName_.push_back(Form("%sGJets_ht200to400.root" ,filesPath.Data()));   infileCat_.push_back(kPlotGJ0);
  //infileName_.push_back(Form("%sGJets_ht400to600.root" ,filesPath.Data()));   infileCat_.push_back(kPlotGJ0);
  //infileName_.push_back(Form("%sGJets_ht600toinf.root" ,filesPath.Data()));   infileCat_.push_back(kPlotGJ0);

  TFile *fLepton_Fakes = TFile::Open(fLepton_FakesName.Data());
  TH2D* histoFakeEffSelMediumEtaPt_m = (TH2D*)fLepton_Fakes->Get("histoFakeEffSelEtaPt_2_0"); histoFakeEffSelMediumEtaPt_m->SetDirectory(0);
  TH2D* histoFakeEffSelMediumEtaPt_e = (TH2D*)fLepton_Fakes->Get("histoFakeEffSelEtaPt_0_1"); histoFakeEffSelMediumEtaPt_e->SetDirectory(0);
  TH2D* histoFakeEffSelTightEtaPt_m  = (TH2D*)fLepton_Fakes->Get("histoFakeEffSelEtaPt_2_0"); histoFakeEffSelTightEtaPt_m ->SetDirectory(0);
  TH2D* histoFakeEffSelTightEtaPt_e  = (TH2D*)fLepton_Fakes->Get("histoFakeEffSelEtaPt_0_1"); histoFakeEffSelTightEtaPt_e ->SetDirectory(0);

  TFile *fLepton_Eff = TFile::Open(effSFPath.Data());
  TH2D* histoLepEffSelMediumEtaPt_m = (TH2D*)fLepton_Eff->Get("histoEffSFStudy_2_0"); histoLepEffSelMediumEtaPt_m->SetDirectory(0);
  TH2D* histoLepEffSelMediumEtaPt_e = (TH2D*)fLepton_Eff->Get("histoEffSFStudy_0_1"); histoLepEffSelMediumEtaPt_e->SetDirectory(0);
  TH2D* histoLepEffSelTightEtaPt_m  = (TH2D*)fLepton_Eff->Get("histoEffSFStudy_2_0"); histoLepEffSelTightEtaPt_m ->SetDirectory(0);   
  TH2D* histoLepEffSelTightEtaPt_e  = (TH2D*)fLepton_Eff->Get("histoEffSFStudy_0_1"); histoLepEffSelTightEtaPt_e ->SetDirectory(0);
  fLepton_Eff->Close();

  TFile *fPUFile = TFile::Open(Form("%s",puPath.Data()));
  TH1D *fhDPU     = (TH1D*)(fPUFile->Get("puWeights"));     assert(fhDPU);     fhDPU    ->SetDirectory(0);
  TH1D *fhDPUUp   = (TH1D*)(fPUFile->Get("puWeightsUp"));   assert(fhDPUUp);   fhDPUUp  ->SetDirectory(0);
  TH1D *fhDPUDown = (TH1D*)(fPUFile->Get("puWeightsDown")); assert(fhDPUDown); fhDPUDown->SetDirectory(0);
  delete fPUFile;

  TFile *fPUStdFile = TFile::Open(Form("%s",puPathStd.Data()));
  TH1D *fhDPUStd = (TH1D*)(fPUStdFile->Get("puWeights")); assert(fhDPUStd); fhDPUStd->SetDirectory(0);
  delete fPUStdFile;

  TFile *fPhotonSF = TFile::Open(photonSFPath.Data());
  TH2D *fhDPhotonSF       = (TH2D*)(fPhotonSF->Get("EGamma_SF2D")); assert(fhDPhotonSF); fhDPhotonSF->SetDirectory(0);
  TH2D *fhDElectronVetoSF = (TH2D*)(fPhotonSF->Get("Scaling_Factors_HasPix_R9 Inclusive")); assert(fhDElectronVetoSF); fhDElectronVetoSF->SetDirectory(0);
  delete fPhotonSF;

  TFile *fElePhoSFDef = TFile::Open(elephoSFPathDef.Data());
  TH2D *fhDElePhoSFDef = (TH2D*)(fElePhoSFDef->Get("histoLGSF")); assert(fhDElePhoSFDef); fhDElePhoSFDef->SetDirectory(0);
  delete fElePhoSFDef;

  TFile *fElePhoSFAlt = TFile::Open(elephoSFPathAlt.Data());
  TH2D *fhDElePhoSFAlt = (TH2D*)(fElePhoSFAlt->Get("histoLGSF")); assert(fhDElePhoSFAlt); fhDElePhoSFAlt->SetDirectory(0);
  delete fElePhoSFAlt;

  TFile *ftrgSF = TFile::Open(trgSFPath.Data());
  TH1D *trgSF = (TH1D*)(ftrgSF->Get("hDTrgSF_2")); assert(trgSF); trgSF->SetDirectory(0);
  delete ftrgSF;

  TFile *fTrg_effph_VBFG = TFile::Open("MitAnalysisRunII/data/90x/trigger_vbfg/trigger_efficiency_photon_ph75.root");
  TH1D *trg_VBFG_r9_eff  = (TH1D*)fTrg_effph_VBFG->Get("ph75r9iso/r9_pass"); trg_VBFG_r9_eff ->SetDirectory(0);
  TH1D *trg_VBFG_r9_base = (TH1D*)fTrg_effph_VBFG->Get("ph75r9iso/r9_base"); trg_VBFG_r9_base->SetDirectory(0);
  trg_VBFG_r9_eff->Divide(trg_VBFG_r9_base);
  TH1D *trg_VBFG_pth_eff  = (TH1D*)fTrg_effph_VBFG->Get("ph75r9iso/pt_pass"); trg_VBFG_pth_eff ->SetDirectory(0);
  TH1D *trg_VBFG_pth_base = (TH1D*)fTrg_effph_VBFG->Get("ph75r9iso/pt_base"); trg_VBFG_pth_base->SetDirectory(0);
  trg_VBFG_pth_eff->Divide(trg_VBFG_pth_base);
  fTrg_effph_VBFG->Close();

  TFile *fTrg_effjj_VBFG = TFile::Open("MitAnalysisRunII/data/90x/trigger_vbfg/trigger_efficiency_dijet_ph75.root");
  TH1D *trg_VBFG_mjj_eff  = (TH1D*)fTrg_effjj_VBFG->Get("vbf/mjj_pass"); trg_VBFG_mjj_eff ->SetDirectory(0);
  TH1D *trg_VBFG_mjj_base = (TH1D*)fTrg_effjj_VBFG->Get("vbf/mjj_base"); trg_VBFG_mjj_base->SetDirectory(0);
  trg_VBFG_mjj_eff->Divide(trg_VBFG_mjj_base);
  TH1D *trg_VBFG_detajj_eff  = (TH1D*)fTrg_effjj_VBFG->Get("vbf/dEtajj_pass"); trg_VBFG_detajj_eff ->SetDirectory(0);
  TH1D *trg_VBFG_detajj_base = (TH1D*)fTrg_effjj_VBFG->Get("vbf/dEtajj_base"); trg_VBFG_detajj_base->SetDirectory(0);
  trg_VBFG_detajj_eff->Divide(trg_VBFG_detajj_base);
  fTrg_effjj_VBFG->Close();

  // (mjj<=X/>=X) 0: SR , 1: passESEL, 2: passMGSEL, 3: passGJSel, 4: passMMGSEL
  const int nBinMVA1DHVBFG    = 3; Double_t xbins1DHVBFG[nBinMVA1DHVBFG+1]       = {0, mtgSplit0, mtgSplit1, 1000};
  const int nBinMVA1DTrigger0 = 6; Double_t xbins1DTrigger0[nBinMVA1DTrigger0+1] = {0,   30,   60,   mtgSplit0, 170, mtgSplit1, 1000};
  const int nBinMVA1DTrigger1 = 6; Double_t xbins1DTrigger1[nBinMVA1DTrigger1+1] = {0,   30,   60,   mtgSplit0, 170, mtgSplit1, 1000};

  const int nBinMVA1DAddHVBFG =  6; Double_t xbins1DAddHVBFG[nBinMVA1DAddHVBFG+1] = {1000,1000+mtgSplit0,1000+mtgSplit1,2000,3000,4000,5000};
  const int nBinMVA1DAddTrigger0 =  6; Double_t xbins1DAddTrigger0[nBinMVA1DAddTrigger0+1] = {1000,1000+mtgSplit0,1000+mtgSplit1,2000,3000,4000,5000};
  const int nBinMVA1DAddTrigger1 =  6; Double_t xbins1DAddTrigger1[nBinMVA1DAddTrigger1+1] = {1000,1000+mtgSplit0,1000+mtgSplit1,2000,3000,4000,5000};

  const int nBinMVACR = 3; Double_t xbinsMVACR[nBinMVACR+1] = {0,mtgSplit0,mtgSplit1,500}; // careful here 1000 --> 500

  int nBinMVA1DAux    = 0; Double_t xbins1DAux   [TMath::Max(TMath::Max(nBinMVA1DTrigger0,   nBinMVA1DTrigger1)   ,nBinMVA1DHVBFG)+1];
  int nBinMVA1DAddAux = 0; Double_t xbins1DAddAux[TMath::Max(TMath::Max(nBinMVA1DAddTrigger0,nBinMVA1DAddTrigger1),nBinMVA1DHVBFG)+1];
  if     (isHVBFGAna){
    nBinMVA1DAux = nBinMVA1DHVBFG;
    for(int i=0; i<=nBinMVA1DAux; i++) xbins1DAux[i] = xbins1DHVBFG[i];
    nBinMVA1DAddAux = nBinMVA1DAddHVBFG;
    for(int i=0; i<=nBinMVA1DAddAux; i++) xbins1DAddAux[i] = xbins1DAddHVBFG[i];
  }
  else if(triggerCat == 0){
    nBinMVA1DAux = nBinMVA1DTrigger0;
    for(int i=0; i<=nBinMVA1DAux; i++) xbins1DAux[i] = xbins1DTrigger0[i];
    nBinMVA1DAddAux = nBinMVA1DAddTrigger0;
    for(int i=0; i<=nBinMVA1DAddAux; i++) xbins1DAddAux[i] = xbins1DAddTrigger0[i];
  }
  else if(triggerCat == 1){
    nBinMVA1DAux = nBinMVA1DTrigger1;
    for(int i=0; i<=nBinMVA1DAux; i++) xbins1DAux[i] = xbins1DTrigger1[i];
    nBinMVA1DAddAux = nBinMVA1DAddTrigger1;
    for(int i=0; i<=nBinMVA1DAddAux; i++) xbins1DAddAux[i] = xbins1DAddTrigger1[i];
  }
  const int nBinMVA1D = nBinMVA1DAux; Double_t xbins1D[nBinMVA1D+1];
  for(int i=0; i<=nBinMVA1D; i++) xbins1D[i] = xbins1DAux[i];
  const int nBinMVA1DAdd = nBinMVA1DAddAux; Double_t xbins1DAdd[nBinMVA1DAdd+1];
  for(int i=0; i<=nBinMVA1DAdd; i++) xbins1DAdd[i] = xbins1DAddAux[i];

  const int nBinMVA = 2*nBinMVA1D+2*nBinMVA1DAdd; Double_t xbins[nBinMVA+1];
  for(int i=0; i<=nBinMVA1D;    i++) xbins[i+0*nBinMVA1D+0*nBinMVA1DAdd] = xbins1D   [i];
  for(int i=0; i<=nBinMVA1DAdd; i++) xbins[i+1*nBinMVA1D+0*nBinMVA1DAdd] = xbins1DAdd[i];
  for(int i=0; i<=nBinMVA1D;    i++) xbins[i+1*nBinMVA1D+1*nBinMVA1DAdd] = xbins1D   [i]+5000;
  for(int i=0; i<=nBinMVA1DAdd; i++) xbins[i+2*nBinMVA1D+1*nBinMVA1DAdd] = xbins1DAdd[i]+5000;
  xbins[nBinMVA] = 10000;
  for(int i=0; i<=nBinMVA; i++) printf("(%d,%.0f) ",i,xbins[i]); printf("\n");
  const int nBinMT1D = 6; Double_t xbinsMT1D[nBinMT1D+1] = {0,   30,   60,   mtgSplit0, 170, mtgSplit1, 500}; // careful here 1000 --> 500

  int nBinPlot      = 200;
  double xminPlot   = 0.0;
  double xmaxPlot   = 200.0;
  const int allPlots = 124;
  TH1D* histo[allPlots][nPlotCategories];
  for(int thePlot=0; thePlot<allPlots; thePlot++){
    bool is1DCard = false;
    bool is1DMT = false;
    int the1DFit = 0;
    if     ((thePlot >=   0 && thePlot <=   9) && mH != 115) {is1DMT = true;}
    else if((thePlot >=   0 && thePlot <=   9) && mH == 115) {is1DCard = true;}
    //if     (thePlot >=   0 && thePlot <=   9) {nBinPlot = 40;  xminPlot =  0.0; xmaxPlot = 1000;}
    else if(thePlot >=  10 && thePlot <=  14) {nBinPlot = 20;  xminPlot = 60.0; xmaxPlot = 460;}
    else if(thePlot >=  15 && thePlot <=  19) {nBinPlot = 4;   xminPlot =  1.5; xmaxPlot = 5.5;}
    else if(thePlot >=  20 && thePlot <=  24) {nBinPlot = 12;  xminPlot =  0.0; xmaxPlot = 3.0;}
    else if(thePlot >=  25 && thePlot <=  29) {nBinPlot = 10;  xminPlot =500.0; xmaxPlot = 3000;}
    else if(thePlot >=  30 && thePlot <=  34) {nBinPlot = 10;  xminPlot =  3.0; xmaxPlot = 8;}
    else if(thePlot >=  35 && thePlot <=  39) {nBinPlot = 10;  xminPlot =  0.0; xmaxPlot = 1.0;}
    else if(thePlot >=  40 && thePlot <=  44) {nBinPlot = 14;  xminPlot =  0.0; xmaxPlot = 210;}
    else if(thePlot >=  45 && thePlot <=  49) {nBinPlot = 9;   xminPlot = -0.5; xmaxPlot = 8.5;}
    else if(thePlot >=  50 && thePlot <=  54) {nBinPlot = 15;  xminPlot =  0.0; xmaxPlot = 1.5;}
    else if(thePlot >=  55 && thePlot <=  59) {nBinPlot = 14;  xminPlot = 80.0; xmaxPlot = 500.0;}
    else if(thePlot >=  60 && thePlot <=  64) {nBinPlot = 12;  xminPlot =  0.0; xmaxPlot = 3.0;}
    else if(thePlot >=  65 && thePlot <=  69) {nBinPlot = 20;  xminPlot =  0.0; xmaxPlot = 5.0;}
    else if(thePlot >=  70 && thePlot <=  79) {nBinPlot = 12;  xminPlot =  0.0; xmaxPlot = 3.0;}
    else if(thePlot >=  80 && thePlot <=  84) {nBinPlot = 12;  xminPlot =  0.0; xmaxPlot = 4.8;}
    else if(thePlot >=  85 && thePlot <=  89) {nBinPlot = 20;  xminPlot = 50.0; xmaxPlot = 450.0;}
    else if(thePlot >=  90 && thePlot <=  92) {nBinPlot = 80;  xminPlot = -0.5; xmaxPlot = 79.5;}
    else if(thePlot >=  93 && thePlot <=  94) {nBinPlot = 40; xminPlot = -TMath::Pi();  xmaxPlot = TMath::Pi();}
    else if(thePlot >=  95 && thePlot <=  99) {nBinPlot = 15;  xminPlot =  0.7; xmaxPlot = 1.0;}
    else if(thePlot >= 100 && thePlot <= 104) {nBinPlot = 20;  xminPlot =  0.0; xmaxPlot = 1.0;}
    else if(thePlot >= 105 && thePlot <= 109) {nBinPlot = 20;  xminPlot =  0.0; xmaxPlot = 1.0;}
    else if(thePlot >= 110 && thePlot <= 111) {the1DFit = 1;}
    else if(thePlot >= 112 && thePlot <= 112) {the1DFit = 2;}
    else if(thePlot >= 113 && thePlot <= 113) {the1DFit = 2;}
    else if(thePlot >= 114 && thePlot <= 114) {the1DFit = 2;}
    else if(thePlot >= 115 && thePlot <= 116) {the1DFit = 1;}
    else if(thePlot >= 117 && thePlot <= 119) {nBinPlot = 30; xminPlot = -TMath::Pi();  xmaxPlot = TMath::Pi();}
    else if(thePlot >= 120 && thePlot <= 121) {nBinPlot = 30; xminPlot = -4.5; xmaxPlot = 4.5;}
    else if(thePlot >= 122 && thePlot <= 122) {nBinPlot = 30; xminPlot = -1.5; xmaxPlot = 1.5;}
    if     (thePlot == allPlots-1) for(int i=0; i<nPlotCategories; i++) histo[thePlot][i] = new TH1D(Form("histo_%d_%d",thePlot,i), Form("histo_%d_%d",thePlot,i), nBinMVA, xbins);
    else if(is1DCard == true)      for(int i=0; i<nPlotCategories; i++) histo[thePlot][i] = new TH1D(Form("histo_%d_%d",thePlot,i), Form("histo_%d_%d",thePlot,i), nBinMVA1D, xbins1D);
    else if(is1DMT == true)        for(int i=0; i<nPlotCategories; i++) histo[thePlot][i] = new TH1D(Form("histo_%d_%d",thePlot,i), Form("histo_%d_%d",thePlot,i), nBinMT1D, xbinsMT1D);
    else if(the1DFit == 1)         for(int i=0; i<nPlotCategories; i++) histo[thePlot][i] = new TH1D(Form("histo_%d_%d",thePlot,i), Form("histo_%d_%d",thePlot,i), nBinMVACR, xbinsMVACR);
    else if(the1DFit == 2)         for(int i=0; i<nPlotCategories; i++) histo[thePlot][i] = new TH1D(Form("histo_%d_%d",thePlot,i), Form("histo_%d_%d",thePlot,i), 2, 500, 2500);
    else                           for(int i=0; i<nPlotCategories; i++) histo[thePlot][i] = new TH1D(Form("histo_%d_%d",thePlot,i), Form("histo_%d_%d",thePlot,i), nBinPlot, xminPlot, xmaxPlot);
  }

  TH1D* histoMTGMET0p75 = new TH1D(Form("histoMTGMET0p75"), Form("histoMTGMET0p75"), nBinMVA1D, xbins1D);
  TH1D* histoMTGMET0p50 = new TH1D(Form("histoMTGMET0p50"), Form("histoMTGMET0p50"), nBinMVA1D, xbins1D);
  TH1D* histoMTGMET0p25 = new TH1D(Form("histoMTGMET0p25"), Form("histoMTGMET0p25"), nBinMVA1D, xbins1D);
  TH1D* histoMTGMETFit  = new TH1D(Form("histoMTGMETFit"),  Form("histoMTGMETFit"),  5, 0, 100);
  TH1D* histoMTGMETMJJ[2][nPlotCategories];
  for(int thePlot=0; thePlot<2; thePlot++){
    for(int i=0; i<nPlotCategories; i++) histoMTGMETMJJ[thePlot][i] = new TH1D(Form("histoMTGMETMJJ_%d_%d",thePlot,i), Form("histoMTGMETMJJ_%d_%d",thePlot,i), 5, 0, 100);
  }

  TH1D* histo_MVA = new TH1D("histo_MVA", "histo_MVA", nBinMVA, xbins); histo_MVA->Sumw2();

  const int nJESTypes = 6;
  TH1D *histo_Baseline[nPlotCategories];
  TH1D *histo_QCDScaleBounding[nPlotCategories][6];
  TH1D *histo_QCDScaleUp[nPlotCategories];
  TH1D *histo_QCDScaleDown[nPlotCategories];
  TH1D *histo_PDFBoundingUp[nPlotCategories];
  TH1D *histo_PDFBoundingDown[nPlotCategories];
  TH1D *histo_LepEffMBoundingUp[nPlotCategories];
  TH1D *histo_LepEffMBoundingDown[nPlotCategories];
  TH1D *histo_LepEffEBoundingUp[nPlotCategories];
  TH1D *histo_LepEffEBoundingDown[nPlotCategories];
  TH1D *histo_ScaleMBoundingUp[nPlotCategories];
  TH1D *histo_ScaleMBoundingDown[nPlotCategories];
  TH1D *histo_ScaleEBoundingUp[nPlotCategories];
  TH1D *histo_ScaleEBoundingDown[nPlotCategories];
  TH1D *histo_ScaleGBoundingUp[nPlotCategories];
  TH1D *histo_ScaleGBoundingDown[nPlotCategories];
  TH1D *histo_PUBoundingUp[nPlotCategories];
  TH1D *histo_PUBoundingDown[nPlotCategories];
  TH1D *histo_JESBoundingUp[nJESTypes][nPlotCategories];
  TH1D *histo_JESBoundingDown[nJESTypes][nPlotCategories];
  TH1D *histo_PreFireBoundingUp[nPlotCategories];
  TH1D *histo_PreFireBoundingDown[nPlotCategories];
  TH1D *histo_TriggerDBoundingUp[nPlotCategories];
  TH1D *histo_TriggerDBoundingDown[nPlotCategories];
  TH1D *histo_TriggerABoundingUp[nPlotCategories];
  TH1D *histo_TriggerABoundingDown[nPlotCategories];
  TH1D *histo_PhoEffBoundingUp[nPlotCategories];
  TH1D *histo_PhoEffBoundingDown[nPlotCategories];
  TH1D *histo_PhoFakeBoundingUp[nPlotCategories];
  TH1D *histo_PhoFakeBoundingDown[nPlotCategories];
  TH1D *histo_ElToPhDefBoundingUp[nPlotCategories];
  TH1D *histo_ElToPhDefBoundingDown[nPlotCategories];
  TH1D *histo_ElToPhAltBoundingUp[nPlotCategories];
  TH1D *histo_ElToPhAltBoundingDown[nPlotCategories];
  
  for(unsigned ic=kPlotData; ic!=nPlotCategories; ic++) {
    for(int i=0; i<6; i++)  histo_QCDScaleBounding[ic][i] = (TH1D*)histo_MVA->Clone(Form("histo_%s_%d_QCDScaleBounding",plotBaseNames[ic].Data(),i));
    histo_Baseline              [ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s"                    , plotBaseNames[ic].Data()));
    histo_QCDScaleUp            [ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_QCDScale_%s_ACCEPTUp"         , plotBaseNames[ic].Data(), plotBaseNames[ic].Data()));
    histo_QCDScaleDown          [ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_QCDScale_%s_ACCEPTDown"       , plotBaseNames[ic].Data(), plotBaseNames[ic].Data()));
    histo_PDFBoundingUp 	[ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_PDFUp"              , plotBaseNames[ic].Data()));
    histo_PDFBoundingDown	[ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_PDFDown"            , plotBaseNames[ic].Data()));
    histo_LepEffMBoundingUp	[ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_eff_mUp"        , plotBaseNames[ic].Data()));
    histo_LepEffMBoundingDown	[ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_eff_mDown"      , plotBaseNames[ic].Data()));
    histo_LepEffEBoundingUp	[ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_eff_eUp"        , plotBaseNames[ic].Data()));
    histo_LepEffEBoundingDown	[ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_eff_eDown"      , plotBaseNames[ic].Data()));
    histo_ScaleMBoundingUp	[ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_scale_mUp"      , plotBaseNames[ic].Data()));
    histo_ScaleMBoundingDown	[ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_scale_mDown"    , plotBaseNames[ic].Data()));
    histo_ScaleEBoundingUp	[ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_scale_eUp"      , plotBaseNames[ic].Data()));
    histo_ScaleEBoundingDown	[ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_scale_eDown"    , plotBaseNames[ic].Data()));
    histo_ScaleGBoundingUp	[ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_scale_pUp"      , plotBaseNames[ic].Data()));
    histo_ScaleGBoundingDown	[ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_scale_pDown"    , plotBaseNames[ic].Data()));
    histo_PUBoundingUp		[ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_puUp"           , plotBaseNames[ic].Data()));
    histo_PUBoundingDown	[ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_puDown"         , plotBaseNames[ic].Data()));
    for(int nj=0; nj<nJESTypes; nj++){
    histo_JESBoundingUp      [nj][ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_jes_%d_%dUp"	   , plotBaseNames[ic].Data(),nj,year));
    histo_JESBoundingDown    [nj][ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_jes_%d_%dDown"  , plotBaseNames[ic].Data(),nj,year));
    }
    histo_PreFireBoundingUp    [ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_prefire_%dUp"   , plotBaseNames[ic].Data(),year));
    histo_PreFireBoundingDown  [ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_prefire_%dDown" , plotBaseNames[ic].Data(),year));
    histo_TriggerDBoundingUp   [ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_triggerD%d_%dUp"  , plotBaseNames[ic].Data(),triggerCat,year));
    histo_TriggerDBoundingDown [ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_triggerD%d_%dDown", plotBaseNames[ic].Data(),triggerCat,year));
    histo_TriggerABoundingUp   [ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_triggerA%d_%dUp"  , plotBaseNames[ic].Data(),triggerCat,year));
    histo_TriggerABoundingDown [ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_triggerA%d_%dDown", plotBaseNames[ic].Data(),triggerCat,year));
    histo_PhoEffBoundingUp     [ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_eff_photonUp"   , plotBaseNames[ic].Data()));
    histo_PhoEffBoundingDown   [ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_eff_photonDown" , plotBaseNames[ic].Data()));
    histo_PhoFakeBoundingUp    [ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_fake_photon_%dUp"  , plotBaseNames[ic].Data(),year));
    histo_PhoFakeBoundingDown  [ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_fake_photon_%dDown", plotBaseNames[ic].Data(),year));
    histo_ElToPhDefBoundingUp  [ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_fake_elDef_%dUp"  , plotBaseNames[ic].Data(),year));
    histo_ElToPhDefBoundingDown[ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_fake_elDef_%dDown", plotBaseNames[ic].Data(),year));
    histo_ElToPhAltBoundingUp  [ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_fake_elAlt_%dUp"  , plotBaseNames[ic].Data(),year));
    histo_ElToPhAltBoundingDown[ic] = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_fake_elAlt_%dDown", plotBaseNames[ic].Data(),year));
  }
  TH1D *histo_GJPhotonE0Up   = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_GJPhotonE0_%d_trigger%dUp"   , plotBaseNames[kPlotPhotonE0].Data(),year,triggerCat));
  TH1D *histo_GJPhotonE0Down = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_GJPhotonE0_%d_trigger%dDown" , plotBaseNames[kPlotPhotonE0].Data(),year,triggerCat));
  TH1D *histo_GJPhotonE1Up   = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_GJPhotonE1_%d_trigger%dUp"   , plotBaseNames[kPlotPhotonE1].Data(),year,triggerCat));
  TH1D *histo_GJPhotonE1Down = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_GJPhotonE1_%d_trigger%dDown" , plotBaseNames[kPlotPhotonE1].Data(),year,triggerCat));

  TH1D *histo_GJNorm0Up    = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_GJNorm0_%dUp"    , plotBaseNames[kPlotGJ0].Data(),year));
  TH1D *histo_GJNorm0Down  = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_GJNorm0_%dDown"  , plotBaseNames[kPlotGJ0].Data(),year));
  TH1D *histo_GJNorm1Up    = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_GJNorm1_%dUp"    , plotBaseNames[kPlotGJ0].Data(),year));
  TH1D *histo_GJNorm1Down  = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_GJNorm1_%dDown"  , plotBaseNames[kPlotGJ0].Data(),year));
  TH1D *histo_WJNorm00Up   = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_WJNorm00_%dUp"   , plotBaseNames[kPlotWJ0].Data(),year));
  TH1D *histo_WJNorm00Down = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_WJNorm00_%dDown" , plotBaseNames[kPlotWJ0].Data(),year));
  TH1D *histo_WJNorm01Up   = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_WJNorm01_%dUp"   , plotBaseNames[kPlotWJ0].Data(),year));
  TH1D *histo_WJNorm01Down = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_WJNorm01_%dDown" , plotBaseNames[kPlotWJ0].Data(),year));
  TH1D *histo_WJNorm02Up   = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_WJNorm02_%dUp"   , plotBaseNames[kPlotWJ0].Data(),year));
  TH1D *histo_WJNorm02Down = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_WJNorm02_%dDown" , plotBaseNames[kPlotWJ0].Data(),year));
  TH1D *histo_WJNorm10Up   = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_WJNorm10_%dUp"   , plotBaseNames[kPlotWJ0].Data(),year));
  TH1D *histo_WJNorm10Down = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_WJNorm10_%dDown" , plotBaseNames[kPlotWJ0].Data(),year));
  TH1D *histo_WJNorm11Up   = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_WJNorm11_%dUp"   , plotBaseNames[kPlotWJ0].Data(),year));
  TH1D *histo_WJNorm11Down = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_WJNorm11_%dDown" , plotBaseNames[kPlotWJ0].Data(),year));
  TH1D *histo_WJNorm12Up   = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_WJNorm12_%dUp"   , plotBaseNames[kPlotWJ0].Data(),year));
  TH1D *histo_WJNorm12Down = (TH1D*)histo_MVA->Clone(Form("histo_%s_CMS_WJNorm12_%dDown" , plotBaseNames[kPlotWJ0].Data(),year));

  //*******************************************************
  // Chain Loop
  //*******************************************************
  for(UInt_t ifile=0; ifile<infileName_.size(); ifile++) {
    printf("sampleNames(%d): %s\n",ifile,infileName_[ifile].Data());
    TFile *the_input_file = TFile::Open(infileName_[ifile].Data());
    TTree *the_input_tree = (TTree*)the_input_file->FindObjectAny("events");

    double srYields[4]  = {0., 0., 0., 0.};
    double srYieldsE[4] = {0., 0., 0., 0.};
    pandaFlat thePandaFlat(the_input_tree);
    Long64_t nentries = thePandaFlat.fChain->GetEntriesFast();
    Long64_t nbytes = 0, nb = 0;
    for (Long64_t jentry=0; jentry<nentries;jentry++) {
      Long64_t ientry = thePandaFlat.LoadTree(jentry);
      if (ientry < 0) break;
      nb = thePandaFlat.fChain->GetEntry(jentry);   nbytes += nb;
      if (jentry%1000000 == 0) printf("--- reading event %8lld (%8lld) of %8lld\n",jentry,ientry,nentries);

/*bool thePass =
(thePandaFlat.runNumber==297563&&thePandaFlat.eventNumber==278996355)||
(thePandaFlat.runNumber==303838&&thePandaFlat.eventNumber==308439887)||
(thePandaFlat.runNumber==306029&&thePandaFlat.eventNumber==31771161);
      if(thePass == false) continue;*/

      if(debug == 3) printf("DEBUG%d STEP0 %d %d %llu\n",ifile,thePandaFlat.runNumber,thePandaFlat.lumiNumber,thePandaFlat.eventNumber);

      bool passTrigger[3] = {false, false, false};
      bool passSinglePhotonTrigger = false;
      if(year == 2016 && triggerCat == 0){
        if(infileCat_[ifile] == kPlotData || infileCat_[ifile] == kPlotNonPrompt) passTrigger[0] = (thePandaFlat.trigger & (1<<kVBFPhoTrig)) != 0;
	else                                                                      passTrigger[0] = true;
        if(infileCat_[ifile] == kPlotData || infileCat_[ifile] == kPlotNonPrompt) passTrigger[1] = (thePandaFlat.trigger & (1<<kSingleEleTrig)) != 0;
	else                                                                      passTrigger[1] = (thePandaFlat.trigger & (1<<kSingleEleTrig)) != 0;
      } else {
        if     (triggerCat == 0) passTrigger[0] = (thePandaFlat.trigger & (1<<kMETTrig)) != 0;
        else if(triggerCat == 1) passTrigger[0] = (thePandaFlat.trigger & (1<<kSinglePhoTrig)) != 0;
        passTrigger[1] = passTrigger[0];
	passSinglePhotonTrigger = (thePandaFlat.trigger & (1<<kSinglePhoTrig)) != 0;
      }
      passTrigger[2] = (thePandaFlat.trigger & (1<<kSingleMuTrig)) != 0;
      if(passTrigger[0] == false && passTrigger[1] == false && passTrigger[2] == false) continue;
      if(thePandaFlat.metFilter == 0) continue;

      if(debug == 3) printf("DEBUG%d STEP1 %d %d %llu\n",ifile,thePandaFlat.runNumber,thePandaFlat.lumiNumber,thePandaFlat.eventNumber);

      if(thePandaFlat.nLooseLep > 2) continue;

      int theCategory = infileCat_[ifile];

      double etaPhotonCut = 1.47; double r9PhotonCut = 0.9;
      if(year == 2017 || year == 2018) {etaPhotonCut = 1.47; r9PhotonCut = 0.0;}

      TLorentzVector vFakePhoton,vPhoton,vPhotonUp,vPhotonDown;
      int passPhoSel = 0; double photonR9 = 0;
      if(theCategory != kPlotNonPrompt){
        if(thePandaFlat.loosePho1Pt > ptMin
           && TMath::Abs(thePandaFlat.loosePho1Eta) < etaPhotonCut
           && (thePandaFlat.loosePho1SelBit & pMedium) == pMedium
	   && thePandaFlat.loosePho1r9 > r9PhotonCut
	   && (thePandaFlat.loosePho1SelBit & pCsafeVeto) == pCsafeVeto
	   && (thePandaFlat.loosePho1SelBit & pPixelVeto) == pPixelVeto) passPhoSel = 1;
        //if(passPhoSel == 0
        //   && thePandaFlat.loosePho1Pt > ptMin
        //   && TMath::Abs(thePandaFlat.loosePho1Eta) < etaPhotonCut
        //   && (thePandaFlat.loosePho1SelBit & pMedium) == pMedium
        //   && thePandaFlat.loosePho1r9 > r9PhotonCut
        //   &&!((thePandaFlat.loosePho1SelBit & pCsafeVeto) == pCsafeVeto
        //   &&  (thePandaFlat.loosePho1SelBit & pPixelVeto) == pPixelVeto)) passPhoSel = 3;
      }
      else {
        if(thePandaFlat.alterPho1Pt > ptMin
           && TMath::Abs(thePandaFlat.alterPho1Eta) < etaPhotonCut
           && (thePandaFlat.alterPho1SelBit & pMediumNM1) == pMediumNM1
	   && thePandaFlat.alterPho1SelBit > r9PhotonCut
	   && (thePandaFlat.alterPho1SelBit & pCsafeVeto) == pCsafeVeto
	   && (thePandaFlat.alterPho1SelBit & pPixelVeto) == pPixelVeto) passPhoSel = 2;
        if(passPhoSel == 0) continue;
      }

      if     (passPhoSel == 1 || passPhoSel == 3) {
        vPhoton.SetPtEtaPhiM(thePandaFlat.loosePho1Pt, thePandaFlat.loosePho1Eta, thePandaFlat.loosePho1Phi, 0);
	photonR9 = thePandaFlat.loosePho1r9;
      }
      else if(passPhoSel == 2) {
        vPhoton.SetPtEtaPhiM(thePandaFlat.alterPho1Pt, thePandaFlat.alterPho1Eta, thePandaFlat.alterPho1Phi, 0);
	photonR9 = thePandaFlat.alterPho1r9;
      }
 
      vector<float>  looseLepPt,looseLepEta,looseLepPhi,looseLepSF,looseLepIso;
      vector<int> looseLepSelBit,looseLepPdgId,looseLepTripleCharge,looseLepMissingHits;
      int ptSelCuts[1] = {0};
      for(int i=0; i<thePandaFlat.nLooseMuon; i++){
        looseLepPt.push_back(thePandaFlat.muonPt[i]);
        looseLepEta.push_back(thePandaFlat.muonEta[i]);
        looseLepPhi.push_back(thePandaFlat.muonPhi[i]);
        looseLepSF.push_back(thePandaFlat.muonSfReco[i] * thePandaFlat.muonSfTight[i]);
        looseLepSelBit.push_back(thePandaFlat.muonSelBit[i]);
        looseLepPdgId.push_back(thePandaFlat.muonPdgId[i]);
        looseLepTripleCharge.push_back(1);
        looseLepMissingHits.push_back(0);
        looseLepIso.push_back(thePandaFlat.muonCombIso[i]);
	if(looseLepPt[looseLepPt.size()-1] > ptMin) ptSelCuts[0]++;
      }
      for(int i=0; i<thePandaFlat.nLooseElectron; i++){
        if(passPhoSel == 3 && thePandaFlat.electronLPhoMatch[i] == 1) continue;
        looseLepPt.push_back(thePandaFlat.electronPt[i]);
        looseLepEta.push_back(thePandaFlat.electronEta[i]);
        looseLepPhi.push_back(thePandaFlat.electronPhi[i]);
        looseLepSelBit.push_back(thePandaFlat.electronSelBit[i]);
        looseLepSF.push_back(thePandaFlat.electronSfReco[i] * thePandaFlat.electronSfMedium[i]);
        looseLepPdgId.push_back(thePandaFlat.electronPdgId[i]);
        looseLepTripleCharge.push_back(thePandaFlat.electronTripleCharge[i]);
        looseLepMissingHits.push_back(thePandaFlat.electronNMissingHits[i]);
        looseLepIso.push_back(thePandaFlat.electronCombIso[i]);
	if(looseLepPt[looseLepPt.size()-1] > ptMin) ptSelCuts[0]++;
      }

      if(passPhoSel == 0 && ptSelCuts[0] != 1) continue;

      if((int)looseLepPt.size() != thePandaFlat.nLooseLep && passPhoSel != 3) printf("IMPOSSIBLE\n");

      vector<TLorentzVector> vLoose;
      vector<int> idLep;
      int qTot = 0;
      unsigned int countLeptonTight = 0;
      for(unsigned int i=0; i<looseLepPt.size(); i++) {
        idLep.push_back(0);
        //if     (abs(looseLepPdgId[i])==13) idLep[i] = 1;
        if     (abs(looseLepPdgId[i])==13 && (looseLepSelBit[i] & kMedium) == kMedium) idLep[i] = 1;
        else if(abs(looseLepPdgId[i])==11 && (looseLepSelBit[i] & kMedium) == kMedium) idLep[i] = 1;
	countLeptonTight = countLeptonTight + (idLep[i] > 0);

        double thePDGMass = mass_mu;
        if(abs(looseLepPdgId[i])==11) thePDGMass = mass_el;
	TLorentzVector vLepTemp; vLepTemp.SetPtEtaPhiM(looseLepPt[i],looseLepEta[i],looseLepPhi[i],thePDGMass);
        vLoose.push_back(vLepTemp);

	qTot = qTot + abs(looseLepPdgId[i])/looseLepPdgId[i];
      }

      int lepType = -1; double muSFUnc = 1.0; double elSFUnc = 1.0;
      if     (looseLepPt.size() == 1){
        if     (abs(looseLepPdgId[0])==13) {lepType = 0; muSFUnc = 1.010;}
        else if(abs(looseLepPdgId[0])==11) {lepType = 1; elSFUnc = 1.020;}
      }
      else if(looseLepPt.size() == 2){
        if     (abs(looseLepPdgId[0])==13 && abs(looseLepPdgId[1])==13) {lepType = 0; muSFUnc = 1.010*1.010;}
        else if(abs(looseLepPdgId[0])==11 && abs(looseLepPdgId[1])==11) {lepType = 1; elSFUnc = 1.020*1.020;}
        else  {lepType = 2; muSFUnc = 1.010; elSFUnc = 1.020;}
      }

      TLorentzVector vMet,vMetUp,vMetDown;
      double dPhiJetMET, dPhiJetMETUp, dPhiJetMETDown;
      if(year == 2016 || year == 2018 || year == 2017){
        vMet    .SetPtEtaPhiM(thePandaFlat.pfmet,             0.0,thePandaFlat.pfmetphi,             0.0);
        vMetUp  .SetPtEtaPhiM(thePandaFlat.pfmet_JESTotalUp,  0.0,thePandaFlat.pfmetphi_JESTotalUp,  0.0);
        vMetDown.SetPtEtaPhiM(thePandaFlat.pfmet_JESTotalDown,0.0,thePandaFlat.pfmetphi_JESTotalDown,0.0);
        dPhiJetMET     = thePandaFlat.dphipfmet;
        dPhiJetMETUp   = thePandaFlat.dphipfmet_JESTotalUp;
        dPhiJetMETDown = thePandaFlat.dphipfmet_JESTotalDown;
      } else {
        vMet    .SetPtEtaPhiM(thePandaFlat.puppimet,             0.0,thePandaFlat.puppimetphi,             0.0);
        vMetUp  .SetPtEtaPhiM(thePandaFlat.puppimet_JESTotalUp,  0.0,thePandaFlat.puppimetphi_JESTotalUp,  0.0);
        vMetDown.SetPtEtaPhiM(thePandaFlat.puppimet_JESTotalDown,0.0,thePandaFlat.puppimetphi_JESTotalDown,0.0);
        dPhiJetMET     = thePandaFlat.dphipuppimet;
        dPhiJetMETUp   = thePandaFlat.dphipuppimet_JESTotalUp;
        dPhiJetMETDown = thePandaFlat.dphipuppimet_JESTotalDown;
      }

      if(countLeptonTight != idLep.size()) continue;

      double mLL = 91.1876;
      int theMinSelType = -1;
      TLorentzVector theG;
      if     ((passPhoSel == 1 || passPhoSel == 2) && vLoose.size() == 0){ // 1 gamma + 0 leptons
        theMinSelType = VBFGSEL;
        theG = vPhoton;
      }
      else if((passPhoSel == 1 || passPhoSel == 2) && vLoose.size() == 1 && thePandaFlat.nLooseMuon == 1 && TMath::Abs(vPhoton.DeltaR(vLoose[0])) > 0.3){ // 1 gamma + 1 muon
        theMinSelType = MGSEL;
        theG = vPhoton;
	vMet	 = vMet     + vLoose[0];
	vMetUp   = vMetUp   + vLoose[0];
	vMetDown = vMetDown + vLoose[0];
      }
      else if((passPhoSel == 1 || passPhoSel == 2) && vLoose.size() == 2 && TMath::Abs(qTot) == 0 && thePandaFlat.nLooseMuon == 2 &&
              TMath::Abs(vPhoton.DeltaR(vLoose[0])) > 0.3 && TMath::Abs(vPhoton.DeltaR(vLoose[1])) > 0.3){ // 1 gamma + 2 muons
        theMinSelType = MMGSEL;
        theG = vPhoton;
	vMet	 = vMet     + vLoose[0] + vLoose[1];
	vMetUp   = vMetUp   + vLoose[0] + vLoose[1];
	vMetDown = vMetDown + vLoose[0] + vLoose[1];
	mLL = (vLoose[0]+vLoose[1]).M();
      }
      //else if(passPhoSel == 3 && vLoose.size() == 0){ // electron faking gamma + 0 leptons
      else if(passPhoSel == 0 && vLoose.size() == 1 && thePandaFlat.nLooseElectron == 1 && TMath::Abs(vLoose[0].Eta()) < etaPhotonCut){ // 0 gamma + 1 electron
        theMinSelType = ESEL;
        //theG = vPhoton;
	theG = vLoose[0];
	photonR9 = 0.95;
      }
      else if(passPhoSel == 0 && vLoose.size() == 1 && thePandaFlat.nLooseMuon == 1 && TMath::Abs(vLoose[0].Eta()) < etaPhotonCut){ // 0 gamma + 1 muon
        theMinSelType = MSEL;
        //theG = vPhoton;
	theG = vLoose[0];
	photonR9 = 0.95;
      }

      if(debug == 3) printf("DEBUG%d STEP2 %d %d %llu %d %d %zu\n",ifile,thePandaFlat.runNumber,thePandaFlat.lumiNumber,thePandaFlat.eventNumber,theMinSelType,passPhoSel,vLoose.size());

      if(theMinSelType == -1) continue;

      if((theMinSelType != ESEL && passTrigger[0] == false) || (theMinSelType == ESEL && passTrigger[1] == false) || (theMinSelType == MSEL && passTrigger[2] == false)) continue;

      if(debug == 3) printf("DEBUG%d STEP3 %d %d %llu %d %f\n",ifile,thePandaFlat.runNumber,thePandaFlat.lumiNumber,thePandaFlat.eventNumber,passSinglePhotonTrigger,theG.Pt());

      bool isPhoSel = passSinglePhotonTrigger == true && theG.Pt() > 230;
      if(year != 2016 && triggerCat == 0 &&  isPhoSel && theMinSelType != MSEL) continue;
      if(year != 2016 && triggerCat == 1 && !isPhoSel && theMinSelType != MSEL) continue;
      if(year != 2016 && triggerCat == 0 && theG.Pt() >  230 && theMinSelType == MSEL) continue;
      if(year != 2016 && triggerCat == 1 && theG.Pt() <= 230 && theMinSelType == MSEL) continue;

      double dPhiJetG = 100.0; double dRJetG = 100.0;
      for(int i=0; i<TMath::Min(thePandaFlat.nJot,2); i++){
        if(thePandaFlat.jotPt[i] <= 30) continue;
        TLorentzVector vJetTemp;
        vJetTemp.SetPtEtaPhiM(thePandaFlat.jotPt[i],thePandaFlat.jotEta[i],thePandaFlat.jotPhi[i],0.0);
        //if(dPhiJetMET > TMath::Abs(vJetTemp.DeltaPhi(vMet))) dPhiJetMET = TMath::Abs(vJetTemp.DeltaPhi(vMet));
        if(dPhiJetG > TMath::Abs(vJetTemp.DeltaPhi(theG))) dPhiJetG = TMath::Abs(vJetTemp.DeltaPhi(theG));
        if(dRJetG > TMath::Abs(vJetTemp.DeltaR(theG))) dRJetG = TMath::Abs(vJetTemp.DeltaR(theG));
      }

      if(debug == 3) printf("DEBUG%d STEP4 %d %d %llu %f %f\n",ifile,thePandaFlat.runNumber,thePandaFlat.lumiNumber,thePandaFlat.eventNumber,dRJetG,vMet.Pt());

      if(dRJetG < 0.4) continue; // Remove events where photon and jet overlap

      if(theMinSelType == VBFGSEL && dPhiJetMET > 0.0 && dPhiJetMET < 0.5) theMinSelType = GJSEL;

      TLorentzVector totSystem,totSystemUp,totSystemDown;
      double dPhiGMET = 0; double dPhiGMETUp = 0;double dPhiGMETDown = 0;
      double mTGMET = 0;   double mTGMETUp = 0;  double mTGMETDown = 0;
      if(theMinSelType >= 0){
        totSystem     = totSystem     + theG + vMet;
        totSystemUp   = totSystemUp   + theG + vMetUp;
        totSystemDown = totSystemDown + theG + vMetDown;
	dPhiGMET     = TMath::Abs(theG.DeltaPhi(vMet    )); 
	dPhiGMETUp   = TMath::Abs(theG.DeltaPhi(vMetUp  )); 
	dPhiGMETDown = TMath::Abs(theG.DeltaPhi(vMetDown));
        mTGMET     = TMath::Sqrt(2.0*theG.Pt()*vMet    .Pt()*(1.0 - cos(dPhiGMET    ))); 
	mTGMETUp   = TMath::Sqrt(2.0*theG.Pt()*vMetUp  .Pt()*(1.0 - cos(dPhiGMETUp  ))); 
	mTGMETDown = TMath::Sqrt(2.0*theG.Pt()*vMetDown.Pt()*(1.0 - cos(dPhiGMETDown)));
      }

      double mtgCutVal = 0;if(isHVBFGAna) mtgCutVal = 70;
      double metCutVal = 100;
      if(year != 2016) metCutVal = 140;
      if(theMinSelType == MMGSEL && year == 2016) metCutVal = 50;
      bool passZMass = TMath::Abs(mLL-91.1876) < 15.0;
      bool passMET     = vMet.Pt()     > metCutVal && mTGMET     > mtgCutVal;
      bool passMETUp   = vMetUp.Pt()   > metCutVal && mTGMETUp   > mtgCutVal;
      bool passMETDown = vMetDown.Pt() > metCutVal && mTGMETDown > mtgCutVal;
      if(theMinSelType == MGSEL){
        passMET     = thePandaFlat.pfUWmag              > metCutVal && mTGMET     > mtgCutVal; 
	passMETUp   = thePandaFlat.pfUWmag_JESTotalUp   > metCutVal && mTGMETUp   > mtgCutVal;
	passMETDown = thePandaFlat.pfUWmag_JESTotalDown > metCutVal && mTGMETDown > mtgCutVal;
      }
      else if(theMinSelType == MMGSEL){
        passMET     = thePandaFlat.pfUZmag		> metCutVal && mTGMET     > mtgCutVal; 
	passMETUp   = thePandaFlat.pfUZmag_JESTotalUp   > metCutVal && mTGMETUp   > mtgCutVal;
	passMETDown = thePandaFlat.pfUZmag_JESTotalDown > metCutVal && mTGMETDown > mtgCutVal;
      }

      if(debug == 1 && dPhiGMET < 0.1) printf("%d %f %f %f %f %f %f\n",theMinSelType,mTGMET,dPhiGMET,theG.Phi(),vMet.Phi(),theG.Pt(),vMet.Pt());

      bool passNjets     = thePandaFlat.nJot              >= 2 && thePandaFlat.nJot              <= 5 && thePandaFlat.jotPt[0]  	    > 50 && thePandaFlat.jotPt[1]	       > 50;
      bool passNjetsUp   = thePandaFlat.nJot_JESTotalUp   >= 2 && thePandaFlat.nJot_JESTotalUp   <= 5 && thePandaFlat.jotPt_JESTotalUp[0]   > 50 && thePandaFlat.jotPt_JESTotalUp[1]   > 50;
      bool passNjetsDown = thePandaFlat.nJot_JESTotalDown >= 2 && thePandaFlat.nJot_JESTotalDown <= 5 && thePandaFlat.jotPt_JESTotalDown[0] > 50 && thePandaFlat.jotPt_JESTotalDown[1] > 50;
      TLorentzVector vJot1;     if(thePandaFlat.jotPt[0]>10) vJot1.SetPtEtaPhiM    (thePandaFlat.jotPt[0],thePandaFlat.jotEta[0],thePandaFlat.jotPhi[0],0.0);
      TLorentzVector vJot2;     if(thePandaFlat.jotPt[1]>10) vJot2.SetPtEtaPhiM    (thePandaFlat.jotPt[1],thePandaFlat.jotEta[1],thePandaFlat.jotPhi[1],0.0);
      TLorentzVector vJot1Up;   if(thePandaFlat.jotPt_JESTotalUp[0]>10) vJot1Up.SetPtEtaPhiM  (thePandaFlat.jotPt_JESTotalUp[0],thePandaFlat.jotEta[0],thePandaFlat.jotPhi[0],0.0);
      TLorentzVector vJot2Up;   if(thePandaFlat.jotPt_JESTotalUp[1]>10) vJot2Up.SetPtEtaPhiM  (thePandaFlat.jotPt_JESTotalUp[1],thePandaFlat.jotEta[1],thePandaFlat.jotPhi[1],0.0);
      TLorentzVector vJot1Down; if(thePandaFlat.jotPt_JESTotalDown[0]>10) vJot1Down.SetPtEtaPhiM(thePandaFlat.jotPt_JESTotalDown[0],thePandaFlat.jotEta[0],thePandaFlat.jotPhi[0],0.0);
      TLorentzVector vJot2Down; if(thePandaFlat.jotPt_JESTotalDown[1]>10) vJot2Down.SetPtEtaPhiM(thePandaFlat.jotPt_JESTotalDown[1],thePandaFlat.jotEta[1],thePandaFlat.jotPhi[1],0.0);
      totSystem     = totSystem     + vJot1     + vJot2;
      totSystemUp   = totSystemUp   + vJot1Up   + vJot2Up;
      totSystemDown = totSystemDown + vJot1Down + vJot2Down;

      TLorentzVector vAllJot;     vAllJot    .SetPtEtaPhiE(thePandaFlat.allJotPt             ,thePandaFlat.allJotEta             ,thePandaFlat.allJotPhi             ,thePandaFlat.allJotE	       );
      TLorentzVector vAllJotUp;   vAllJotUp  .SetPtEtaPhiE(thePandaFlat.allJotPt_JESTotalUp  ,thePandaFlat.allJotEta_JESTotalUp  ,thePandaFlat.allJotPhi_JESTotalUp  ,thePandaFlat.allJotE_JESTotalUp  );
      TLorentzVector vAllJotDown; vAllJotDown.SetPtEtaPhiE(thePandaFlat.allJotPt_JESTotalDown,thePandaFlat.allJotEta_JESTotalDown,thePandaFlat.allJotPhi_JESTotalDown,thePandaFlat.allJotE_JESTotalDown);
      double theAllJotHT     = thePandaFlat.allJotHT;
      double theAllJotHTUp   = thePandaFlat.allJotHT_JESTotalUp;
      double theAllJotHTDown = thePandaFlat.allJotHT_JESTotalDown;
      double ratio_allJetPt_vs_allJetHT = vAllJot.Pt()/theAllJotHT;

      vAllJot     = vAllJot     - vJot1     - vJot2     + theG;
      vAllJotUp   = vAllJotUp   - vJot1Up   - vJot2Up   + theG;
      vAllJotDown = vAllJotDown - vJot1Down - vJot2Down + theG;
      theAllJotHT     = theAllJotHT     - vJot1.Pt()     - vJot2.Pt()     + theG.Pt();
      theAllJotHTUp   = theAllJotHTUp   - vJot1Up.Pt()   - vJot2Up.Pt()   + theG.Pt();
      theAllJotHTDown = theAllJotHTDown - vJot1Down.Pt() - vJot2Down.Pt() + theG.Pt();

      double massJJ         = thePandaFlat.jot12Mass;
      double massJJUp       = thePandaFlat.jot12Mass_JESTotalUp;
      double massJJDown     = thePandaFlat.jot12Mass_JESTotalDown;
      double deltaEtaJJ     = thePandaFlat.jot12DEta;
      double deltaEtaJJUp   = thePandaFlat.jot12DEta_JESTotalUp;
      double deltaEtaJJDown = thePandaFlat.jot12DEta_JESTotalDown;
      double deltaPhiJJ     = thePandaFlat.jot12DPhi;
      double deltaPhiJJUp   = thePandaFlat.jot12DPhi_JESTotalUp;
      double deltaPhiJJDown = thePandaFlat.jot12DPhi_JESTotalDown;

      double gZep     = TMath::Min(TMath::Abs(theG.Eta()-(vJot1.Eta()+vJot2.Eta())/2.)/deltaEtaJJ,0.999);
      double gZepUp   = TMath::Min(TMath::Abs(theG.Eta()-(vJot1Up.Eta()+vJot2Up.Eta())/2.)/deltaEtaJJUp,0.999);
      double gZepDown = TMath::Min(TMath::Abs(theG.Eta()-(vJot1Down.Eta()+vJot2Down.Eta())/2.)/deltaEtaJJDown,0.999);

      bool passMJJ     = thePandaFlat.nJot              >= 2 && massJJ     > 500;
      bool passMJJUp   = thePandaFlat.nJot_JESTotalUp   >= 2 && massJJUp   > 500;
      bool passMJJDown = thePandaFlat.nJot_JESTotalDown >= 2 && massJJDown > 500;
      bool passDEtaJJ     = thePandaFlat.nJot		   >= 2 && deltaEtaJJ	  > 3.0 && vJot1.Eta()*vJot2.Eta() < 0;
      bool passDEtaJJUp   = thePandaFlat.nJot_JESTotalUp   >= 2 && deltaEtaJJUp   > 3.0 && vJot1.Eta()*vJot2.Eta() < 0;
      bool passDEtaJJDown = thePandaFlat.nJot_JESTotalDown >= 2 && deltaEtaJJDown > 3.0 && vJot1.Eta()*vJot2.Eta() < 0;
      bool passgZep     = thePandaFlat.nJot		 >= 2 && gZep	  < 0.6;
      bool passgZepUp   = thePandaFlat.nJot_JESTotalUp   >= 2 && gZepUp   < 0.6;
      bool passgZepDown = thePandaFlat.nJot_JESTotalDown >= 2 && gZepDown < 0.6;

      bool passPtTot     = totSystem.Pt()     < 150;
      bool passPtTotUp   = totSystemUp.Pt()   < 150;
      bool passPtTotDown = totSystemDown.Pt() < 150;

      int theJESType = -1;
      if     (TMath::Abs(vJot1.Eta()) <  2.4 && TMath::Abs(vJot2.Eta()) <  2.4) theJESType = 0;
      else if(TMath::Abs(vJot1.Eta()) >= 2.4 && TMath::Abs(vJot2.Eta()) >= 2.4) theJESType = 1;
      else                                                                      theJESType = 2;

      if     (massJJ < 1500) theJESType = theJESType + 0;
      else                   theJESType = theJESType + 3;

      bool passHEM1516 = true;
      if(year == 2018 && thePandaFlat.nJot >= 2){
        passHEM1516 = passHEM1516 && 
        !(thePandaFlat.jotPhi[0]<-0.87 && thePandaFlat.jotPhi[0]>-1.57 && thePandaFlat.jotEta[0]<-1.3 && thePandaFlat.jotEta[0]>-3.0) &&
        !(thePandaFlat.jotPhi[1]<-0.87 && thePandaFlat.jotPhi[1]>-1.57 && thePandaFlat.jotEta[1]<-1.3 && thePandaFlat.jotEta[1]>-3.0);
        if(theMinSelType == ESEL || theMinSelType == MSEL){
          passHEM1516 = passHEM1516 && !(theG.Phi()<-0.87 && theG.Phi()>-1.57 && theG.Eta()<-1.3 && theG.Eta()>-3.0);
        }
      }

      double dPhiJetCutVal = 1.0;
      bool passDPhiJetMET     = dPhiJetMET     >= dPhiJetCutVal || theMinSelType == GJSEL;
      bool passDPhiJetMETUp   = dPhiJetMETUp   >= dPhiJetCutVal || theMinSelType == GJSEL;
      bool passDPhiJetMETDown = dPhiJetMETDown >= dPhiJetCutVal || theMinSelType == GJSEL;
      if     (theMinSelType == MGSEL){
        passDPhiJetMET     = thePandaFlat.dphipfUW              >= dPhiJetCutVal;
        passDPhiJetMETUp   = thePandaFlat.dphipfUW_JESTotalUp   >= dPhiJetCutVal;
        passDPhiJetMETDown = thePandaFlat.dphipfUW_JESTotalDown >= dPhiJetCutVal;
      }
      else if(theMinSelType == MMGSEL){
        passDPhiJetMET     = thePandaFlat.dphipfUZ              >= dPhiJetCutVal;
        passDPhiJetMETUp   = thePandaFlat.dphipfUZ_JESTotalUp   >= dPhiJetCutVal;
        passDPhiJetMETDown = thePandaFlat.dphipfUZ_JESTotalDown >= dPhiJetCutVal;
      }

      // Removing some requirements
      if(theMinSelType == MMGSEL){
        //passMET        = true; passMETUp	= true; passMETDown	   = true;
        passDPhiJetMET = true; passDPhiJetMETUp = true; passDPhiJetMETDown = true;
        //passgZep       = true; passgZepUp	= true; passgZepDown	   = true;
        //passPtTot      = true; passPtTotUp	= true; passPtTotDown	   = true;
      }

      const int numberOfCuts = 9;
      //                                                 0         1         2       3          4       5         6              7        8
      bool passCutEvol[numberOfCuts] = {theMinSelType >= 0,passZMass,passNjets,passMJJ,passDEtaJJ,passMET,passPtTot,passDPhiJetMET,passgZep};
      bool passCutEvolAll = true;

      if((debug == 1 || debug == 3) && theMinSelType >= 0) printf("DEBUG %d %d %d %d %d %d %d %d\n",theMinSelType,passZMass,passPtTot,passMET,passNjets,passDPhiJetMET,passMJJ,passDEtaJJ);

      bool passAllCuts[nSelTypes] = {                   
     theMinSelType == VBFGSEL && passZMass && passMET && passNjets && passDPhiJetMET && passMJJ && passDEtaJJ && passgZep && passPtTot,
     theMinSelType == ESEL    && passZMass && passMET && passNjets && passDPhiJetMET && passMJJ && passDEtaJJ && passgZep && passPtTot,
     theMinSelType == MGSEL   && passZMass && passMET && passNjets && passDPhiJetMET && passMJJ && passDEtaJJ && passgZep && passPtTot,
     theMinSelType == GJSEL   && passZMass && passMET && passNjets && passDPhiJetMET && passMJJ && passDEtaJJ && passgZep && passPtTot,
     theMinSelType == MMGSEL  && passZMass && passMET && passNjets && passDPhiJetMET && passMJJ && passDEtaJJ && passgZep && passPtTot,
     theMinSelType == MSEL    && passZMass && passMET && passNjets && passDPhiJetMET && passMJJ && passDEtaJJ && passgZep && passPtTot
                                    };

      bool passNMinusOne[7] = {
     theMinSelType >= 0 && passZMass &&            passNjets && passDPhiJetMET && passMJJ && passDEtaJJ && passgZep && passPtTot,
     theMinSelType >= 0 && passZMass && passMET &&              passDPhiJetMET                                      && passPtTot,
     theMinSelType >= 0 && passZMass && passMET && passNjets &&                   passMJJ && passDEtaJJ && passgZep && passPtTot,
     theMinSelType >= 0 && passZMass && passMET && passNjets && passDPhiJetMET            && passDEtaJJ && passgZep && passPtTot,
     theMinSelType >= 0 && passZMass && passMET && passNjets && passDPhiJetMET && passMJJ               && passgZep && passPtTot,
     theMinSelType >= 0 && passZMass && passMET && passNjets && passDPhiJetMET && passMJJ && passDEtaJJ             && passPtTot,
     theMinSelType >= 0 && passZMass && passMET && passNjets && passDPhiJetMET && passMJJ && passDEtaJJ && passgZep
                                    };

      bool passVBFGSel     = theMinSelType == VBFGSEL && passZMass && passMET     && passNjets     && passDPhiJetMET     && passMJJ	&& passDEtaJJ     && passgZep     && passPtTot    ;
      bool passVBFGSelUp   = theMinSelType == VBFGSEL && passZMass && passMETUp   && passNjetsUp   && passDPhiJetMETUp   && passMJJUp   && passDEtaJJUp   && passgZepUp   && passPtTotUp  ;
      bool passVBFGSelDown = theMinSelType == VBFGSEL && passZMass && passMETDown && passNjetsDown && passDPhiJetMETDown && passMJJDown && passDEtaJJDown && passgZepDown && passPtTotDown;
      bool passESEL	   = theMinSelType == ESEL    && passZMass && passMET     && passNjets     && passDPhiJetMET     && passMJJ	&& passDEtaJJ     && passgZep     && passPtTot    ;
      bool passESELUp	   = theMinSelType == ESEL    && passZMass && passMETUp   && passNjetsUp   && passDPhiJetMETUp   && passMJJUp   && passDEtaJJUp   && passgZepUp   && passPtTotUp  ;
      bool passESELDown    = theMinSelType == ESEL    && passZMass && passMETDown && passNjetsDown && passDPhiJetMETDown && passMJJDown && passDEtaJJDown && passgZepDown && passPtTotDown;
      bool passMGSEL       = theMinSelType == MGSEL   && passZMass && passMET     && passNjets     && passDPhiJetMET     && passMJJ	&& passDEtaJJ     && passgZep     && passPtTot    ;
      bool passMGSELUp     = theMinSelType == MGSEL   && passZMass && passMETUp   && passNjetsUp   && passDPhiJetMETUp   && passMJJUp   && passDEtaJJUp   && passgZepUp   && passPtTotUp  ;
      bool passMGSELDown   = theMinSelType == MGSEL   && passZMass && passMETDown && passNjetsDown && passDPhiJetMETDown && passMJJDown && passDEtaJJDown && passgZepDown && passPtTotDown;
      bool passGJSel	   = theMinSelType == GJSEL   && passZMass && passMET     && passNjets     && passDPhiJetMET     && passMJJ	&& passDEtaJJ     && passgZep     && passPtTot    ;
      bool passGJSelUp	   = theMinSelType == GJSEL   && passZMass && passMETUp   && passNjetsUp   && passDPhiJetMETUp   && passMJJUp   && passDEtaJJUp   && passgZepUp   && passPtTotUp  ;
      bool passGJSelDown   = theMinSelType == GJSEL   && passZMass && passMETDown && passNjetsDown && passDPhiJetMETDown && passMJJDown && passDEtaJJDown && passgZepDown && passPtTotDown;
      bool passMMGSEL      = theMinSelType == MMGSEL  && passZMass && passMET	  && passNjets     && passDPhiJetMET	 && passMJJ	&& passDEtaJJ	  && passgZep	  && passPtTot    ;
      bool passMMGSELUp    = theMinSelType == MMGSEL  && passZMass && passMETUp   && passNjetsUp   && passDPhiJetMETUp   && passMJJUp	&& passDEtaJJUp   && passgZepUp   && passPtTotUp  ;
      bool passMMGSELDown  = theMinSelType == MMGSEL  && passZMass && passMETDown && passNjetsDown && passDPhiJetMETDown && passMJJDown && passDEtaJJDown && passgZepDown && passPtTotDown;

      int dataCardSel = -1; int dataCardSelUp = -1;int dataCardSelDown = -1;
      if     (passVBFGSel) dataCardSel = 0;
      else if(passESEL)    dataCardSel = 1;
      else if(passMGSEL)   dataCardSel = 2;
      else if(passGJSel)   dataCardSel = 3;
      else if(passMMGSEL)  dataCardSel = 4;

      if     (passVBFGSelUp) dataCardSelUp = 0;
      else if(passESELUp)    dataCardSelUp = 1;
      else if(passMGSELUp)   dataCardSelUp = 2;
      else if(passGJSelUp)   dataCardSelUp = 3;
      else if(passMMGSELUp)  dataCardSelUp = 4;

      if     (passVBFGSelDown) dataCardSelDown = 0;
      else if(passESELDown)    dataCardSelDown = 1;
      else if(passMGSELDown)   dataCardSelDown = 2;
      else if(passGJSelDown)   dataCardSelDown = 3;
      else if(passMMGSELDown)  dataCardSelDown = 4;

      if(isHVBFGAna){
        if(dataCardSel	   >= 0 && massJJ     > mjjSplit) {dataCardSel     = dataCardSel     + 5;}
        if(dataCardSelUp   >= 0 && massJJUp   > mjjSplit) {dataCardSelUp   = dataCardSelUp   + 5;}
        if(dataCardSelDown >= 0 && massJJDown > mjjSplit) {dataCardSelDown = dataCardSelDown + 5;}
      } else {
        if(dataCardSel	   >= 0 && massJJ     > mjjSplit) {dataCardSel     = dataCardSel     + 5;}
        if(dataCardSelUp   >= 0 && massJJUp   > mjjSplit) {dataCardSelUp   = dataCardSelUp   + 5;}
        if(dataCardSelDown >= 0 && massJJDown > mjjSplit) {dataCardSelDown = dataCardSelDown + 5;}
      }

      bool passSystCuts[nSystTypes] = {dataCardSelUp  >= 0, dataCardSelDown  >= 0};

      double photonSFUnc[4] = {1.0, 1.0, 1.0, 1.0};
      double totalWeight = 1.0; double puStdWeight = 1.0;  double puWeight = 1.0;double puWeightUp = 1.0; double puWeightDown = 1.0; double sf_l1PrefireE = 1.0;
      double triggerWeights[2] = {1.0, 1.0}; double triggerWeightsEl[2] = {1.0, 1.0}; double nloKfactor = 1;
      double photonSFDef = 1.0, effSFLoose = 1.0, effSFTight = 1.0;
      if(theCategory != kPlotData && theCategory != kPlotNonPrompt){
	puWeight     = nPUScaleFactor(fhDPU,    thePandaFlat.pu);
        puWeightUp   = nPUScaleFactor(fhDPUUp,  thePandaFlat.pu);
        puWeightDown = nPUScaleFactor(fhDPUDown,thePandaFlat.pu);
	puStdWeight  = nPUScaleFactor(fhDPUStd, thePandaFlat.pu);

        sf_l1PrefireE = 1.0 + TMath::Abs(1.0 - thePandaFlat.sf_l1Prefire) * 0.2;

	//double npvWeight = nPUScaleFactor(fhDNPV, thePandaFlat.npv);

        if(theMinSelType == MSEL){
          triggerWeights[1] = 1.03;
        }
        else if(!(year == 2016 && theMinSelType == ESEL)){
          trigger_eff_sf(triggerWeights  , vMet.Pt(), photonR9, theG.Pt(), massJJ, deltaEtaJJ, year, triggerCat, trg_VBFG_r9_eff, trg_VBFG_pth_eff, trg_VBFG_mjj_eff, trg_VBFG_detajj_eff, false);
          if((year == 2017 || year == 2018) && triggerCat == 0){
          trigger_eff_sf(triggerWeightsEl, vMet.Pt(), photonR9, theG.Pt(), massJJ, deltaEtaJJ, year, triggerCat, trg_VBFG_r9_eff, trg_VBFG_pth_eff, trg_VBFG_mjj_eff, trg_VBFG_detajj_eff, true);
	  }
	  else {
	    triggerWeightsEl[0] = triggerWeights[0];
	    triggerWeightsEl[1] = 1.0;
	  }
        }
	else {
          triggerWeights[1] = 1.03;
	}

        totalWeight = thePandaFlat.normalizedWeight * lumiV[whichYear] * 1000 * puWeight * thePandaFlat.sf_l1Prefire * triggerWeights[0];

        //if(theMinSelType != ESEL){
        if(1){
          for(unsigned int nl=0; nl<idLep.size(); nl++) effSFLoose = effSFLoose * looseLepSF[nl];
        }

        // NLO QCD K-factors
	if     (infileCat_[ifile] == kPlotWJ0) nloKfactor = (1.166790*TMath::Exp(-0.001606*thePandaFlat.trueGenBosonPt)+0.466154);
	else if(infileCat_[ifile] == kPlotDY)  nloKfactor = (1.539043*TMath::Exp(-0.001721*thePandaFlat.trueGenBosonPt)+0.391421);
	else if(infileCat_[ifile] == kPlotGJ0) {
	  double ptNLO = TMath::Max(TMath::Min(thePandaFlat.trueGenBosonPt,1000.0f),80.0f);
	  //double xVal[6] = {8.01627316e-14,-2.37457824e-10,2.59442718e-07,-1.27589087e-04,2.62074469e-02,2.23357748e-01};
	  double xVal[6] = {3.74923578e-14,-1.26232115e-10,1.57263595e-07,-8.75070209e-05,1.97795090e-02,6.30233994e-01};
	  nloKfactor =  xVal[0]*TMath::Power(ptNLO,5)+
	                xVal[1]*TMath::Power(ptNLO,4)+
			xVal[2]*TMath::Power(ptNLO,3)+
			xVal[3]*TMath::Power(ptNLO,2)+
			xVal[4]*ptNLO+
			xVal[5];
        }
	totalWeight = totalWeight * nloKfactor;

        // EWK K-factors
	//if     (infileCat_[ifile] == kPlotWJ0) totalWeight = totalWeight * thePandaFlat.sf_ewkV;
	//else if(infileCat_[ifile] == kPlotDY)  totalWeight = totalWeight * thePandaFlat.sf_ewkV;
	//else if(infileCat_[ifile] == kPlotGJ0) totalWeight = totalWeight * thePandaFlat.sf_ewkV;

        if((theCategory == kPlotWJ0 && theMinSelType == MGSEL) ||
           (theCategory == kPlotDY && theMinSelType == MMGSEL)) totalWeight = 0.0;
        if(theCategory == kPlotZG && theMinSelType == MMGSEL && totalWeight < 0) totalWeight = 0.0;

        if(theCategory == kPlotGJ0){
	  double addFactor = 2.0;
	  if(year != 2016 && triggerCat == 0) addFactor = 3.0;
          if(TMath::Abs(vJot1.Eta()) > 2.6 && TMath::Abs(vJot1.Eta()) < 3.2) totalWeight = totalWeight * addFactor;
          if(TMath::Abs(vJot2.Eta()) > 2.6 && TMath::Abs(vJot2.Eta()) < 3.2) totalWeight = totalWeight * addFactor;
        }

        double splitVar0 = massJJ; double splitVar1 = mTGMET;
	if(isHVBFGAna){
          splitVar0 = massJJ; splitVar1 = 100*deltaEtaJJ;
	}

        if(makeUseNorm == true){
          if     (theCategory == kPlotWJ0){
	    if     (splitVar0 <  mjjSplit && splitVar1 <  mtgSplit0) theCategory = kPlotWJ0;
	    else if(splitVar0 <  mjjSplit && splitVar1 <  mtgSplit1) theCategory = kPlotWJ1;
	    else if(splitVar0 <  mjjSplit && splitVar1 >= mtgSplit1) theCategory = kPlotWJ2;
	    else if(splitVar0 >= mjjSplit && splitVar1 <  mtgSplit0) theCategory = kPlotWJ3;
	    else if(splitVar0 >= mjjSplit && splitVar1 <  mtgSplit1) theCategory = kPlotWJ4;
	    else if(splitVar0 >= mjjSplit && splitVar1 >= mtgSplit1) theCategory = kPlotWJ5;
          }
          else if(theCategory == kPlotGJ0){
	    if     (splitVar0 <  mjjSplit) theCategory = kPlotGJ0;
	    else if(splitVar0 >= mjjSplit) theCategory = kPlotGJ1;
          }
        }

        if(theCategory != kPlotData){
          totalWeight = totalWeight * mcCorrection(0, infileName_[ifile].Data(), year, theCategory, massJJ, mTGMET, triggerCat);
        }

	if(passPhoSel == 1) {
          if     (thePandaFlat.looseGenPho1PdgId == 1) {
	    int nxbin = fhDElePhoSFDef->GetXaxis()->FindBin(TMath::Abs(vPhoton.Eta()));
	    int nybin = fhDElePhoSFDef->GetYaxis()->FindBin(TMath::Min((double)vPhoton.Pt(), fhDElePhoSFDef->GetYaxis()->GetBinCenter(fhDElePhoSFDef->GetNbinsY())));
            photonSFDef = fhDElePhoSFDef->GetBinContent(nxbin, nybin);
	    photonSFUnc[2] = (photonSFDef+fhDElePhoSFDef->GetBinError(nxbin, nybin))/photonSFDef;
	    photonSFUnc[3] = fhDElePhoSFAlt->GetBinContent(nxbin, nybin)/photonSFDef;
	  }
          else if(thePandaFlat.looseGenPho1PdgId == 3) {
            photonSFDef = effhDPhotonScaleFactor(vPhoton.Pt(), vPhoton.Eta(), "medium", fhDPhotonSF, fhDElectronVetoSF);
	    photonSFUnc[0] = effhDPhotonScaleFactor(vPhoton.Pt(), vPhoton.Eta(), "medium", fhDPhotonSF, fhDElectronVetoSF, true);
	  }
          else if(thePandaFlat.looseGenPho1PdgId == 2) {
            photonSFDef = 1.0; photonSFUnc[1] = 1.10;
	  }
          else {
            photonSFDef = 0.0; // fake photons estimated on data
	  }
	  totalWeight = totalWeight * photonSFDef;
	}

        //if(theMinSelType != ESEL){
        if(1){
          for(unsigned int nl=0; nl<idLep.size(); nl++){
            if(idLep[nl] == 0) continue;
            bool applyTight = false;
            effSFTight = effSFTight * lepScaleFactor(vLoose[nl].Pt(),vLoose[nl].Eta(),TMath::Abs(looseLepPdgId[nl]),applyTight,histoLepEffSelMediumEtaPt_m,histoLepEffSelMediumEtaPt_e,histoLepEffSelTightEtaPt_m,histoLepEffSelTightEtaPt_e);
            if(effSFTight == 0){printf("effSFTight == 0!: %f %f %d \n",vLoose[nl].Pt(),vLoose[nl].Eta(),TMath::Abs(looseLepPdgId[nl])); return;}
          }
	}
        totalWeight = totalWeight * effSFLoose * effSFTight;

      } // mcWeights
      else if(passPhoSel == 2 && theCategory == kPlotNonPrompt){
        photonSFUnc[1] = TMath::Min(0.000625/2*vPhoton.Pt()+1.025,1.15);
	if     (year == 2016) totalWeight = totalWeight * 3.60167797932 * TMath::Exp(-0.0508590637067*vPhoton.Pt())+0.164430014756;
	else if(year == 2017) totalWeight = totalWeight * 6.54397693239 * TMath::Exp(-0.0521365327166*vPhoton.Pt())+0.245878324881;
	else if(year == 2018) totalWeight = totalWeight * 7.17000000000 * TMath::Exp(-0.0525360000000*vPhoton.Pt())+0.271000000000;
      }
      else if(theCategory == kPlotData){
      }
      else {
        printf("IMPOSSIBLE weight category\n");
      }

      if(totalWeight == 0) continue;

      if(passAllCuts[VBFGSEL] && thePandaFlat.jotEta[0]<-1.3 && thePandaFlat.jotEta[0]>-3.0) histo[117][theCategory]->Fill(thePandaFlat.jotPhi[0],totalWeight);
      if(passAllCuts[VBFGSEL] && thePandaFlat.jotEta[1]<-1.3 && thePandaFlat.jotEta[1]>-3.0) histo[117][theCategory]->Fill(thePandaFlat.jotPhi[1],totalWeight);
      if(passAllCuts[GJSEL] && thePandaFlat.jotEta[0]<-1.3 && thePandaFlat.jotEta[0]>-3.0)   histo[118][theCategory]->Fill(thePandaFlat.jotPhi[0],totalWeight);
      if(passAllCuts[GJSEL] && thePandaFlat.jotEta[1]<-1.3 && thePandaFlat.jotEta[1]>-3.0)   histo[118][theCategory]->Fill(thePandaFlat.jotPhi[1],totalWeight);
      if(passAllCuts[ESEL] && theG.Eta()<-1.3 && theG.Eta()>-3.0)                            histo[119][theCategory]->Fill(theG.Phi(),totalWeight);
      if(passAllCuts[VBFGSEL] && thePandaFlat.jotPhi[0]<-0.87 && thePandaFlat.jotPhi[0]>-1.57) histo[120][theCategory]->Fill(thePandaFlat.jotEta[0],totalWeight);
      if(passAllCuts[VBFGSEL] && thePandaFlat.jotPhi[1]<-0.87 && thePandaFlat.jotPhi[1]>-1.57) histo[120][theCategory]->Fill(thePandaFlat.jotEta[1],totalWeight);
      if(passAllCuts[GJSEL] && thePandaFlat.jotPhi[0]<-0.87 && thePandaFlat.jotPhi[0]>-1.57)   histo[121][theCategory]->Fill(thePandaFlat.jotEta[0],totalWeight);
      if(passAllCuts[GJSEL] && thePandaFlat.jotPhi[1]<-0.87 && thePandaFlat.jotPhi[1]>-1.5)    histo[121][theCategory]->Fill(thePandaFlat.jotEta[1],totalWeight);
      if(passAllCuts[ESEL] && theG.Phi()<-0.87 && theG.Phi()>-1.57)                            histo[122][theCategory]->Fill(theG.Eta(),totalWeight);

      if(passHEM1516 == false) continue;

      if(passAllCuts[VBFGSEL] && passPhoSel == 1) {
        srYields [thePandaFlat.looseGenPho1PdgId] = srYields [thePandaFlat.looseGenPho1PdgId] + totalWeight;
        srYieldsE[thePandaFlat.looseGenPho1PdgId] = srYieldsE[thePandaFlat.looseGenPho1PdgId] + totalWeight * totalWeight;
      }

      //if(passAllCuts[VBFGSEL] && theCategory == kPlotData) {
      //  printf("DATA: %d %d %llu %f %f %d %f %f %f %f %f %f\n",thePandaFlat.runNumber,thePandaFlat.lumiNumber,thePandaFlat.eventNumber,mTGMET,vMet.Pt(),thePandaFlat.nJot,dPhiJetMET,massJJ,deltaEtaJJ,gZep,dRJetG,dPhiGMET);
      //}

      if((theMinSelType == VBFGSEL || theMinSelType == GJSEL) && passNjets && passMJJ && passDEtaJJ && passgZep && (theCategory == kPlotGJ0 || theCategory == kPlotGJ1)){
        TLorentzVector vMet0p75 = vMet + 0.40 * theG;
        TLorentzVector vMet0p50 = vMet + 0.65 * theG;
        TLorentzVector vMet0p25 = vMet + 0.90 * theG;
	double dPhiGMET0p75 = TMath::Abs(theG.DeltaPhi(vMet0p75)); 
	double dPhiGMET0p50 = TMath::Abs(theG.DeltaPhi(vMet0p50)); 
	double dPhiGMET0p25 = TMath::Abs(theG.DeltaPhi(vMet0p25)); 
        double mTGMET0p75 = TMath::Sqrt(2.0*theG.Pt()*(1-0.40)*vMet0p75.Pt()*(1.0 - cos(dPhiGMET0p75))); 
        double mTGMET0p50 = TMath::Sqrt(2.0*theG.Pt()*(1-0.65)*vMet0p50.Pt()*(1.0 - cos(dPhiGMET0p50))); 
        double mTGMET0p25 = TMath::Sqrt(2.0*theG.Pt()*(1-0.90)*vMet0p25.Pt()*(1.0 - cos(dPhiGMET0p25)));
        histoMTGMET0p75->Fill(TMath::Min(mTGMET0p75,999.999),totalWeight);
        histoMTGMET0p50->Fill(TMath::Min(mTGMET0p50,999.999),totalWeight);
        histoMTGMET0p25->Fill(TMath::Min(mTGMET0p25,999.999),totalWeight);
        histoMTGMETFit->Fill(mTGMET0p50,totalWeight);
      }

      double MVAVar	= TMath::Min(mTGMET    ,999.999);
      double MVAVarUp	= TMath::Min(mTGMETUp  ,999.999);
      double MVAVarDown = TMath::Min(mTGMETDown,999.999);
      if(isHVBFGAna){
        MVAVar     = TMath::Min(100*deltaEtaJJ    ,999.999);
        MVAVarUp   = TMath::Min(100*deltaEtaJJUp  ,999.999);
        MVAVarDown = TMath::Min(100*deltaEtaJJDown,999.999);
      }

      if(theMinSelType != MSEL){
	if(dataCardSel >= 0) histo[ 0+dataCardSel][theCategory]  ->Fill(TMath::Min(MVAVar,xbinsMT1D[nBinMT1D]-0.001),totalWeight);
	if(passNMinusOne[0]) histo[10+theMinSelType][theCategory]->Fill(TMath::Min(vMet.Pt(),459.999),totalWeight);
	if(dataCardSel >= 0) histo[15+theMinSelType][theCategory]->Fill(TMath::Min((double)thePandaFlat.nJot,5.499),totalWeight);
	if(passNMinusOne[2]) histo[20+theMinSelType][theCategory]->Fill(TMath::Min(dPhiJetMET,2.999),totalWeight);
	if(dataCardSel >= 0) histo[25+theMinSelType][theCategory]->Fill(TMath::Min(massJJ,2999.999),totalWeight);
	if(dataCardSel >= 0)  histo[30+theMinSelType][theCategory]->Fill(TMath::Min(deltaEtaJJ,7.999),totalWeight);
	if(passNMinusOne[5]) histo[35+theMinSelType][theCategory]->Fill(gZep,totalWeight);
	if(passNMinusOne[6]) histo[40+theMinSelType][theCategory]->Fill(TMath::Min(totSystem.Pt(),209.999),totalWeight);
	for(int i=0; i<numberOfCuts; i++) {passCutEvolAll = passCutEvolAll && passCutEvol[i]; if(passCutEvolAll) histo[45+theMinSelType][theCategory]->Fill((double)i,totalWeight);}
	if(dataCardSel >= 0) histo[ 50+theMinSelType][theCategory]->Fill(TMath::Abs(theG.Eta()),totalWeight);
	if(dataCardSel >= 0) histo[ 55+theMinSelType][theCategory]->Fill(theG.Pt(),totalWeight);
	if(dataCardSel >= 0) histo[ 60+theMinSelType][theCategory]->Fill(TMath::Min(dPhiJetG,2.999),totalWeight);
	if(dataCardSel >= 0) histo[ 65+theMinSelType][theCategory]->Fill(TMath::Min(dRJetG,4.999),totalWeight);
	if(dataCardSel >= 0) histo[ 70+dataCardSel][theCategory]->Fill(TMath::Min(dPhiGMET,2.999),totalWeight);
	if(dataCardSel >= 0) histo[ 80+theMinSelType][theCategory]->Fill(TMath::Abs(vJot1.Eta()),totalWeight);
	if(dataCardSel >= 0) histo[ 80+theMinSelType][theCategory]->Fill(TMath::Abs(vJot2.Eta()),totalWeight);
	if(dataCardSel >= 0) histo[ 85+theMinSelType][theCategory]->Fill(TMath::Min(vJot1.Pt(),449.999),totalWeight);
	if(dataCardSel >= 0) histo[ 85+theMinSelType][theCategory]->Fill(TMath::Min(vJot2.Pt(),449.999),totalWeight);
	if(dataCardSel >= 0) histo[ 90][theCategory]->Fill(TMath::Min((double)thePandaFlat.npv,79.499),totalWeight);
	if(dataCardSel >= 0) histo[ 91][theCategory]->Fill(TMath::Min((double)thePandaFlat.npv,79.499),totalWeight/puWeight);
	if(dataCardSel >= 0) histo[ 92][theCategory]->Fill(TMath::Min((double)thePandaFlat.npv,79.499),totalWeight/puWeight*puStdWeight);
	if     (passVBFGSel     ) histo[ 93][theCategory]->Fill(theG.Phi(),totalWeight);
	else if(dataCardSel >= 0) histo[ 94][theCategory]->Fill(theG.Phi(),totalWeight);
	if(dataCardSel >= 0) histo[ 95+theMinSelType][theCategory]->Fill(TMath::Max(TMath::Min(photonR9,0.999),0.701),totalWeight);
	if(dataCardSel >= 0) histo[100+theMinSelType][theCategory]->Fill(TMath::Min(ratio_allJetPt_vs_allJetHT,0.999),totalWeight);
	if(dataCardSel >= 0) histo[105+theMinSelType][theCategory]->Fill(TMath::Min(TMath::Abs(vMet.Pt()-thePandaFlat.trkmet)/vMet.Pt(),0.999),totalWeight);
	if(dataCardSel == 1) histo[110][theCategory]->Fill(TMath::Min(MVAVar,xbinsMVACR[nBinMVACR]-0.001),totalWeight);
	if(dataCardSel == 6) histo[111][theCategory]->Fill(TMath::Min(MVAVar,xbinsMVACR[nBinMVACR]-0.001),totalWeight);
	if(dataCardSel == 2 || dataCardSel == 7) histo[112][theCategory]->Fill(TMath::Min(massJJ,2499.999),totalWeight);
	if(dataCardSel == 3 || dataCardSel == 8) histo[113][theCategory]->Fill(TMath::Min(massJJ,2499.999),totalWeight);
	if(dataCardSel == 4 || dataCardSel == 9) histo[114][theCategory]->Fill(TMath::Min(massJJ,2499.999),totalWeight);
      }

      if(passAllCuts[MSEL] && massJJ <= mjjSplit) histo[115][theCategory]->Fill(TMath::Min(MVAVar,xbinsMVACR[nBinMVACR]-0.001),totalWeight);
      if(passAllCuts[MSEL] && massJJ >  mjjSplit) histo[116][theCategory]->Fill(TMath::Min(MVAVar,xbinsMVACR[nBinMVACR]-0.001),totalWeight);

      if(dataCardSel == 0) histoMTGMETMJJ[0][theCategory]->Fill(mTGMET,totalWeight);
      if(dataCardSel == 5) histoMTGMETMJJ[1][theCategory]->Fill(mTGMET,totalWeight);

      if(dataCardSel >= 0 || dataCardSelUp   >= 0 || dataCardSelDown >= 0){ // Begin datacard making
        if(debug == 2 && dataCardSel >= 0) printf("DEBUG%d %d %d %llu %d %f %f %f %f %f %f %f %f %f\n",ifile,thePandaFlat.runNumber,thePandaFlat.lumiNumber,thePandaFlat.eventNumber,dataCardSel,totalWeight,thePandaFlat.normalizedWeight*lumiV[whichYear]*1000,puWeight,thePandaFlat.sf_l1Prefire,triggerWeights[0],photonSFDef,effSFLoose,effSFTight,nloKfactor);

        if(dataCardSel     >= 0) {MVAVar     = MVAVar	  +  dataCardSel     * 1000;}
        if(dataCardSelUp   >= 0) {MVAVarUp   = MVAVarUp   +  dataCardSelUp   * 1000;}
        if(dataCardSelDown >= 0) {MVAVarDown = MVAVarDown +  dataCardSelDown * 1000;}

        double rndWeights[6] = {1,1,1,1,1,1};
	if(theMinSelType == ESEL || theMinSelType == MGSEL ||theMinSelType == MMGSEL) rndWeights[0] = 1+gRandom->Uniform()*0.02;
	if(theMinSelType == ESEL || theMinSelType == MGSEL ||theMinSelType == MMGSEL) rndWeights[1] = 1-gRandom->Uniform()*0.02;
	if(theMinSelType == ESEL || theMinSelType == MGSEL ||theMinSelType == MMGSEL) rndWeights[2] = 1+gRandom->Uniform()*0.02;
	if(theMinSelType == ESEL || theMinSelType == MGSEL ||theMinSelType == MMGSEL) rndWeights[3] = 1-gRandom->Uniform()*0.02;
	if(theMinSelType != ESEL) rndWeights[4] = 1+gRandom->Uniform()*0.02;
	if(theMinSelType != ESEL) rndWeights[5] = 1-gRandom->Uniform()*0.02;

        // Avoid QCD scale weights that are anomalous high
        double maxQCDscale = (TMath::Abs(thePandaFlat.scale[0])+TMath::Abs(thePandaFlat.scale[1])+TMath::Abs(thePandaFlat.scale[2])+
	                      TMath::Abs(thePandaFlat.scale[3])+TMath::Abs(thePandaFlat.scale[4])+TMath::Abs(thePandaFlat.scale[5]))/6.0;
        if(maxQCDscale == 0) maxQCDscale = 1;

        if     (theCategory == kPlotData && dataCardSel >= 0){
          histo_Baseline[theCategory]->Fill(MVAVar,totalWeight);
        }
        else if(theCategory != kPlotData){
	  if(dataCardSel >= 0) {
	    double pdf_error = pdfUncs[0]+(gRandom->Uniform()-0.5)*0.01;
	    if(theCategory == kPlotBSM) pdf_error = pdfUncs[1]+(gRandom->Uniform()-0.5)*0.01;
	    if(theCategory == kPlotSignal1) pdf_error = pdfUncs[2]+(gRandom->Uniform()-0.5)*0.01;
	    histo_Baseline[theCategory]->Fill(MVAVar,totalWeight);
	    histo_QCDScaleBounding[theCategory][0]->Fill(MVAVar,totalWeight*TMath::Abs(thePandaFlat.scale[0])/maxQCDscale);
	    histo_QCDScaleBounding[theCategory][1]->Fill(MVAVar,totalWeight*TMath::Abs(thePandaFlat.scale[1])/maxQCDscale);
	    histo_QCDScaleBounding[theCategory][2]->Fill(MVAVar,totalWeight*TMath::Abs(thePandaFlat.scale[2])/maxQCDscale);
	    histo_QCDScaleBounding[theCategory][3]->Fill(MVAVar,totalWeight*TMath::Abs(thePandaFlat.scale[3])/maxQCDscale);
	    histo_QCDScaleBounding[theCategory][4]->Fill(MVAVar,totalWeight*TMath::Abs(thePandaFlat.scale[4])/maxQCDscale);
	    histo_QCDScaleBounding[theCategory][5]->Fill(MVAVar,totalWeight*TMath::Abs(thePandaFlat.scale[5])/maxQCDscale);
	    histo_PDFBoundingUp[theCategory]  ->Fill(MVAVar,totalWeight*TMath::Max((double)thePandaFlat.pdfUp,pdf_error));
	    histo_PDFBoundingDown[theCategory]->Fill(MVAVar,totalWeight*TMath::Min((double)thePandaFlat.pdfDown,1.0/pdf_error));
            histo_LepEffMBoundingUp  [theCategory]->Fill(MVAVar,totalWeight*muSFUnc); histo_LepEffEBoundingUp  [theCategory]->Fill(MVAVar,totalWeight*elSFUnc);
            histo_LepEffMBoundingDown[theCategory]->Fill(MVAVar,totalWeight/muSFUnc); histo_LepEffEBoundingDown[theCategory]->Fill(MVAVar,totalWeight/elSFUnc);
            histo_PUBoundingUp  [theCategory]->Fill(MVAVar,totalWeight*puWeightUp  /puWeight);
            histo_PUBoundingDown[theCategory]->Fill(MVAVar,totalWeight*puWeightDown/puWeight);
            histo_PreFireBoundingUp  [theCategory]->Fill(MVAVar,totalWeight*sf_l1PrefireE);
            histo_PreFireBoundingDown[theCategory]->Fill(MVAVar,totalWeight/sf_l1PrefireE);
            histo_TriggerDBoundingUp  [theCategory]->Fill(MVAVar,totalWeight*triggerWeights[1]);
            histo_TriggerDBoundingDown[theCategory]->Fill(MVAVar,totalWeight/triggerWeights[1]);
            histo_TriggerABoundingUp  [theCategory]->Fill(MVAVar,totalWeight*(triggerWeightsEl[0]/triggerWeights[0]));
            histo_TriggerABoundingDown[theCategory]->Fill(MVAVar,totalWeight/(triggerWeightsEl[0]/triggerWeights[0]));
	    histo_PhoEffBoundingUp  [theCategory]->Fill(MVAVar,totalWeight*photonSFUnc[0]);
	    histo_PhoEffBoundingDown[theCategory]->Fill(MVAVar,totalWeight/photonSFUnc[0]);
	    histo_PhoFakeBoundingUp  [theCategory]->Fill(MVAVar,totalWeight*photonSFUnc[1]);
	    histo_PhoFakeBoundingDown[theCategory]->Fill(MVAVar,totalWeight/photonSFUnc[1]);
	    histo_ElToPhDefBoundingUp  [theCategory]->Fill(MVAVar,totalWeight*photonSFUnc[2]);
	    histo_ElToPhDefBoundingDown[theCategory]->Fill(MVAVar,totalWeight/photonSFUnc[2]);
	    histo_ElToPhAltBoundingUp  [theCategory]->Fill(MVAVar,totalWeight*photonSFUnc[3]);
	    histo_ElToPhAltBoundingDown[theCategory]->Fill(MVAVar,totalWeight/photonSFUnc[3]);
	  }
	  for(int nj=0; nj<nJESTypes; nj++){
	    if(nj == theJESType) {
                if(passSystCuts[JESUP])   histo_JESBoundingUp  [nj][theCategory]->Fill(MVAVarUp  ,totalWeight);
                if(passSystCuts[JESDOWN]) histo_JESBoundingDown[nj][theCategory]->Fill(MVAVarDown,totalWeight);
            } else {
              if(dataCardSel >= 0) histo_JESBoundingUp  [nj][theCategory]->Fill(MVAVar,totalWeight);
              if(dataCardSel >= 0) histo_JESBoundingDown[nj][theCategory]->Fill(MVAVar,totalWeight);
	    }
	  }
          if(dataCardSel >= 0) histo_ScaleMBoundingUp  [theCategory]->Fill(MVAVar,totalWeight*rndWeights[0]);
          if(dataCardSel >= 0) histo_ScaleMBoundingDown[theCategory]->Fill(MVAVar,totalWeight*rndWeights[1]);
          if(dataCardSel >= 0) histo_ScaleEBoundingUp  [theCategory]->Fill(MVAVar,totalWeight*rndWeights[2]);
          if(dataCardSel >= 0) histo_ScaleEBoundingDown[theCategory]->Fill(MVAVar,totalWeight*rndWeights[3]);
          if(dataCardSel >= 0) histo_ScaleGBoundingUp  [theCategory]->Fill(MVAVar,totalWeight*rndWeights[4]);
          if(dataCardSel >= 0) histo_ScaleGBoundingDown[theCategory]->Fill(MVAVar,totalWeight*rndWeights[5]);
        }
      } // End datacard making
    } // end events loop
    printf("srYields: %.2f +/- %.2f / %.2f +/- %.2f / %.2f +/- %.2f / %.2f +/- %.2f\n",
            srYields[0],sqrt(srYieldsE[0]),srYields[1],sqrt(srYieldsE[1]),
            srYields[2],sqrt(srYieldsE[2]),srYields[3],sqrt(srYieldsE[3]));
    the_input_file->Close();
  } // end chain loop

  // Mismeasured photon
  if(histoMTGMET0p50->GetSumOfWeights() > 0){
    for(int i=1; i<=nBinMVA1D; i++) {
      histo_Baseline[kPlotPhotonE0]->SetBinContent(i+        0,histoMTGMET0p50->GetBinContent(i));
      histo_GJPhotonE0Up           ->SetBinContent(i+        0,histoMTGMET0p75->GetBinContent(i));
      histo_GJPhotonE0Down         ->SetBinContent(i+        0,histoMTGMET0p25->GetBinContent(i));
      histo_Baseline[kPlotPhotonE1]->SetBinContent(i+nBinMVA/2,histoMTGMET0p50->GetBinContent(i));
      histo_GJPhotonE1Up           ->SetBinContent(i+nBinMVA/2,histoMTGMET0p75->GetBinContent(i));
      histo_GJPhotonE1Down         ->SetBinContent(i+nBinMVA/2,histoMTGMET0p25->GetBinContent(i));
    }
    double normPhotonE0 = 25.0; if(year != 2016) normPhotonE0 = 1.0; if(isHVBFGAna) normPhotonE0 = 0.0;
    histo_Baseline[kPlotPhotonE0]->Scale(normPhotonE0/histo_Baseline[kPlotPhotonE0]->GetSumOfWeights());
    histo_GJPhotonE0Up           ->Scale(normPhotonE0/histo_GJPhotonE0Up		 ->GetSumOfWeights());
    histo_GJPhotonE0Down         ->Scale(normPhotonE0/histo_GJPhotonE0Down 	 ->GetSumOfWeights());
    double normPhotonE1 = 10.0; if(year != 2016) normPhotonE1 = 1.0; if(isHVBFGAna) normPhotonE1 = 0.0;
    histo_Baseline[kPlotPhotonE1]->Scale(normPhotonE1/histo_Baseline[kPlotPhotonE1]->GetSumOfWeights());
    histo_GJPhotonE1Up           ->Scale(normPhotonE1/histo_GJPhotonE1Up		 ->GetSumOfWeights());
    histo_GJPhotonE1Down         ->Scale(normPhotonE1/histo_GJPhotonE1Down 	 ->GetSumOfWeights());

    for(int nb=1; nb<=histo_Baseline[kPlotPhotonE0]->GetNbinsX(); nb++){
      histo[VBFGSEL+0][kPlotPhotonE0]->SetBinContent(nb,histoMTGMET0p50->GetBinContent(nb)); histo[VBFGSEL+0][kPlotPhotonE0]->SetBinError(nb,histoMTGMET0p50->GetBinError(nb));
      histo[VBFGSEL+5][kPlotPhotonE1]->SetBinContent(nb,histoMTGMET0p50->GetBinContent(nb)); histo[VBFGSEL+5][kPlotPhotonE1]->SetBinError(nb,histoMTGMET0p50->GetBinError(nb));
    }
    histo[VBFGSEL+0][kPlotPhotonE0]->Scale(normPhotonE0/histo[VBFGSEL+0][kPlotPhotonE0]->GetSumOfWeights());
    histo[VBFGSEL+5][kPlotPhotonE1]->Scale(normPhotonE1/histo[VBFGSEL+5][kPlotPhotonE1]->GetSumOfWeights());
    histoMTGMETMJJ[0][kPlotPhotonE0]->Add(histoMTGMETFit); histoMTGMETMJJ[0][kPlotPhotonE0]->Scale(normPhotonE0/histoMTGMETMJJ[0][kPlotPhotonE0]->GetSumOfWeights());
    histoMTGMETMJJ[1][kPlotPhotonE1]->Add(histoMTGMETFit); histoMTGMETMJJ[1][kPlotPhotonE1]->Scale(normPhotonE1/histoMTGMETMJJ[1][kPlotPhotonE1]->GetSumOfWeights());
  }

  // GJ
  histo_GJNorm0Up  ->Add(histo_Baseline[kPlotGJ0]);
  histo_GJNorm0Down->Add(histo_Baseline[kPlotGJ0]);
  histo_GJNorm1Up  ->Add(histo_Baseline[kPlotGJ0]);
  histo_GJNorm1Down->Add(histo_Baseline[kPlotGJ0]);
  for(int i=1; i<=histo_Baseline[kPlotGJ0]->GetNbinsX(); i++) {
    if     (histo_Baseline[kPlotGJ0]->GetBinCenter(i) <=  5000){
      histo_GJNorm0Up  ->SetBinContent(i,histo_GJNorm0Up  ->GetBinContent(i)*100.0);
      histo_GJNorm0Down->SetBinContent(i,histo_GJNorm0Down->GetBinContent(i)/100.0);
    }
    else if(histo_Baseline[kPlotGJ0]->GetBinCenter(i) <= 10000){
      histo_GJNorm1Up  ->SetBinContent(i,histo_GJNorm1Up  ->GetBinContent(i)*100.0);
      histo_GJNorm1Down->SetBinContent(i,histo_GJNorm1Down->GetBinContent(i)/100.0);
    }
  }

  // WJ
  histo_WJNorm00Up  ->Add(histo_Baseline[kPlotWJ0]);
  histo_WJNorm00Down->Add(histo_Baseline[kPlotWJ0]);
  histo_WJNorm01Up  ->Add(histo_Baseline[kPlotWJ0]);
  histo_WJNorm01Down->Add(histo_Baseline[kPlotWJ0]);
  histo_WJNorm02Up  ->Add(histo_Baseline[kPlotWJ0]);
  histo_WJNorm02Down->Add(histo_Baseline[kPlotWJ0]);
  histo_WJNorm10Up  ->Add(histo_Baseline[kPlotWJ0]);
  histo_WJNorm10Down->Add(histo_Baseline[kPlotWJ0]);
  histo_WJNorm11Up  ->Add(histo_Baseline[kPlotWJ0]);
  histo_WJNorm11Down->Add(histo_Baseline[kPlotWJ0]);
  histo_WJNorm12Up  ->Add(histo_Baseline[kPlotWJ0]);
  histo_WJNorm12Down->Add(histo_Baseline[kPlotWJ0]);
  for(int i=1; i<=histo_Baseline[kPlotWJ0]->GetNbinsX(); i++) {
    if     (histo_Baseline[kPlotWJ0]->GetBinCenter(i) <= mtgSplit0){
      histo_WJNorm00Up  ->SetBinContent(i,histo_WJNorm00Up  ->GetBinContent(i)*100.0);
      histo_WJNorm00Down->SetBinContent(i,histo_WJNorm00Down->GetBinContent(i)/100.0);
    }
    else if(histo_Baseline[kPlotWJ0]->GetBinCenter(i) <= mtgSplit1){
      histo_WJNorm01Up  ->SetBinContent(i,histo_WJNorm01Up  ->GetBinContent(i)*100.0);
      histo_WJNorm01Down->SetBinContent(i,histo_WJNorm01Down->GetBinContent(i)/100.0);
    }
    else if(histo_Baseline[kPlotWJ0]->GetBinCenter(i) <= 1000){
      histo_WJNorm02Up  ->SetBinContent(i,histo_WJNorm02Up  ->GetBinContent(i)*100.0);
      histo_WJNorm02Down->SetBinContent(i,histo_WJNorm02Down->GetBinContent(i)/100.0);
    }
    else if(histo_Baseline[kPlotWJ0]->GetBinCenter(i) <= 1000 + mtgSplit0){
      histo_WJNorm00Up  ->SetBinContent(i,histo_WJNorm00Up  ->GetBinContent(i)*100.0);
      histo_WJNorm00Down->SetBinContent(i,histo_WJNorm00Down->GetBinContent(i)/100.0);
    }
    else if(histo_Baseline[kPlotWJ0]->GetBinCenter(i) <= 1000 + mtgSplit1){
      histo_WJNorm01Up  ->SetBinContent(i,histo_WJNorm01Up  ->GetBinContent(i)*100.0);
      histo_WJNorm01Down->SetBinContent(i,histo_WJNorm01Down->GetBinContent(i)/100.0);
    }
    else if(histo_Baseline[kPlotWJ0]->GetBinCenter(i) <= 1000 + 1000){
      histo_WJNorm02Up  ->SetBinContent(i,histo_WJNorm02Up  ->GetBinContent(i)*100.0);
      histo_WJNorm02Down->SetBinContent(i,histo_WJNorm02Down->GetBinContent(i)/100.0);
    }
    else if(histo_Baseline[kPlotWJ0]->GetBinCenter(i) <= 5000){
    }
    else if(histo_Baseline[kPlotWJ0]->GetBinCenter(i) <= mtgSplit0 + 5000){
      histo_WJNorm10Up  ->SetBinContent(i,histo_WJNorm10Up  ->GetBinContent(i)*100.0);
      histo_WJNorm10Down->SetBinContent(i,histo_WJNorm10Down->GetBinContent(i)/100.0);
    }
    else if(histo_Baseline[kPlotWJ0]->GetBinCenter(i) <= mtgSplit1 + 5000){
      histo_WJNorm11Up  ->SetBinContent(i,histo_WJNorm11Up  ->GetBinContent(i)*100.0);
      histo_WJNorm11Down->SetBinContent(i,histo_WJNorm11Down->GetBinContent(i)/100.0);
    }
    else if(histo_Baseline[kPlotWJ0]->GetBinCenter(i) <= 1000 + 5000){
      histo_WJNorm12Up  ->SetBinContent(i,histo_WJNorm12Up  ->GetBinContent(i)*100.0);
      histo_WJNorm12Down->SetBinContent(i,histo_WJNorm12Down->GetBinContent(i)/100.0);
    }
    else if(histo_Baseline[kPlotWJ0]->GetBinCenter(i) <= 1000 + mtgSplit0 + 5000){
      histo_WJNorm10Up  ->SetBinContent(i,histo_WJNorm10Up  ->GetBinContent(i)*100.0);
      histo_WJNorm10Down->SetBinContent(i,histo_WJNorm10Down->GetBinContent(i)/100.0);
    }
    else if(histo_Baseline[kPlotWJ0]->GetBinCenter(i) <= 1000 + mtgSplit1 + 5000){
      histo_WJNorm11Up  ->SetBinContent(i,histo_WJNorm11Up  ->GetBinContent(i)*100.0);
      histo_WJNorm11Down->SetBinContent(i,histo_WJNorm11Down->GetBinContent(i)/100.0);
    }
    else if(histo_Baseline[kPlotWJ0]->GetBinCenter(i) <= 1000 + 1000 + 5000){
      histo_WJNorm12Up  ->SetBinContent(i,histo_WJNorm12Up  ->GetBinContent(i)*100.0);
      histo_WJNorm12Down->SetBinContent(i,histo_WJNorm12Down->GetBinContent(i)/100.0);
    }
    else if(histo_Baseline[kPlotWJ0]->GetBinCenter(i) <= 10000){
    }
  }

  for(int ic=1; ic<nPlotCategories; ic++) if(histo_Baseline[ic]->GetSumOfWeights() < 0) histo_Baseline[ic]->Scale(0.0);
  for(int ic=0; ic<nPlotCategories; ic++) histo[allPlots-1][ic]->Add(histo_Baseline[ic]);

  double qcdScaleTotal[2] = {1.005, 1.021}; // VBF, ggH

  for(unsigned ic=0; ic<nPlotCategories; ic++) {
    if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    for(int nb=1; nb<=histo_Baseline[ic]->GetNbinsX(); nb++){
      histo_Baseline[ic]->SetBinContent(nb, TMath::Max((float)histo_Baseline[ic]->GetBinContent(nb),0.0f));
      // compute QCD scale uncertainties bin-by-bin
      double diffQCDScale[6] = {
       TMath::Abs(histo_QCDScaleBounding[ic][0]->GetBinContent(nb)-histo_Baseline[ic]->GetBinContent(nb)),
       TMath::Abs(histo_QCDScaleBounding[ic][1]->GetBinContent(nb)-histo_Baseline[ic]->GetBinContent(nb)),
       TMath::Abs(histo_QCDScaleBounding[ic][2]->GetBinContent(nb)-histo_Baseline[ic]->GetBinContent(nb)),
       TMath::Abs(histo_QCDScaleBounding[ic][3]->GetBinContent(nb)-histo_Baseline[ic]->GetBinContent(nb)),
       TMath::Abs(histo_QCDScaleBounding[ic][4]->GetBinContent(nb)-histo_Baseline[ic]->GetBinContent(nb)),
       TMath::Abs(histo_QCDScaleBounding[ic][5]->GetBinContent(nb)-histo_Baseline[ic]->GetBinContent(nb))};

      double systQCDScale = diffQCDScale[0];
      for(int nqcd=1; nqcd<6; nqcd++) {
        if(diffQCDScale[nqcd] > systQCDScale) systQCDScale = diffQCDScale[nqcd];
      }

      if(histo_Baseline[ic]->GetBinContent(nb) > 0) 
        systQCDScale = 1.0+systQCDScale/histo_Baseline[ic]->GetBinContent(nb);
      else systQCDScale = 1;

      histo_QCDScaleUp  [ic]->SetBinContent(nb, histo_Baseline[ic]->GetBinContent(nb)*systQCDScale);
      histo_QCDScaleDown[ic]->SetBinContent(nb, histo_Baseline[ic]->GetBinContent(nb)/systQCDScale);

      histo_Baseline              [ic]->SetBinContent(nb, TMath::Max((float)histo_Baseline		[ic]->GetBinContent(nb),0.0f));
      histo_QCDScaleUp  	  [ic]->SetBinContent(nb, TMath::Max((float)histo_QCDScaleUp		[ic]->GetBinContent(nb),0.0f));
      histo_QCDScaleDown	  [ic]->SetBinContent(nb, TMath::Max((float)histo_QCDScaleDown  	[ic]->GetBinContent(nb),0.0f));
      histo_PDFBoundingUp	  [ic]->SetBinContent(nb, TMath::Max((float)histo_PDFBoundingUp 	[ic]->GetBinContent(nb),0.0f));
      histo_PDFBoundingDown	  [ic]->SetBinContent(nb, TMath::Max((float)histo_PDFBoundingDown	[ic]->GetBinContent(nb),0.0f));
      histo_LepEffMBoundingUp	  [ic]->SetBinContent(nb, TMath::Max((float)histo_LepEffMBoundingUp	[ic]->GetBinContent(nb),0.0f));
      histo_LepEffMBoundingDown   [ic]->SetBinContent(nb, TMath::Max((float)histo_LepEffMBoundingDown	[ic]->GetBinContent(nb),0.0f));
      histo_LepEffEBoundingUp	  [ic]->SetBinContent(nb, TMath::Max((float)histo_LepEffEBoundingUp	[ic]->GetBinContent(nb),0.0f));
      histo_LepEffEBoundingDown   [ic]->SetBinContent(nb, TMath::Max((float)histo_LepEffEBoundingDown	[ic]->GetBinContent(nb),0.0f));
      histo_ScaleMBoundingUp	  [ic]->SetBinContent(nb, TMath::Max((float)histo_ScaleMBoundingUp      [ic]->GetBinContent(nb),0.0f));
      histo_ScaleMBoundingDown    [ic]->SetBinContent(nb, TMath::Max((float)histo_ScaleMBoundingDown    [ic]->GetBinContent(nb),0.0f));
      histo_ScaleEBoundingUp	  [ic]->SetBinContent(nb, TMath::Max((float)histo_ScaleEBoundingUp      [ic]->GetBinContent(nb),0.0f));
      histo_ScaleEBoundingDown    [ic]->SetBinContent(nb, TMath::Max((float)histo_ScaleEBoundingDown    [ic]->GetBinContent(nb),0.0f));
      histo_ScaleGBoundingUp	  [ic]->SetBinContent(nb, TMath::Max((float)histo_ScaleGBoundingUp      [ic]->GetBinContent(nb),0.0f));
      histo_ScaleGBoundingDown    [ic]->SetBinContent(nb, TMath::Max((float)histo_ScaleGBoundingDown    [ic]->GetBinContent(nb),0.0f));
      histo_PUBoundingUp	  [ic]->SetBinContent(nb, TMath::Max((float)histo_PUBoundingUp  	[ic]->GetBinContent(nb),0.0f));
      histo_PUBoundingDown	  [ic]->SetBinContent(nb, TMath::Max((float)histo_PUBoundingDown	[ic]->GetBinContent(nb),0.0f));
      histo_PUBoundingDown        [ic]->SetBinContent(nb, TMath::Max((float)(2*histo_Baseline[ic]->GetBinContent(nb)-histo_PUBoundingUp[ic]->GetBinContent(nb)),0.00001f));
      histo_PreFireBoundingUp     [ic]->SetBinContent(nb, TMath::Max((float)histo_PreFireBoundingUp     [ic]->GetBinContent(nb),0.0f));
      histo_PreFireBoundingDown   [ic]->SetBinContent(nb, TMath::Max((float)histo_PreFireBoundingDown   [ic]->GetBinContent(nb),0.0f));
      histo_TriggerDBoundingUp    [ic]->SetBinContent(nb, TMath::Max((float)histo_TriggerDBoundingUp	[ic]->GetBinContent(nb),0.0f));
      histo_TriggerDBoundingDown  [ic]->SetBinContent(nb, TMath::Max((float)histo_TriggerDBoundingDown  [ic]->GetBinContent(nb),0.0f));
      histo_TriggerABoundingUp    [ic]->SetBinContent(nb, TMath::Max((float)histo_TriggerABoundingUp	[ic]->GetBinContent(nb),0.0f));
      histo_TriggerABoundingDown  [ic]->SetBinContent(nb, TMath::Max((float)histo_TriggerABoundingDown  [ic]->GetBinContent(nb),0.0f));
      for(int nj=0; nj<nJESTypes; nj++){
      histo_JESBoundingUp  [nj][ic]->SetBinContent(nb, TMath::Max((float)histo_JESBoundingUp  [nj][ic]->GetBinContent(nb),0.00001f));
      histo_JESBoundingDown[nj][ic]->SetBinContent(nb, TMath::Max((float)histo_JESBoundingDown[nj][ic]->GetBinContent(nb),0.00001f));
      histo_JESBoundingDown[nj][ic]->SetBinContent(nb, TMath::Max((float)(2*histo_Baseline[ic]->GetBinContent(nb)-histo_JESBoundingUp[nj][ic]->GetBinContent(nb)),0.00001f));
      }
      histo_PhoEffBoundingUp	  [ic]->SetBinContent(nb, TMath::Max((float)histo_PhoEffBoundingUp     [ic]->GetBinContent(nb),0.0f));
      histo_PhoEffBoundingDown    [ic]->SetBinContent(nb, TMath::Max((float)histo_PhoEffBoundingDown   [ic]->GetBinContent(nb),0.0f));
      histo_PhoFakeBoundingUp	  [ic]->SetBinContent(nb, TMath::Max((float)histo_PhoFakeBoundingUp    [ic]->GetBinContent(nb),0.0f));
      histo_PhoFakeBoundingDown   [ic]->SetBinContent(nb, TMath::Max((float)histo_PhoFakeBoundingDown  [ic]->GetBinContent(nb),0.0f));
      histo_ElToPhDefBoundingUp   [ic]->SetBinContent(nb, TMath::Max((float)histo_ElToPhDefBoundingUp  [ic]->GetBinContent(nb),0.0f));
      histo_ElToPhDefBoundingDown [ic]->SetBinContent(nb, TMath::Max((float)histo_ElToPhDefBoundingDown[ic]->GetBinContent(nb),0.0f));
      histo_ElToPhAltBoundingUp   [ic]->SetBinContent(nb, TMath::Max((float)histo_ElToPhAltBoundingUp  [ic]->GetBinContent(nb),0.0f));
      histo_ElToPhAltBoundingDown [ic]->SetBinContent(nb, TMath::Max((float)histo_ElToPhAltBoundingDown[ic]->GetBinContent(nb),0.0f));
    }
    if(ic == kPlotBSM || ic == kPlotSignal1 || ic == kPlotZG ||
       ic == kPlotGJ0 || ic == kPlotGJ1 ||
       ic == kPlotWG  ||
       ic == kPlotWJ0 || ic == kPlotWJ1 || ic == kPlotWJ2 || ic == kPlotWJ3 || ic == kPlotWJ4 || ic == kPlotWJ5) {
      histo_QCDScaleUp  [ic]->Scale(histo_Baseline[ic]->GetSumOfWeights()/histo_QCDScaleUp  [ic]->GetSumOfWeights());
      histo_QCDScaleDown[ic]->Scale(histo_Baseline[ic]->GetSumOfWeights()/histo_QCDScaleDown[ic]->GetSumOfWeights());
    }
    if(ic == kPlotZG ||
       ic == kPlotGJ0 || ic == kPlotGJ1 ||
       ic == kPlotWG  ||
       ic == kPlotWJ0 || ic == kPlotWJ1 || ic == kPlotWJ2 || ic == kPlotWJ3 || ic == kPlotWJ4 || ic == kPlotWJ5) {
      for(int nj=0; nj<nJESTypes; nj++){
        histo_JESBoundingUp  [nj][ic]->Scale(histo_Baseline[ic]->GetSumOfWeights()/histo_JESBoundingUp  [nj][ic]->GetSumOfWeights());
        histo_JESBoundingDown[nj][ic]->Scale(histo_Baseline[ic]->GetSumOfWeights()/histo_JESBoundingDown[nj][ic]->GetSumOfWeights());
      }
    }
  }

  if(showSyst == true){
    printf("Yields\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) printf("%6.2f ",histo_Baseline[ic]->GetBinContent(i)); printf("\n");
    }
    printf("uncertainties Statistical\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_Baseline[ic]->GetBinError(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }
    printf("uncertainties QCDSCALEUp\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_QCDScaleUp[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }
    printf("uncertainties QCDSCALEDown\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_QCDScaleDown[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }

    printf("uncertainties PDFUp\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_PDFBoundingUp[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }
    printf("uncertainties PDFDown\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_PDFBoundingDown[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }

    printf("uncertainties LEPEFFMUp\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_LepEffMBoundingUp[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }
    printf("uncertainties LEPEFFMDown\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_LepEffMBoundingDown[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }

    printf("uncertainties LEPEFFEUp\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_LepEffEBoundingUp[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }
    printf("uncertainties LEPEFFEDown\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_LepEffEBoundingDown[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }

    printf("uncertainties ScaleMUp\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_ScaleMBoundingUp[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }
    printf("uncertainties ScaleMDown\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_ScaleMBoundingDown[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }

    printf("uncertainties ScaleEUp\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_ScaleEBoundingUp[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }
    printf("uncertainties ScaleEDown\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_ScaleEBoundingDown[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }

    printf("uncertainties ScaleGUp\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_ScaleGBoundingUp[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }
    printf("uncertainties ScaleGDown\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_ScaleGBoundingDown[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }

    printf("uncertainties PUUp\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_PUBoundingUp[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }
    printf("uncertainties PUDown\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_PUBoundingDown[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }

    printf("uncertainties PreFireUp\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    	 printf("%10s: ",plotBaseNames[ic].Data());
    	for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_PreFireBoundingUp[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }
    printf("uncertainties PreFireDown\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    	 printf("%10s: ",plotBaseNames[ic].Data());
    	for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_PreFireBoundingDown[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }

    printf("uncertainties TriggerMUp\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    	 printf("%10s: ",plotBaseNames[ic].Data());
    	for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_TriggerDBoundingUp[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }
    printf("uncertainties TriggerMDown\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    	 printf("%10s: ",plotBaseNames[ic].Data());
    	for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_TriggerDBoundingDown[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }

    printf("uncertainties TriggerEUp\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    	 printf("%10s: ",plotBaseNames[ic].Data());
    	for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_TriggerABoundingUp[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }
    printf("uncertainties TriggerEDown\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    	 printf("%10s: ",plotBaseNames[ic].Data());
    	for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_TriggerABoundingDown[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }

    for(int nj=0; nj<nJESTypes; nj++){
      printf("uncertainties jes (%d)\n",nj);
      printf("uncertainties JESUp\n");
      for(unsigned ic=0; ic<nPlotCategories; ic++) {
	if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
           printf("%10s: ",plotBaseNames[ic].Data());
          for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_JESBoundingUp[nj][ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
      }
      printf("uncertainties JESDown\n");
      for(unsigned ic=0; ic<nPlotCategories; ic++) {
	if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
           printf("%10s: ",plotBaseNames[ic].Data());
          for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_JESBoundingDown[nj][ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
      }
      printf("---------\n");
    }

    printf("uncertainties PHOEFFUp\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_PhoEffBoundingUp[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }
    printf("uncertainties PHOEFFDown\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_PhoEffBoundingDown[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }

    printf("uncertainties PHOFakeUp\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_PhoFakeBoundingUp[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }
    printf("uncertainties PHOFakeDown\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_PhoFakeBoundingDown[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }

    printf("uncertainties ElToPhDefUp\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_ElToPhDefBoundingUp[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }
    printf("uncertainties ElToPhDefDown\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_ElToPhDefBoundingDown[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }
    printf("uncertainties ElToPhAltUp\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_ElToPhAltBoundingUp[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }
    printf("uncertainties ElToPhAltDown\n");
    for(unsigned ic=0; ic<nPlotCategories; ic++) {
      if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
         printf("%10s: ",plotBaseNames[ic].Data());
        for(int i=1; i<=histo_MVA->GetNbinsX(); i++) {if(histo_Baseline[ic]->GetBinContent(i)>0)printf("%5.1f ",histo_ElToPhAltBoundingDown[ic]->GetBinContent(i)/histo_Baseline[ic]->GetBinContent(i)*100);else printf("100.0 ");} printf("\n");
    }

  }

  //histo_Baseline[kPlotData]->Add(histo_Baseline[kPlotBSM],0.300);
  //histo_Baseline[kPlotData]->Add(histo_Baseline[kPlotSignal1],0.300);

  // Filling datacards input root file
  char outputLimits[200];
  sprintf(outputLimits,"vbfg_%d_trigger%d_mH%d_input.root",year,triggerCat,mH);
  TFile* outFileLimits = new TFile(outputLimits,"recreate");
  outFileLimits->cd();

  double theScale;
  for(unsigned ic=0; ic<nPlotCategories; ic++) {
    if(ic != kPlotData && histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    histo_Baseline		[ic]->Write();
    if(ic == kPlotData) continue;
    histo_QCDScaleUp		[ic]->Write();
    histo_QCDScaleDown  	[ic]->Write();
    histo_PDFBoundingUp 	[ic]->Write();
    histo_PDFBoundingDown	[ic]->Write();
    histo_LepEffMBoundingUp	[ic]->Write();
    histo_LepEffMBoundingDown	[ic]->Write();
    histo_LepEffEBoundingUp	[ic]->Write();
    histo_LepEffEBoundingDown	[ic]->Write();
    histo_ScaleMBoundingUp      [ic]->Write();
    histo_ScaleMBoundingDown    [ic]->Write();
    histo_ScaleEBoundingUp      [ic]->Write();
    histo_ScaleEBoundingDown    [ic]->Write();
    histo_ScaleGBoundingUp      [ic]->Write();
    histo_ScaleGBoundingDown    [ic]->Write();
    histo_PUBoundingUp  	[ic]->Write();
    histo_PUBoundingDown	[ic]->Write();
    histo_PreFireBoundingUp 	[ic]->Write();
    histo_PreFireBoundingDown	[ic]->Write();
    histo_TriggerDBoundingUp 	[ic]->Write();
    histo_TriggerDBoundingDown	[ic]->Write();
    histo_TriggerABoundingUp 	[ic]->Write();
    histo_TriggerABoundingDown	[ic]->Write();
    for(int nj=0; nj<nJESTypes; nj++){
    histo_JESBoundingUp 	[nj][ic]->Write();
    histo_JESBoundingDown	[nj][ic]->Write();
    }
    histo_PhoEffBoundingUp     [ic]->Write();
    histo_PhoEffBoundingDown   [ic]->Write();
    histo_PhoFakeBoundingUp    [ic]->Write();
    histo_PhoFakeBoundingDown  [ic]->Write();
    histo_ElToPhDefBoundingUp  [ic]->Write();
    histo_ElToPhDefBoundingDown[ic]->Write();
    histo_ElToPhAltBoundingUp  [ic]->Write();
    histo_ElToPhAltBoundingDown[ic]->Write();
  }
  histo_GJPhotonE0Up  ->Write();
  histo_GJPhotonE0Down->Write();
  histo_GJPhotonE1Up  ->Write();
  histo_GJPhotonE1Down->Write();
  histo_GJNorm0Up  ->Write();
  histo_GJNorm0Down->Write();
  histo_GJNorm1Up  ->Write();
  histo_GJNorm1Down->Write();
  histo_WJNorm00Up  ->Write();
  histo_WJNorm00Down->Write();
  histo_WJNorm01Up  ->Write();
  histo_WJNorm01Down->Write();
  histo_WJNorm02Up  ->Write();
  histo_WJNorm02Down->Write();
  histo_WJNorm10Up  ->Write();
  histo_WJNorm10Down->Write();
  histo_WJNorm11Up  ->Write();
  histo_WJNorm11Down->Write();
  histo_WJNorm12Up  ->Write();
  histo_WJNorm12Down->Write();
  outFileLimits->Close();


  // Filling datacards txt file
  char outputLimitsCard[200];  					  
  sprintf(outputLimitsCard,"datacard_vbfg_%d_trigger%d_mH%d.txt",year,triggerCat,mH);
  ofstream newcardShape;
  newcardShape.open(outputLimitsCard);
  newcardShape << Form("imax * number of channels\n");
  newcardShape << Form("jmax * number of background minus 1\n");
  newcardShape << Form("kmax * number of nuisance parameters\n");

  newcardShape << Form("shapes    *   *   %s  histo_$PROCESS histo_$PROCESS_$SYSTEMATIC\n",outputLimits);
  newcardShape << Form("shapes data_obs * %s  histo_Data\n",outputLimits);

  newcardShape << Form("Observation %f\n",histo_Baseline[kPlotData]->GetSumOfWeights());

  newcardShape << Form("bin   ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    newcardShape << Form("ch1  ");
  }
  newcardShape << Form("\n");
 
  newcardShape << Form("process  ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    newcardShape << Form("%s  ", plotBaseNames[ic].Data());
  }
  newcardShape << Form("\n");


  newcardShape << Form("process  ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic != kPlotBSM) newcardShape << Form("%d  ", ic);
    else               newcardShape << Form("%d  ", 0);
  }
  newcardShape << Form("\n");

  newcardShape << Form("rate  ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    newcardShape << Form("%f  ", histo_Baseline[ic]->GetSumOfWeights());
  }
  newcardShape << Form("\n");

  newcardShape << Form("lumi_13TeV_%d    lnN     ",year);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1) newcardShape << Form("- ");
    else                                                                   newcardShape << Form("%6.3f ",lumiE[whichYear]);
  }
  newcardShape << Form("\n");

  newcardShape << Form("UEPS    lnN     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic != kPlotBSM && ic != kPlotSignal1) newcardShape << Form(" - ");
    else                                     newcardShape << Form("%f  ", 1.02);
  }
  newcardShape << Form("\n");

  newcardShape << Form("QCDscaleVBFTotal    lnN     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic != kPlotBSM) newcardShape << Form("- ");
    else               newcardShape << Form("%f ",qcdScaleTotal[0]);
  }
  newcardShape << Form("\n");

  if(histo_Baseline[kPlotSignal1]->GetSumOfWeights() > 0){
    newcardShape << Form("QCDscaleggHTotal    lnN     ");
    for (int ic=0; ic<nPlotCategories; ic++){
      if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
      if(ic != kPlotSignal1) newcardShape << Form("- ");
      else                   newcardShape << Form("%f ",qcdScaleTotal[1]);
    }
    newcardShape << Form("\n");
  }

  for(unsigned ic=0; ic<nPlotCategories; ic++) {
    if(ic == kPlotData || ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1 || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    newcardShape << Form("QCDScale_%s_ACCEPT    shape   ",plotBaseNames[ic].Data());
    for(unsigned ic2=0; ic2<nPlotCategories; ic2++) {
      if(ic2 == kPlotData || histo_Baseline[ic2]->GetSumOfWeights() <= 0) continue;
          if(ic==ic2) newcardShape << Form("1.0  ");
          else        newcardShape << Form("-  ");
      }
      newcardShape << Form("\n");
  }

  newcardShape << Form("PDF    shape     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1) newcardShape << Form("- ");
    else                                                                   newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_eff_m    shape     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1) newcardShape << Form("- ");
    else                                                                   newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_eff_e    shape     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1) newcardShape << Form("- ");
    else                                                                   newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_scale_m    shape     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1) newcardShape << Form("- ");
    else                                                                   newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_scale_e    shape     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1) newcardShape << Form("- ");
    else                                                                   newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_scale_p    shape     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1) newcardShape << Form("- ");
    else                                                                   newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_pu    shape     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1) newcardShape << Form("- ");
    else                                                                   newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  for(int nj=0; nj<nJESTypes; nj++){
  newcardShape << Form("CMS_jes_%d_%d    shape     ",nj,year);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1) newcardShape << Form("- ");
    else                                                                   newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");
  }

  newcardShape << Form("CMS_prefire_%d    shape     ",year);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1) newcardShape << Form("- ");
    else                                                                   newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_triggerD%d_%d    shape     ",triggerCat,year);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1) newcardShape << Form("- ");
    else                                                                   newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_triggerA%d_%d    shape     ",triggerCat,year);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1) newcardShape << Form("- ");
    else                                                                   newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_eff_photon    shape     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1) newcardShape << Form("- ");
    else                                                                   newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_fake_photon_%d    shape     ",year);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotPhotonE0 || ic == kPlotPhotonE1) newcardShape << Form("- ");
    else                                           newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_fake_elDef_%d    shape     ",year);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1) newcardShape << Form("- ");
    else                                                                   newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_fake_elAlt_%d    shape     ",year);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt || ic == kPlotPhotonE0 || ic == kPlotPhotonE1) newcardShape << Form("- ");
    else                                                                   newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_GJPhotonE0_%d_trigger%d    shape     ",year,triggerCat);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotPhotonE0) newcardShape << Form("1.0 ");
    else                    newcardShape << Form("- ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_GJPhotonE1_%d_trigger%d    shape     ",year,triggerCat);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotPhotonE1) newcardShape << Form("1.0 ");
    else                    newcardShape << Form("- ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("ch1 autoMCStats 0\n");

  newcardShape << Form("CMS_vbfg_zgnorm rateParam * %s 1 [0,20]\n",plotBaseNames[kPlotZG].Data());

  newcardShape << Form("CMS_vbfg_wgnorm_%d rateParam * %s 1 [0,20]\n",year,plotBaseNames[kPlotWG].Data());

  if(makeUseNorm == true){

  if(histo_Baseline[kPlotGJ0]->GetSumOfWeights() > 0) newcardShape << Form("CMS_vbfg_gj0norm_%d_trigger%d  rateParam * %s 1 [0,20]\n",year,triggerCat,plotBaseNames[kPlotGJ0].Data());
  if(histo_Baseline[kPlotGJ1]->GetSumOfWeights() > 0) newcardShape << Form("CMS_vbfg_gj1norm_%d_trigger%d  rateParam * %s 1 [0,20]\n",year,triggerCat,plotBaseNames[kPlotGJ1].Data());
  if(histo_Baseline[kPlotWJ0]->GetSumOfWeights() > 0) newcardShape << Form("CMS_vbfg_wj0norm_%d_trigger%d  rateParam * %s 1 [0,20]\n",year,triggerCat,plotBaseNames[kPlotWJ0].Data());
  if(histo_Baseline[kPlotWJ1]->GetSumOfWeights() > 0) newcardShape << Form("CMS_vbfg_wj1norm_%d_trigger%d  rateParam * %s 1 [0,20]\n",year,triggerCat,plotBaseNames[kPlotWJ1].Data());
  if(histo_Baseline[kPlotWJ2]->GetSumOfWeights() > 0) newcardShape << Form("CMS_vbfg_wj2norm_%d_trigger%d  rateParam * %s 1 [0,20]\n",year,triggerCat,plotBaseNames[kPlotWJ2].Data());
  if(histo_Baseline[kPlotWJ3]->GetSumOfWeights() > 0) newcardShape << Form("CMS_vbfg_wj3norm_%d_trigger%d  rateParam * %s 1 [0,20]\n",year,triggerCat,plotBaseNames[kPlotWJ3].Data());
  if(histo_Baseline[kPlotWJ4]->GetSumOfWeights() > 0) newcardShape << Form("CMS_vbfg_wj4norm_%d_trigger%d  rateParam * %s 1 [0,20]\n",year,triggerCat,plotBaseNames[kPlotWJ4].Data());
  if(histo_Baseline[kPlotWJ5]->GetSumOfWeights() > 0) newcardShape << Form("CMS_vbfg_wj5norm_%d_trigger%d  rateParam * %s 1 [0,20]\n",year,triggerCat,plotBaseNames[kPlotWJ5].Data());

  }
  else {

  newcardShape << Form("CMS_GJNorm0_%d    shape     ",year);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotGJ0) newcardShape << Form("1.0 ");
    else               newcardShape << Form("- ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_GJNorm1_%d    shape     ",year);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotGJ0) newcardShape << Form("1.0 ");
    else               newcardShape << Form("- ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_WJNorm00_%d    shape     ",year);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotWJ0) newcardShape << Form("1.0 ");
    else               newcardShape << Form("- ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_WJNorm01_%d    shape     ",year);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotWJ0) newcardShape << Form("1.0 ");
    else               newcardShape << Form("- ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_WJNorm02_%d    shape     ",year);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotWJ0) newcardShape << Form("1.0 ");
    else               newcardShape << Form("- ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_WJNorm10_%d    shape     ",year);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotWJ0) newcardShape << Form("1.0 ");
    else               newcardShape << Form("- ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_WJNorm11_%d    shape     ",year);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotWJ0) newcardShape << Form("1.0 ");
    else               newcardShape << Form("- ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_WJNorm12_%d    shape     ",year);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotWJ0) newcardShape << Form("1.0 ");
    else               newcardShape << Form("- ");
  }
  newcardShape << Form("\n");

  }

  newcardShape << Form("CMS_vbfg_photone0norm_%d_trigger%d    lnN     ",year,triggerCat);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic != kPlotPhotonE0) newcardShape << Form(" - ");
    else                    newcardShape << Form("%f ", 2.00);
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_vbfg_photone1norm_%d_trigger%d    lnN     ",year,triggerCat);
  for (int ic=0; ic<nPlotCategories; ic++){
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic != kPlotPhotonE1) newcardShape << Form(" - ");
    else                    newcardShape << Form("%f ", 2.00);
  }
  newcardShape << Form("\n");

  newcardShape.close();

  // Writing standard histograms
  char output[200];
  for(int thePlot=0; thePlot<allPlots; thePlot++){
    sprintf(output,"histoVBFG_%d_trigger%d_mH%d_%d.root",year,triggerCat,mH,thePlot);	
    TFile* outFilePlotsNote = new TFile(output,"recreate");
    outFilePlotsNote->cd();
    double totBck = 0;
    for(int i=1; i<nPlotCategories; i++) if(histo[thePlot][i]->GetSumOfWeights() < 0) histo[thePlot][i]->Scale(0.0);
    for(int i=1; i<nPlotCategories; i++) if(i != kPlotBSM && i != kPlotSignal1) totBck = totBck + histo[thePlot][i]->GetSumOfWeights();
    printf("(%2d) %7.1f vs. %7.1f ",thePlot,histo[thePlot][0]->GetSumOfWeights(),totBck);
    printf("(");
    for(int i=1; i<nPlotCategories; i++) printf("%7.1f ",histo[thePlot][i]->GetSumOfWeights());
    printf(")\n");
    for(int np=0; np<nPlotCategories; np++) {histo[thePlot][np]->SetNameTitle(Form("histo%d",np),Form("histo%d",np));histo[thePlot][np]->Write();}
    outFilePlotsNote->Close();
  }
  for(int thePlot=0; thePlot<2; thePlot++){
    sprintf(output,"histoVBFGMTGMETMJJ_%d_trigger%d_mH%d_%d.root",year,triggerCat,mH,thePlot);	
    TFile* outFilePlotsNote = new TFile(output,"recreate");
    outFilePlotsNote->cd();
    double totBck = 0;
    for(int i=1; i<nPlotCategories; i++) if(histoMTGMETMJJ[thePlot][i]->GetSumOfWeights() < 0) histoMTGMETMJJ[thePlot][i]->Scale(0.0);
    for(int i=1; i<nPlotCategories; i++) if(i != kPlotBSM && i != kPlotSignal1) totBck = totBck + histoMTGMETMJJ[thePlot][i]->GetSumOfWeights();
    printf("(%d) %7.1f vs. %7.1f ",thePlot,histoMTGMETMJJ[thePlot][0]->GetSumOfWeights(),totBck);
    printf("(");
    for(int i=1; i<nPlotCategories; i++) printf("%7.1f ",histoMTGMETMJJ[thePlot][i]->GetSumOfWeights());
    printf(")\n");
    for(int np=0; np<nPlotCategories; np++) {histoMTGMETMJJ[thePlot][np]->SetNameTitle(Form("histo%d",np),Form("histo%d",np));histoMTGMETMJJ[thePlot][np]->Write();}
    outFilePlotsNote->Close();
  }

}
