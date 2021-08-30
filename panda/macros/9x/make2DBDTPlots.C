#include <TROOT.h>
#include <TFile.h>
#include <TTree.h>
#include <TSystem.h>
#include <TString.h>
#include <TH1D.h>
#include <TH2D.h>
#include <TMath.h>
#include <TLatex.h>
#include <TCanvas.h>
#include "TStyle.h"
#include "TSystem.h"
#include "TLorentzVector.h"
#include "MitAnalysisRunII/panda/macros/9x/common.h"

void DrawTLatex(Double_t x, Double_t y, Double_t tsize, const char* text, bool isLeft = true)
{
  TLatex* tl = new TLatex(x, y, text);

  tl->SetNDC();
  if(isLeft) tl->SetTextAlign(   11);
  else       tl->SetTextAlign(   31); 
  tl->SetTextFont (   42);
  tl->SetTextSize (tsize);

  tl->Draw("same");
}

void atributes(TH2D *histo, TString xtitle, TString ytitle, TString title){

  histo->SetTitle(title.Data()); histo->SetTitle("");
  histo->GetXaxis()->SetTitle(xtitle.Data());
  histo->GetXaxis()->SetLabelFont  (   42);
  histo->GetXaxis()->SetLabelOffset(0.015);
  histo->GetXaxis()->SetLabelSize  (0.030);
  histo->GetXaxis()->SetNdivisions (  505);
  histo->GetXaxis()->SetTitleFont  (   42);
  histo->GetXaxis()->SetTitleOffset( 1.20);
  histo->GetXaxis()->SetTitleSize  (0.030);
  histo->GetXaxis()->SetTickLength (0.07 );

  histo->GetYaxis()->SetTitle(ytitle.Data());
  histo->GetYaxis()->SetLabelFont  (   42);
  histo->GetYaxis()->SetLabelOffset(0.015);
  histo->GetYaxis()->SetLabelSize  (0.030);
  histo->GetYaxis()->SetNdivisions (  505);
  histo->GetYaxis()->SetTitleFont  (   42);
  histo->GetYaxis()->SetTitleOffset( 1.50);
  histo->GetYaxis()->SetTitleSize  (0.030);
  histo->GetYaxis()->SetTickLength (0.03 );

  histo->GetZaxis()->SetLabelSize  (0.020);

  histo->SetLineColor  (kBlack);
  histo->SetMarkerStyle(kFullCircle);
}

void make2DBDTPlots(TString fileName = "/home/ceballos/ana_area/done_ana/hD2DBDT_2019_fiducial5.root", 
                    TString format = "pdf"){

  gStyle->SetOptStat(0);
  gStyle->SetPaintTextFormat(".3f");
  gStyle->SetPalette(1);

  TH2D *hD2DBDT[nPlotCategories];
  TFile *fFile = TFile::Open(fileName.Data());
  for(int np=0; np<nPlotCategories; np++) {hD2DBDT[np] = (TH2D*)(fFile->Get(Form("histo%d",np))); assert(hD2DBDT[np]); hD2DBDT[np]->SetDirectory(0);}    
  fFile->cd();

  atributes(hD2DBDT[kPlotNonPrompt],"Signal BDT","Non-VBS BDT","");
  atributes(hD2DBDT[kPlotSignal1]  ,"Signal BDT","Non-VBS BDT","");
  atributes(hD2DBDT[kPlotSignal2]  ,"Signal BDT","Non-VBS BDT","");
  atributes(hD2DBDT[kPlotSignal3]  ,"Signal BDT","Non-VBS BDT","");

  TCanvas* c00 = new TCanvas("c00","c00",5,5,500,500);
  TCanvas* c01 = new TCanvas("c01","c01",5,5,500,500);
  TCanvas* c02 = new TCanvas("c02","c02",5,5,500,500);
  TCanvas* c03 = new TCanvas("c03","c03",5,5,500,500);
  c00->cd();hD2DBDT[kPlotNonPrompt]->Draw("colz");DrawTLatex(0.10, 0.91, 0.032, "Nonprompt");
  c01->cd();hD2DBDT[kPlotSignal1]  ->Draw("colz");DrawTLatex(0.10, 0.91, 0.032, "W^{#pm}_{L}W^{#pm}_{L}");
  c02->cd();hD2DBDT[kPlotSignal2]  ->Draw("colz");DrawTLatex(0.10, 0.91, 0.032, "W^{#pm}_{L}W^{#pm}_{T}");
  c03->cd();hD2DBDT[kPlotSignal3]  ->Draw("colz");DrawTLatex(0.10, 0.91, 0.032, "W^{#pm}_{T}W^{#pm}_{T}");

  TString outputName;
  outputName = Form("hD2DBDT_kPlotNonPrompt.%s",format.Data()); c00->SaveAs(outputName.Data());
  outputName = Form("hD2DBDT_kPlotSignal1.%s",format.Data());   c01->SaveAs(outputName.Data());
  outputName = Form("hD2DBDT_kPlotSignal2.%s",format.Data());   c02->SaveAs(outputName.Data());
  outputName = Form("hD2DBDT_kPlotSignal2.%s",format.Data());   c03->SaveAs(outputName.Data());
}
