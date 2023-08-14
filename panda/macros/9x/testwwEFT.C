void testwwEFT(){
TFile *_fileA[9];
_fileA[0] = TFile::Open("histoWW_2016_72.root");
_fileA[1] = TFile::Open("histoWW_2016_73.root");
_fileA[2] = TFile::Open("histoWW_2016_74.root");
_fileA[3] = TFile::Open("histoWW_2016_75.root");
_fileA[4] = TFile::Open("histoWW_2016_76.root");
_fileA[5] = TFile::Open("histoWW_2016_77.root");
_fileA[6] = TFile::Open("histoWW_2016_78.root");
_fileA[7] = TFile::Open("histoWW_2016_79.root");
_fileA[8] = TFile::Open("histoWW_2016_80.root");

for(int i=0; i<9; i++){
  TH1D* histo1 = (TH1D*)(_fileA[i]->Get("histo1"));
  printf("%7.1f %.3f  %.3f  %.3f\n",histo1->GetSumOfWeights(),histo1->GetBinContent(1)/histo1->GetSumOfWeights(),histo1->GetBinContent(2)/histo1->GetSumOfWeights(),histo1->GetBinContent(3)/histo1->GetSumOfWeights());
}

TFile *_fileB[9];
_fileB[0] = TFile::Open("histoWW_2016_81.root");
_fileB[1] = TFile::Open("histoWW_2016_82.root");
_fileB[2] = TFile::Open("histoWW_2016_83.root");
_fileB[3] = TFile::Open("histoWW_2016_84.root");
_fileB[4] = TFile::Open("histoWW_2016_85.root");
_fileB[5] = TFile::Open("histoWW_2016_86.root");
_fileB[6] = TFile::Open("histoWW_2016_87.root");
_fileB[7] = TFile::Open("histoWW_2016_88.root");
_fileB[8] = TFile::Open("histoWW_2016_89.root");

for(int i=0; i<9; i++){
  TH1D* histo1 = (TH1D*)(_fileB[i]->Get("histo1"));
  printf("%7.1f %.3f  %.3f  %.3f\n",histo1->GetSumOfWeights(),histo1->GetBinContent(1)/histo1->GetSumOfWeights(),histo1->GetBinContent(2)/histo1->GetSumOfWeights(),histo1->GetBinContent(3)/histo1->GetSumOfWeights());
}
}  
