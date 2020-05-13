
void mergeVBSHist() {

double diff[2];

TString inputFolder = "/data/t3home000/ceballos/panda/v_001_0";

const int nFilesEWKWWNEW = 3;
TFile *_filesEWKWWNEW[nFilesEWKWWNEW];
_filesEWKWWNEW[0] = TFile::Open(Form("%s/WWjj_SS_long_new.root", inputFolder.Data()));
_filesEWKWWNEW[1] = TFile::Open(Form("%s/WWjj_SS_lt_new.root"  , inputFolder.Data()));
_filesEWKWWNEW[2] = TFile::Open(Form("%s/WWjj_SS_tt_new.root"  , inputFolder.Data()));

const int nFilesEWKWW = 2;
TFile *_filesEWKWW[nFilesEWKWW];
_filesEWKWW[0] = TFile::Open(Form("%s/WWjj_SS_lttt.root"  , inputFolder.Data()));
_filesEWKWW[1] = TFile::Open(Form("%s/WWjj_SS_long.root"  , inputFolder.Data()));

const int nFilesQCDWW = 1;
TFile *_filesQCDWW[nFilesQCDWW];
_filesQCDWW[0] = TFile::Open(Form("%s/WpWp_QCD.root"  , inputFolder.Data()));

const int nFilesINTWW = 1;
TFile *_filesINTWW[nFilesINTWW];
_filesINTWW[0] = TFile::Open(Form("%s/WWjj_SS_interference.root"  , inputFolder.Data()));

const int nFilesEWKWZ = 1;
TFile *_filesEWKWZ[nFilesEWKWZ];
_filesEWKWZ[0] = TFile::Open(Form("%s/WZ3l_MG_EWK.root",inputFolder.Data()));

const int nFilesQCDWZ = 4;
TFile *_filesQCDWZ[nFilesQCDWZ];
_filesQCDWZ[0] = TFile::Open(Form("%s/WZ3l_0Jets_MG_QCD.root",inputFolder.Data()));
_filesQCDWZ[1] = TFile::Open(Form("%s/WZ3l_1Jets_MG_QCD.root",inputFolder.Data()));
_filesQCDWZ[2] = TFile::Open(Form("%s/WZ3l_2Jets_MG_QCD.root",inputFolder.Data()));
_filesQCDWZ[3] = TFile::Open(Form("%s/WZ3l_3Jets_MG_QCD.root",inputFolder.Data()));

const int nFilesINTWZ = 1;
TFile *_filesINTWZ[nFilesINTWZ];
_filesINTWZ[0] = TFile::Open(Form("%s/WZJJ_interference.root",inputFolder.Data()));

double xsEWKWWNEW[nFilesEWKWWNEW] = {0.002119,
                                     0.01087,
                                     0.0161
                                    };

double xsEWKWW[nFilesEWKWW] = {0.0258,
                               0.00192
                              };

double xsQCDWW[nFilesQCDWW] = {0.0261515
                              };

double xsINTWW[nFilesINTWW] = {0.003769
                              };

double xsEWKWZ[nFilesEWKWZ] = {0.0176340
                              };

double xsQCDWZ[nFilesQCDWZ] = {0.5770677*1.109*1.206,
         	               0.3445573*1.109*1.206,
         	               0.0768421*1.109*1.206,
         	               0.1112010*1.109*1.206
                              };

double xsINTWZ[nFilesINTWZ] = {0.0002365*4
                              };

TH1D *hDITotalMCWeightEWKWWNEW[nFilesEWKWWNEW];
for(int i=0; i<nFilesEWKWWNEW; i++){
  hDITotalMCWeightEWKWWNEW[i] = (TH1D*)_filesEWKWWNEW[i]->Get("hDTotalMCWeight");	 
}
TH1D *hDITotalMCWeightEWKWW[nFilesEWKWW];
for(int i=0; i<nFilesEWKWW; i++){
  hDITotalMCWeightEWKWW[i] = (TH1D*)_filesEWKWW[i]->Get("hDTotalMCWeight");	 
}
TH1D *hDITotalMCWeightQCDWW[nFilesQCDWW];
for(int i=0; i<nFilesQCDWW; i++){
  hDITotalMCWeightQCDWW[i] = (TH1D*)_filesQCDWW[i]->Get("hDTotalMCWeight");	 
}
TH1D *hDITotalMCWeightINTWW[nFilesINTWW];
for(int i=0; i<nFilesINTWW; i++){
  hDITotalMCWeightINTWW[i] = (TH1D*)_filesINTWW[i]->Get("hDTotalMCWeight");	 
}
TH1D *hDITotalMCWeightEWKWZ[nFilesEWKWZ];
for(int i=0; i<nFilesEWKWZ; i++){
  hDITotalMCWeightEWKWZ[i] = (TH1D*)_filesEWKWZ[i]->Get("hDTotalMCWeight");	 
}
TH1D *hDITotalMCWeightQCDWZ[nFilesQCDWZ];
for(int i=0; i<nFilesQCDWZ; i++){
  hDITotalMCWeightQCDWZ[i] = (TH1D*)_filesQCDWZ[i]->Get("hDTotalMCWeight");	 
}
TH1D *hDITotalMCWeightINTWZ[nFilesINTWZ];
for(int i=0; i<nFilesINTWZ; i++){
  hDITotalMCWeightINTWZ[i] = (TH1D*)_filesINTWZ[i]->Get("hDTotalMCWeight");	 
}

// EWKWWNEW EWKCorr applied
TH1D *hDIEWKWWNEWMJJ[nFilesEWKWWNEW];  TH1D *hDIEWKWWNEWMJJ_PDF[nFilesEWKWWNEW];  TH1D *hDIEWKWWNEWMJJ_QCD[nFilesEWKWWNEW];	 
TH1D *hDIEWKWWNEWMLL[nFilesEWKWWNEW];  TH1D *hDIEWKWWNEWMLL_PDF[nFilesEWKWWNEW];  TH1D *hDIEWKWWNEWMLL_QCD[nFilesEWKWWNEW];	 
TH1D *hDIEWKWWNEWPTL1[nFilesEWKWWNEW]; TH1D *hDIEWKWWNEWPTL1_PDF[nFilesEWKWWNEW]; TH1D *hDIEWKWWNEWPTL1_QCD[nFilesEWKWWNEW];	 

for(int i=0; i<nFilesEWKWWNEW; i++){
  printf("EWKWWNEWEWKCorr(%d)\n",i);
  hDIEWKWWNEWMJJ[i]      = (TH1D*)_filesEWKWWNEW[i]->Get("hDSSWWMJJ");      hDIEWKWWNEWMJJ[i]     ->Sumw2(); hDIEWKWWNEWMJJ[i]     ->Scale(xsEWKWWNEW[i]/hDITotalMCWeightEWKWWNEW[i]->GetSumOfWeights());
  hDIEWKWWNEWMJJ_PDF[i]  = (TH1D*)_filesEWKWWNEW[i]->Get("hDSSWWMJJ_PDF");  hDIEWKWWNEWMJJ_PDF[i] ->Sumw2(); hDIEWKWWNEWMJJ_PDF[i] ->Scale(xsEWKWWNEW[i]/hDITotalMCWeightEWKWWNEW[i]->GetSumOfWeights());
  hDIEWKWWNEWMJJ_QCD[i]  = (TH1D*)_filesEWKWWNEW[i]->Get("hDSSWWMJJ_QCD");  hDIEWKWWNEWMJJ_QCD[i] ->Sumw2(); hDIEWKWWNEWMJJ_QCD[i] ->Scale(xsEWKWWNEW[i]/hDITotalMCWeightEWKWWNEW[i]->GetSumOfWeights());
  hDIEWKWWNEWMLL[i]      = (TH1D*)_filesEWKWWNEW[i]->Get("hDSSWWMLL");      hDIEWKWWNEWMLL[i]     ->Sumw2(); hDIEWKWWNEWMLL[i]     ->Scale(xsEWKWWNEW[i]/hDITotalMCWeightEWKWWNEW[i]->GetSumOfWeights());
  hDIEWKWWNEWMLL_PDF[i]  = (TH1D*)_filesEWKWWNEW[i]->Get("hDSSWWMLL_PDF");  hDIEWKWWNEWMLL_PDF[i] ->Sumw2(); hDIEWKWWNEWMLL_PDF[i] ->Scale(xsEWKWWNEW[i]/hDITotalMCWeightEWKWWNEW[i]->GetSumOfWeights());
  hDIEWKWWNEWMLL_QCD[i]  = (TH1D*)_filesEWKWWNEW[i]->Get("hDSSWWMLL_QCD");  hDIEWKWWNEWMLL_QCD[i] ->Sumw2(); hDIEWKWWNEWMLL_QCD[i] ->Scale(xsEWKWWNEW[i]/hDITotalMCWeightEWKWWNEW[i]->GetSumOfWeights());
  hDIEWKWWNEWPTL1[i]     = (TH1D*)_filesEWKWWNEW[i]->Get("hDSSWWPTL1");     hDIEWKWWNEWPTL1[i]    ->Sumw2(); hDIEWKWWNEWPTL1[i]    ->Scale(xsEWKWWNEW[i]/hDITotalMCWeightEWKWWNEW[i]->GetSumOfWeights());
  hDIEWKWWNEWPTL1_PDF[i] = (TH1D*)_filesEWKWWNEW[i]->Get("hDSSWWPTL1_PDF"); hDIEWKWWNEWPTL1_PDF[i]->Sumw2(); hDIEWKWWNEWPTL1_PDF[i]->Scale(xsEWKWWNEW[i]/hDITotalMCWeightEWKWWNEW[i]->GetSumOfWeights());
  hDIEWKWWNEWPTL1_QCD[i] = (TH1D*)_filesEWKWWNEW[i]->Get("hDSSWWPTL1_QCD"); hDIEWKWWNEWPTL1_QCD[i]->Sumw2(); hDIEWKWWNEWPTL1_QCD[i]->Scale(xsEWKWWNEW[i]/hDITotalMCWeightEWKWWNEW[i]->GetSumOfWeights());
}

TH1D *hDEWKWWNEWMJJ      = (TH1D*)hDIEWKWWNEWMJJ     [0]->Clone("hDEWKWWNEWMJJ"	   );
TH1D *hDEWKWWNEWMJJ_PDF  = (TH1D*)hDIEWKWWNEWMJJ_PDF [0]->Clone("hDEWKWWNEWMJJ_PDF" );
TH1D *hDEWKWWNEWMJJ_QCD  = (TH1D*)hDIEWKWWNEWMJJ_QCD [0]->Clone("hDEWKWWNEWMJJ_QCD" );
TH1D *hDEWKWWNEWMLL      = (TH1D*)hDIEWKWWNEWMLL     [0]->Clone("hDEWKWWNEWMLL"	   );
TH1D *hDEWKWWNEWMLL_PDF  = (TH1D*)hDIEWKWWNEWMLL_PDF [0]->Clone("hDEWKWWNEWMLL_PDF" );
TH1D *hDEWKWWNEWMLL_QCD  = (TH1D*)hDIEWKWWNEWMLL_QCD [0]->Clone("hDEWKWWNEWMLL_QCD" );
TH1D *hDEWKWWNEWPTL1     = (TH1D*)hDIEWKWWNEWPTL1    [0]->Clone("hDEWKWWNEWPTL1"    );
TH1D *hDEWKWWNEWPTL1_PDF = (TH1D*)hDIEWKWWNEWPTL1_PDF[0]->Clone("hDEWKWWNEWPTL1_PDF");
TH1D *hDEWKWWNEWPTL1_QCD = (TH1D*)hDIEWKWWNEWPTL1_QCD[0]->Clone("hDEWKWWNEWPTL1_QCD");

for(int i=1; i<nFilesEWKWWNEW; i++){
  hDEWKWWNEWMJJ	 ->Add(hDIEWKWWNEWMJJ     [i]); 
  hDEWKWWNEWMJJ_PDF ->Add(hDIEWKWWNEWMJJ_PDF [i]);   
  hDEWKWWNEWMJJ_QCD ->Add(hDIEWKWWNEWMJJ_QCD [i]);   
  hDEWKWWNEWMLL	 ->Add(hDIEWKWWNEWMLL     [i]); 
  hDEWKWWNEWMLL_PDF ->Add(hDIEWKWWNEWMLL_PDF [i]);   
  hDEWKWWNEWMLL_QCD ->Add(hDIEWKWWNEWMLL_QCD [i]);   
  hDEWKWWNEWPTL1	 ->Add(hDIEWKWWNEWPTL1    [i]); 
  hDEWKWWNEWPTL1_PDF->Add(hDIEWKWWNEWPTL1_PDF[i]);   
  hDEWKWWNEWPTL1_QCD->Add(hDIEWKWWNEWPTL1_QCD[i]);   
}

diff[0] = 1000*(hDEWKWWNEWMJJ_PDF->GetSumOfWeights()-hDEWKWWNEWMJJ->GetSumOfWeights());
diff[1] = 1000*(hDEWKWWNEWMJJ_QCD->GetSumOfWeights()-hDEWKWWNEWMJJ->GetSumOfWeights());
printf("hDEWKWWNEWMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDEWKWWNEWMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDEWKWWNEWMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDEWKWWNEWMJJ_PDF->GetBinContent(i)-hDEWKWWNEWMJJ->GetBinContent(i));
  diff[1] = 1000*(hDEWKWWNEWMJJ_QCD->GetBinContent(i)-hDEWKWWNEWMJJ->GetBinContent(i));
  printf("hDEWKWWNEWMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDEWKWWNEWMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

diff[0] = 1000*(hDEWKWWNEWMLL_PDF->GetSumOfWeights()-hDEWKWWNEWMLL->GetSumOfWeights());
diff[1] = 1000*(hDEWKWWNEWMLL_QCD->GetSumOfWeights()-hDEWKWWNEWMLL->GetSumOfWeights());
printf("hDEWKWWNEWMLL: %.2f %.2f %.2f (%.2f)\n",1000*hDEWKWWNEWMLL->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDEWKWWNEWMLL->GetNbinsX();i++){
  diff[0] = 1000*(hDEWKWWNEWMLL_PDF->GetBinContent(i)-hDEWKWWNEWMLL->GetBinContent(i));
  diff[1] = 1000*(hDEWKWWNEWMLL_QCD->GetBinContent(i)-hDEWKWWNEWMLL->GetBinContent(i));
  printf("hDEWKWWNEWMLL(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDEWKWWNEWMLL->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

diff[0] = 1000*(hDEWKWWNEWPTL1_PDF->GetSumOfWeights()-hDEWKWWNEWPTL1->GetSumOfWeights());
diff[1] = 1000*(hDEWKWWNEWPTL1_QCD->GetSumOfWeights()-hDEWKWWNEWPTL1->GetSumOfWeights());
printf("hDEWKWWNEWPTL1: %.2f %.2f %.2f (%.2f)\n",1000*hDEWKWWNEWPTL1->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDEWKWWNEWPTL1->GetNbinsX();i++){
  diff[0] = 1000*(hDEWKWWNEWPTL1_PDF->GetBinContent(i)-hDEWKWWNEWPTL1->GetBinContent(i));
  diff[1] = 1000*(hDEWKWWNEWPTL1_QCD->GetBinContent(i)-hDEWKWWNEWPTL1->GetBinContent(i));
  printf("hDEWKWWNEWPTL1(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDEWKWWNEWPTL1->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

// EWKWW EWKCorr applied
TH1D *hDIEWKWWMJJ[nFilesEWKWW];  TH1D *hDIEWKWWMJJ_PDF[nFilesEWKWW];  TH1D *hDIEWKWWMJJ_QCD[nFilesEWKWW];	 
TH1D *hDIEWKWWMLL[nFilesEWKWW];  TH1D *hDIEWKWWMLL_PDF[nFilesEWKWW];  TH1D *hDIEWKWWMLL_QCD[nFilesEWKWW];	 
TH1D *hDIEWKWWPTL1[nFilesEWKWW]; TH1D *hDIEWKWWPTL1_PDF[nFilesEWKWW]; TH1D *hDIEWKWWPTL1_QCD[nFilesEWKWW];	 

for(int i=0; i<nFilesEWKWW; i++){
  printf("EWKWWEWKCorr(%d)\n",i);
  hDIEWKWWMJJ[i]      = (TH1D*)_filesEWKWW[i]->Get("hDSSWWMJJ");      hDIEWKWWMJJ[i]	 ->Sumw2(); hDIEWKWWMJJ[i]     ->Scale(xsEWKWW[i]/hDITotalMCWeightEWKWW[i]->GetSumOfWeights());
  hDIEWKWWMJJ_PDF[i]  = (TH1D*)_filesEWKWW[i]->Get("hDSSWWMJJ_PDF");  hDIEWKWWMJJ_PDF[i] ->Sumw2(); hDIEWKWWMJJ_PDF[i] ->Scale(xsEWKWW[i]/hDITotalMCWeightEWKWW[i]->GetSumOfWeights());
  hDIEWKWWMJJ_QCD[i]  = (TH1D*)_filesEWKWW[i]->Get("hDSSWWMJJ_QCD");  hDIEWKWWMJJ_QCD[i] ->Sumw2(); hDIEWKWWMJJ_QCD[i] ->Scale(xsEWKWW[i]/hDITotalMCWeightEWKWW[i]->GetSumOfWeights());
  hDIEWKWWMLL[i]      = (TH1D*)_filesEWKWW[i]->Get("hDSSWWMLL");      hDIEWKWWMLL[i]	 ->Sumw2(); hDIEWKWWMLL[i]     ->Scale(xsEWKWW[i]/hDITotalMCWeightEWKWW[i]->GetSumOfWeights());
  hDIEWKWWMLL_PDF[i]  = (TH1D*)_filesEWKWW[i]->Get("hDSSWWMLL_PDF");  hDIEWKWWMLL_PDF[i] ->Sumw2(); hDIEWKWWMLL_PDF[i] ->Scale(xsEWKWW[i]/hDITotalMCWeightEWKWW[i]->GetSumOfWeights());
  hDIEWKWWMLL_QCD[i]  = (TH1D*)_filesEWKWW[i]->Get("hDSSWWMLL_QCD");  hDIEWKWWMLL_QCD[i] ->Sumw2(); hDIEWKWWMLL_QCD[i] ->Scale(xsEWKWW[i]/hDITotalMCWeightEWKWW[i]->GetSumOfWeights());
  hDIEWKWWPTL1[i]     = (TH1D*)_filesEWKWW[i]->Get("hDSSWWPTL1");     hDIEWKWWPTL1[i]	 ->Sumw2(); hDIEWKWWPTL1[i]    ->Scale(xsEWKWW[i]/hDITotalMCWeightEWKWW[i]->GetSumOfWeights());
  hDIEWKWWPTL1_PDF[i] = (TH1D*)_filesEWKWW[i]->Get("hDSSWWPTL1_PDF"); hDIEWKWWPTL1_PDF[i]->Sumw2(); hDIEWKWWPTL1_PDF[i]->Scale(xsEWKWW[i]/hDITotalMCWeightEWKWW[i]->GetSumOfWeights());
  hDIEWKWWPTL1_QCD[i] = (TH1D*)_filesEWKWW[i]->Get("hDSSWWPTL1_QCD"); hDIEWKWWPTL1_QCD[i]->Sumw2(); hDIEWKWWPTL1_QCD[i]->Scale(xsEWKWW[i]/hDITotalMCWeightEWKWW[i]->GetSumOfWeights());
}

TH1D *hDEWKWWMJJ      = (TH1D*)hDIEWKWWMJJ     [0]->Clone("hDEWKWWMJJ"	   );
TH1D *hDEWKWWMJJ_PDF  = (TH1D*)hDIEWKWWMJJ_PDF [0]->Clone("hDEWKWWMJJ_PDF" );
TH1D *hDEWKWWMJJ_QCD  = (TH1D*)hDIEWKWWMJJ_QCD [0]->Clone("hDEWKWWMJJ_QCD" );
TH1D *hDEWKWWMLL      = (TH1D*)hDIEWKWWMLL     [0]->Clone("hDEWKWWMLL"	   );
TH1D *hDEWKWWMLL_PDF  = (TH1D*)hDIEWKWWMLL_PDF [0]->Clone("hDEWKWWMLL_PDF" );
TH1D *hDEWKWWMLL_QCD  = (TH1D*)hDIEWKWWMLL_QCD [0]->Clone("hDEWKWWMLL_QCD" );
TH1D *hDEWKWWPTL1     = (TH1D*)hDIEWKWWPTL1    [0]->Clone("hDEWKWWPTL1"    );
TH1D *hDEWKWWPTL1_PDF = (TH1D*)hDIEWKWWPTL1_PDF[0]->Clone("hDEWKWWPTL1_PDF");
TH1D *hDEWKWWPTL1_QCD = (TH1D*)hDIEWKWWPTL1_QCD[0]->Clone("hDEWKWWPTL1_QCD");

for(int i=1; i<nFilesEWKWW; i++){
  hDEWKWWMJJ	 ->Add(hDIEWKWWMJJ     [i]); 
  hDEWKWWMJJ_PDF ->Add(hDIEWKWWMJJ_PDF [i]);   
  hDEWKWWMJJ_QCD ->Add(hDIEWKWWMJJ_QCD [i]);   
  hDEWKWWMLL	 ->Add(hDIEWKWWMLL     [i]); 
  hDEWKWWMLL_PDF ->Add(hDIEWKWWMLL_PDF [i]);   
  hDEWKWWMLL_QCD ->Add(hDIEWKWWMLL_QCD [i]);   
  hDEWKWWPTL1	 ->Add(hDIEWKWWPTL1    [i]); 
  hDEWKWWPTL1_PDF->Add(hDIEWKWWPTL1_PDF[i]);   
  hDEWKWWPTL1_QCD->Add(hDIEWKWWPTL1_QCD[i]);   
}

diff[0] = 1000*(hDEWKWWMJJ_PDF->GetSumOfWeights()-hDEWKWWMJJ->GetSumOfWeights());
diff[1] = 1000*(hDEWKWWMJJ_QCD->GetSumOfWeights()-hDEWKWWMJJ->GetSumOfWeights());
printf("hDEWKWWMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDEWKWWMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDEWKWWMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDEWKWWMJJ_PDF->GetBinContent(i)-hDEWKWWMJJ->GetBinContent(i));
  diff[1] = 1000*(hDEWKWWMJJ_QCD->GetBinContent(i)-hDEWKWWMJJ->GetBinContent(i));
  printf("hDEWKWWMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDEWKWWMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

diff[0] = 1000*(hDEWKWWMLL_PDF->GetSumOfWeights()-hDEWKWWMLL->GetSumOfWeights());
diff[1] = 1000*(hDEWKWWMLL_QCD->GetSumOfWeights()-hDEWKWWMLL->GetSumOfWeights());
printf("hDEWKWWMLL: %.2f %.2f %.2f (%.2f)\n",1000*hDEWKWWMLL->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDEWKWWMLL->GetNbinsX();i++){
  diff[0] = 1000*(hDEWKWWMLL_PDF->GetBinContent(i)-hDEWKWWMLL->GetBinContent(i));
  diff[1] = 1000*(hDEWKWWMLL_QCD->GetBinContent(i)-hDEWKWWMLL->GetBinContent(i));
  printf("hDEWKWWMLL(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDEWKWWMLL->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

diff[0] = 1000*(hDEWKWWPTL1_PDF->GetSumOfWeights()-hDEWKWWPTL1->GetSumOfWeights());
diff[1] = 1000*(hDEWKWWPTL1_QCD->GetSumOfWeights()-hDEWKWWPTL1->GetSumOfWeights());
printf("hDEWKWWPTL1: %.2f %.2f %.2f (%.2f)\n",1000*hDEWKWWPTL1->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDEWKWWPTL1->GetNbinsX();i++){
  diff[0] = 1000*(hDEWKWWPTL1_PDF->GetBinContent(i)-hDEWKWWPTL1->GetBinContent(i));
  diff[1] = 1000*(hDEWKWWPTL1_QCD->GetBinContent(i)-hDEWKWWPTL1->GetBinContent(i));
  printf("hDEWKWWPTL1(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDEWKWWPTL1->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

// EWKWZ EWKCorr applied
TH1D *hDIEWKWZMJJ[nFilesEWKWZ];  TH1D *hDIEWKWZMJJ_PDF[nFilesEWKWZ];  TH1D *hDIEWKWZMJJ_QCD[nFilesEWKWZ];	 

for(int i=0; i<nFilesEWKWZ; i++){
  printf("EWKWZEWKCorr(%d)\n",i);
  hDIEWKWZMJJ[i]      = (TH1D*)_filesEWKWZ[i]->Get("hDWZMJJ");      hDIEWKWZMJJ[i]	->Sumw2(); hDIEWKWZMJJ[i]     ->Scale(xsEWKWZ[i]/hDITotalMCWeightEWKWZ[i]->GetSumOfWeights());
  hDIEWKWZMJJ_PDF[i]  = (TH1D*)_filesEWKWZ[i]->Get("hDWZMJJ_PDF");  hDIEWKWZMJJ_PDF[i] ->Sumw2();  hDIEWKWZMJJ_PDF[i] ->Scale(xsEWKWZ[i]/hDITotalMCWeightEWKWZ[i]->GetSumOfWeights());
  hDIEWKWZMJJ_QCD[i]  = (TH1D*)_filesEWKWZ[i]->Get("hDWZMJJ_QCD");  hDIEWKWZMJJ_QCD[i] ->Sumw2();  hDIEWKWZMJJ_QCD[i] ->Scale(xsEWKWZ[i]/hDITotalMCWeightEWKWZ[i]->GetSumOfWeights());
}

TH1D *hDEWKWZMJJ      = (TH1D*)hDIEWKWZMJJ     [0]->Clone("hDEWKWZMJJ"	  );
TH1D *hDEWKWZMJJ_PDF  = (TH1D*)hDIEWKWZMJJ_PDF [0]->Clone("hDEWKWZMJJ_PDF" );
TH1D *hDEWKWZMJJ_QCD  = (TH1D*)hDIEWKWZMJJ_QCD [0]->Clone("hDEWKWZMJJ_QCD" );

for(int i=1; i<nFilesEWKWZ; i++){
  hDEWKWZMJJ	 ->Add(hDIEWKWZMJJ     [i]); 
  hDEWKWZMJJ_PDF ->Add(hDIEWKWZMJJ_PDF [i]);   
  hDEWKWZMJJ_QCD ->Add(hDIEWKWZMJJ_QCD [i]);   
}

diff[0] = 1000*(hDEWKWZMJJ_PDF->GetSumOfWeights()-hDEWKWZMJJ->GetSumOfWeights());
diff[1] = 1000*(hDEWKWZMJJ_QCD->GetSumOfWeights()-hDEWKWZMJJ->GetSumOfWeights());
printf("hDEWKWZMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDEWKWZMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDEWKWZMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDEWKWZMJJ_PDF->GetBinContent(i)-hDEWKWZMJJ->GetBinContent(i));
  diff[1] = 1000*(hDEWKWZMJJ_QCD->GetBinContent(i)-hDEWKWZMJJ->GetBinContent(i));
  printf("hDEWKWZMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDEWKWZMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

// EWKWWNEW NoEWKCorr applied
TH1D *hDNoEWKCorrIEWKWWNEWMJJ[nFilesEWKWWNEW];  TH1D *hDNoEWKCorrIEWKWWNEWMJJ_PDF[nFilesEWKWWNEW];  TH1D *hDNoEWKCorrIEWKWWNEWMJJ_QCD[nFilesEWKWWNEW];	 
TH1D *hDNoEWKCorrIEWKWWNEWMLL[nFilesEWKWWNEW];  TH1D *hDNoEWKCorrIEWKWWNEWMLL_PDF[nFilesEWKWWNEW];  TH1D *hDNoEWKCorrIEWKWWNEWMLL_QCD[nFilesEWKWWNEW];	 
TH1D *hDNoEWKCorrIEWKWWNEWPTL1[nFilesEWKWWNEW]; TH1D *hDNoEWKCorrIEWKWWNEWPTL1_PDF[nFilesEWKWWNEW]; TH1D *hDNoEWKCorrIEWKWWNEWPTL1_QCD[nFilesEWKWWNEW];	 

for(int i=0; i<nFilesEWKWWNEW; i++){
  printf("EWKWWNEWNoEWKCorr(%d)\n",i);
  hDNoEWKCorrIEWKWWNEWMJJ[i]      = (TH1D*)_filesEWKWWNEW[i]->Get("hDNoEWKCorrSSWWMJJ");      hDNoEWKCorrIEWKWWNEWMJJ[i]     ->Sumw2(); hDNoEWKCorrIEWKWWNEWMJJ[i]     ->Scale(xsEWKWWNEW[i]/hDITotalMCWeightEWKWWNEW[i]->GetSumOfWeights());
  hDNoEWKCorrIEWKWWNEWMJJ_PDF[i]  = (TH1D*)_filesEWKWWNEW[i]->Get("hDNoEWKCorrSSWWMJJ_PDF");  hDNoEWKCorrIEWKWWNEWMJJ_PDF[i] ->Sumw2(); hDNoEWKCorrIEWKWWNEWMJJ_PDF[i] ->Scale(xsEWKWWNEW[i]/hDITotalMCWeightEWKWWNEW[i]->GetSumOfWeights());
  hDNoEWKCorrIEWKWWNEWMJJ_QCD[i]  = (TH1D*)_filesEWKWWNEW[i]->Get("hDNoEWKCorrSSWWMJJ_QCD");  hDNoEWKCorrIEWKWWNEWMJJ_QCD[i] ->Sumw2(); hDNoEWKCorrIEWKWWNEWMJJ_QCD[i] ->Scale(xsEWKWWNEW[i]/hDITotalMCWeightEWKWWNEW[i]->GetSumOfWeights());
  hDNoEWKCorrIEWKWWNEWMLL[i]      = (TH1D*)_filesEWKWWNEW[i]->Get("hDNoEWKCorrSSWWMLL");      hDNoEWKCorrIEWKWWNEWMLL[i]     ->Sumw2(); hDNoEWKCorrIEWKWWNEWMLL[i]     ->Scale(xsEWKWWNEW[i]/hDITotalMCWeightEWKWWNEW[i]->GetSumOfWeights());
  hDNoEWKCorrIEWKWWNEWMLL_PDF[i]  = (TH1D*)_filesEWKWWNEW[i]->Get("hDNoEWKCorrSSWWMLL_PDF");  hDNoEWKCorrIEWKWWNEWMLL_PDF[i] ->Sumw2(); hDNoEWKCorrIEWKWWNEWMLL_PDF[i] ->Scale(xsEWKWWNEW[i]/hDITotalMCWeightEWKWWNEW[i]->GetSumOfWeights());
  hDNoEWKCorrIEWKWWNEWMLL_QCD[i]  = (TH1D*)_filesEWKWWNEW[i]->Get("hDNoEWKCorrSSWWMLL_QCD");  hDNoEWKCorrIEWKWWNEWMLL_QCD[i] ->Sumw2(); hDNoEWKCorrIEWKWWNEWMLL_QCD[i] ->Scale(xsEWKWWNEW[i]/hDITotalMCWeightEWKWWNEW[i]->GetSumOfWeights());
  hDNoEWKCorrIEWKWWNEWPTL1[i]     = (TH1D*)_filesEWKWWNEW[i]->Get("hDNoEWKCorrSSWWPTL1");     hDNoEWKCorrIEWKWWNEWPTL1[i]    ->Sumw2(); hDNoEWKCorrIEWKWWNEWPTL1[i]    ->Scale(xsEWKWWNEW[i]/hDITotalMCWeightEWKWWNEW[i]->GetSumOfWeights());
  hDNoEWKCorrIEWKWWNEWPTL1_PDF[i] = (TH1D*)_filesEWKWWNEW[i]->Get("hDNoEWKCorrSSWWPTL1_PDF"); hDNoEWKCorrIEWKWWNEWPTL1_PDF[i]->Sumw2(); hDNoEWKCorrIEWKWWNEWPTL1_PDF[i]->Scale(xsEWKWWNEW[i]/hDITotalMCWeightEWKWWNEW[i]->GetSumOfWeights());
  hDNoEWKCorrIEWKWWNEWPTL1_QCD[i] = (TH1D*)_filesEWKWWNEW[i]->Get("hDNoEWKCorrSSWWPTL1_QCD"); hDNoEWKCorrIEWKWWNEWPTL1_QCD[i]->Sumw2(); hDNoEWKCorrIEWKWWNEWPTL1_QCD[i]->Scale(xsEWKWWNEW[i]/hDITotalMCWeightEWKWWNEW[i]->GetSumOfWeights());
}

TH1D *hDNoEWKCorrEWKWWNEWMJJ      = (TH1D*)hDNoEWKCorrIEWKWWNEWMJJ     [0]->Clone("hDNoEWKCorrEWKWWNEWMJJ"     );
TH1D *hDNoEWKCorrEWKWWNEWMJJ_PDF  = (TH1D*)hDNoEWKCorrIEWKWWNEWMJJ_PDF [0]->Clone("hDNoEWKCorrEWKWWNEWMJJ_PDF" );
TH1D *hDNoEWKCorrEWKWWNEWMJJ_QCD  = (TH1D*)hDNoEWKCorrIEWKWWNEWMJJ_QCD [0]->Clone("hDNoEWKCorrEWKWWNEWMJJ_QCD" );
TH1D *hDNoEWKCorrEWKWWNEWMLL      = (TH1D*)hDNoEWKCorrIEWKWWNEWMLL     [0]->Clone("hDNoEWKCorrEWKWWNEWMLL"     );
TH1D *hDNoEWKCorrEWKWWNEWMLL_PDF  = (TH1D*)hDNoEWKCorrIEWKWWNEWMLL_PDF [0]->Clone("hDNoEWKCorrEWKWWNEWMLL_PDF" );
TH1D *hDNoEWKCorrEWKWWNEWMLL_QCD  = (TH1D*)hDNoEWKCorrIEWKWWNEWMLL_QCD [0]->Clone("hDNoEWKCorrEWKWWNEWMLL_QCD" );
TH1D *hDNoEWKCorrEWKWWNEWPTL1     = (TH1D*)hDNoEWKCorrIEWKWWNEWPTL1    [0]->Clone("hDNoEWKCorrEWKWWNEWPTL1"    );
TH1D *hDNoEWKCorrEWKWWNEWPTL1_PDF = (TH1D*)hDNoEWKCorrIEWKWWNEWPTL1_PDF[0]->Clone("hDNoEWKCorrEWKWWNEWPTL1_PDF");
TH1D *hDNoEWKCorrEWKWWNEWPTL1_QCD = (TH1D*)hDNoEWKCorrIEWKWWNEWPTL1_QCD[0]->Clone("hDNoEWKCorrEWKWWNEWPTL1_QCD");

for(int i=1; i<nFilesEWKWWNEW; i++){
  hDNoEWKCorrEWKWWNEWMJJ	  ->Add(hDNoEWKCorrIEWKWWNEWMJJ     [i]); 
  hDNoEWKCorrEWKWWNEWMJJ_PDF ->Add(hDNoEWKCorrIEWKWWNEWMJJ_PDF [i]);   
  hDNoEWKCorrEWKWWNEWMJJ_QCD ->Add(hDNoEWKCorrIEWKWWNEWMJJ_QCD [i]);   
  hDNoEWKCorrEWKWWNEWMLL	  ->Add(hDNoEWKCorrIEWKWWNEWMLL     [i]); 
  hDNoEWKCorrEWKWWNEWMLL_PDF ->Add(hDNoEWKCorrIEWKWWNEWMLL_PDF [i]);   
  hDNoEWKCorrEWKWWNEWMLL_QCD ->Add(hDNoEWKCorrIEWKWWNEWMLL_QCD [i]);   
  hDNoEWKCorrEWKWWNEWPTL1	  ->Add(hDNoEWKCorrIEWKWWNEWPTL1    [i]); 
  hDNoEWKCorrEWKWWNEWPTL1_PDF->Add(hDNoEWKCorrIEWKWWNEWPTL1_PDF[i]);   
  hDNoEWKCorrEWKWWNEWPTL1_QCD->Add(hDNoEWKCorrIEWKWWNEWPTL1_QCD[i]);   
}

diff[0] = 1000*(hDNoEWKCorrEWKWWNEWMJJ_PDF->GetSumOfWeights()-hDNoEWKCorrEWKWWNEWMJJ->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrEWKWWNEWMJJ_QCD->GetSumOfWeights()-hDNoEWKCorrEWKWWNEWMJJ->GetSumOfWeights());
printf("hDNoEWKCorrEWKWWNEWMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrEWKWWNEWMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrEWKWWNEWMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrEWKWWNEWMJJ_PDF->GetBinContent(i)-hDNoEWKCorrEWKWWNEWMJJ->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrEWKWWNEWMJJ_QCD->GetBinContent(i)-hDNoEWKCorrEWKWWNEWMJJ->GetBinContent(i));
  printf("hDNoEWKCorrEWKWWNEWMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrEWKWWNEWMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

diff[0] = 1000*(hDNoEWKCorrEWKWWNEWMLL_PDF->GetSumOfWeights()-hDNoEWKCorrEWKWWNEWMLL->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrEWKWWNEWMLL_QCD->GetSumOfWeights()-hDNoEWKCorrEWKWWNEWMLL->GetSumOfWeights());
printf("hDNoEWKCorrEWKWWNEWMLL: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrEWKWWNEWMLL->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrEWKWWNEWMLL->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrEWKWWNEWMLL_PDF->GetBinContent(i)-hDNoEWKCorrEWKWWNEWMLL->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrEWKWWNEWMLL_QCD->GetBinContent(i)-hDNoEWKCorrEWKWWNEWMLL->GetBinContent(i));
  printf("hDNoEWKCorrEWKWWNEWMLL(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrEWKWWNEWMLL->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

diff[0] = 1000*(hDNoEWKCorrEWKWWNEWPTL1_PDF->GetSumOfWeights()-hDNoEWKCorrEWKWWNEWPTL1->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrEWKWWNEWPTL1_QCD->GetSumOfWeights()-hDNoEWKCorrEWKWWNEWPTL1->GetSumOfWeights());
printf("hDNoEWKCorrEWKWWNEWPTL1: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrEWKWWNEWPTL1->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrEWKWWNEWPTL1->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrEWKWWNEWPTL1_PDF->GetBinContent(i)-hDNoEWKCorrEWKWWNEWPTL1->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrEWKWWNEWPTL1_QCD->GetBinContent(i)-hDNoEWKCorrEWKWWNEWPTL1->GetBinContent(i));
  printf("hDNoEWKCorrEWKWWNEWPTL1(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrEWKWWNEWPTL1->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

// EWKWW NoEWKCorr applied
TH1D *hDNoEWKCorrIEWKWWMJJ[nFilesEWKWW];  TH1D *hDNoEWKCorrIEWKWWMJJ_PDF[nFilesEWKWW];  TH1D *hDNoEWKCorrIEWKWWMJJ_QCD[nFilesEWKWW];	 
TH1D *hDNoEWKCorrIEWKWWMLL[nFilesEWKWW];  TH1D *hDNoEWKCorrIEWKWWMLL_PDF[nFilesEWKWW];  TH1D *hDNoEWKCorrIEWKWWMLL_QCD[nFilesEWKWW];	 
TH1D *hDNoEWKCorrIEWKWWPTL1[nFilesEWKWW]; TH1D *hDNoEWKCorrIEWKWWPTL1_PDF[nFilesEWKWW]; TH1D *hDNoEWKCorrIEWKWWPTL1_QCD[nFilesEWKWW];	 

for(int i=0; i<nFilesEWKWW; i++){
  printf("EWKWWNoEWKCorr(%d)\n",i);
  hDNoEWKCorrIEWKWWMJJ[i]      = (TH1D*)_filesEWKWW[i]->Get("hDNoEWKCorrSSWWMJJ");      hDNoEWKCorrIEWKWWMJJ[i]     ->Sumw2(); hDNoEWKCorrIEWKWWMJJ[i]     ->Scale(xsEWKWW[i]/hDITotalMCWeightEWKWW[i]->GetSumOfWeights());
  hDNoEWKCorrIEWKWWMJJ_PDF[i]  = (TH1D*)_filesEWKWW[i]->Get("hDNoEWKCorrSSWWMJJ_PDF");  hDNoEWKCorrIEWKWWMJJ_PDF[i] ->Sumw2(); hDNoEWKCorrIEWKWWMJJ_PDF[i] ->Scale(xsEWKWW[i]/hDITotalMCWeightEWKWW[i]->GetSumOfWeights());
  hDNoEWKCorrIEWKWWMJJ_QCD[i]  = (TH1D*)_filesEWKWW[i]->Get("hDNoEWKCorrSSWWMJJ_QCD");  hDNoEWKCorrIEWKWWMJJ_QCD[i] ->Sumw2(); hDNoEWKCorrIEWKWWMJJ_QCD[i] ->Scale(xsEWKWW[i]/hDITotalMCWeightEWKWW[i]->GetSumOfWeights());
  hDNoEWKCorrIEWKWWMLL[i]      = (TH1D*)_filesEWKWW[i]->Get("hDNoEWKCorrSSWWMLL");      hDNoEWKCorrIEWKWWMLL[i]     ->Sumw2(); hDNoEWKCorrIEWKWWMLL[i]     ->Scale(xsEWKWW[i]/hDITotalMCWeightEWKWW[i]->GetSumOfWeights());
  hDNoEWKCorrIEWKWWMLL_PDF[i]  = (TH1D*)_filesEWKWW[i]->Get("hDNoEWKCorrSSWWMLL_PDF");  hDNoEWKCorrIEWKWWMLL_PDF[i] ->Sumw2(); hDNoEWKCorrIEWKWWMLL_PDF[i] ->Scale(xsEWKWW[i]/hDITotalMCWeightEWKWW[i]->GetSumOfWeights());
  hDNoEWKCorrIEWKWWMLL_QCD[i]  = (TH1D*)_filesEWKWW[i]->Get("hDNoEWKCorrSSWWMLL_QCD");  hDNoEWKCorrIEWKWWMLL_QCD[i] ->Sumw2(); hDNoEWKCorrIEWKWWMLL_QCD[i] ->Scale(xsEWKWW[i]/hDITotalMCWeightEWKWW[i]->GetSumOfWeights());
  hDNoEWKCorrIEWKWWPTL1[i]     = (TH1D*)_filesEWKWW[i]->Get("hDNoEWKCorrSSWWPTL1");     hDNoEWKCorrIEWKWWPTL1[i]    ->Sumw2(); hDNoEWKCorrIEWKWWPTL1[i]    ->Scale(xsEWKWW[i]/hDITotalMCWeightEWKWW[i]->GetSumOfWeights());
  hDNoEWKCorrIEWKWWPTL1_PDF[i] = (TH1D*)_filesEWKWW[i]->Get("hDNoEWKCorrSSWWPTL1_PDF"); hDNoEWKCorrIEWKWWPTL1_PDF[i]->Sumw2(); hDNoEWKCorrIEWKWWPTL1_PDF[i]->Scale(xsEWKWW[i]/hDITotalMCWeightEWKWW[i]->GetSumOfWeights());
  hDNoEWKCorrIEWKWWPTL1_QCD[i] = (TH1D*)_filesEWKWW[i]->Get("hDNoEWKCorrSSWWPTL1_QCD"); hDNoEWKCorrIEWKWWPTL1_QCD[i]->Sumw2(); hDNoEWKCorrIEWKWWPTL1_QCD[i]->Scale(xsEWKWW[i]/hDITotalMCWeightEWKWW[i]->GetSumOfWeights());
}

TH1D *hDNoEWKCorrEWKWWMJJ      = (TH1D*)hDNoEWKCorrIEWKWWMJJ     [0]->Clone("hDNoEWKCorrEWKWWMJJ"     );
TH1D *hDNoEWKCorrEWKWWMJJ_PDF  = (TH1D*)hDNoEWKCorrIEWKWWMJJ_PDF [0]->Clone("hDNoEWKCorrEWKWWMJJ_PDF" );
TH1D *hDNoEWKCorrEWKWWMJJ_QCD  = (TH1D*)hDNoEWKCorrIEWKWWMJJ_QCD [0]->Clone("hDNoEWKCorrEWKWWMJJ_QCD" );
TH1D *hDNoEWKCorrEWKWWMLL      = (TH1D*)hDNoEWKCorrIEWKWWMLL     [0]->Clone("hDNoEWKCorrEWKWWMLL"     );
TH1D *hDNoEWKCorrEWKWWMLL_PDF  = (TH1D*)hDNoEWKCorrIEWKWWMLL_PDF [0]->Clone("hDNoEWKCorrEWKWWMLL_PDF" );
TH1D *hDNoEWKCorrEWKWWMLL_QCD  = (TH1D*)hDNoEWKCorrIEWKWWMLL_QCD [0]->Clone("hDNoEWKCorrEWKWWMLL_QCD" );
TH1D *hDNoEWKCorrEWKWWPTL1     = (TH1D*)hDNoEWKCorrIEWKWWPTL1    [0]->Clone("hDNoEWKCorrEWKWWPTL1"    );
TH1D *hDNoEWKCorrEWKWWPTL1_PDF = (TH1D*)hDNoEWKCorrIEWKWWPTL1_PDF[0]->Clone("hDNoEWKCorrEWKWWPTL1_PDF");
TH1D *hDNoEWKCorrEWKWWPTL1_QCD = (TH1D*)hDNoEWKCorrIEWKWWPTL1_QCD[0]->Clone("hDNoEWKCorrEWKWWPTL1_QCD");

for(int i=1; i<nFilesEWKWW; i++){
  hDNoEWKCorrEWKWWMJJ	  ->Add(hDNoEWKCorrIEWKWWMJJ     [i]); 
  hDNoEWKCorrEWKWWMJJ_PDF ->Add(hDNoEWKCorrIEWKWWMJJ_PDF [i]);   
  hDNoEWKCorrEWKWWMJJ_QCD ->Add(hDNoEWKCorrIEWKWWMJJ_QCD [i]);   
  hDNoEWKCorrEWKWWMLL	  ->Add(hDNoEWKCorrIEWKWWMLL     [i]); 
  hDNoEWKCorrEWKWWMLL_PDF ->Add(hDNoEWKCorrIEWKWWMLL_PDF [i]);   
  hDNoEWKCorrEWKWWMLL_QCD ->Add(hDNoEWKCorrIEWKWWMLL_QCD [i]);   
  hDNoEWKCorrEWKWWPTL1	  ->Add(hDNoEWKCorrIEWKWWPTL1    [i]); 
  hDNoEWKCorrEWKWWPTL1_PDF->Add(hDNoEWKCorrIEWKWWPTL1_PDF[i]);   
  hDNoEWKCorrEWKWWPTL1_QCD->Add(hDNoEWKCorrIEWKWWPTL1_QCD[i]);   
}

diff[0] = 1000*(hDNoEWKCorrEWKWWMJJ_PDF->GetSumOfWeights()-hDNoEWKCorrEWKWWMJJ->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrEWKWWMJJ_QCD->GetSumOfWeights()-hDNoEWKCorrEWKWWMJJ->GetSumOfWeights());
printf("hDNoEWKCorrEWKWWMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrEWKWWMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrEWKWWMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrEWKWWMJJ_PDF->GetBinContent(i)-hDNoEWKCorrEWKWWMJJ->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrEWKWWMJJ_QCD->GetBinContent(i)-hDNoEWKCorrEWKWWMJJ->GetBinContent(i));
  printf("hDNoEWKCorrEWKWWMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrEWKWWMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

diff[0] = 1000*(hDNoEWKCorrEWKWWMLL_PDF->GetSumOfWeights()-hDNoEWKCorrEWKWWMLL->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrEWKWWMLL_QCD->GetSumOfWeights()-hDNoEWKCorrEWKWWMLL->GetSumOfWeights());
printf("hDNoEWKCorrEWKWWMLL: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrEWKWWMLL->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrEWKWWMLL->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrEWKWWMLL_PDF->GetBinContent(i)-hDNoEWKCorrEWKWWMLL->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrEWKWWMLL_QCD->GetBinContent(i)-hDNoEWKCorrEWKWWMLL->GetBinContent(i));
  printf("hDNoEWKCorrEWKWWMLL(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrEWKWWMLL->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

diff[0] = 1000*(hDNoEWKCorrEWKWWPTL1_PDF->GetSumOfWeights()-hDNoEWKCorrEWKWWPTL1->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrEWKWWPTL1_QCD->GetSumOfWeights()-hDNoEWKCorrEWKWWPTL1->GetSumOfWeights());
printf("hDNoEWKCorrEWKWWPTL1: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrEWKWWPTL1->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrEWKWWPTL1->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrEWKWWPTL1_PDF->GetBinContent(i)-hDNoEWKCorrEWKWWPTL1->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrEWKWWPTL1_QCD->GetBinContent(i)-hDNoEWKCorrEWKWWPTL1->GetBinContent(i));
  printf("hDNoEWKCorrEWKWWPTL1(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrEWKWWPTL1->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

// QCDWW NoEWKCorr applied
TH1D *hDNoEWKCorrIQCDWWMJJ[nFilesQCDWW];  TH1D *hDNoEWKCorrIQCDWWMJJ_PDF[nFilesQCDWW];  TH1D *hDNoEWKCorrIQCDWWMJJ_QCD[nFilesQCDWW];	 
TH1D *hDNoEWKCorrIQCDWWMLL[nFilesQCDWW];  TH1D *hDNoEWKCorrIQCDWWMLL_PDF[nFilesQCDWW];  TH1D *hDNoEWKCorrIQCDWWMLL_QCD[nFilesQCDWW];	 
TH1D *hDNoEWKCorrIQCDWWPTL1[nFilesQCDWW]; TH1D *hDNoEWKCorrIQCDWWPTL1_PDF[nFilesQCDWW]; TH1D *hDNoEWKCorrIQCDWWPTL1_QCD[nFilesQCDWW];	 

for(int i=0; i<nFilesQCDWW; i++){
  printf("QCDWWNoEWKCorr(%d)\n",i);
  hDNoEWKCorrIQCDWWMJJ[i]      = (TH1D*)_filesQCDWW[i]->Get("hDNoEWKCorrSSWWMJJ");      hDNoEWKCorrIQCDWWMJJ[i]	    ->Sumw2(); hDNoEWKCorrIQCDWWMJJ[i]     ->Scale(xsQCDWW[i]/hDITotalMCWeightQCDWW[i]->GetSumOfWeights());
  hDNoEWKCorrIQCDWWMJJ_PDF[i]  = (TH1D*)_filesQCDWW[i]->Get("hDNoEWKCorrSSWWMJJ_PDF");  hDNoEWKCorrIQCDWWMJJ_PDF[i] ->Sumw2(); hDNoEWKCorrIQCDWWMJJ_PDF[i] ->Scale(xsQCDWW[i]/hDITotalMCWeightQCDWW[i]->GetSumOfWeights());
  hDNoEWKCorrIQCDWWMJJ_QCD[i]  = (TH1D*)_filesQCDWW[i]->Get("hDNoEWKCorrSSWWMJJ_QCD");  hDNoEWKCorrIQCDWWMJJ_QCD[i] ->Sumw2(); hDNoEWKCorrIQCDWWMJJ_QCD[i] ->Scale(xsQCDWW[i]/hDITotalMCWeightQCDWW[i]->GetSumOfWeights());
  hDNoEWKCorrIQCDWWMLL[i]      = (TH1D*)_filesQCDWW[i]->Get("hDNoEWKCorrSSWWMLL");      hDNoEWKCorrIQCDWWMLL[i]	    ->Sumw2(); hDNoEWKCorrIQCDWWMLL[i]     ->Scale(xsQCDWW[i]/hDITotalMCWeightQCDWW[i]->GetSumOfWeights());
  hDNoEWKCorrIQCDWWMLL_PDF[i]  = (TH1D*)_filesQCDWW[i]->Get("hDNoEWKCorrSSWWMLL_PDF");  hDNoEWKCorrIQCDWWMLL_PDF[i] ->Sumw2(); hDNoEWKCorrIQCDWWMLL_PDF[i] ->Scale(xsQCDWW[i]/hDITotalMCWeightQCDWW[i]->GetSumOfWeights());
  hDNoEWKCorrIQCDWWMLL_QCD[i]  = (TH1D*)_filesQCDWW[i]->Get("hDNoEWKCorrSSWWMLL_QCD");  hDNoEWKCorrIQCDWWMLL_QCD[i] ->Sumw2(); hDNoEWKCorrIQCDWWMLL_QCD[i] ->Scale(xsQCDWW[i]/hDITotalMCWeightQCDWW[i]->GetSumOfWeights());
  hDNoEWKCorrIQCDWWPTL1[i]     = (TH1D*)_filesQCDWW[i]->Get("hDNoEWKCorrSSWWPTL1");     hDNoEWKCorrIQCDWWPTL1[i]    ->Sumw2(); hDNoEWKCorrIQCDWWPTL1[i]    ->Scale(xsQCDWW[i]/hDITotalMCWeightQCDWW[i]->GetSumOfWeights());
  hDNoEWKCorrIQCDWWPTL1_PDF[i] = (TH1D*)_filesQCDWW[i]->Get("hDNoEWKCorrSSWWPTL1_PDF"); hDNoEWKCorrIQCDWWPTL1_PDF[i]->Sumw2(); hDNoEWKCorrIQCDWWPTL1_PDF[i]->Scale(xsQCDWW[i]/hDITotalMCWeightQCDWW[i]->GetSumOfWeights());
  hDNoEWKCorrIQCDWWPTL1_QCD[i] = (TH1D*)_filesQCDWW[i]->Get("hDNoEWKCorrSSWWPTL1_QCD"); hDNoEWKCorrIQCDWWPTL1_QCD[i]->Sumw2(); hDNoEWKCorrIQCDWWPTL1_QCD[i]->Scale(xsQCDWW[i]/hDITotalMCWeightQCDWW[i]->GetSumOfWeights());
}

TH1D *hDNoEWKCorrQCDWWMJJ      = (TH1D*)hDNoEWKCorrIQCDWWMJJ     [0]->Clone("hDNoEWKCorrQCDWWMJJ"	  );
TH1D *hDNoEWKCorrQCDWWMJJ_PDF  = (TH1D*)hDNoEWKCorrIQCDWWMJJ_PDF [0]->Clone("hDNoEWKCorrQCDWWMJJ_PDF" );
TH1D *hDNoEWKCorrQCDWWMJJ_QCD  = (TH1D*)hDNoEWKCorrIQCDWWMJJ_QCD [0]->Clone("hDNoEWKCorrQCDWWMJJ_QCD" );
TH1D *hDNoEWKCorrQCDWWMLL      = (TH1D*)hDNoEWKCorrIQCDWWMLL     [0]->Clone("hDNoEWKCorrQCDWWMLL"	  );
TH1D *hDNoEWKCorrQCDWWMLL_PDF  = (TH1D*)hDNoEWKCorrIQCDWWMLL_PDF [0]->Clone("hDNoEWKCorrQCDWWMLL_PDF" );
TH1D *hDNoEWKCorrQCDWWMLL_QCD  = (TH1D*)hDNoEWKCorrIQCDWWMLL_QCD [0]->Clone("hDNoEWKCorrQCDWWMLL_QCD" );
TH1D *hDNoEWKCorrQCDWWPTL1     = (TH1D*)hDNoEWKCorrIQCDWWPTL1    [0]->Clone("hDNoEWKCorrQCDWWPTL1"    );
TH1D *hDNoEWKCorrQCDWWPTL1_PDF = (TH1D*)hDNoEWKCorrIQCDWWPTL1_PDF[0]->Clone("hDNoEWKCorrQCDWWPTL1_PDF");
TH1D *hDNoEWKCorrQCDWWPTL1_QCD = (TH1D*)hDNoEWKCorrIQCDWWPTL1_QCD[0]->Clone("hDNoEWKCorrQCDWWPTL1_QCD");

for(int i=1; i<nFilesQCDWW; i++){
  hDNoEWKCorrQCDWWMJJ	 ->Add(hDNoEWKCorrIQCDWWMJJ     [i]); 
  hDNoEWKCorrQCDWWMJJ_PDF ->Add(hDNoEWKCorrIQCDWWMJJ_PDF [i]);   
  hDNoEWKCorrQCDWWMJJ_QCD ->Add(hDNoEWKCorrIQCDWWMJJ_QCD [i]);   
  hDNoEWKCorrQCDWWMLL	 ->Add(hDNoEWKCorrIQCDWWMLL     [i]); 
  hDNoEWKCorrQCDWWMLL_PDF ->Add(hDNoEWKCorrIQCDWWMLL_PDF [i]);   
  hDNoEWKCorrQCDWWMLL_QCD ->Add(hDNoEWKCorrIQCDWWMLL_QCD [i]);   
  hDNoEWKCorrQCDWWPTL1	 ->Add(hDNoEWKCorrIQCDWWPTL1    [i]); 
  hDNoEWKCorrQCDWWPTL1_PDF->Add(hDNoEWKCorrIQCDWWPTL1_PDF[i]);   
  hDNoEWKCorrQCDWWPTL1_QCD->Add(hDNoEWKCorrIQCDWWPTL1_QCD[i]);   
}

diff[0] = 1000*(hDNoEWKCorrQCDWWMJJ_PDF->GetSumOfWeights()-hDNoEWKCorrQCDWWMJJ->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrQCDWWMJJ_QCD->GetSumOfWeights()-hDNoEWKCorrQCDWWMJJ->GetSumOfWeights());
printf("hDNoEWKCorrQCDWWMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrQCDWWMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrQCDWWMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrQCDWWMJJ_PDF->GetBinContent(i)-hDNoEWKCorrQCDWWMJJ->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrQCDWWMJJ_QCD->GetBinContent(i)-hDNoEWKCorrQCDWWMJJ->GetBinContent(i));
  printf("hDNoEWKCorrQCDWWMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrQCDWWMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

diff[0] = 1000*(hDNoEWKCorrQCDWWMLL_PDF->GetSumOfWeights()-hDNoEWKCorrQCDWWMLL->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrQCDWWMLL_QCD->GetSumOfWeights()-hDNoEWKCorrQCDWWMLL->GetSumOfWeights());
printf("hDNoEWKCorrQCDWWMLL: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrQCDWWMLL->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrQCDWWMLL->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrQCDWWMLL_PDF->GetBinContent(i)-hDNoEWKCorrQCDWWMLL->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrQCDWWMLL_QCD->GetBinContent(i)-hDNoEWKCorrQCDWWMLL->GetBinContent(i));
  printf("hDNoEWKCorrQCDWWMLL(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrQCDWWMLL->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

diff[0] = 1000*(hDNoEWKCorrQCDWWPTL1_PDF->GetSumOfWeights()-hDNoEWKCorrQCDWWPTL1->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrQCDWWPTL1_QCD->GetSumOfWeights()-hDNoEWKCorrQCDWWPTL1->GetSumOfWeights());
printf("hDNoEWKCorrQCDWWPTL1: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrQCDWWPTL1->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrQCDWWPTL1->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrQCDWWPTL1_PDF->GetBinContent(i)-hDNoEWKCorrQCDWWPTL1->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrQCDWWPTL1_QCD->GetBinContent(i)-hDNoEWKCorrQCDWWPTL1->GetBinContent(i));
  printf("hDNoEWKCorrQCDWWPTL1(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrQCDWWPTL1->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

// INTWW NoEWKCorr applied
TH1D *hDNoEWKCorrIINTWWMJJ[nFilesINTWW];  TH1D *hDNoEWKCorrIINTWWMJJ_PDF[nFilesINTWW];  TH1D *hDNoEWKCorrIINTWWMJJ_QCD[nFilesINTWW];	 
TH1D *hDNoEWKCorrIINTWWMLL[nFilesINTWW];  TH1D *hDNoEWKCorrIINTWWMLL_PDF[nFilesINTWW];  TH1D *hDNoEWKCorrIINTWWMLL_QCD[nFilesINTWW];	 
TH1D *hDNoEWKCorrIINTWWPTL1[nFilesINTWW]; TH1D *hDNoEWKCorrIINTWWPTL1_PDF[nFilesINTWW]; TH1D *hDNoEWKCorrIINTWWPTL1_QCD[nFilesINTWW];	 

for(int i=0; i<nFilesINTWW; i++){
  printf("INTWWEWKCorr(%d)\n",i);
  hDNoEWKCorrIINTWWMJJ[i]      = (TH1D*)_filesINTWW[i]->Get("hDNoEWKCorrSSWWMJJ");      hDNoEWKCorrIINTWWMJJ[i]     ->Sumw2(); hDNoEWKCorrIINTWWMJJ[i]     ->Scale(xsINTWW[i]/hDITotalMCWeightINTWW[i]->GetSumOfWeights());
  hDNoEWKCorrIINTWWMJJ_PDF[i]  = (TH1D*)_filesINTWW[i]->Get("hDNoEWKCorrSSWWMJJ_PDF");  hDNoEWKCorrIINTWWMJJ_PDF[i] ->Sumw2(); hDNoEWKCorrIINTWWMJJ_PDF[i] ->Scale(xsINTWW[i]/hDITotalMCWeightINTWW[i]->GetSumOfWeights());
  hDNoEWKCorrIINTWWMJJ_QCD[i]  = (TH1D*)_filesINTWW[i]->Get("hDNoEWKCorrSSWWMJJ_QCD");  hDNoEWKCorrIINTWWMJJ_QCD[i] ->Sumw2(); hDNoEWKCorrIINTWWMJJ_QCD[i] ->Scale(xsINTWW[i]/hDITotalMCWeightINTWW[i]->GetSumOfWeights());
  hDNoEWKCorrIINTWWMLL[i]      = (TH1D*)_filesINTWW[i]->Get("hDNoEWKCorrSSWWMLL");      hDNoEWKCorrIINTWWMLL[i]     ->Sumw2(); hDNoEWKCorrIINTWWMLL[i]     ->Scale(xsINTWW[i]/hDITotalMCWeightINTWW[i]->GetSumOfWeights());
  hDNoEWKCorrIINTWWMLL_PDF[i]  = (TH1D*)_filesINTWW[i]->Get("hDNoEWKCorrSSWWMLL_PDF");  hDNoEWKCorrIINTWWMLL_PDF[i] ->Sumw2(); hDNoEWKCorrIINTWWMLL_PDF[i] ->Scale(xsINTWW[i]/hDITotalMCWeightINTWW[i]->GetSumOfWeights());
  hDNoEWKCorrIINTWWMLL_QCD[i]  = (TH1D*)_filesINTWW[i]->Get("hDNoEWKCorrSSWWMLL_QCD");  hDNoEWKCorrIINTWWMLL_QCD[i] ->Sumw2(); hDNoEWKCorrIINTWWMLL_QCD[i] ->Scale(xsINTWW[i]/hDITotalMCWeightINTWW[i]->GetSumOfWeights());
  hDNoEWKCorrIINTWWPTL1[i]     = (TH1D*)_filesINTWW[i]->Get("hDNoEWKCorrSSWWPTL1");     hDNoEWKCorrIINTWWPTL1[i]    ->Sumw2(); hDNoEWKCorrIINTWWPTL1[i]    ->Scale(xsINTWW[i]/hDITotalMCWeightINTWW[i]->GetSumOfWeights());
  hDNoEWKCorrIINTWWPTL1_PDF[i] = (TH1D*)_filesINTWW[i]->Get("hDNoEWKCorrSSWWPTL1_PDF"); hDNoEWKCorrIINTWWPTL1_PDF[i]->Sumw2(); hDNoEWKCorrIINTWWPTL1_PDF[i]->Scale(xsINTWW[i]/hDITotalMCWeightINTWW[i]->GetSumOfWeights());
  hDNoEWKCorrIINTWWPTL1_QCD[i] = (TH1D*)_filesINTWW[i]->Get("hDNoEWKCorrSSWWPTL1_QCD"); hDNoEWKCorrIINTWWPTL1_QCD[i]->Sumw2(); hDNoEWKCorrIINTWWPTL1_QCD[i]->Scale(xsINTWW[i]/hDITotalMCWeightINTWW[i]->GetSumOfWeights());
}

TH1D *hDNoEWKCorrINTWWMJJ      = (TH1D*)hDNoEWKCorrIINTWWMJJ     [0]->Clone("hDNoEWKCorrINTWWMJJ"	  );
TH1D *hDNoEWKCorrINTWWMJJ_PDF  = (TH1D*)hDNoEWKCorrIINTWWMJJ_PDF [0]->Clone("hDNoEWKCorrINTWWMJJ_PDF" );
TH1D *hDNoEWKCorrINTWWMJJ_QCD  = (TH1D*)hDNoEWKCorrIINTWWMJJ_QCD [0]->Clone("hDNoEWKCorrINTWWMJJ_QCD" );
TH1D *hDNoEWKCorrINTWWMLL      = (TH1D*)hDNoEWKCorrIINTWWMLL     [0]->Clone("hDNoEWKCorrINTWWMLL"	  );
TH1D *hDNoEWKCorrINTWWMLL_PDF  = (TH1D*)hDNoEWKCorrIINTWWMLL_PDF [0]->Clone("hDNoEWKCorrINTWWMLL_PDF" );
TH1D *hDNoEWKCorrINTWWMLL_QCD  = (TH1D*)hDNoEWKCorrIINTWWMLL_QCD [0]->Clone("hDNoEWKCorrINTWWMLL_QCD" );
TH1D *hDNoEWKCorrINTWWPTL1     = (TH1D*)hDNoEWKCorrIINTWWPTL1    [0]->Clone("hDNoEWKCorrINTWWPTL1"    );
TH1D *hDNoEWKCorrINTWWPTL1_PDF = (TH1D*)hDNoEWKCorrIINTWWPTL1_PDF[0]->Clone("hDNoEWKCorrINTWWPTL1_PDF");
TH1D *hDNoEWKCorrINTWWPTL1_QCD = (TH1D*)hDNoEWKCorrIINTWWPTL1_QCD[0]->Clone("hDNoEWKCorrINTWWPTL1_QCD");

for(int i=1; i<nFilesINTWW; i++){
  hDNoEWKCorrINTWWMJJ	 ->Add(hDNoEWKCorrIINTWWMJJ     [i]); 
  hDNoEWKCorrINTWWMJJ_PDF ->Add(hDNoEWKCorrIINTWWMJJ_PDF [i]);   
  hDNoEWKCorrINTWWMJJ_QCD ->Add(hDNoEWKCorrIINTWWMJJ_QCD [i]);   
  hDNoEWKCorrINTWWMLL	 ->Add(hDNoEWKCorrIINTWWMLL     [i]); 
  hDNoEWKCorrINTWWMLL_PDF ->Add(hDNoEWKCorrIINTWWMLL_PDF [i]);   
  hDNoEWKCorrINTWWMLL_QCD ->Add(hDNoEWKCorrIINTWWMLL_QCD [i]);   
  hDNoEWKCorrINTWWPTL1	 ->Add(hDNoEWKCorrIINTWWPTL1    [i]); 
  hDNoEWKCorrINTWWPTL1_PDF->Add(hDNoEWKCorrIINTWWPTL1_PDF[i]);   
  hDNoEWKCorrINTWWPTL1_QCD->Add(hDNoEWKCorrIINTWWPTL1_QCD[i]);   
}

diff[0] = 1000*(hDNoEWKCorrINTWWMJJ_PDF->GetSumOfWeights()-hDNoEWKCorrINTWWMJJ->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrINTWWMJJ_QCD->GetSumOfWeights()-hDNoEWKCorrINTWWMJJ->GetSumOfWeights());
printf("hDNoEWKCorrINTWWMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrINTWWMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrINTWWMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrINTWWMJJ_PDF->GetBinContent(i)-hDNoEWKCorrINTWWMJJ->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrINTWWMJJ_QCD->GetBinContent(i)-hDNoEWKCorrINTWWMJJ->GetBinContent(i));
  printf("hDNoEWKCorrINTWWMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrINTWWMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

diff[0] = 1000*(hDNoEWKCorrINTWWMLL_PDF->GetSumOfWeights()-hDNoEWKCorrINTWWMLL->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrINTWWMLL_QCD->GetSumOfWeights()-hDNoEWKCorrINTWWMLL->GetSumOfWeights());
printf("hDNoEWKCorrINTWWMLL: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrINTWWMLL->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrINTWWMLL->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrINTWWMLL_PDF->GetBinContent(i)-hDNoEWKCorrINTWWMLL->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrINTWWMLL_QCD->GetBinContent(i)-hDNoEWKCorrINTWWMLL->GetBinContent(i));
  printf("hDNoEWKCorrINTWWMLL(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrINTWWMLL->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

diff[0] = 1000*(hDNoEWKCorrINTWWPTL1_PDF->GetSumOfWeights()-hDNoEWKCorrINTWWPTL1->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrINTWWPTL1_QCD->GetSumOfWeights()-hDNoEWKCorrINTWWPTL1->GetSumOfWeights());
printf("hDNoEWKCorrINTWWPTL1: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrINTWWPTL1->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrINTWWPTL1->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrINTWWPTL1_PDF->GetBinContent(i)-hDNoEWKCorrINTWWPTL1->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrINTWWPTL1_QCD->GetBinContent(i)-hDNoEWKCorrINTWWPTL1->GetBinContent(i));
  printf("hDNoEWKCorrINTWWPTL1(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrINTWWPTL1->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

// EWKWZ NoEWKCorr applied
TH1D *hDNoEWKCorrIEWKWZMJJ[nFilesEWKWZ];  TH1D *hDNoEWKCorrIEWKWZMJJ_PDF[nFilesEWKWZ];  TH1D *hDNoEWKCorrIEWKWZMJJ_QCD[nFilesEWKWZ];	 

for(int i=0; i<nFilesEWKWZ; i++){
  printf("EWKWZEWKCorr(%d)\n",i);
  hDNoEWKCorrIEWKWZMJJ[i]      = (TH1D*)_filesEWKWZ[i]->Get("hDNoEWKCorrWZMJJ");      hDNoEWKCorrIEWKWZMJJ[i]     ->Sumw2(); hDNoEWKCorrIEWKWZMJJ[i]     ->Scale(xsEWKWZ[i]/hDITotalMCWeightEWKWZ[i]->GetSumOfWeights());
  hDNoEWKCorrIEWKWZMJJ_PDF[i]  = (TH1D*)_filesEWKWZ[i]->Get("hDNoEWKCorrWZMJJ_PDF");  hDNoEWKCorrIEWKWZMJJ_PDF[i] ->Sumw2(); hDNoEWKCorrIEWKWZMJJ_PDF[i] ->Scale(xsEWKWZ[i]/hDITotalMCWeightEWKWZ[i]->GetSumOfWeights());
  hDNoEWKCorrIEWKWZMJJ_QCD[i]  = (TH1D*)_filesEWKWZ[i]->Get("hDNoEWKCorrWZMJJ_QCD");  hDNoEWKCorrIEWKWZMJJ_QCD[i] ->Sumw2(); hDNoEWKCorrIEWKWZMJJ_QCD[i] ->Scale(xsEWKWZ[i]/hDITotalMCWeightEWKWZ[i]->GetSumOfWeights());
}

TH1D *hDNoEWKCorrEWKWZMJJ      = (TH1D*)hDNoEWKCorrIEWKWZMJJ     [0]->Clone("hDNoEWKCorrEWKWZMJJ"     );
TH1D *hDNoEWKCorrEWKWZMJJ_PDF  = (TH1D*)hDNoEWKCorrIEWKWZMJJ_PDF [0]->Clone("hDNoEWKCorrEWKWZMJJ_PDF" );
TH1D *hDNoEWKCorrEWKWZMJJ_QCD  = (TH1D*)hDNoEWKCorrIEWKWZMJJ_QCD [0]->Clone("hDNoEWKCorrEWKWZMJJ_QCD" );

for(int i=1; i<nFilesEWKWZ; i++){
  hDNoEWKCorrEWKWZMJJ	 ->Add(hDNoEWKCorrIEWKWZMJJ     [i]); 
  hDNoEWKCorrEWKWZMJJ_PDF ->Add(hDNoEWKCorrIEWKWZMJJ_PDF [i]);   
  hDNoEWKCorrEWKWZMJJ_QCD ->Add(hDNoEWKCorrIEWKWZMJJ_QCD [i]);   
}

diff[0] = 1000*(hDNoEWKCorrEWKWZMJJ_PDF->GetSumOfWeights()-hDNoEWKCorrEWKWZMJJ->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrEWKWZMJJ_QCD->GetSumOfWeights()-hDNoEWKCorrEWKWZMJJ->GetSumOfWeights());
printf("hDNoEWKCorrEWKWZMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrEWKWZMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrEWKWZMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrEWKWZMJJ_PDF->GetBinContent(i)-hDNoEWKCorrEWKWZMJJ->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrEWKWZMJJ_QCD->GetBinContent(i)-hDNoEWKCorrEWKWZMJJ->GetBinContent(i));
  printf("hDNoEWKCorrEWKWZMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrEWKWZMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

// QCDWZ NoEWKCorr applied
TH1D *hDNoEWKCorrIQCDWZMJJ[nFilesQCDWZ];  TH1D *hDNoEWKCorrIQCDWZMJJ_PDF[nFilesQCDWZ];  TH1D *hDNoEWKCorrIQCDWZMJJ_QCD[nFilesQCDWZ];	 

for(int i=0; i<nFilesQCDWZ; i++){
  printf("QCDWZEWKCorr(%d)\n",i);
  hDNoEWKCorrIQCDWZMJJ[i]      = (TH1D*)_filesQCDWZ[i]->Get("hDNoEWKCorrWZMJJ");      hDNoEWKCorrIQCDWZMJJ[i]	  ->Sumw2(); hDNoEWKCorrIQCDWZMJJ[i]     ->Scale(xsQCDWZ[i]/hDITotalMCWeightQCDWZ[i]->GetSumOfWeights());
  hDNoEWKCorrIQCDWZMJJ_PDF[i]  = (TH1D*)_filesQCDWZ[i]->Get("hDNoEWKCorrWZMJJ_PDF");  hDNoEWKCorrIQCDWZMJJ_PDF[i] ->Sumw2(); hDNoEWKCorrIQCDWZMJJ_PDF[i] ->Scale(xsQCDWZ[i]/hDITotalMCWeightQCDWZ[i]->GetSumOfWeights());
  hDNoEWKCorrIQCDWZMJJ_QCD[i]  = (TH1D*)_filesQCDWZ[i]->Get("hDNoEWKCorrWZMJJ_QCD");  hDNoEWKCorrIQCDWZMJJ_QCD[i] ->Sumw2(); hDNoEWKCorrIQCDWZMJJ_QCD[i] ->Scale(xsQCDWZ[i]/hDITotalMCWeightQCDWZ[i]->GetSumOfWeights());
}

TH1D *hDNoEWKCorrQCDWZMJJ      = (TH1D*)hDNoEWKCorrIQCDWZMJJ     [0]->Clone("hDNoEWKCorrQCDWZMJJ"     );
TH1D *hDNoEWKCorrQCDWZMJJ_PDF  = (TH1D*)hDNoEWKCorrIQCDWZMJJ_PDF [0]->Clone("hDNoEWKCorrQCDWZMJJ_PDF" );
TH1D *hDNoEWKCorrQCDWZMJJ_QCD  = (TH1D*)hDNoEWKCorrIQCDWZMJJ_QCD [0]->Clone("hDNoEWKCorrQCDWZMJJ_QCD" );

for(int i=1; i<nFilesQCDWZ; i++){
  hDNoEWKCorrQCDWZMJJ	  ->Add(hDNoEWKCorrIQCDWZMJJ     [i]); 
  hDNoEWKCorrQCDWZMJJ_PDF ->Add(hDNoEWKCorrIQCDWZMJJ_PDF [i]);   
  hDNoEWKCorrQCDWZMJJ_QCD ->Add(hDNoEWKCorrIQCDWZMJJ_QCD [i]);   
}

diff[0] = 1000*(hDNoEWKCorrQCDWZMJJ_PDF->GetSumOfWeights()-hDNoEWKCorrQCDWZMJJ->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrQCDWZMJJ_QCD->GetSumOfWeights()-hDNoEWKCorrQCDWZMJJ->GetSumOfWeights());
printf("hDNoEWKCorrQCDWZMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrQCDWZMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrQCDWZMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrQCDWZMJJ_PDF->GetBinContent(i)-hDNoEWKCorrQCDWZMJJ->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrQCDWZMJJ_QCD->GetBinContent(i)-hDNoEWKCorrQCDWZMJJ->GetBinContent(i));
  printf("hDNoEWKCorrQCDWZMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrQCDWZMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

// INTWZ NoEWKCorr applied
TH1D *hDNoEWKCorrIINTWZMJJ[nFilesINTWZ];  TH1D *hDNoEWKCorrIINTWZMJJ_PDF[nFilesINTWZ];  TH1D *hDNoEWKCorrIINTWZMJJ_QCD[nFilesINTWZ];	 

for(int i=0; i<nFilesINTWZ; i++){
  printf("INTWZEWKCorr(%d)\n",i);
  hDNoEWKCorrIINTWZMJJ[i]      = (TH1D*)_filesINTWZ[i]->Get("hDNoEWKCorrWZMJJ");      hDNoEWKCorrIINTWZMJJ[i]	  ->Sumw2(); hDNoEWKCorrIINTWZMJJ[i]     ->Scale(xsINTWZ[i]/hDITotalMCWeightINTWZ[i]->GetSumOfWeights());
  hDNoEWKCorrIINTWZMJJ_PDF[i]  = (TH1D*)_filesINTWZ[i]->Get("hDNoEWKCorrWZMJJ_PDF");  hDNoEWKCorrIINTWZMJJ_PDF[i] ->Sumw2(); hDNoEWKCorrIINTWZMJJ_PDF[i] ->Scale(xsINTWZ[i]/hDITotalMCWeightINTWZ[i]->GetSumOfWeights());
  hDNoEWKCorrIINTWZMJJ_QCD[i]  = (TH1D*)_filesINTWZ[i]->Get("hDNoEWKCorrWZMJJ_QCD");  hDNoEWKCorrIINTWZMJJ_QCD[i] ->Sumw2(); hDNoEWKCorrIINTWZMJJ_QCD[i] ->Scale(xsINTWZ[i]/hDITotalMCWeightINTWZ[i]->GetSumOfWeights());
}

TH1D *hDNoEWKCorrINTWZMJJ      = (TH1D*)hDNoEWKCorrIINTWZMJJ     [0]->Clone("hDNoEWKCorrINTWZMJJ"     );
TH1D *hDNoEWKCorrINTWZMJJ_PDF  = (TH1D*)hDNoEWKCorrIINTWZMJJ_PDF [0]->Clone("hDNoEWKCorrINTWZMJJ_PDF" );
TH1D *hDNoEWKCorrINTWZMJJ_QCD  = (TH1D*)hDNoEWKCorrIINTWZMJJ_QCD [0]->Clone("hDNoEWKCorrINTWZMJJ_QCD" );

for(int i=1; i<nFilesINTWZ; i++){
  hDNoEWKCorrINTWZMJJ	 ->Add(hDNoEWKCorrIINTWZMJJ     [i]); 
  hDNoEWKCorrINTWZMJJ_PDF ->Add(hDNoEWKCorrIINTWZMJJ_PDF [i]);   
  hDNoEWKCorrINTWZMJJ_QCD ->Add(hDNoEWKCorrIINTWZMJJ_QCD [i]);   
}

diff[0] = 1000*(hDNoEWKCorrINTWZMJJ_PDF->GetSumOfWeights()-hDNoEWKCorrINTWZMJJ->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrINTWZMJJ_QCD->GetSumOfWeights()-hDNoEWKCorrINTWZMJJ->GetSumOfWeights());
printf("hDNoEWKCorrINTWZMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrINTWZMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrINTWZMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrINTWZMJJ_PDF->GetBinContent(i)-hDNoEWKCorrINTWZMJJ->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrINTWZMJJ_QCD->GetBinContent(i)-hDNoEWKCorrINTWZMJJ->GetBinContent(i));
  printf("hDNoEWKCorrINTWZMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrINTWZMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

TFile myOutputFile("genVBS.root","RECREATE");
  hDEWKWWMJJ     ->Write(); 
  hDEWKWWMJJ_PDF ->Write(); 
  hDEWKWWMJJ_QCD ->Write(); 
  hDEWKWWMLL     ->Write(); 
  hDEWKWWMLL_PDF ->Write(); 
  hDEWKWWMLL_QCD ->Write(); 
  hDEWKWWPTL1    ->Write(); 
  hDEWKWWPTL1_PDF->Write(); 
  hDEWKWWPTL1_QCD->Write(); 
  hDEWKWZMJJ	 ->Write(); 
  hDEWKWZMJJ_PDF ->Write(); 
  hDEWKWZMJJ_QCD ->Write(); 
  hDNoEWKCorrEWKWWMJJ     ->Write(); 
  hDNoEWKCorrEWKWWMJJ_PDF ->Write(); 
  hDNoEWKCorrEWKWWMJJ_QCD ->Write();
  hDNoEWKCorrEWKWWMLL     ->Write(); 
  hDNoEWKCorrEWKWWMLL_PDF ->Write(); 
  hDNoEWKCorrEWKWWMLL_QCD ->Write(); 
  hDNoEWKCorrEWKWWPTL1    ->Write(); 
  hDNoEWKCorrEWKWWPTL1_PDF->Write(); 
  hDNoEWKCorrEWKWWPTL1_QCD->Write(); 
  hDNoEWKCorrQCDWWMJJ     ->Write(); 
  hDNoEWKCorrQCDWWMJJ_PDF ->Write(); 
  hDNoEWKCorrQCDWWMJJ_QCD ->Write();
  hDNoEWKCorrQCDWWMLL     ->Write(); 
  hDNoEWKCorrQCDWWMLL_PDF ->Write(); 
  hDNoEWKCorrQCDWWMLL_QCD ->Write(); 
  hDNoEWKCorrQCDWWPTL1    ->Write(); 
  hDNoEWKCorrQCDWWPTL1_PDF->Write(); 
  hDNoEWKCorrQCDWWPTL1_QCD->Write(); 
  hDNoEWKCorrINTWWMJJ     ->Write(); 
  hDNoEWKCorrINTWWMJJ_PDF ->Write(); 
  hDNoEWKCorrINTWWMJJ_QCD ->Write();
  hDNoEWKCorrINTWWMLL     ->Write(); 
  hDNoEWKCorrINTWWMLL_PDF ->Write(); 
  hDNoEWKCorrINTWWMLL_QCD ->Write(); 
  hDNoEWKCorrINTWWPTL1    ->Write(); 
  hDNoEWKCorrINTWWPTL1_PDF->Write(); 
  hDNoEWKCorrINTWWPTL1_QCD->Write(); 
  hDNoEWKCorrEWKWZMJJ	  ->Write(); 
  hDNoEWKCorrEWKWZMJJ_PDF ->Write(); 
  hDNoEWKCorrEWKWZMJJ_QCD ->Write(); 
  hDNoEWKCorrQCDWZMJJ	  ->Write(); 
  hDNoEWKCorrQCDWZMJJ_PDF ->Write(); 
  hDNoEWKCorrQCDWZMJJ_QCD ->Write(); 
  hDNoEWKCorrINTWZMJJ	  ->Write(); 
  hDNoEWKCorrINTWZMJJ_PDF ->Write(); 
  hDNoEWKCorrINTWZMJJ_QCD ->Write(); 
myOutputFile.Close();

}
