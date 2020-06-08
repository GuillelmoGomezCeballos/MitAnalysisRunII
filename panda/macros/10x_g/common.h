#include "TH1D.h"
#include "TH2D.h"

enum selYear {Y2016, Y2017, Y2018, nYears};
const double lumiV[nYears] = {35.9, 41.5, 60.0};
const double lumiE[nYears] = {1.025, 1.023, 1.025};
const double totalLumiV = lumiV[Y2016] + lumiV[Y2017] + lumiV[Y2018];


enum LepSelectionBit {
   kLoose   =(1<<0),
   kFake    =(1<<1),
   kMedium  =(1<<2),
   kTight   =(1<<3),
   kDxyz    =(1<<4),
   kEleMvaWP90=(1<<5),
   kEleMvaWP80=(1<<6),
   kMvaMedium    =(1<<7),
   kMvaTight     =(1<<8),
   kMiniIsoMedium=(1<<9),
   kMiniIsoTight =(1<<10)
};

enum PhoSelectionBit {
   pMedium  =(1<<0),
   pTight   =(1<<1),
   pHighPt  =(1<<2),
   pCsafeVeto =(1<<3),
   pPixelVeto =(1<<4),
   pTrkVeto   =(1<<5),
   pMediumNM1  =(1<<6),
   pMediumPanda =(1<<7)
};

enum TriggerBits {
    kMETTrig     = 0,
    kSingleEleTrig,
    kSinglePhoTrig,
    kSingleMuTrig,
    kDoubleMuTrig,
    kDoubleEleTrig,
    kEMuTrig,
    kJetHTTrig,
    kMuFakeTrig,
    kEleFakeTrig,
    kVBFPhoTrig,
    kNTrig
};


enum plotCategory {
  kPlotData	 , // 0
  kPlotVV	 , // 1
  kPlotWJ0	 , // 2
  kPlotWJ1	 , // 3
  kPlotWJ2	 , // 4
  kPlotWJ3	 , // 5
  kPlotWJ4	 , // 6
  kPlotWJ5	 , // 7
  kPlotDY	 , // 8
  kPlotTop	 , // 9
  kPlotVVV	 , //10
  kPlotWG 	 , //11
  kPlotZG	 , //12
  kPlotGJ0	 , //13
  kPlotGJ1	 , //14
  kPlotNonPrompt , //15
  kPlotPhotonE0  , //16
  kPlotPhotonE1  , //17
  kPlotBSM	 , //18
  kPlotSignal0	 , //19
  kPlotSignal1	 , //20
  kPlotSignal2	 , //21
  kPlotSignal3	 , //22
  nPlotCategories
};

std::map<int, TString> plotBaseNames={
  { kPlotData	   , "Data" },
  { kPlotVV	   , "VV" },
  { kPlotWJ0	   , "WJ0" },
  { kPlotWJ1	   , "WJ1" },
  { kPlotWJ2	   , "WJ2" },
  { kPlotWJ3	   , "WJ3" },
  { kPlotWJ4	   , "WJ4" },
  { kPlotWJ5	   , "WJ5" },
  { kPlotDY	   , "DY" },
  { kPlotTop	   , "Top" },
  { kPlotVVV	   , "VVV" },
  { kPlotWG 	   , "WG" },
  { kPlotZG	   , "ZG" },
  { kPlotGJ0	   , "GJ0" },
  { kPlotGJ1	   , "GJ1" },
  { kPlotNonPrompt , "NonPrompt" },
  { kPlotPhotonE0  , "PhotonE0" },
  { kPlotPhotonE1  , "PhotonE1" },
  { kPlotBSM	   , "BSM" },
  { kPlotSignal0   , "Signal0" },
  { kPlotSignal1   , "Signal1" },
  { kPlotSignal2   , "Signal2" },
  { kPlotSignal3   , "Signal3" }
}; 

std::map<int, int> plotColors={
  { kPlotData	   , kBlack},
  { kPlotVV	   , kAzure-9},
  { kPlotWJ0	   , 901},
  { kPlotWJ1	   , kMagenta+1},
  { kPlotWJ2	   , kMagenta+2},
  { kPlotWJ3	   , kMagenta+3},
  { kPlotWJ4	   , kMagenta+4},
  { kPlotWJ5	   , kMagenta+5},
  { kPlotDY	   , kYellow},
  { kPlotTop	   , kAzure-2},
  { kPlotVVV	   , TColor::GetColor(248,206,104)},
  { kPlotWG 	   , TColor::GetColor(250,202,255)},
  { kPlotZG	   , kCyan+3},
  { kPlotGJ0	   , TColor::GetColor(222,90,106)},
  { kPlotGJ1	   , kMagenta+4},
  { kPlotNonPrompt , kAzure-9},
  { kPlotPhotonE0  , TColor::GetColor(155,152,204)},
  { kPlotPhotonE1  , 809},
  { kPlotBSM	   , kGreen},
  { kPlotSignal0   , kBlue},
  { kPlotSignal1   , kBlue},
  { kPlotSignal2   , kBlue},
  { kPlotSignal3   , kBlue}
}; 

std::map<int, TString> plotNames={
    { kPlotData      , "Data"},
    { kPlotVV	     , "VV"},
    { kPlotWJ0       , "W+jets"},
    { kPlotWJ1       , "W+jets1"},
    { kPlotWJ2       , "W+jets2"},
    { kPlotWJ3       , "W+jets3"},
    { kPlotWJ4       , "W+jets4"},
    { kPlotWJ5       , "W+jets5"},
    { kPlotDY	     , "Z+jets"},
    { kPlotTop       , "Top quark"},
    { kPlotVVV       , "VVV"},
    { kPlotWG        , "W#bf{#gamma}"},
    { kPlotZG	     , "Z#bf{#gamma}"},
    { kPlotGJ0       , "#bf{#gamma}+jets"},
    { kPlotGJ1       , "#bf{#gamma}+jets1"},
    { kPlotNonPrompt , "Nonprompt"},
    { kPlotPhotonE0  , "Mismeasured #bf{#gamma}"},
    { kPlotPhotonE1  , "Mismeasured #bf{#gamma} high m_{jj}"},
    { kPlotBSM       , "BSM"},
    { kPlotSignal0   , "Signal 0"},
    { kPlotSignal1   , "Signal 1"},
    { kPlotSignal2   , "Signal 2"},
    { kPlotSignal3   , "Signal 3"}
};

const double mass_el = 0.000510998928;
const double mass_mu = 0.10566;

double mcCorrection(int type, TString infileName, int year, int infileCat, double mjj, double mtg, int triggerCat){
  double totalWeight = 1.0;

  if(infileCat == kPlotBSM) {
    if     (infileName.Contains("VBF_HinvG")) totalWeight = totalWeight * 1.0;
    else if(infileName.Contains("125"))  totalWeight = totalWeight * 0.392500;
    else if(infileName.Contains("150"))  totalWeight = totalWeight * 0.323900;
    else if(infileName.Contains("200"))  totalWeight = totalWeight * 0.228200;
    else if(infileName.Contains("300"))  totalWeight = totalWeight * 0.125600;
    else if(infileName.Contains("500"))  totalWeight = totalWeight * 0.048720;
    else if(infileName.Contains("800"))  totalWeight = totalWeight * 0.016220;
    else if(infileName.Contains("1000")) totalWeight = totalWeight * 0.008732;
    else {printf("XS NOT FOUND!\n"); totalWeight = 0.0;}
  }

  if     (type == 0){ // VBFG

    if     (year == 2016 && (infileCat == kPlotWJ2 || infileCat == kPlotWJ5)) totalWeight = totalWeight * 2.0;
    else if(year != 2016 && (infileCat == kPlotWJ2 || infileCat == kPlotWJ5)) totalWeight = totalWeight * 2.5;

 }

  return totalWeight;
}

void trigger_eff_sf(double triggerWeights[2], double met, double r9, double pth, double mjj, double detajj, int year, int triggerCat, 
                    TH1D* trg_VBFG_r9_eff, TH1D* trg_VBFG_pth_eff, TH1D* trg_VBFG_mjj_eff, TH1D* trg_VBFG_detajj_eff, bool isElEff){
  double daTrgEff  = 1.0;
  double mcTrgEff  = 1.0;
  double sfTrgEff  = 1.0;
  double sfTrgEffE = 1.0;
  if     (year == 2016 && triggerCat == 0){
    int lastr9Bin = trg_VBFG_r9_eff->GetNbinsX();
    double myr9 = TMath::Min(r9, trg_VBFG_r9_eff->GetXaxis()->GetBinCenter(lastr9Bin));
    int myr9Bin = trg_VBFG_r9_eff->GetXaxis()->FindBin(myr9);

    int lastpthBin = trg_VBFG_pth_eff->GetNbinsX();
    double mypth = TMath::Min(pth, trg_VBFG_pth_eff->GetXaxis()->GetBinCenter(lastpthBin));
    int mypthBin = trg_VBFG_pth_eff->GetXaxis()->FindBin(mypth);

    double mymjj = TMath::Min(mjj, 999.999);
    int mymjjBin = trg_VBFG_mjj_eff->GetXaxis()->FindBin(mymjj);

    double mydetajj = TMath::Min(detajj, 4.999);
    int mydetajjBin = trg_VBFG_detajj_eff->GetXaxis()->FindBin(mydetajj);

    daTrgEff = trg_VBFG_pth_eff->GetBinContent(mypthBin) * trg_VBFG_mjj_eff->GetBinContent(mymjjBin);
    if(daTrgEff > 0) sfTrgEffE = (trg_VBFG_r9_eff->GetBinContent(myr9Bin) * trg_VBFG_detajj_eff->GetBinContent(mydetajjBin)) / daTrgEff;
  }
  else if(year == 2017 && triggerCat == 0){
    if(isElEff == false){
      double daVal[5] = {0.022571,167.320198,0.077194,0.000330,222.058189};
      double mcVal[5] = {0.025953,153.096915,0.043153,0.000338,216.578332};
      daTrgEff = 1./2*(1 + TMath::Erf(daVal[0] * (met-daVal[1]))) - daVal[2]*TMath::Exp(-daVal[3]*(met-daVal[4])*(met-daVal[4]));
      mcTrgEff = 1./2*(1 + TMath::Erf(mcVal[0] * (met-mcVal[1]))) - mcVal[2]*TMath::Exp(-mcVal[3]*(met-mcVal[4])*(met-mcVal[4]));
    } else {
      double daVal[2] = {2.76878259e-02,1.83986714e+02};
      double mcVal[2] = {3.30525865e-02,1.71112499e+02};
      daTrgEff = 1./2*(1 + TMath::Erf(daVal[0] * (met-daVal[1])/sqrt(2)));
      mcTrgEff = 1./2*(1 + TMath::Erf(mcVal[0] * (met-mcVal[1])/sqrt(2)));
    }
    if(met < 240) sfTrgEffE = 1.10; else sfTrgEffE = 1.01;
  }
  else if(year == 2017 && triggerCat == 1){
    double daVal[4] = {0.335,217.91,0.065,0.996};
    double mcVal[4] = {0.244,212.34,0.050,1.000};
    daTrgEff = daVal[2] + (daVal[3]-daVal[2]) / (1.0+TMath::Exp(-daVal[0]*(pth-daVal[1])));
    mcTrgEff = mcVal[2] + (mcVal[3]-mcVal[2]) / (1.0+TMath::Exp(-mcVal[0]*(pth-mcVal[1])));
    if(pth < 225) sfTrgEffE = 1.10; else sfTrgEffE = 1.01;
  }
  else if(year == 2018 && triggerCat == 0){
    if(isElEff == false){
      double daVal[5] = {0.022171,172.524448,0.090892,0.000652,224.661923};
      double mcVal[5] = {0.025514,137.136023,0.065548,0.000381,182.744938};
      daTrgEff = 1./2*(1 + TMath::Erf(daVal[0] * (met-daVal[1]))) - daVal[2]*TMath::Exp(-daVal[3]*(met-daVal[4])*(met-daVal[4]));
      mcTrgEff = 1./2*(1 + TMath::Erf(mcVal[0] * (met-mcVal[1]))) - mcVal[2]*TMath::Exp(-mcVal[3]*(met-mcVal[4])*(met-mcVal[4]));
    } else {
      double daVal[5] = {1.48004575e-02,2.08450376e+02,-3.29619730e-01,3.76548739e-04,2.09122325e+02};
      double mcVal[5] = {2.48814500e-02,1.93317169e+02,-5.92316991e-01,5.12962900e-04,1.70073538e+02};
      daTrgEff = 1./2*(1 + TMath::Erf(daVal[0] * (met-daVal[1]))) - daVal[2]*TMath::Exp(-daVal[3]*(met-daVal[4])*(met-daVal[4]));
      mcTrgEff = 1./2*(1 + TMath::Erf(mcVal[0] * (met-mcVal[1]))) - mcVal[2]*TMath::Exp(-mcVal[3]*(met-mcVal[4])*(met-mcVal[4]));
    }
    if(met < 240) sfTrgEffE = 1.10; else sfTrgEffE = 1.01;
  }
  else if(year == 2018 && triggerCat == 1){
    double daVal[4] = {1.022,218.39,0.086,0.999};
    double mcVal[4] = {0.301,212.83,0.062,1.000};
    daTrgEff = daVal[2] + (daVal[3]-daVal[2]) / (1.0+TMath::Exp(-daVal[0]*(pth-daVal[1])));
    mcTrgEff = mcVal[2] + (mcVal[3]-mcVal[2]) / (1.0+TMath::Exp(-mcVal[0]*(pth-mcVal[1])));
    if(pth < 225) sfTrgEffE = 1.10; else sfTrgEffE = 1.01;
  }
  if(mcTrgEff > 0) sfTrgEff = daTrgEff/mcTrgEff;
  //printf("TRGEFF (%5.1f %5.2f %5.1f %6.1f %4.1f) (%4d %1d) %5.3f %5.3f %5.3f %5.3f\n",met,r9,pth,mjj,detajj,year,triggerCat,daTrgEff,mcTrgEff,sfTrgEff,sfTrgEffE);
  triggerWeights[0] = sfTrgEff;
  triggerWeights[1] = sfTrgEffE;
}
