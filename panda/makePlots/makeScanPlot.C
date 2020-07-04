#include "TROOT.h"
#include "Math/ProbFuncMathCore.h"
#include "TInterpreter.h"
#include "TFile.h"
#include "TCanvas.h"
#include "TAxis.h"
#include "TLegend.h"
#include "TStyle.h"
#include "TPad.h"
#include "Math/QuantFuncMathCore.h"
#include "TMath.h"
#include "TGraphAsymmErrors.h"
#include "TSystem.h"
#include "TLatex.h"
#include "TPaveText.h"
#include "CMS_lumi.C"
#include "TRandom.h"
#include "GoodStyle.C"
void makeScanPlot(int nsel = 0, TString outputName = "likscan"){
  TString scanName0 = "/home/ceballos/ana_area/ana_long/scan0.root"; // exp stat
  TString scanName1 = "/home/ceballos/ana_area/ana_long/scan1.root"; // exp syst+stat
  TString scanName2 = "/home/ceballos/ana_area/ana_long/scan2.root"; // obs
  TString scanName3 = "/home/ceballos/ana_area/ana_long/scan3.root"; // exp
  TString xName = "#sigma_{W_{L}W_{L}} [fb]";
  double textSize = 0.0310;
  if     (nsel == 1) {
    scanName0 = "/home/ceballos/ana_area/ana_zh/scan0.root";
    scanName1 = "/home/ceballos/ana_area/ana_zh/scan1.root";
    scanName2 = "/home/ceballos/ana_area/ana_zh/scan2.root";
    scanName3 = "/home/ceballos/ana_area/ana_zh/scan3.root";
    xName = "B(H #rightarrow inv)";
    textSize = 0.0215;
  }
  else if(nsel == 2) {
    scanName0 = "/home/ceballos/ana_area/ana_znn/scan.root";
    scanName1 = "/home/ceballos/ana_area/ana_znn/scan.root";
    scanName2 = "/home/ceballos/ana_area/ana_znn/scan.root";
    scanName3 = "/home/ceballos/ana_area/ana_znn/scan.root";
    xName = "#sigma_{Z} (fb)";
    textSize = 0.0310;
  }

  TFile* file0 = new TFile(scanName0, "read");  if(!file0) {printf("File %s does not exist\n",scanName0.Data()); return;}
  TFile* file1 = new TFile(scanName1, "read");  if(!file1) {printf("File %s does not exist\n",scanName1.Data()); return;}
  TFile* file2 = new TFile(scanName2, "read");  if(!file2) {printf("File %s does not exist\n",scanName2.Data()); return;}
  TFile* file3 = new TFile(scanName3, "read");  if(!file3) {printf("File %s does not exist\n",scanName3.Data()); return;}

  TGraph* scan0 = (TGraph*)file0->Get(Form("scan"));
  TGraph* scan1 = (TGraph*)file1->Get(Form("scan"));
  TGraph* scan2 = (TGraph*)file2->Get(Form("scan"));
  TGraph* scan3 = (TGraph*)file3->Get(Form("scan"));

  scan2->SetTitle("");
  scan2->GetXaxis()->SetLabelFont  (   42);
  scan2->GetXaxis()->SetLabelOffset(0.010);
  scan2->GetXaxis()->SetLabelSize  (0.040);
  scan2->GetXaxis()->SetNdivisions (  505);
  scan2->GetXaxis()->SetTitleFont  (   42);
  scan2->GetXaxis()->SetTitleOffset(  0.9);
  scan2->GetXaxis()->SetTitleSize  (0.050);
  scan2->GetXaxis()->SetTitle(xName.Data());
  scan2->GetYaxis()->SetLabelFont  (   42);
  scan2->GetYaxis()->SetLabelOffset(0.010);
  scan2->GetYaxis()->SetLabelSize  (0.040);
  scan2->GetYaxis()->SetNdivisions (  505);
  scan2->GetYaxis()->SetTitleFont  (   42);
  scan2->GetYaxis()->SetTitleSize  (0.050);
  scan2->GetYaxis()->SetTitleOffset(  1.2);
  scan2->GetYaxis()->SetTitle("- 2 #Delta ln L");
  scan2->GetYaxis()->SetRangeUser(0.0,7.0);

  scan0->SetLineColor(2);
  scan0->SetLineStyle(1);
  scan0->SetLineWidth(4);

  scan1->SetLineColor(9);
  scan1->SetLineStyle(1);
  scan1->SetLineWidth(4);

  scan2->SetLineColor(1);
  scan2->SetLineStyle(1);
  scan2->SetLineWidth(4);

  scan3->SetLineColor(8);
  scan3->SetLineStyle(1);
  scan3->SetLineWidth(4);

  GoodStyle();
  gStyle->SetOptStat(0);

  TCanvas* c1 = new TCanvas("c1", "c1",5,5,500,500);

  double maxRatio = 0.0;
  double minRatio = 1.0;

  c1->SetBottomMargin(0.1);
  c1->cd();
  TPad *pad1 = new TPad("pad1", "pad1",0.00,0.00,1.00,1.00);
  pad1->Draw();
  pad1->cd();
  pad1->RedrawAxis();
  scan2->Draw("AL");
  if(nsel!=2)scan1->Draw("LSAME");
  if(nsel!=2)scan0->Draw("LSAME");
  if(nsel!=2)scan3->Draw("LSAME");
  CMS_lumi( pad1, 2019, 11 );

  TLegend* leg = new TLegend(0.2, 0.7, 0.4, 0.9);
  leg->SetBorderSize(    0);
  leg->SetFillColor (    0);
  leg->SetFillStyle (    0);
  leg->SetTextFont  (   62);
  leg->SetTextSize  (textSize);
  if(nsel!=2)leg->AddEntry(scan1, "Expected bkg. only stat","l");
  if(nsel!=2)leg->AddEntry(scan0, "Expected bkg. only stat+syst","l");
  if(nsel!=2)leg->AddEntry(scan3, "Expected signal+bkg.","l");
  leg->AddEntry(scan2, "Observed","l");
  leg->Draw("same");

  double theLines[2] = {1.00, 3.84};
  printf("%f %f\n",scan0->GetXaxis()->GetXmin(),scan0->GetXaxis()->GetXmax());
  printf("%f %f\n",scan1->GetXaxis()->GetXmin(),scan1->GetXaxis()->GetXmax());
  printf("%f %f\n",scan2->GetXaxis()->GetXmin(),scan2->GetXaxis()->GetXmax());
  printf("%f %f\n",scan3->GetXaxis()->GetXmin(),scan3->GetXaxis()->GetXmax());
  
  TLine* baseline0 = new TLine(scan2->GetXaxis()->GetXmin(), theLines[0],
                               scan2->GetXaxis()->GetXmax(), theLines[0]);
  baseline0->SetLineStyle(kDashed);
  baseline0->Draw();
  TLatex* extraLabel0 = new TLatex(0.25, 0.33,"68\% CL");
  extraLabel0->SetNDC();
  extraLabel0->SetTextAlign(12);
  extraLabel0->SetTextFont(62);
  extraLabel0->SetTextSize(0.035);
  extraLabel0->Draw();

  if(nsel!=2){
    TLine* baseline1 = new TLine(scan2->GetXaxis()->GetXmin(), theLines[1],
                                 scan2->GetXaxis()->GetXmax(), theLines[1]);
   baseline1->SetLineStyle(kDashed);
    baseline1->Draw();
    TLatex* extraLabel1 = new TLatex(0.25, 0.62,"95\% CL");
    extraLabel1->SetNDC();
    extraLabel1->SetTextAlign(12);
    extraLabel1->SetTextFont(62);
    extraLabel1->SetTextSize(0.035);
    extraLabel1->Draw();
  }
  else {
    TPaveText *pt = new TPaveText(0.5, 0.8, 0.8, 0.9, "NDCNB");
    pt->AddText("#sigma_{Z} = 3036^{#plus 177}_{#minus 166} fb");
    pt->Draw();
  }

  if(strcmp(outputName.Data(),"") != 0){
    TString myOutputFile;
    outputName = Form("%s_%d",outputName.Data(),2019);
    myOutputFile = Form("plots/%s.png",outputName.Data());
    c1->SaveAs(myOutputFile.Data());
    myOutputFile = Form("plots/%s.pdf",outputName.Data());
    c1->SaveAs(myOutputFile.Data());
  }
}
