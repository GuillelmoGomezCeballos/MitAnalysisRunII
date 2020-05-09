#define ewkvbsMakePlots_cxx
#include "ewkvbsMakePlots.h"
#include "common.h"
#include <TH2.h>
#include <TStyle.h>
#include <TCanvas.h>

void ewkvbsMakePlots::Loop(int opt)
{
//   In a ROOT session, you can do:
//      root> .L ewkvbsMakePlots.C
//      root> ewkvbsMakePlots t
//      root> t.GetEntry(12); // Fill t data members with entry number 12
//      root> t.Show();       // Show values of entry 12
//      root> t.Show(16);     // Read and show values of entry 16
//      root> t.Loop();       // Loop on all entries
//

//     This is the loop skeleton where:
//    jentry is the global entry number in the chain
//    ientry is the entry number in the current Tree
//  Note that the argument to GetEntry must be:
//    jentry for TChain::GetEntry
//    ientry for TTree::GetEntry and TBranch::GetEntry
//
//       To read only selected branches, Insert statements like:
// METHOD1:
//    fChain->SetBranchStatus("*",0);  // disable all branches
//    fChain->SetBranchStatus("branchname",1);  // activate branchname
// METHOD2: replace line
//    fChain->GetEntry(jentry);       //read all branches
//by  b_branchname->GetEntry(ientry); //read only this branch
   if (fChain == 0) return;

   gStyle->SetOptStat(0);

   Long64_t nentries = fChain->GetEntriesFast();
   int nBinPlot=40; double xminPlot=0; double xmaxPlot=3.16;
   if     (opt == 1){xminPlot=50; xmaxPlot=450;}
   else if(opt == 2){xminPlot=50; xmaxPlot=250;}
   else if(opt == 3){xminPlot=20; xmaxPlot=420;}
   else if(opt == 4){xminPlot=30; xmaxPlot=230;}
   TH1D *histo[5];
   for(int i=0; i<5; i++){
     histo[i] = new TH1D(Form("histo_%d",i), Form("histo_%d",i), nBinPlot, xminPlot, xmaxPlot);
   }

   Long64_t nbytes = 0, nb = 0;
   for (Long64_t jentry=0; jentry<nentries;jentry++) {
      Long64_t ientry = LoadTree(jentry);
      if (ientry < 0) break;
      nb = fChain->GetEntry(jentry);   nbytes += nb;
      // if (Cut(ientry) < 0) continue;
      if(!(mvajetpt1 > 50 && mvajetpt2 > 50 && mvanlep == 2)) continue;
      double var = mvadphijj;
      if     (opt==1) var = mvajetpt1;
      else if(opt==2) var = mvajetpt2;
      else if(opt==3) var = mvamll;
      else if(opt==4) var = mvaWpt;
      int type = -1;
      if(mvamjj<1000&&category==kPlotBSM) type = 0;
      if(mvamjj>1800&&category==kPlotBSM) type = 1;
      if(mvamjj<1000&&(category==kPlotSignal1||category==kPlotSignal2)) type = 2;
      if(mvamjj>1800&&(category==kPlotSignal1||category==kPlotSignal2)) type = 3;
      if(type == -1) continue;
      histo[type]->Fill(var,weight);
   }
   //TFile output(Form("mvaPlot_%d.root",opt),"RECREATE");
   for(int i=0; i<4; i++){
     histo[i]->Scale(1/histo[i]->GetSumOfWeights());
   }
   TCanvas* c1 = new TCanvas("c1", "c1",5,5,500,500);
   c1->Divide(1,3);
   c1->cd(1);
   histo[0]->SetTitle("LL Signal");
   histo[0]->Draw();
   histo[1]->Draw("same");
   c1->cd(2);
   histo[2]->SetTitle("LT+TT Background");
   histo[2]->Draw();
   histo[3]->Draw("same");
   c1->cd(3);
   histo[4]->SetTitle("LL / LT+TT");
   for(int i=1; i<=histo[0]->GetNbinsX(); i++){
     double ratio = 1;
     ratio = (histo[1]->GetBinContent(i)/histo[3]->GetBinContent(i))/(histo[0]->GetBinContent(i)/histo[2]->GetBinContent(i));
     histo[4]->SetBinContent(i,ratio);
   }
   histo[4]->Draw();
   c1->SaveAs(Form("mvaPlot_%d.png",opt));
   //output.Close();
   
}
