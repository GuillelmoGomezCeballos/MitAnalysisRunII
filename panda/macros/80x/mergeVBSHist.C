
void mergeVBSHist() {

double diff[2];

TString inputFolder = "/data/t3home000/ceballos/panda/v_001_0";

const int nFilesWW = 1+1;
TFile *_fileWW[nFilesWW];
_fileWW[0] = TFile::Open(Form("%s/WpWp_QCD.root"  , inputFolder.Data()));
_fileWW[1] = TFile::Open(Form("%s/WpWp_EWK.root"  , inputFolder.Data()));
const int nFilesWZ = 4+1;
TFile *_fileWZ[nFilesWZ];
_fileWZ[0] = TFile::Open(Form("%s/WZ3l_0Jets_MG_QCD.root",inputFolder.Data()));
_fileWZ[1] = TFile::Open(Form("%s/WZ3l_1Jets_MG_QCD.root",inputFolder.Data()));
_fileWZ[2] = TFile::Open(Form("%s/WZ3l_2Jets_MG_QCD.root",inputFolder.Data()));
_fileWZ[3] = TFile::Open(Form("%s/WZ3l_3Jets_MG_QCD.root",inputFolder.Data()));
_fileWZ[4] = TFile::Open(Form("%s/WZ3l_MG_EWK.root",inputFolder.Data()));

double xsWW[nFilesWW] = {0.0269642,
                         0.0261515
			 };

double xsWZ[nFilesWZ] = {0.5770677*1.109*1.206,
         	         0.3445573*1.109*1.206,
         	         0.0768421*1.109*1.206,
         	         0.1112010*1.109*1.206,
	     	         0.0176340
                         };

TH1D *hDITotalMCWeightWW[nFilesWW];
for(int i=0; i<nFilesWW; i++){
  hDITotalMCWeightWW[i] = (TH1D*)_fileWW[i]->Get("hDTotalMCWeight");	 
}
TH1D *hDITotalMCWeightWZ[nFilesWZ];
for(int i=0; i<nFilesWZ; i++){
  hDITotalMCWeightWZ[i] = (TH1D*)_fileWZ[i]->Get("hDTotalMCWeight");	 
}

// EWKCorr applied
TH1D *hDIWWMJJ[nFilesWW]; TH1D *hDIWWMJJ_PDF[nFilesWW]; TH1D *hDIWWMJJ_QCD[nFilesWW];	 
TH1D *hDIWWMLL[nFilesWW]; TH1D *hDIWWMLL_PDF[nFilesWW]; TH1D *hDIWWMLL_QCD[nFilesWW];	 
TH1D *hDIWWPTL1[nFilesWW]; TH1D *hDIWWPTL1_PDF[nFilesWW]; TH1D *hDIWWPTL1_QCD[nFilesWW];	 

for(int i=0; i<nFilesWW; i++){
  printf("WWEWKCorr(%d)\n",i);
  hDIWWMJJ[i]     = (TH1D*)_fileWW[i]->Get("hDSSWWMJJ");     hDIWWMJJ[i]    ->Sumw2(); hDIWWMJJ[i]    ->Scale(xsWW[i]/hDITotalMCWeightWW[i]->GetSumOfWeights());
  hDIWWMJJ_PDF[i] = (TH1D*)_fileWW[i]->Get("hDSSWWMJJ_PDF"); hDIWWMJJ_PDF[i]->Sumw2(); hDIWWMJJ_PDF[i]->Scale(xsWW[i]/hDITotalMCWeightWW[i]->GetSumOfWeights());
  hDIWWMJJ_QCD[i] = (TH1D*)_fileWW[i]->Get("hDSSWWMJJ_QCD"); hDIWWMJJ_QCD[i]->Sumw2(); hDIWWMJJ_QCD[i]->Scale(xsWW[i]/hDITotalMCWeightWW[i]->GetSumOfWeights());
  hDIWWMLL[i]     = (TH1D*)_fileWW[i]->Get("hDSSWWMLL");     hDIWWMLL[i]    ->Sumw2(); hDIWWMLL[i]    ->Scale(xsWW[i]/hDITotalMCWeightWW[i]->GetSumOfWeights());
  hDIWWMLL_PDF[i] = (TH1D*)_fileWW[i]->Get("hDSSWWMLL_PDF"); hDIWWMLL_PDF[i]->Sumw2(); hDIWWMLL_PDF[i]->Scale(xsWW[i]/hDITotalMCWeightWW[i]->GetSumOfWeights());
  hDIWWMLL_QCD[i] = (TH1D*)_fileWW[i]->Get("hDSSWWMLL_QCD"); hDIWWMLL_QCD[i]->Sumw2(); hDIWWMLL_QCD[i]->Scale(xsWW[i]/hDITotalMCWeightWW[i]->GetSumOfWeights());
  hDIWWPTL1[i]     = (TH1D*)_fileWW[i]->Get("hDSSWWPTL1");     hDIWWPTL1[i]    ->Sumw2(); hDIWWPTL1[i]    ->Scale(xsWW[i]/hDITotalMCWeightWW[i]->GetSumOfWeights());
  hDIWWPTL1_PDF[i] = (TH1D*)_fileWW[i]->Get("hDSSWWPTL1_PDF"); hDIWWPTL1_PDF[i]->Sumw2(); hDIWWPTL1_PDF[i]->Scale(xsWW[i]/hDITotalMCWeightWW[i]->GetSumOfWeights());
  hDIWWPTL1_QCD[i] = (TH1D*)_fileWW[i]->Get("hDSSWWPTL1_QCD"); hDIWWPTL1_QCD[i]->Sumw2(); hDIWWPTL1_QCD[i]->Scale(xsWW[i]/hDITotalMCWeightWW[i]->GetSumOfWeights());
}

TH1D *hDEWKWWMJJ     = (TH1D*)hDIWWMJJ    [nFilesWW-1]->Clone("hDEWKWWMJJ"    );
TH1D *hDEWKWWMJJ_PDF = (TH1D*)hDIWWMJJ_PDF[nFilesWW-1]->Clone("hDEWKWWMJJ_PDF");
TH1D *hDEWKWWMJJ_QCD = (TH1D*)hDIWWMJJ_QCD[nFilesWW-1]->Clone("hDEWKWWMJJ_QCD");
TH1D *hDEWKWWMLL     = (TH1D*)hDIWWMLL    [nFilesWW-1]->Clone("hDEWKWWMLL"    );
TH1D *hDEWKWWMLL_PDF = (TH1D*)hDIWWMLL_PDF[nFilesWW-1]->Clone("hDEWKWWMLL_PDF");
TH1D *hDEWKWWMLL_QCD = (TH1D*)hDIWWMLL_QCD[nFilesWW-1]->Clone("hDEWKWWMLL_QCD");
TH1D *hDEWKWWPTL1     = (TH1D*)hDIWWPTL1    [nFilesWW-1]->Clone("hDEWKWWPTL1"    );
TH1D *hDEWKWWPTL1_PDF = (TH1D*)hDIWWPTL1_PDF[nFilesWW-1]->Clone("hDEWKWWPTL1_PDF");
TH1D *hDEWKWWPTL1_QCD = (TH1D*)hDIWWPTL1_QCD[nFilesWW-1]->Clone("hDEWKWWPTL1_QCD");

// MJJ with EWKCorr
diff[0] = 1000*(hDEWKWWMJJ_PDF->GetSumOfWeights()-hDEWKWWMJJ->GetSumOfWeights());
diff[1] = 1000*(hDEWKWWMJJ_QCD->GetSumOfWeights()-hDEWKWWMJJ->GetSumOfWeights());
printf("hDEWKWWMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDEWKWWMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDEWKWWMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDEWKWWMJJ_PDF->GetBinContent(i)-hDEWKWWMJJ->GetBinContent(i));
  diff[1] = 1000*(hDEWKWWMJJ_QCD->GetBinContent(i)-hDEWKWWMJJ->GetBinContent(i));
  printf("hDEWKWWMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDEWKWWMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

TH1D *hDQCDWWMJJ     = (TH1D*)hDIWWMJJ[0]    ->Clone("hDQCDWWMJJ"    );
TH1D *hDQCDWWMJJ_PDF = (TH1D*)hDIWWMJJ_PDF[0]->Clone("hDQCDWWMJJ_PDF");
TH1D *hDQCDWWMJJ_QCD = (TH1D*)hDIWWMJJ_QCD[0]->Clone("hDQCDWWMJJ_QCD");

for(int i=1; i<nFilesWW-1; i++){
  printf("Should no go through here\n");
  hDQCDWWMJJ    ->Add(hDIWWMJJ    [i]);	
  hDQCDWWMJJ_PDF->Add(hDIWWMJJ_PDF[i]);   
  hDQCDWWMJJ_QCD->Add(hDIWWMJJ_QCD[i]);   
}

diff[0] = 1000*(hDQCDWWMJJ_PDF->GetSumOfWeights()-hDQCDWWMJJ->GetSumOfWeights());
diff[1] = 1000*(hDQCDWWMJJ_QCD->GetSumOfWeights()-hDQCDWWMJJ->GetSumOfWeights());
printf("hDQCDWWMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDQCDWWMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDQCDWWMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDQCDWWMJJ_PDF->GetBinContent(i)-hDQCDWWMJJ->GetBinContent(i));
  diff[1] = 1000*(hDQCDWWMJJ_QCD->GetBinContent(i)-hDQCDWWMJJ->GetBinContent(i));
  printf("hDQCDWWMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDQCDWWMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

TH1D *hDAllWWMJJ     = (TH1D*)hDIWWMJJ[0]    ->Clone("hDAllWWMJJ"    );
TH1D *hDAllWWMJJ_PDF = (TH1D*)hDIWWMJJ_PDF[0]->Clone("hDAllWWMJJ_PDF");
TH1D *hDAllWWMJJ_QCD = (TH1D*)hDIWWMJJ_QCD[0]->Clone("hDAllWWMJJ_QCD");

for(int i=1; i<nFilesWW; i++){
  hDAllWWMJJ    ->Add(hDIWWMJJ    [i]);	
  hDAllWWMJJ_PDF->Add(hDIWWMJJ_PDF[i]);   
  hDAllWWMJJ_QCD->Add(hDIWWMJJ_QCD[i]);   
}

diff[0] = 1000*(hDAllWWMJJ_PDF->GetSumOfWeights()-hDAllWWMJJ->GetSumOfWeights());
diff[1] = 1000*(hDAllWWMJJ_QCD->GetSumOfWeights()-hDAllWWMJJ->GetSumOfWeights());
printf("hDAllWWMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDAllWWMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDAllWWMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDAllWWMJJ_PDF->GetBinContent(i)-hDAllWWMJJ->GetBinContent(i));
  diff[1] = 1000*(hDAllWWMJJ_QCD->GetBinContent(i)-hDAllWWMJJ->GetBinContent(i));
  printf("hDAllWWMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDAllWWMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

MLLToMJJCorr = hDEWKWWMJJ->GetSumOfWeights()/hDEWKWWMLL->GetSumOfWeights();
printf("MLLToMJJCorr: %f\n",MLLToMJJCorr);
hDEWKWWMLL    ->Scale(MLLToMJJCorr);
hDEWKWWMLL_PDF->Scale(MLLToMJJCorr);
hDEWKWWMLL_QCD->Scale(MLLToMJJCorr);
// MLL with EWKCorr
diff[0] = 1000*(hDEWKWWMLL_PDF->GetSumOfWeights()-hDEWKWWMLL->GetSumOfWeights());
diff[1] = 1000*(hDEWKWWMLL_QCD->GetSumOfWeights()-hDEWKWWMLL->GetSumOfWeights());
printf("hDEWKWWMLL: %.2f %.2f %.2f (%.2f)\n",1000*hDEWKWWMLL->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDEWKWWMLL->GetNbinsX();i++){
  diff[0] = 1000*(hDEWKWWMLL_PDF->GetBinContent(i)-hDEWKWWMLL->GetBinContent(i));
  diff[1] = 1000*(hDEWKWWMLL_QCD->GetBinContent(i)-hDEWKWWMLL->GetBinContent(i));
  printf("hDEWKWWMLL(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDEWKWWMLL->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

TH1D *hDQCDWWMLL     = (TH1D*)hDIWWMLL[0]    ->Clone("hDQCDWWMLL"    );
TH1D *hDQCDWWMLL_PDF = (TH1D*)hDIWWMLL_PDF[0]->Clone("hDQCDWWMLL_PDF");
TH1D *hDQCDWWMLL_QCD = (TH1D*)hDIWWMLL_QCD[0]->Clone("hDQCDWWMLL_QCD");

for(int i=1; i<nFilesWW-1; i++){
  printf("Should no go through here\n");
  hDQCDWWMLL    ->Add(hDIWWMLL    [i]);	
  hDQCDWWMLL_PDF->Add(hDIWWMLL_PDF[i]);   
  hDQCDWWMLL_QCD->Add(hDIWWMLL_QCD[i]);   
}

diff[0] = 1000*(hDQCDWWMLL_PDF->GetSumOfWeights()-hDQCDWWMLL->GetSumOfWeights());
diff[1] = 1000*(hDQCDWWMLL_QCD->GetSumOfWeights()-hDQCDWWMLL->GetSumOfWeights());
printf("hDQCDWWMLL: %.2f %.2f %.2f (%.2f)\n",1000*hDQCDWWMLL->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDQCDWWMLL->GetNbinsX();i++){
  diff[0] = 1000*(hDQCDWWMLL_PDF->GetBinContent(i)-hDQCDWWMLL->GetBinContent(i));
  diff[1] = 1000*(hDQCDWWMLL_QCD->GetBinContent(i)-hDQCDWWMLL->GetBinContent(i));
  printf("hDQCDWWMLL(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDQCDWWMLL->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

TH1D *hDAllWWMLL     = (TH1D*)hDIWWMLL[0]    ->Clone("hDAllWWMLL"    );
TH1D *hDAllWWMLL_PDF = (TH1D*)hDIWWMLL_PDF[0]->Clone("hDAllWWMLL_PDF");
TH1D *hDAllWWMLL_QCD = (TH1D*)hDIWWMLL_QCD[0]->Clone("hDAllWWMLL_QCD");

for(int i=1; i<nFilesWW; i++){
  hDAllWWMLL    ->Add(hDIWWMLL    [i]);	
  hDAllWWMLL_PDF->Add(hDIWWMLL_PDF[i]);   
  hDAllWWMLL_QCD->Add(hDIWWMLL_QCD[i]);   
}

diff[0] = 1000*(hDAllWWMLL_PDF->GetSumOfWeights()-hDAllWWMLL->GetSumOfWeights());
diff[1] = 1000*(hDAllWWMLL_QCD->GetSumOfWeights()-hDAllWWMLL->GetSumOfWeights());
printf("hDAllWWMLL: %.2f %.2f %.2f (%.2f)\n",1000*hDAllWWMLL->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDAllWWMLL->GetNbinsX();i++){
  diff[0] = 1000*(hDAllWWMLL_PDF->GetBinContent(i)-hDAllWWMLL->GetBinContent(i));
  diff[1] = 1000*(hDAllWWMLL_QCD->GetBinContent(i)-hDAllWWMLL->GetBinContent(i));
  printf("hDAllWWMLL(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDAllWWMLL->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

PTL1ToMJJCorr = hDEWKWWMJJ->GetSumOfWeights()/hDEWKWWPTL1->GetSumOfWeights();
printf("PTL1ToMJJCorr: %f\n",PTL1ToMJJCorr);
hDEWKWWPTL1    ->Scale(PTL1ToMJJCorr);
hDEWKWWPTL1_PDF->Scale(PTL1ToMJJCorr);
hDEWKWWPTL1_QCD->Scale(PTL1ToMJJCorr);
// PTL1 with EWKCorr
diff[0] = 1000*(hDEWKWWPTL1_PDF->GetSumOfWeights()-hDEWKWWPTL1->GetSumOfWeights());
diff[1] = 1000*(hDEWKWWPTL1_QCD->GetSumOfWeights()-hDEWKWWPTL1->GetSumOfWeights());
printf("hDEWKWWPTL1: %.2f %.2f %.2f (%.2f)\n",1000*hDEWKWWPTL1->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDEWKWWPTL1->GetNbinsX();i++){
  diff[0] = 1000*(hDEWKWWPTL1_PDF->GetBinContent(i)-hDEWKWWPTL1->GetBinContent(i));
  diff[1] = 1000*(hDEWKWWPTL1_QCD->GetBinContent(i)-hDEWKWWPTL1->GetBinContent(i));
  printf("hDEWKWWPTL1(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDEWKWWPTL1->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

TH1D *hDQCDWWPTL1     = (TH1D*)hDIWWPTL1[0]    ->Clone("hDQCDWWPTL1"    );
TH1D *hDQCDWWPTL1_PDF = (TH1D*)hDIWWPTL1_PDF[0]->Clone("hDQCDWWPTL1_PDF");
TH1D *hDQCDWWPTL1_QCD = (TH1D*)hDIWWPTL1_QCD[0]->Clone("hDQCDWWPTL1_QCD");

for(int i=1; i<nFilesWW-1; i++){
  printf("Should no go through here\n");
  hDQCDWWPTL1    ->Add(hDIWWPTL1    [i]);	
  hDQCDWWPTL1_PDF->Add(hDIWWPTL1_PDF[i]);   
  hDQCDWWPTL1_QCD->Add(hDIWWPTL1_QCD[i]);   
}

diff[0] = 1000*(hDQCDWWPTL1_PDF->GetSumOfWeights()-hDQCDWWPTL1->GetSumOfWeights());
diff[1] = 1000*(hDQCDWWPTL1_QCD->GetSumOfWeights()-hDQCDWWPTL1->GetSumOfWeights());
printf("hDQCDWWPTL1: %.2f %.2f %.2f (%.2f)\n",1000*hDQCDWWPTL1->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDQCDWWPTL1->GetNbinsX();i++){
  diff[0] = 1000*(hDQCDWWPTL1_PDF->GetBinContent(i)-hDQCDWWPTL1->GetBinContent(i));
  diff[1] = 1000*(hDQCDWWPTL1_QCD->GetBinContent(i)-hDQCDWWPTL1->GetBinContent(i));
  printf("hDQCDWWPTL1(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDQCDWWPTL1->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

TH1D *hDAllWWPTL1     = (TH1D*)hDIWWPTL1[0]    ->Clone("hDAllWWPTL1"    );
TH1D *hDAllWWPTL1_PDF = (TH1D*)hDIWWPTL1_PDF[0]->Clone("hDAllWWPTL1_PDF");
TH1D *hDAllWWPTL1_QCD = (TH1D*)hDIWWPTL1_QCD[0]->Clone("hDAllWWPTL1_QCD");

for(int i=1; i<nFilesWW; i++){
  hDAllWWPTL1    ->Add(hDIWWPTL1    [i]);	
  hDAllWWPTL1_PDF->Add(hDIWWPTL1_PDF[i]);   
  hDAllWWPTL1_QCD->Add(hDIWWPTL1_QCD[i]);   
}

diff[0] = 1000*(hDAllWWPTL1_PDF->GetSumOfWeights()-hDAllWWPTL1->GetSumOfWeights());
diff[1] = 1000*(hDAllWWPTL1_QCD->GetSumOfWeights()-hDAllWWPTL1->GetSumOfWeights());
printf("hDAllWWPTL1: %.2f %.2f %.2f (%.2f)\n",1000*hDAllWWPTL1->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDAllWWPTL1->GetNbinsX();i++){
  diff[0] = 1000*(hDAllWWPTL1_PDF->GetBinContent(i)-hDAllWWPTL1->GetBinContent(i));
  diff[1] = 1000*(hDAllWWPTL1_QCD->GetBinContent(i)-hDAllWWPTL1->GetBinContent(i));
  printf("hDAllWWPTL1(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDAllWWPTL1->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

// NoEWKEWKCorr applied
TH1D *hDINoEWKCorrWWMJJ[nFilesWW]; TH1D *hDINoEWKCorrWWMJJ_PDF[nFilesWW]; TH1D *hDINoEWKCorrWWMJJ_QCD[nFilesWW];	 
TH1D *hDINoEWKCorrWWMLL[nFilesWW]; TH1D *hDINoEWKCorrWWMLL_PDF[nFilesWW]; TH1D *hDINoEWKCorrWWMLL_QCD[nFilesWW];	 
TH1D *hDINoEWKCorrWWPTL1[nFilesWW]; TH1D *hDINoEWKCorrWWPTL1_PDF[nFilesWW]; TH1D *hDINoEWKCorrWWPTL1_QCD[nFilesWW];	 

for(int i=0; i<nFilesWW; i++){
  printf("WWNoEWKEWKCorr(%d)\n",i);
  hDINoEWKCorrWWMJJ[i]     = (TH1D*)_fileWW[i]->Get("hDNoEWKCorrSSWWMJJ");     hDINoEWKCorrWWMJJ[i]    ->Sumw2(); hDINoEWKCorrWWMJJ[i]    ->Scale(xsWW[i]/hDITotalMCWeightWW[i]->GetSumOfWeights());
  hDINoEWKCorrWWMJJ_PDF[i] = (TH1D*)_fileWW[i]->Get("hDNoEWKCorrSSWWMJJ_PDF"); hDINoEWKCorrWWMJJ_PDF[i]->Sumw2(); hDINoEWKCorrWWMJJ_PDF[i]->Scale(xsWW[i]/hDITotalMCWeightWW[i]->GetSumOfWeights());
  hDINoEWKCorrWWMJJ_QCD[i] = (TH1D*)_fileWW[i]->Get("hDNoEWKCorrSSWWMJJ_QCD"); hDINoEWKCorrWWMJJ_QCD[i]->Sumw2(); hDINoEWKCorrWWMJJ_QCD[i]->Scale(xsWW[i]/hDITotalMCWeightWW[i]->GetSumOfWeights());
  hDINoEWKCorrWWMLL[i]     = (TH1D*)_fileWW[i]->Get("hDNoEWKCorrSSWWMLL");     hDINoEWKCorrWWMLL[i]    ->Sumw2(); hDINoEWKCorrWWMLL[i]    ->Scale(xsWW[i]/hDITotalMCWeightWW[i]->GetSumOfWeights());
  hDINoEWKCorrWWMLL_PDF[i] = (TH1D*)_fileWW[i]->Get("hDNoEWKCorrSSWWMLL_PDF"); hDINoEWKCorrWWMLL_PDF[i]->Sumw2(); hDINoEWKCorrWWMLL_PDF[i]->Scale(xsWW[i]/hDITotalMCWeightWW[i]->GetSumOfWeights());
  hDINoEWKCorrWWMLL_QCD[i] = (TH1D*)_fileWW[i]->Get("hDNoEWKCorrSSWWMLL_QCD"); hDINoEWKCorrWWMLL_QCD[i]->Sumw2(); hDINoEWKCorrWWMLL_QCD[i]->Scale(xsWW[i]/hDITotalMCWeightWW[i]->GetSumOfWeights());
  hDINoEWKCorrWWPTL1[i]     = (TH1D*)_fileWW[i]->Get("hDNoEWKCorrSSWWPTL1");     hDINoEWKCorrWWPTL1[i]    ->Sumw2(); hDINoEWKCorrWWPTL1[i]    ->Scale(xsWW[i]/hDITotalMCWeightWW[i]->GetSumOfWeights());
  hDINoEWKCorrWWPTL1_PDF[i] = (TH1D*)_fileWW[i]->Get("hDNoEWKCorrSSWWPTL1_PDF"); hDINoEWKCorrWWPTL1_PDF[i]->Sumw2(); hDINoEWKCorrWWPTL1_PDF[i]->Scale(xsWW[i]/hDITotalMCWeightWW[i]->GetSumOfWeights());
  hDINoEWKCorrWWPTL1_QCD[i] = (TH1D*)_fileWW[i]->Get("hDNoEWKCorrSSWWPTL1_QCD"); hDINoEWKCorrWWPTL1_QCD[i]->Sumw2(); hDINoEWKCorrWWPTL1_QCD[i]->Scale(xsWW[i]/hDITotalMCWeightWW[i]->GetSumOfWeights());
}

TH1D *hDNoEWKCorrEWKWWMJJ     = (TH1D*)hDINoEWKCorrWWMJJ    [nFilesWW-1]->Clone("hDNoEWKCorrEWKWWMJJ"	 );
TH1D *hDNoEWKCorrEWKWWMJJ_PDF = (TH1D*)hDINoEWKCorrWWMJJ_PDF[nFilesWW-1]->Clone("hDNoEWKCorrEWKWWMJJ_PDF");
TH1D *hDNoEWKCorrEWKWWMJJ_QCD = (TH1D*)hDINoEWKCorrWWMJJ_QCD[nFilesWW-1]->Clone("hDNoEWKCorrEWKWWMJJ_QCD");
TH1D *hDNoEWKCorrEWKWWMLL     = (TH1D*)hDINoEWKCorrWWMLL    [nFilesWW-1]->Clone("hDNoEWKCorrEWKWWMLL"	 );
TH1D *hDNoEWKCorrEWKWWMLL_PDF = (TH1D*)hDINoEWKCorrWWMLL_PDF[nFilesWW-1]->Clone("hDNoEWKCorrEWKWWMLL_PDF");
TH1D *hDNoEWKCorrEWKWWMLL_QCD = (TH1D*)hDINoEWKCorrWWMLL_QCD[nFilesWW-1]->Clone("hDNoEWKCorrEWKWWMLL_QCD");
TH1D *hDNoEWKCorrEWKWWPTL1     = (TH1D*)hDINoEWKCorrWWPTL1    [nFilesWW-1]->Clone("hDNoEWKCorrEWKWWPTL1"    );
TH1D *hDNoEWKCorrEWKWWPTL1_PDF = (TH1D*)hDINoEWKCorrWWPTL1_PDF[nFilesWW-1]->Clone("hDNoEWKCorrEWKWWPTL1_PDF");
TH1D *hDNoEWKCorrEWKWWPTL1_QCD = (TH1D*)hDINoEWKCorrWWPTL1_QCD[nFilesWW-1]->Clone("hDNoEWKCorrEWKWWPTL1_QCD");

// MJJ with NoEWKCorr
diff[0] = 1000*(hDNoEWKCorrEWKWWMJJ_PDF->GetSumOfWeights()-hDNoEWKCorrEWKWWMJJ->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrEWKWWMJJ_QCD->GetSumOfWeights()-hDNoEWKCorrEWKWWMJJ->GetSumOfWeights());
printf("hDNoEWKCorrEWKWWMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrEWKWWMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrEWKWWMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrEWKWWMJJ_PDF->GetBinContent(i)-hDNoEWKCorrEWKWWMJJ->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrEWKWWMJJ_QCD->GetBinContent(i)-hDNoEWKCorrEWKWWMJJ->GetBinContent(i));
  printf("hDNoEWKCorrEWKWWMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrEWKWWMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

TH1D *hDNoEWKCorrQCDWWMJJ     = (TH1D*)hDINoEWKCorrWWMJJ[0]    ->Clone("hDNoEWKCorrQCDWWMJJ"	);
TH1D *hDNoEWKCorrQCDWWMJJ_PDF = (TH1D*)hDINoEWKCorrWWMJJ_PDF[0]->Clone("hDNoEWKCorrQCDWWMJJ_PDF");
TH1D *hDNoEWKCorrQCDWWMJJ_QCD = (TH1D*)hDINoEWKCorrWWMJJ_QCD[0]->Clone("hDNoEWKCorrQCDWWMJJ_QCD");

for(int i=1; i<nFilesWW-1; i++){
  printf("Should no go through here\n");
  hDNoEWKCorrQCDWWMJJ    ->Add(hDINoEWKCorrWWMJJ    [i]);	
  hDNoEWKCorrQCDWWMJJ_PDF->Add(hDINoEWKCorrWWMJJ_PDF[i]);   
  hDNoEWKCorrQCDWWMJJ_QCD->Add(hDINoEWKCorrWWMJJ_QCD[i]);   
}

diff[0] = 1000*(hDNoEWKCorrQCDWWMJJ_PDF->GetSumOfWeights()-hDNoEWKCorrQCDWWMJJ->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrQCDWWMJJ_QCD->GetSumOfWeights()-hDNoEWKCorrQCDWWMJJ->GetSumOfWeights());
printf("hDNoEWKCorrQCDWWMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrQCDWWMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrQCDWWMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrQCDWWMJJ_PDF->GetBinContent(i)-hDNoEWKCorrQCDWWMJJ->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrQCDWWMJJ_QCD->GetBinContent(i)-hDNoEWKCorrQCDWWMJJ->GetBinContent(i));
  printf("hDNoEWKCorrQCDWWMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrQCDWWMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

TH1D *hDNoEWKCorrAllWWMJJ     = (TH1D*)hDINoEWKCorrWWMJJ[0]    ->Clone("hDNoEWKCorrAllWWMJJ"	);
TH1D *hDNoEWKCorrAllWWMJJ_PDF = (TH1D*)hDINoEWKCorrWWMJJ_PDF[0]->Clone("hDNoEWKCorrAllWWMJJ_PDF");
TH1D *hDNoEWKCorrAllWWMJJ_QCD = (TH1D*)hDINoEWKCorrWWMJJ_QCD[0]->Clone("hDNoEWKCorrAllWWMJJ_QCD");

for(int i=1; i<nFilesWW; i++){
  hDNoEWKCorrAllWWMJJ    ->Add(hDINoEWKCorrWWMJJ    [i]);	
  hDNoEWKCorrAllWWMJJ_PDF->Add(hDINoEWKCorrWWMJJ_PDF[i]);   
  hDNoEWKCorrAllWWMJJ_QCD->Add(hDINoEWKCorrWWMJJ_QCD[i]);   
}

diff[0] = 1000*(hDNoEWKCorrAllWWMJJ_PDF->GetSumOfWeights()-hDNoEWKCorrAllWWMJJ->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrAllWWMJJ_QCD->GetSumOfWeights()-hDNoEWKCorrAllWWMJJ->GetSumOfWeights());
printf("hDNoEWKCorrAllWWMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrAllWWMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrAllWWMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrAllWWMJJ_PDF->GetBinContent(i)-hDNoEWKCorrAllWWMJJ->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrAllWWMJJ_QCD->GetBinContent(i)-hDNoEWKCorrAllWWMJJ->GetBinContent(i));
  printf("hDNoEWKCorrAllWWMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrAllWWMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

// MLL with NoEWKCorr
diff[0] = 1000*(hDNoEWKCorrEWKWWMLL_PDF->GetSumOfWeights()-hDNoEWKCorrEWKWWMLL->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrEWKWWMLL_QCD->GetSumOfWeights()-hDNoEWKCorrEWKWWMLL->GetSumOfWeights());
printf("hDNoEWKCorrEWKWWMLL: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrEWKWWMLL->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrEWKWWMLL->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrEWKWWMLL_PDF->GetBinContent(i)-hDNoEWKCorrEWKWWMLL->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrEWKWWMLL_QCD->GetBinContent(i)-hDNoEWKCorrEWKWWMLL->GetBinContent(i));
  printf("hDNoEWKCorrEWKWWMLL(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrEWKWWMLL->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

TH1D *hDNoEWKCorrQCDWWMLL     = (TH1D*)hDINoEWKCorrWWMLL[0]    ->Clone("hDNoEWKCorrQCDWWMLL"	);
TH1D *hDNoEWKCorrQCDWWMLL_PDF = (TH1D*)hDINoEWKCorrWWMLL_PDF[0]->Clone("hDNoEWKCorrQCDWWMLL_PDF");
TH1D *hDNoEWKCorrQCDWWMLL_QCD = (TH1D*)hDINoEWKCorrWWMLL_QCD[0]->Clone("hDNoEWKCorrQCDWWMLL_QCD");

for(int i=1; i<nFilesWW-1; i++){
  printf("Should no go through here\n");
  hDNoEWKCorrQCDWWMLL    ->Add(hDINoEWKCorrWWMLL    [i]);	
  hDNoEWKCorrQCDWWMLL_PDF->Add(hDINoEWKCorrWWMLL_PDF[i]);   
  hDNoEWKCorrQCDWWMLL_QCD->Add(hDINoEWKCorrWWMLL_QCD[i]);   
}

diff[0] = 1000*(hDNoEWKCorrQCDWWMLL_PDF->GetSumOfWeights()-hDNoEWKCorrQCDWWMLL->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrQCDWWMLL_QCD->GetSumOfWeights()-hDNoEWKCorrQCDWWMLL->GetSumOfWeights());
printf("hDNoEWKCorrQCDWWMLL: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrQCDWWMLL->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrQCDWWMLL->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrQCDWWMLL_PDF->GetBinContent(i)-hDNoEWKCorrQCDWWMLL->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrQCDWWMLL_QCD->GetBinContent(i)-hDNoEWKCorrQCDWWMLL->GetBinContent(i));
  printf("hDNoEWKCorrQCDWWMLL(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrQCDWWMLL->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

TH1D *hDNoEWKCorrAllWWMLL     = (TH1D*)hDINoEWKCorrWWMLL[0]    ->Clone("hDNoEWKCorrAllWWMLL"	);
TH1D *hDNoEWKCorrAllWWMLL_PDF = (TH1D*)hDINoEWKCorrWWMLL_PDF[0]->Clone("hDNoEWKCorrAllWWMLL_PDF");
TH1D *hDNoEWKCorrAllWWMLL_QCD = (TH1D*)hDINoEWKCorrWWMLL_QCD[0]->Clone("hDNoEWKCorrAllWWMLL_QCD");

for(int i=1; i<nFilesWW; i++){
  hDNoEWKCorrAllWWMLL    ->Add(hDINoEWKCorrWWMLL    [i]);	
  hDNoEWKCorrAllWWMLL_PDF->Add(hDINoEWKCorrWWMLL_PDF[i]);   
  hDNoEWKCorrAllWWMLL_QCD->Add(hDINoEWKCorrWWMLL_QCD[i]);   
}

diff[0] = 1000*(hDNoEWKCorrAllWWMLL_PDF->GetSumOfWeights()-hDNoEWKCorrAllWWMLL->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrAllWWMLL_QCD->GetSumOfWeights()-hDNoEWKCorrAllWWMLL->GetSumOfWeights());
printf("hDNoEWKCorrAllWWMLL: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrAllWWMLL->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrAllWWMLL->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrAllWWMLL_PDF->GetBinContent(i)-hDNoEWKCorrAllWWMLL->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrAllWWMLL_QCD->GetBinContent(i)-hDNoEWKCorrAllWWMLL->GetBinContent(i));
  printf("hDNoEWKCorrAllWWMLL(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrAllWWMLL->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}


// PTL1 with NoEWKCorr
diff[0] = 1000*(hDNoEWKCorrEWKWWPTL1_PDF->GetSumOfWeights()-hDNoEWKCorrEWKWWPTL1->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrEWKWWPTL1_QCD->GetSumOfWeights()-hDNoEWKCorrEWKWWPTL1->GetSumOfWeights());
printf("hDNoEWKCorrEWKWWPTL1: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrEWKWWPTL1->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrEWKWWPTL1->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrEWKWWPTL1_PDF->GetBinContent(i)-hDNoEWKCorrEWKWWPTL1->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrEWKWWPTL1_QCD->GetBinContent(i)-hDNoEWKCorrEWKWWPTL1->GetBinContent(i));
  printf("hDNoEWKCorrEWKWWPTL1(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrEWKWWPTL1->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

TH1D *hDNoEWKCorrQCDWWPTL1     = (TH1D*)hDINoEWKCorrWWPTL1[0]    ->Clone("hDNoEWKCorrQCDWWPTL1"	);
TH1D *hDNoEWKCorrQCDWWPTL1_PDF = (TH1D*)hDINoEWKCorrWWPTL1_PDF[0]->Clone("hDNoEWKCorrQCDWWPTL1_PDF");
TH1D *hDNoEWKCorrQCDWWPTL1_QCD = (TH1D*)hDINoEWKCorrWWPTL1_QCD[0]->Clone("hDNoEWKCorrQCDWWPTL1_QCD");

for(int i=1; i<nFilesWW-1; i++){
  printf("Should no go through here\n");
  hDNoEWKCorrQCDWWPTL1    ->Add(hDINoEWKCorrWWPTL1    [i]);	
  hDNoEWKCorrQCDWWPTL1_PDF->Add(hDINoEWKCorrWWPTL1_PDF[i]);   
  hDNoEWKCorrQCDWWPTL1_QCD->Add(hDINoEWKCorrWWPTL1_QCD[i]);   
}

diff[0] = 1000*(hDNoEWKCorrQCDWWPTL1_PDF->GetSumOfWeights()-hDNoEWKCorrQCDWWPTL1->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrQCDWWPTL1_QCD->GetSumOfWeights()-hDNoEWKCorrQCDWWPTL1->GetSumOfWeights());
printf("hDNoEWKCorrQCDWWPTL1: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrQCDWWPTL1->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrQCDWWPTL1->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrQCDWWPTL1_PDF->GetBinContent(i)-hDNoEWKCorrQCDWWPTL1->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrQCDWWPTL1_QCD->GetBinContent(i)-hDNoEWKCorrQCDWWPTL1->GetBinContent(i));
  printf("hDNoEWKCorrQCDWWPTL1(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrQCDWWPTL1->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

TH1D *hDNoEWKCorrAllWWPTL1     = (TH1D*)hDINoEWKCorrWWPTL1[0]    ->Clone("hDNoEWKCorrAllWWPTL1"	);
TH1D *hDNoEWKCorrAllWWPTL1_PDF = (TH1D*)hDINoEWKCorrWWPTL1_PDF[0]->Clone("hDNoEWKCorrAllWWPTL1_PDF");
TH1D *hDNoEWKCorrAllWWPTL1_QCD = (TH1D*)hDINoEWKCorrWWPTL1_QCD[0]->Clone("hDNoEWKCorrAllWWPTL1_QCD");

for(int i=1; i<nFilesWW; i++){
  hDNoEWKCorrAllWWPTL1    ->Add(hDINoEWKCorrWWPTL1    [i]);	
  hDNoEWKCorrAllWWPTL1_PDF->Add(hDINoEWKCorrWWPTL1_PDF[i]);   
  hDNoEWKCorrAllWWPTL1_QCD->Add(hDINoEWKCorrWWPTL1_QCD[i]);   
}

diff[0] = 1000*(hDNoEWKCorrAllWWPTL1_PDF->GetSumOfWeights()-hDNoEWKCorrAllWWPTL1->GetSumOfWeights());
diff[1] = 1000*(hDNoEWKCorrAllWWPTL1_QCD->GetSumOfWeights()-hDNoEWKCorrAllWWPTL1->GetSumOfWeights());
printf("hDNoEWKCorrAllWWPTL1: %.2f %.2f %.2f (%.2f)\n",1000*hDNoEWKCorrAllWWPTL1->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDNoEWKCorrAllWWPTL1->GetNbinsX();i++){
  diff[0] = 1000*(hDNoEWKCorrAllWWPTL1_PDF->GetBinContent(i)-hDNoEWKCorrAllWWPTL1->GetBinContent(i));
  diff[1] = 1000*(hDNoEWKCorrAllWWPTL1_QCD->GetBinContent(i)-hDNoEWKCorrAllWWPTL1->GetBinContent(i));
  printf("hDNoEWKCorrAllWWPTL1(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDNoEWKCorrAllWWPTL1->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

// WZ with EWKCorr
TH1D *hDIWZMJJ[nFilesWZ]; TH1D *hDIWZMJJ_PDF[nFilesWZ]; TH1D *hDIWZMJJ_QCD[nFilesWZ];	 

for(int i=0; i<nFilesWZ; i++){
  printf("WZEWKCorr(%d)\n",i);
  hDIWZMJJ[i]     = (TH1D*)_fileWZ[i]->Get("hDWZMJJ");     hDIWZMJJ[i]	  ->Sumw2(); hDIWZMJJ[i]    ->Scale(xsWZ[i]/hDITotalMCWeightWZ[i]->GetSumOfWeights());  
  hDIWZMJJ_PDF[i] = (TH1D*)_fileWZ[i]->Get("hDWZMJJ_PDF"); hDIWZMJJ_PDF[i]->Sumw2(); hDIWZMJJ_PDF[i]->Scale(xsWZ[i]/hDITotalMCWeightWZ[i]->GetSumOfWeights());  
  hDIWZMJJ_QCD[i] = (TH1D*)_fileWZ[i]->Get("hDWZMJJ_QCD"); hDIWZMJJ_QCD[i]->Sumw2(); hDIWZMJJ_QCD[i]->Scale(xsWZ[i]/hDITotalMCWeightWZ[i]->GetSumOfWeights());  
}

TH1D *hDEWKWZMJJ     = (TH1D*)hDIWZMJJ    [nFilesWZ-1]->Clone("hDEWKWZMJJ"    );
TH1D *hDEWKWZMJJ_PDF = (TH1D*)hDIWZMJJ_PDF[nFilesWZ-1]->Clone("hDEWKWZMJJ_PDF");
TH1D *hDEWKWZMJJ_QCD = (TH1D*)hDIWZMJJ_QCD[nFilesWZ-1]->Clone("hDEWKWZMJJ_QCD");

diff[0] = 1000*(hDEWKWZMJJ_PDF->GetSumOfWeights()-hDEWKWZMJJ->GetSumOfWeights());
diff[1] = 1000*(hDEWKWZMJJ_QCD->GetSumOfWeights()-hDEWKWZMJJ->GetSumOfWeights());
printf("hDEWKWZMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDEWKWZMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDEWKWZMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDEWKWZMJJ_PDF->GetBinContent(i)-hDEWKWZMJJ->GetBinContent(i));
  diff[1] = 1000*(hDEWKWZMJJ_QCD->GetBinContent(i)-hDEWKWZMJJ->GetBinContent(i));
  printf("hDEWKWZMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDEWKWZMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

TH1D *hDQCDWZMJJ     = (TH1D*)hDIWZMJJ[0]    ->Clone("hDQCDWZMJJ"    );
TH1D *hDQCDWZMJJ_PDF = (TH1D*)hDIWZMJJ_PDF[0]->Clone("hDQCDWZMJJ_PDF");
TH1D *hDQCDWZMJJ_QCD = (TH1D*)hDIWZMJJ_QCD[0]->Clone("hDQCDWZMJJ_QCD");

for(int i=1; i<nFilesWZ-1; i++){
  hDQCDWZMJJ    ->Add(hDIWZMJJ    [i]);	
  hDQCDWZMJJ_PDF->Add(hDIWZMJJ_PDF[i]);   
  hDQCDWZMJJ_QCD->Add(hDIWZMJJ_QCD[i]);   
}

diff[0] = 1000*(hDQCDWZMJJ_PDF->GetSumOfWeights()-hDQCDWZMJJ->GetSumOfWeights());
diff[1] = 1000*(hDQCDWZMJJ_QCD->GetSumOfWeights()-hDQCDWZMJJ->GetSumOfWeights());
printf("hDQCDWZMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDQCDWZMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDQCDWZMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDQCDWZMJJ_PDF->GetBinContent(i)-hDQCDWZMJJ->GetBinContent(i));
  diff[1] = 1000*(hDQCDWZMJJ_QCD->GetBinContent(i)-hDQCDWZMJJ->GetBinContent(i));
  printf("hDQCDWZMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDQCDWZMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

TH1D *hDAllWZMJJ     = (TH1D*)hDIWZMJJ[0]    ->Clone("hDAllWZMJJ"    );
TH1D *hDAllWZMJJ_PDF = (TH1D*)hDIWZMJJ_PDF[0]->Clone("hDAllWZMJJ_PDF");
TH1D *hDAllWZMJJ_QCD = (TH1D*)hDIWZMJJ_QCD[0]->Clone("hDAllWZMJJ_QCD");

for(int i=1; i<nFilesWZ; i++){
  hDAllWZMJJ    ->Add(hDIWZMJJ    [i]);	
  hDAllWZMJJ_PDF->Add(hDIWZMJJ_PDF[i]);   
  hDAllWZMJJ_QCD->Add(hDIWZMJJ_QCD[i]);   
}

diff[0] = 1000*(hDAllWZMJJ_PDF->GetSumOfWeights()-hDAllWZMJJ->GetSumOfWeights());
diff[1] = 1000*(hDAllWZMJJ_QCD->GetSumOfWeights()-hDAllWZMJJ->GetSumOfWeights());
printf("hDAllWZMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDAllWZMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDAllWZMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDAllWZMJJ_PDF->GetBinContent(i)-hDAllWZMJJ->GetBinContent(i));
  diff[1] = 1000*(hDAllWZMJJ_QCD->GetBinContent(i)-hDAllWZMJJ->GetBinContent(i));
  printf("hDAllWZMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDAllWZMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

// NoEWKCorrWZ with EWKCorr
TH1D *hDINoEWKCorrWZMJJ[nFilesWZ]; TH1D *hDINoEWKCorrWZMJJ_PDF[nFilesWZ]; TH1D *hDINoEWKCorrWZMJJ_QCD[nFilesWZ];	 

for(int i=0; i<nFilesWZ; i++){
  printf("WZNoEWKCorrEWKCorr(%d)\n",i);
  hDINoEWKCorrWZMJJ[i]     = (TH1D*)_fileWZ[i]->Get("hDNoEWKCorrWZMJJ");     hDINoEWKCorrWZMJJ[i]    ->Sumw2(); hDINoEWKCorrWZMJJ[i]    ->Scale(xsWZ[i]/hDITotalMCWeightWZ[i]->GetSumOfWeights());  
  hDINoEWKCorrWZMJJ_PDF[i] = (TH1D*)_fileWZ[i]->Get("hDNoEWKCorrWZMJJ_PDF"); hDINoEWKCorrWZMJJ_PDF[i]->Sumw2(); hDINoEWKCorrWZMJJ_PDF[i]->Scale(xsWZ[i]/hDITotalMCWeightWZ[i]->GetSumOfWeights());  
  hDINoEWKCorrWZMJJ_QCD[i] = (TH1D*)_fileWZ[i]->Get("hDNoEWKCorrWZMJJ_QCD"); hDINoEWKCorrWZMJJ_QCD[i]->Sumw2(); hDINoEWKCorrWZMJJ_QCD[i]->Scale(xsWZ[i]/hDITotalMCWeightWZ[i]->GetSumOfWeights());  
}

TH1D *hDEWKNoEWKCorrWZMJJ     = (TH1D*)hDINoEWKCorrWZMJJ    [nFilesWZ-1]->Clone("hDNoEWKCorrEWKWZMJJ"	 );
TH1D *hDEWKNoEWKCorrWZMJJ_PDF = (TH1D*)hDINoEWKCorrWZMJJ_PDF[nFilesWZ-1]->Clone("hDNoEWKCorrEWKWZMJJ_PDF");
TH1D *hDEWKNoEWKCorrWZMJJ_QCD = (TH1D*)hDINoEWKCorrWZMJJ_QCD[nFilesWZ-1]->Clone("hDNoEWKCorrEWKWZMJJ_QCD");

diff[0] = 1000*(hDEWKNoEWKCorrWZMJJ_PDF->GetSumOfWeights()-hDEWKNoEWKCorrWZMJJ->GetSumOfWeights());
diff[1] = 1000*(hDEWKNoEWKCorrWZMJJ_QCD->GetSumOfWeights()-hDEWKNoEWKCorrWZMJJ->GetSumOfWeights());
printf("hDEWKNoEWKCorrWZMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDEWKNoEWKCorrWZMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDEWKNoEWKCorrWZMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDEWKNoEWKCorrWZMJJ_PDF->GetBinContent(i)-hDEWKNoEWKCorrWZMJJ->GetBinContent(i));
  diff[1] = 1000*(hDEWKNoEWKCorrWZMJJ_QCD->GetBinContent(i)-hDEWKNoEWKCorrWZMJJ->GetBinContent(i));
  printf("hDEWKNoEWKCorrWZMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDEWKNoEWKCorrWZMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

TH1D *hDQCDNoEWKCorrWZMJJ     = (TH1D*)hDINoEWKCorrWZMJJ[0]    ->Clone("hDNoEWKCorrQCDWZMJJ"	);
TH1D *hDQCDNoEWKCorrWZMJJ_PDF = (TH1D*)hDINoEWKCorrWZMJJ_PDF[0]->Clone("hDNoEWKCorrQCDWZMJJ_PDF");
TH1D *hDQCDNoEWKCorrWZMJJ_QCD = (TH1D*)hDINoEWKCorrWZMJJ_QCD[0]->Clone("hDNoEWKCorrQCDWZMJJ_QCD");

for(int i=1; i<nFilesWZ-1; i++){
  hDQCDNoEWKCorrWZMJJ    ->Add(hDINoEWKCorrWZMJJ    [i]);	
  hDQCDNoEWKCorrWZMJJ_PDF->Add(hDINoEWKCorrWZMJJ_PDF[i]);   
  hDQCDNoEWKCorrWZMJJ_QCD->Add(hDINoEWKCorrWZMJJ_QCD[i]);   
}

diff[0] = 1000*(hDQCDNoEWKCorrWZMJJ_PDF->GetSumOfWeights()-hDQCDNoEWKCorrWZMJJ->GetSumOfWeights());
diff[1] = 1000*(hDQCDNoEWKCorrWZMJJ_QCD->GetSumOfWeights()-hDQCDNoEWKCorrWZMJJ->GetSumOfWeights());
printf("hDQCDNoEWKCorrWZMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDQCDNoEWKCorrWZMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDQCDNoEWKCorrWZMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDQCDNoEWKCorrWZMJJ_PDF->GetBinContent(i)-hDQCDNoEWKCorrWZMJJ->GetBinContent(i));
  diff[1] = 1000*(hDQCDNoEWKCorrWZMJJ_QCD->GetBinContent(i)-hDQCDNoEWKCorrWZMJJ->GetBinContent(i));
  printf("hDQCDNoEWKCorrWZMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDQCDNoEWKCorrWZMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

TH1D *hDAllNoEWKCorrWZMJJ     = (TH1D*)hDINoEWKCorrWZMJJ[0]    ->Clone("hDNoEWKCorrAllWZMJJ"	);
TH1D *hDAllNoEWKCorrWZMJJ_PDF = (TH1D*)hDINoEWKCorrWZMJJ_PDF[0]->Clone("hDNoEWKCorrAllWZMJJ_PDF");
TH1D *hDAllNoEWKCorrWZMJJ_QCD = (TH1D*)hDINoEWKCorrWZMJJ_QCD[0]->Clone("hDNoEWKCorrAllWZMJJ_QCD");

for(int i=1; i<nFilesWZ; i++){
  hDAllNoEWKCorrWZMJJ    ->Add(hDINoEWKCorrWZMJJ    [i]);	
  hDAllNoEWKCorrWZMJJ_PDF->Add(hDINoEWKCorrWZMJJ_PDF[i]);   
  hDAllNoEWKCorrWZMJJ_QCD->Add(hDINoEWKCorrWZMJJ_QCD[i]);   
}

diff[0] = 1000*(hDAllNoEWKCorrWZMJJ_PDF->GetSumOfWeights()-hDAllNoEWKCorrWZMJJ->GetSumOfWeights());
diff[1] = 1000*(hDAllNoEWKCorrWZMJJ_QCD->GetSumOfWeights()-hDAllNoEWKCorrWZMJJ->GetSumOfWeights());
printf("hDAllNoEWKCorrWZMJJ: %.2f %.2f %.2f (%.2f)\n",1000*hDAllNoEWKCorrWZMJJ->GetSumOfWeights(),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
for(int i=1; i<=hDAllNoEWKCorrWZMJJ->GetNbinsX();i++){
  diff[0] = 1000*(hDAllNoEWKCorrWZMJJ_PDF->GetBinContent(i)-hDAllNoEWKCorrWZMJJ->GetBinContent(i));
  diff[1] = 1000*(hDAllNoEWKCorrWZMJJ_QCD->GetBinContent(i)-hDAllNoEWKCorrWZMJJ->GetBinContent(i));
  printf("hDAllNoEWKCorrWZMJJ(%d): %.2f %.2f %.2f (%.2f)\n",i,1000*hDAllNoEWKCorrWZMJJ->GetBinContent(i),diff[0],diff[1],TMath::Sqrt(TMath::Power(diff[0],2)+TMath::Power(diff[1],2)));
}

TFile myOutputFile("genVBS.root","RECREATE");
  hDEWKWWMJJ    ->Write(); 
  hDEWKWWMJJ_PDF->Write(); 
  hDEWKWWMJJ_QCD->Write(); 
  hDEWKWWMLL    ->Write(); 
  hDEWKWWMLL_PDF->Write(); 
  hDEWKWWMLL_QCD->Write(); 
  hDEWKWWPTL1    ->Write(); 
  hDEWKWWPTL1_PDF->Write(); 
  hDEWKWWPTL1_QCD->Write(); 
  hDQCDWWMJJ    ->Write(); 
  hDQCDWWMJJ_PDF->Write(); 
  hDQCDWWMJJ_QCD->Write(); 
  hDQCDWWMLL    ->Write(); 
  hDQCDWWMLL_PDF->Write(); 
  hDQCDWWMLL_QCD->Write(); 
  hDQCDWWPTL1    ->Write(); 
  hDQCDWWPTL1_PDF->Write(); 
  hDQCDWWPTL1_QCD->Write(); 
  hDAllWWMJJ    ->Write(); 
  hDAllWWMJJ_PDF->Write(); 
  hDAllWWMJJ_QCD->Write(); 
  hDAllWWMLL    ->Write(); 
  hDAllWWMLL_PDF->Write(); 
  hDAllWWMLL_QCD->Write(); 
  hDAllWWPTL1    ->Write(); 
  hDAllWWPTL1_PDF->Write(); 
  hDAllWWPTL1_QCD->Write(); 
  hDNoEWKCorrEWKWWMJJ    ->Write(); 
  hDNoEWKCorrEWKWWMJJ_PDF->Write(); 
  hDNoEWKCorrEWKWWMJJ_QCD->Write(); 
  hDNoEWKCorrEWKWWMLL    ->Write(); 
  hDNoEWKCorrEWKWWMLL_PDF->Write(); 
  hDNoEWKCorrEWKWWMLL_QCD->Write(); 
  hDNoEWKCorrEWKWWPTL1    ->Write(); 
  hDNoEWKCorrEWKWWPTL1_PDF->Write(); 
  hDNoEWKCorrEWKWWPTL1_QCD->Write(); 
  hDNoEWKCorrQCDWWMJJ    ->Write(); 
  hDNoEWKCorrQCDWWMJJ_PDF->Write(); 
  hDNoEWKCorrQCDWWMJJ_QCD->Write(); 
  hDNoEWKCorrQCDWWMLL    ->Write(); 
  hDNoEWKCorrQCDWWMLL_PDF->Write(); 
  hDNoEWKCorrQCDWWMLL_QCD->Write(); 
  hDNoEWKCorrQCDWWPTL1    ->Write(); 
  hDNoEWKCorrQCDWWPTL1_PDF->Write(); 
  hDNoEWKCorrQCDWWPTL1_QCD->Write(); 
  hDNoEWKCorrAllWWMJJ    ->Write(); 
  hDNoEWKCorrAllWWMJJ_PDF->Write(); 
  hDNoEWKCorrAllWWMJJ_QCD->Write(); 
  hDNoEWKCorrAllWWMLL    ->Write(); 
  hDNoEWKCorrAllWWMLL_PDF->Write(); 
  hDNoEWKCorrAllWWMLL_QCD->Write(); 
  hDNoEWKCorrAllWWPTL1    ->Write(); 
  hDNoEWKCorrAllWWPTL1_PDF->Write(); 
  hDNoEWKCorrAllWWPTL1_QCD->Write(); 
  hDEWKWZMJJ	->Write(); 
  hDEWKWZMJJ_PDF->Write(); 
  hDEWKWZMJJ_QCD->Write(); 
  hDQCDWZMJJ	->Write(); 
  hDQCDWZMJJ_PDF->Write(); 
  hDQCDWZMJJ_QCD->Write(); 
  hDAllWZMJJ	->Write(); 
  hDAllWZMJJ_PDF->Write(); 
  hDAllWZMJJ_QCD->Write(); 
  hDEWKNoEWKCorrWZMJJ	 ->Write(); 
  hDEWKNoEWKCorrWZMJJ_PDF->Write(); 
  hDEWKNoEWKCorrWZMJJ_QCD->Write(); 
  hDQCDNoEWKCorrWZMJJ	 ->Write(); 
  hDQCDNoEWKCorrWZMJJ_PDF->Write(); 
  hDQCDNoEWKCorrWZMJJ_QCD->Write(); 
  hDAllNoEWKCorrWZMJJ	 ->Write(); 
  hDAllNoEWKCorrWZMJJ_PDF->Write(); 
  hDAllNoEWKCorrWZMJJ_QCD->Write(); 
myOutputFile.Close();

}
