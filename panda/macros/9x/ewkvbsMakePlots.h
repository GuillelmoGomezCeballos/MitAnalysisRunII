//////////////////////////////////////////////////////////
// This class has been automatically generated on
// Fri May  8 14:16:53 2020 by ROOT version 6.12/07
// from TTree mvatree/mvatree
// found on file: /data/t3home000/ceballos/panda/mva_training/mva_SSWW_training.root
//////////////////////////////////////////////////////////

#ifndef ewkvbsMakePlots_h
#define ewkvbsMakePlots_h

#include <TROOT.h>
#include <TChain.h>
#include <TFile.h>

// Header file for the classes stored in the TTree if any.

class ewkvbsMakePlots {
public :
   TTree          *fChain;   //!pointer to the analyzed TTree or TChain
   Int_t           fCurrent; //!current Tree number in a TChain

// Fixed size dimensions of array or collections stored in the TTree if any.

   // Declaration of leaf types
   Int_t           category;
   Int_t           eventNum;
   Double_t        weight;
   Float_t         mvamjj;
   Float_t         mvadetajj;
   Float_t         mvadphijj;
   Float_t         mvajetpt1;
   Float_t         mvajetpt2;
   Float_t         mvajeteta1;
   Float_t         mvajeteta2;
   Float_t         mvanjets;
   Float_t         mvaWpt;
   Float_t         mvaZpt;
   Float_t         mvaVVmt;
   Float_t         mvaWlZdeta;
   Float_t         mvazstar;
   Float_t         mvazep1;
   Float_t         mvazep2;
   Float_t         mvazep3;
   Float_t         mvamaxzep;
   Float_t         mvaj1Zdr;
   Float_t         mvaj2Zdr;
   Float_t         mvapttot;
   Float_t         mvasumpttot;
   Float_t         mvaleppt1;
   Float_t         mvaleppt2;
   Float_t         mvalepeta1;
   Float_t         mvalepeta2;
   Float_t         mvadphill;
   Float_t         mvadrll;
   Float_t         mvamll;
   Int_t           mvanlep;

   // List of branches
   TBranch        *b_category;   //!
   TBranch        *b_eventNum;   //!
   TBranch        *b_weight;   //!
   TBranch        *b_mvamjj;   //!
   TBranch        *b_mvadetajj;   //!
   TBranch        *b_mvadphijj;   //!
   TBranch        *b_mvajetpt1;   //!
   TBranch        *b_mvajetpt2;   //!
   TBranch        *b_mvajeteta1;   //!
   TBranch        *b_mvajeteta2;   //!
   TBranch        *b_mvanjets;   //!
   TBranch        *b_mvaWpt;   //!
   TBranch        *b_mvaZpt;   //!
   TBranch        *b_mvaVVmt;   //!
   TBranch        *b_mvaWlZdeta;   //!
   TBranch        *b_mvazstar;   //!
   TBranch        *b_mvazep1;   //!
   TBranch        *b_mvazep2;   //!
   TBranch        *b_mvazep3;   //!
   TBranch        *b_mvamaxzep;   //!
   TBranch        *b_mvaj1Zdr;   //!
   TBranch        *b_mvaj2Zdr;   //!
   TBranch        *b_mvapttot;   //!
   TBranch        *b_mvasumpttot;   //!
   TBranch        *b_mvaleppt1;   //!
   TBranch        *b_mvaleppt2;   //!
   TBranch        *b_mvalepeta1;   //!
   TBranch        *b_mvalepeta2;   //!
   TBranch        *b_mvadphill;   //!
   TBranch        *b_mvadrll;   //!
   TBranch        *b_mvamll;   //!
   TBranch        *b_mvanlep;   //!

   ewkvbsMakePlots(TTree *tree=0);
   virtual ~ewkvbsMakePlots();
   virtual Int_t    Cut(Long64_t entry);
   virtual Int_t    GetEntry(Long64_t entry);
   virtual Long64_t LoadTree(Long64_t entry);
   virtual void     Init(TTree *tree);
   virtual void     Loop(int opt = 0);
   virtual Bool_t   Notify();
   virtual void     Show(Long64_t entry = -1);
};

#endif

#ifdef ewkvbsMakePlots_cxx
ewkvbsMakePlots::ewkvbsMakePlots(TTree *tree) : fChain(0) 
{
// if parameter tree is not specified (or zero), connect the file
// used to generate this class and read the Tree.
   if (tree == 0) {
      TFile *f = (TFile*)gROOT->GetListOfFiles()->FindObject("/data/t3home000/ceballos/panda/mva_training/mva_SSWW_training.root");
      if (!f || !f->IsOpen()) {
         f = new TFile("/data/t3home000/ceballos/panda/mva_training/mva_SSWW_training.root");
      }
      f->GetObject("mvatree",tree);

   }
   Init(tree);
}

ewkvbsMakePlots::~ewkvbsMakePlots()
{
   if (!fChain) return;
   delete fChain->GetCurrentFile();
}

Int_t ewkvbsMakePlots::GetEntry(Long64_t entry)
{
// Read contents of entry.
   if (!fChain) return 0;
   return fChain->GetEntry(entry);
}
Long64_t ewkvbsMakePlots::LoadTree(Long64_t entry)
{
// Set the environment to read one entry
   if (!fChain) return -5;
   Long64_t centry = fChain->LoadTree(entry);
   if (centry < 0) return centry;
   if (fChain->GetTreeNumber() != fCurrent) {
      fCurrent = fChain->GetTreeNumber();
      Notify();
   }
   return centry;
}

void ewkvbsMakePlots::Init(TTree *tree)
{
   // The Init() function is called when the selector needs to initialize
   // a new tree or chain. Typically here the branch addresses and branch
   // pointers of the tree will be set.
   // It is normally not necessary to make changes to the generated
   // code, but the routine can be extended by the user if needed.
   // Init() will be called many times when running on PROOF
   // (once per file to be processed).

   // Set branch addresses and branch pointers
   if (!tree) return;
   fChain = tree;
   fCurrent = -1;
   fChain->SetMakeClass(1);

   fChain->SetBranchAddress("category", &category, &b_category);
   fChain->SetBranchAddress("eventNum", &eventNum, &b_eventNum);
   fChain->SetBranchAddress("weight", &weight, &b_weight);
   fChain->SetBranchAddress("mvamjj", &mvamjj, &b_mvamjj);
   fChain->SetBranchAddress("mvadetajj", &mvadetajj, &b_mvadetajj);
   fChain->SetBranchAddress("mvadphijj", &mvadphijj, &b_mvadphijj);
   fChain->SetBranchAddress("mvajetpt1", &mvajetpt1, &b_mvajetpt1);
   fChain->SetBranchAddress("mvajetpt2", &mvajetpt2, &b_mvajetpt2);
   fChain->SetBranchAddress("mvajeteta1", &mvajeteta1, &b_mvajeteta1);
   fChain->SetBranchAddress("mvajeteta2", &mvajeteta2, &b_mvajeteta2);
   fChain->SetBranchAddress("mvanjets", &mvanjets, &b_mvanjets);
   fChain->SetBranchAddress("mvaWpt", &mvaWpt, &b_mvaWpt);
   fChain->SetBranchAddress("mvaZpt", &mvaZpt, &b_mvaZpt);
   fChain->SetBranchAddress("mvaVVmt", &mvaVVmt, &b_mvaVVmt);
   fChain->SetBranchAddress("mvaWlZdeta", &mvaWlZdeta, &b_mvaWlZdeta);
   fChain->SetBranchAddress("mvazstar", &mvazstar, &b_mvazstar);
   fChain->SetBranchAddress("mvazep1", &mvazep1, &b_mvazep1);
   fChain->SetBranchAddress("mvazep2", &mvazep2, &b_mvazep2);
   fChain->SetBranchAddress("mvazep3", &mvazep3, &b_mvazep3);
   fChain->SetBranchAddress("mvamaxzep", &mvamaxzep, &b_mvamaxzep);
   fChain->SetBranchAddress("mvaj1Zdr", &mvaj1Zdr, &b_mvaj1Zdr);
   fChain->SetBranchAddress("mvaj2Zdr", &mvaj2Zdr, &b_mvaj2Zdr);
   fChain->SetBranchAddress("mvapttot", &mvapttot, &b_mvapttot);
   fChain->SetBranchAddress("mvasumpttot", &mvasumpttot, &b_mvasumpttot);
   fChain->SetBranchAddress("mvaleppt1", &mvaleppt1, &b_mvaleppt1);
   fChain->SetBranchAddress("mvaleppt2", &mvaleppt2, &b_mvaleppt2);
   fChain->SetBranchAddress("mvalepeta1", &mvalepeta1, &b_mvalepeta1);
   fChain->SetBranchAddress("mvalepeta2", &mvalepeta2, &b_mvalepeta2);
   fChain->SetBranchAddress("mvadphill", &mvadphill, &b_mvadphill);
   fChain->SetBranchAddress("mvadrll", &mvadrll, &b_mvadrll);
   fChain->SetBranchAddress("mvamll", &mvamll, &b_mvamll);
   fChain->SetBranchAddress("mvanlep", &mvanlep, &b_mvanlep);
   Notify();
}

Bool_t ewkvbsMakePlots::Notify()
{
   // The Notify() function is called when a new file is opened. This
   // can be either for a new TTree in a TChain or when when a new TTree
   // is started when using PROOF. It is normally not necessary to make changes
   // to the generated code, but the routine can be extended by the
   // user if needed. The return value is currently not used.

   return kTRUE;
}

void ewkvbsMakePlots::Show(Long64_t entry)
{
// Print contents of entry.
// If entry is not specified, print current entry
   if (!fChain) return;
   fChain->Show(entry);
}
Int_t ewkvbsMakePlots::Cut(Long64_t entry)
{
// This function may be called from Loop.
// returns  1 if entry is accepted.
// returns -1 otherwise.
   return 1;
}
#endif // #ifdef ewkvbsMakePlots_cxx
