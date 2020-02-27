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
  kPlotData      , // 0
  kPlotVV        , // 1
  kPlotWJ0       , // 2
  kPlotWJ1       , // 3
  kPlotWJ2       , // 4
  kPlotWJ3       , // 5
  kPlotWJ4       , // 6
  kPlotWJ5       , // 7
  kPlotDY        , // 8
  kPlotTop       , // 9
  kPlotVVV       , //10
  kPlotWG        , //11
  kPlotZG        , //12
  kPlotGJ0       , //13
  kPlotGJ1       , //14
  kPlotNonPrompt , //15
  kPlotPhotonE0  , //16
  kPlotPhotonE1  , //17
  kPlotBSM       , //18
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
  { kPlotWG	   , "WG" },
  { kPlotZG        , "ZG" },
  { kPlotGJ0	   , "GJ0" },
  { kPlotGJ1	   , "GJ1" },
  { kPlotNonPrompt , "NonPrompt" },
  { kPlotPhotonE0  , "PhotonE0" },
  { kPlotPhotonE1  , "PhotonE1" },
  { kPlotBSM	   , "BSM" }
}; 

std::map<int, int> plotColors={
  { kPlotData      , kBlack},
  { kPlotVV        , kAzure-9},
  { kPlotWJ0       , 901},
  { kPlotWJ1       , kMagenta+1},
  { kPlotWJ2       , kMagenta+2},
  { kPlotWJ3       , kMagenta+3},
  { kPlotWJ4       , kMagenta+4},
  { kPlotWJ5       , kMagenta+5},
  { kPlotDY        , kYellow},
  { kPlotTop       , kAzure-2},
  { kPlotVVV       , TColor::GetColor(248,206,104)},
  { kPlotWG        , TColor::GetColor(250,202,255)},
  { kPlotZG        , kCyan+3},
  { kPlotGJ0       , TColor::GetColor(222,90,106)},
  { kPlotGJ1       , kMagenta+4},
  { kPlotNonPrompt , kAzure-9},
  { kPlotPhotonE0  , TColor::GetColor(155,152,204)},
  { kPlotPhotonE1  , 809},
  { kPlotBSM	   , kGreen}
}; 

std::map<int, TString> plotNames={
    { kPlotData      , "Data"},
    { kPlotVV        , "VV"},
    { kPlotWJ0       , "W+jets"},
    { kPlotWJ1       , "W+jets1"},
    { kPlotWJ2       , "W+jets2"},
    { kPlotWJ3       , "W+jets3"},
    { kPlotWJ4       , "W+jets4"},
    { kPlotWJ5       , "W+jets5"},
    { kPlotDY	     , "Z+jets"},
    { kPlotTop       , "Top quark"},
    { kPlotVVV       , "VVV"},
    { kPlotWG	     , "W#gamma" },
    { kPlotZG        , "Z#gamma"},
    { kPlotGJ0	     , "#gamma+jets"},
    { kPlotGJ1	     , "#gamma+jets1"},
    { kPlotNonPrompt , "Nonprompt"},
    { kPlotPhotonE0  , "Mismeasured #gamma low m_{jj}"},
    { kPlotPhotonE1  , "Mismeasured #gamma high m_{jj}"},
    { kPlotBSM       , "BSM"}
};

const double mass_el = 0.000510998928;
const double mass_mu = 0.10566;

double mcCorrection(int type, int year, int infileCat, double mjj, double mtg, int triggerCat){
  double totalWeight = 1.0;

  if(infileCat == kPlotBSM) totalWeight = totalWeight * 0.1; // 3.782;

  if     (type == 0){ // VBFG

    if     (year == 2016 && infileCat == kPlotWG) totalWeight = totalWeight * 0.45;
    else if(year == 2017 && infileCat == kPlotWG && triggerCat == 0) totalWeight = totalWeight * 0.65;
    else if(year == 2017 && infileCat == kPlotWG && triggerCat == 1) totalWeight = totalWeight * 1.10;
    else if(year == 2018 && infileCat == kPlotWG && triggerCat == 0) totalWeight = totalWeight * 0.90;
    else if(year == 2018 && infileCat == kPlotWG && triggerCat == 1) totalWeight = totalWeight * 0.75;

/*
    else if(year == 2016 && infileCat == kPlotWJ && mjj <  1500) totalWeight = totalWeight * 1.55;
    else if(year == 2016 && infileCat == kPlotWJ && mjj >= 1500) totalWeight = totalWeight * 1.20;

    else if(year == 2017 && infileCat == kPlotWJ && mjj <  1500 && triggerCat == 0) totalWeight = totalWeight * 1.10;
    else if(year == 2017 && infileCat == kPlotWJ && mjj <  1500 && triggerCat == 1) totalWeight = totalWeight * 0.85;
    else if(year == 2017 && infileCat == kPlotWJ && mjj >= 1500 && triggerCat == 0) totalWeight = totalWeight * 0.90;
    else if(year == 2017 && infileCat == kPlotWJ && mjj >= 1500 && triggerCat == 1) totalWeight = totalWeight * 0.90;

    else if(year == 2018 && infileCat == kPlotWJ && mjj <  1500 && triggerCat == 0) totalWeight = totalWeight * 0.85;
    else if(year == 2018 && infileCat == kPlotWJ && mjj <  1500 && triggerCat == 1) totalWeight = totalWeight * 1.15;
    else if(year == 2018 && infileCat == kPlotWJ && mjj >= 1500 && triggerCat == 0) totalWeight = totalWeight * 1.20;
    else if(year == 2018 && infileCat == kPlotWJ && mjj >= 1500 && triggerCat == 1) totalWeight = totalWeight * 1.40;

    else if(year == 2016 && infileCat == kPlotWJ && mjj <  1500 && mtg <  100) totalWeight = totalWeight * 1.872004;// * 1.95 * 0.96;
    else if(year == 2016 && infileCat == kPlotWJ && mjj <  1500              ) totalWeight = totalWeight * 3.216278;// * 1.95 * 1.65;
    else if(year == 2016 && infileCat == kPlotWJ && mjj >= 1500 && mtg <  100) totalWeight = totalWeight * 1.329084;// * 1.95 * 0.68;
    else if(year == 2016 && infileCat == kPlotWJ && mjj >= 1500              ) totalWeight = totalWeight * 3.046966;// * 1.95 * 1.55;

    else if(year == 2017 && infileCat == kPlotWJ && mjj <  1500 && mtg <  100) totalWeight = totalWeight * 0.863155;// * 1.05 * 0.81;
    else if(year == 2017 && infileCat == kPlotWJ && mjj <  1500 	     ) totalWeight = totalWeight * 1.500989;// * 1.05 * 1.29;
    else if(year == 2017 && infileCat == kPlotWJ && mjj >= 1500 && mtg <  100) totalWeight = totalWeight * 0.913045;// * 1.05 * 0.86;
    else if(year == 2017 && infileCat == kPlotWJ && mjj >= 1500 	     ) totalWeight = totalWeight * 1.040936;// * 1.05 * 1.00;

    else if(year == 2018 && infileCat == kPlotWJ && mjj <  1500 && mtg <  100) totalWeight = totalWeight * 1.300613;// * 1.50 * 0.86;
    else if(year == 2018 && infileCat == kPlotWJ && mjj <  1500 	     ) totalWeight = totalWeight * 1.736664;// * 1.50 * 1.14;
    else if(year == 2018 && infileCat == kPlotWJ && mjj >= 1500 && mtg <  100) totalWeight = totalWeight * 1.083650;// * 1.50 * 0.72;
    else if(year == 2018 && infileCat == kPlotWJ && mjj >= 1500 	     ) totalWeight = totalWeight * 3.583177;// * 1.50 * 2.30;


    else if(year == 2016 && infileCat == kPlotGJ && mjj < 1500) totalWeight = totalWeight * 3.338539;// * 2.15 * 1.31;
    else if(year == 2016 && infileCat == kPlotGJ              ) totalWeight = totalWeight * 3.280275;// * 2.15 * 1.36;

    else if(year == 2017 && infileCat == kPlotGJ && mjj < 1500) totalWeight = totalWeight * 4.109783;// * 2.90 * 1.41;
    else if(year == 2017 && infileCat == kPlotGJ              ) totalWeight = totalWeight * 3.556604;// * 2.90 * 1.23;

    else if(year == 2018 && infileCat == kPlotGJ && mjj < 1500) totalWeight = totalWeight * 3.969444;// * 3.75 * 1.06;
    else if(year == 2018 && infileCat == kPlotGJ              ) totalWeight = totalWeight * 2.670423;// * 3.75 * 0.64;
*/
 }

  return totalWeight;
}

void trigger_eff_sf(double triggerWeights[2], double met, double pth, double mjj, double detajj, int year, int triggerCat, 
                      TH1D* trg_VBFG_pth_eff, TH1D* trg_VBFG_mjj_eff, TH1D* trg_VBFG_detajj_eff){
  double daTrgEff  = 1.0;
  double mcTrgEff  = 1.0;
  double sfTrgEff  = 1.0;
  double sfTrgEffE = 1.0;
  if     (year == 2016 && triggerCat == 0){
    int lastpthBin = trg_VBFG_pth_eff->GetNbinsX();
    double mypth = TMath::Min(pth, trg_VBFG_pth_eff->GetXaxis()->GetBinCenter(lastpthBin));
    int mypthBin = trg_VBFG_pth_eff->GetXaxis()->FindBin(mypth);

    double mymjj = TMath::Min(mjj, 999.999);
    int mymjjBin = trg_VBFG_mjj_eff->GetXaxis()->FindBin(mymjj);

    double mydetajj = TMath::Min(detajj, 4.999);
    int mydetajjBin = trg_VBFG_detajj_eff->GetXaxis()->FindBin(mydetajj);

    daTrgEff = trg_VBFG_pth_eff->GetBinContent(mypthBin) * trg_VBFG_mjj_eff->GetBinContent(mymjjBin);
    if(daTrgEff > 0) sfTrgEffE = trg_VBFG_detajj_eff->GetBinContent(mydetajjBin) / trg_VBFG_mjj_eff->GetBinContent(mymjjBin);
  }
  else if(year == 2017 && triggerCat == 0){
    double daVal[5] = {0.022571,167.320198,0.077194,0.000330,222.058189};
    double mcVal[5] = {0.025953,153.096915,0.043153,0.000338,216.578332};
    daTrgEff = 1./2*(1 + TMath::Erf(daVal[0] * (met-daVal[1]))) - daVal[2]*TMath::Exp(-daVal[3]*(met-daVal[4])*(met-daVal[4]));
    mcTrgEff = 1./2*(1 + TMath::Erf(mcVal[0] * (met-mcVal[1]))) - mcVal[2]*TMath::Exp(-mcVal[3]*(met-mcVal[4])*(met-mcVal[4]));
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
    double daVal[5] = {0.022171,172.524448,0.090892,0.000652,224.661923};
    double mcVal[5] = {0.025514,137.136023,0.065548,0.000381,182.744938};
    daTrgEff = 1./2*(1 + TMath::Erf(daVal[0] * (met-daVal[1]))) - daVal[2]*TMath::Exp(-daVal[3]*(met-daVal[4])*(met-daVal[4]));
    mcTrgEff = 1./2*(1 + TMath::Erf(mcVal[0] * (met-mcVal[1]))) - mcVal[2]*TMath::Exp(-mcVal[3]*(met-mcVal[4])*(met-mcVal[4]));
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
  //printf("TRGEFF (%5.1f %5.1f %6.1f %4.1f) (%4d %1d) %5.3f %5.3f %5.3f %5.3f\n",met,pth,mjj,detajj,year,triggerCat,daTrgEff,mcTrgEff,sfTrgEff,sfTrgEffE);
  triggerWeights[0] = sfTrgEff;
  triggerWeights[1] = sfTrgEffE;
}
