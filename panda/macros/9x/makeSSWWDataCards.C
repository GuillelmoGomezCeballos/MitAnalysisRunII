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

#include "pandaFlat.C"
#include "common.h"

void makeSSWWDataCards(TString outputLimits = "ssww_comb_input.root", int fidAna = 0, int mHVal = 0){

  TString fidAnaName = "";
  if     (fidAna == 6) fidAnaName = Form("_fiducial%d_mH%d",fidAna,mHVal);
  else if(fidAna >= 1) fidAnaName = Form("_fiducial%d",fidAna);

  double uncLum;

  bool splitLumi = false;
  if(fidAna == 6) splitLumi = true;

  TFile* infile = new TFile(outputLimits,"read");

  TH1D *histo_Baseline[nPlotCategories];
  for(unsigned ic=kPlotData; ic!=nPlotCategories; ic++) {
      histo_Baseline[ic] = (TH1D*)infile->Get(Form("histo_%s", plotBaseNames[ic].Data()));
      if(!histo_Baseline[ic]) continue;
      histo_Baseline[ic]->SetDirectory(0);
  }

  // Filling datacards txt file
  char outputLimitsCard[200];  					  
  sprintf(outputLimitsCard,"datacard_ssww_comb%s.txt",fidAnaName.Data());
  ofstream newcardShape;
  newcardShape.open(outputLimitsCard);
  newcardShape << Form("imax * number of channels\n");
  newcardShape << Form("jmax * number of background minus 1\n");
  newcardShape << Form("kmax * number of nuisance parameters\n");

  newcardShape << Form("shapes    *   *   %s  histo_$PROCESS histo_$PROCESS_$SYSTEMATIC\n",outputLimits.Data());
  newcardShape << Form("shapes data_obs * %s  histo_Data\n",outputLimits.Data());

  newcardShape << Form("Observation %f\n",histo_Baseline[kPlotData]->GetSumOfWeights());

  newcardShape << Form("bin   ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(!histo_Baseline[ic]) continue;
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    newcardShape << Form("ch1  ");
  }
  newcardShape << Form("\n");
 
  newcardShape << Form("process  ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(!histo_Baseline[ic]) continue;
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    newcardShape << Form("%s  ", plotBaseNames[ic].Data());
  }
  newcardShape << Form("\n");

  newcardShape << Form("process  ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(!histo_Baseline[ic]) continue;
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if     (ic != kPlotEWKSSWW && 
            ic != kPlotSignal0 && ic != kPlotSignal1 && 
            ic != kPlotSignal2 && ic != kPlotSignal2) newcardShape << Form("%d  ", ic);
    else if(ic == kPlotSignal0) newcardShape << Form("%d  ", -1);
    else if(ic == kPlotSignal1) newcardShape << Form("%d  ", -2);
    else if(ic == kPlotSignal2) newcardShape << Form("%d  ", -3);
    else if(ic == kPlotSignal3) newcardShape << Form("%d  ", -4);
    else                        newcardShape << Form("%d  ",  0);
  }
  newcardShape << Form("\n");

  newcardShape << Form("rate  ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(!histo_Baseline[ic]) continue;
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    newcardShape << Form("%f  ", histo_Baseline[ic]->GetSumOfWeights());
  }
  newcardShape << Form("\n");

  if(splitLumi == false){

    for(int ny=2016; ny<2016+nYears; ny++){
      newcardShape << Form("lumi_13TeV_%d    lnN     ",ny);
      for (int ic=0; ic<nPlotCategories; ic++){
	if(!histo_Baseline[ic]) continue;
	if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
	if(ic == kPlotNonPrompt) newcardShape << Form("- ");
	else                     newcardShape << Form("%6.3f ",lumiV[ny-2016]/totalLumiV * (lumiE[ny-2016]-1.0)+1.0);
      }
      newcardShape << Form("\n");
    }

  } else {

    for(int ny=2016; ny<2016+nYears; ny++){
      newcardShape << Form("lumi_13TeV_%d    lnN     ",ny);
      for (int ic=0; ic<nPlotCategories; ic++){
	if(!histo_Baseline[ic]) continue;
	if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
	if(ic == kPlotNonPrompt) newcardShape << Form("- ");
	else                     newcardShape << Form("%6.3f ",lumiV[ny-2016]/totalLumiV * (lumiE_UnCorr[ny-2016]-1.0)+1.0);
      }
      newcardShape << Form("\n");
    }

    uncLum = 
        lumiV[0]/totalLumiV * (lumiE_Factor[0]-1.0) +
	lumiV[1]/totalLumiV * (lumiE_Factor[1]-1.0) +
	lumiV[2]/totalLumiV * (lumiE_Factor[2]-1.0);
    newcardShape << Form("lumi_13TeV_XY    lnN");
    for (int ic=0; ic<nPlotCategories; ic++){
      if(!histo_Baseline[ic]) continue;
      if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
      if(ic == kPlotNonPrompt) newcardShape << Form("- ");
      else		       newcardShape << Form("%6.3f ",uncLum+1.0);
    }
    newcardShape << Form("\n");

    uncLum = 
        lumiV[0]/totalLumiV * (lumiE_Length[0]-1.0) +
	lumiV[1]/totalLumiV * (lumiE_Length[1]-1.0) +
	lumiV[2]/totalLumiV * (lumiE_Length[2]-1.0);
    newcardShape << Form("lumi_13TeV_LS    lnN");
    for (int ic=0; ic<nPlotCategories; ic++){
      if(!histo_Baseline[ic]) continue;
      if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
      if(ic == kPlotNonPrompt) newcardShape << Form("- ");
      else		       newcardShape << Form("%6.3f ",uncLum+1.0);
    }
    newcardShape << Form("\n");

    uncLum = 
        lumiV[0]/totalLumiV * (lumiE_Deflec[0]-1.0) +
	lumiV[1]/totalLumiV * (lumiE_Deflec[1]-1.0) +
	lumiV[2]/totalLumiV * (lumiE_Deflec[2]-1.0);
    newcardShape << Form("lumi_13TeV_BBD    lnN");
    for (int ic=0; ic<nPlotCategories; ic++){
      if(!histo_Baseline[ic]) continue;
      if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
      if(ic == kPlotNonPrompt) newcardShape << Form("- ");
      else		       newcardShape << Form("%6.3f ",uncLum+1.0);
    }
    newcardShape << Form("\n");

    uncLum = 
       lumiV[0]/totalLumiV * (lumiE_DynBet[0]-1.0) +
       lumiV[1]/totalLumiV * (lumiE_DynBet[1]-1.0) +
       lumiV[2]/totalLumiV * (lumiE_DynBet[2]-1.0);
    newcardShape << Form("lumi_13TeV_DB    lnN");
    for (int ic=0; ic<nPlotCategories; ic++){
      if(!histo_Baseline[ic]) continue;
      if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
      if(ic == kPlotNonPrompt) newcardShape << Form("- ");
      else		       newcardShape << Form("%6.3f ",uncLum+1.0);
    }
    newcardShape << Form("\n");

    uncLum = 
        lumiV[0]/totalLumiV * (lumiE_BeamCu[0]-1.0) +
	lumiV[1]/totalLumiV * (lumiE_BeamCu[1]-1.0) +
	lumiV[2]/totalLumiV * (lumiE_BeamCu[2]-1.0);
    newcardShape << Form("lumi_13TeV_BCC    lnN");
    for (int ic=0; ic<nPlotCategories; ic++){
      if(!histo_Baseline[ic]) continue;
      if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
      if(ic == kPlotNonPrompt) newcardShape << Form("- ");
      else		       newcardShape << Form("%6.3f ",uncLum+1.0);
    }
    newcardShape << Form("\n");

    uncLum = 
        lumiV[0]/totalLumiV * (lumiE_Ghosts[0]-1.0) +
	lumiV[1]/totalLumiV * (lumiE_Ghosts[1]-1.0) +
	lumiV[2]/totalLumiV * (lumiE_Ghosts[2]-1.0);
    newcardShape << Form("lumi_13TeV_GS    lnN");
    for (int ic=0; ic<nPlotCategories; ic++){
      if(!histo_Baseline[ic]) continue;
      if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
      if(ic == kPlotNonPrompt) newcardShape << Form("- ");
      else		       newcardShape << Form("%6.3f ",uncLum+1.0);
    }
    newcardShape << Form("\n");

  }

  newcardShape << Form("CMS_scale_m    lnN     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(!histo_Baseline[ic]) continue;
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt) newcardShape << Form("- ");
    else                     newcardShape << Form("%6.3f ",1.005);
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_scale_e    lnN     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(!histo_Baseline[ic]) continue;
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt) newcardShape << Form("- ");
    else                     newcardShape << Form("%6.3f ",1.005);
  }
  newcardShape << Form("\n");

  for(unsigned ic=0; ic<nPlotCategories; ic++) {
    if(!histo_Baseline[ic]) continue;
    if(histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(!(ic == kPlotEWKSSWW || ic == kPlotEWKWZ   || ic == kPlotWZ      || ic == kPlotBSM ||
         ic == kPlotSignal0 || ic == kPlotSignal1 || ic == kPlotSignal2 || ic == kPlotSignal3)) continue;
    newcardShape << Form("EWKCorrVV%s    shape     ",plotBaseNames[ic].Data());
    for(unsigned ic2=0; ic2<nPlotCategories; ic2++) {
      if(!histo_Baseline[ic2]) continue;
      if(ic2 == kPlotData || histo_Baseline[ic2]->GetSumOfWeights() <= 0) continue;
      if(ic==ic2) newcardShape << Form("1.0  ");
      else        newcardShape << Form("-  ");
    }
    newcardShape << Form("\n");
  }

  newcardShape << Form("EWKqqZZCorr    shape	 ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(!histo_Baseline[ic]) continue;
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic != kPlotZZ) newcardShape << Form("- ");
    else	      newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("ggZZCorr    shape     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(!histo_Baseline[ic]) continue;
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic != kPlotZZ) newcardShape << Form("- ");
    else	      newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("WZTauH    shape     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(!histo_Baseline[ic]) continue;
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic != kPlotWZ && ic != kPlotEWKWZ) newcardShape << Form("- ");
    else	                          newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("WZTauL    shape     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(!histo_Baseline[ic]) continue;
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic != kPlotWZ && ic != kPlotEWKWZ) newcardShape << Form("- ");
    else	                          newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  if(fidAna == 6){
  newcardShape << Form("QCDscale_Hpp    lnN     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(!histo_Baseline[ic]) continue;
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic != kPlotBSM) newcardShape << Form("- ");
    else               newcardShape << Form("%f ",1.005);
  }
  newcardShape << Form("\n");

  newcardShape << Form("QCDscale_Hp    lnN     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(!histo_Baseline[ic]) continue;
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic != kPlotSignal1) newcardShape << Form("- ");
    else                   newcardShape << Form("%f ",1.005);
  }
  newcardShape << Form("\n");
  }

  for(unsigned ic=0; ic<nPlotCategories; ic++) {
    if(!histo_Baseline[ic]) continue;
    if(ic== kPlotData || ic == kPlotNonPrompt || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    newcardShape << Form("QCDscale_%s_ACCEPT    shape   ",plotBaseNames[ic].Data());
    for(unsigned ic2=0; ic2<nPlotCategories; ic2++) {
      if(!histo_Baseline[ic2]) continue;
      if(ic2 == kPlotData || histo_Baseline[ic2]->GetSumOfWeights() <= 0) continue;
      if(ic==ic2) newcardShape << Form("1.0  ");
      else        newcardShape << Form("-  ");
    }
    newcardShape << Form("\n");
  }

  newcardShape << Form("pdf_qqbar    shape     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(!histo_Baseline[ic]) continue;
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt) newcardShape << Form("- ");
    else                     newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_eff_m    shape     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(!histo_Baseline[ic]) continue;
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt) newcardShape << Form("- ");
    else                     newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_eff_e    shape     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(!histo_Baseline[ic]) continue;
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt) newcardShape << Form("- ");
    else                     newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  newcardShape << Form("CMS_pu    shape     ");
  for (int ic=0; ic<nPlotCategories; ic++){
    if(!histo_Baseline[ic]) continue;
    if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
    if(ic == kPlotNonPrompt) newcardShape << Form("- ");
    else                     newcardShape << Form("1.0 ");
  }
  newcardShape << Form("\n");

  for(int ny=2016; ny<2016+nYears; ny++){
    newcardShape << Form("CMS_fakeM3L_%d  shape   ",ny);
    for (int ic=0; ic<nPlotCategories; ic++){
      if(!histo_Baseline[ic]) continue;
      if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
      if(ic == kPlotNonPrompt) newcardShape << Form("1.0 ");
      else                     newcardShape << Form("- ");
    }
    newcardShape << Form("\n");

    newcardShape << Form("CMS_fakeE3L_%d  shape   ",ny);
    for (int ic=0; ic<nPlotCategories; ic++){
      if(!histo_Baseline[ic]) continue;
      if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
      if(ic == kPlotNonPrompt) newcardShape << Form("1.0 ");
      else                     newcardShape << Form("- ");
    }
    newcardShape << Form("\n");

    if(fidAna == 999){
      newcardShape << Form("CMS_fakeMP_%d  shape   ",ny);
      for (int ic=0; ic<nPlotCategories; ic++){
        if(!histo_Baseline[ic]) continue;
	if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
	if(ic == kPlotNonPrompt) newcardShape << Form("1.0 ");
	else                     newcardShape << Form("- ");
      }
      newcardShape << Form("\n");

      newcardShape << Form("CMS_fakeMN_%d  shape   ",ny);
      for (int ic=0; ic<nPlotCategories; ic++){
        if(!histo_Baseline[ic]) continue;
	if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
	if(ic == kPlotNonPrompt) newcardShape << Form("1.0 ");
	else                     newcardShape << Form("- ");
      }
      newcardShape << Form("\n");

      newcardShape << Form("CMS_fakeEP_%d  shape   ",ny);
      for (int ic=0; ic<nPlotCategories; ic++){
        if(!histo_Baseline[ic]) continue;
	if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
	if(ic == kPlotNonPrompt) newcardShape << Form("1.0 ");
	else                     newcardShape << Form("- ");
      }
      newcardShape << Form("\n");

      newcardShape << Form("CMS_fakeEN_%d  shape   ",ny);
      for (int ic=0; ic<nPlotCategories; ic++){
        if(!histo_Baseline[ic]) continue;
	if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
	if(ic == kPlotNonPrompt) newcardShape << Form("1.0 ");
	else                     newcardShape << Form("- ");
      }
      newcardShape << Form("\n");
    }
    else {
      newcardShape << Form("CMS_fakeM_%d  shape   ",ny);
      for (int ic=0; ic<nPlotCategories; ic++){
        if(!histo_Baseline[ic]) continue;
	if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
	if(ic == kPlotNonPrompt) newcardShape << Form("1.0 ");
	else                     newcardShape << Form("- ");
      }
      newcardShape << Form("\n");

      newcardShape << Form("CMS_fakeE_%d  shape   ",ny);
      for (int ic=0; ic<nPlotCategories; ic++){
        if(!histo_Baseline[ic]) continue;
	if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
	if(ic == kPlotNonPrompt) newcardShape << Form("1.0 ");
	else                     newcardShape << Form("- ");
      }
      newcardShape << Form("\n");
      if(fidAna == 6){
      newcardShape << Form("CMS_fakeFLM_%d  shape   ",ny);
      for (int ic=0; ic<nPlotCategories; ic++){
        if(!histo_Baseline[ic]) continue;
	if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
	if(ic == kPlotNonPrompt) newcardShape << Form("1.0 ");
	else                     newcardShape << Form("- ");
      }
      newcardShape << Form("\n");

      newcardShape << Form("CMS_fakeFLE_%d  shape   ",ny);
      for (int ic=0; ic<nPlotCategories; ic++){
        if(!histo_Baseline[ic]) continue;
	if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
	if(ic == kPlotNonPrompt) newcardShape << Form("1.0 ");
	else                     newcardShape << Form("- ");
      }
      newcardShape << Form("\n");
      }
    }

    newcardShape << Form("CMS_btag_heavy_%d    shape     ",ny);
    for (int ic=0; ic<nPlotCategories; ic++){
      if(!histo_Baseline[ic]) continue;
      if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
      if(ic == kPlotNonPrompt) newcardShape << Form("- ");
      else		       newcardShape << Form("1.0 ");
    }
    newcardShape << Form("\n");

    newcardShape << Form("CMS_btag_light_%d    shape     ",ny);
    for (int ic=0; ic<nPlotCategories; ic++){
      if(!histo_Baseline[ic]) continue;
      if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
      if(ic == kPlotNonPrompt) newcardShape << Form("- ");
      else		       newcardShape << Form("1.0 ");
    }
    newcardShape << Form("\n");

    newcardShape << Form("CMS_scale_j_%d	shape	  ",ny);
    for (int ic=0; ic<nPlotCategories; ic++){
      if(!histo_Baseline[ic]) continue;
      if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
      if(ic == kPlotNonPrompt || ic == kPlotDY) newcardShape << Form("- ");
      else					newcardShape << Form("1.0 ");
    }
    newcardShape << Form("\n");

    newcardShape << Form("CMS_res_j_%d	shape	  ",ny);
    for (int ic=0; ic<nPlotCategories; ic++){
      if(!histo_Baseline[ic]) continue;
      if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
      if(ic == kPlotNonPrompt || ic == kPlotDY) newcardShape << Form("- ");
      else					newcardShape << Form("1.0 ");
    }
    newcardShape << Form("\n");

    newcardShape << Form("CMS_prefire_%d    shape     ",ny);
    for (int ic=0; ic<nPlotCategories; ic++){
      if(!histo_Baseline[ic]) continue;
      if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
      if(ic == kPlotNonPrompt) newcardShape << Form("- ");
      else		       newcardShape << Form("1.0 ");
    }
    newcardShape << Form("\n");

    newcardShape << Form("CMS_trigger_%d    shape     ",ny);
    for (int ic=0; ic<nPlotCategories; ic++){
      if(!histo_Baseline[ic]) continue;
      if(ic == kPlotData || histo_Baseline[ic]->GetSumOfWeights() <= 0) continue;
      if(ic == kPlotNonPrompt) newcardShape << Form("- ");
      else		       newcardShape << Form("1.0 ");
    }
    newcardShape << Form("\n");
  }

  newcardShape << Form("CMS_ssww_tvxnorm rateParam * %s 1 [0.1,3]\n",plotBaseNames[kPlotTVX].Data());
  newcardShape << Form("CMS_ssww_zznorm  rateParam * %s 1 [0.1,3]\n",plotBaseNames[kPlotZZ].Data());

  newcardShape << Form("ch1 autoMCStats 0\n");

  newcardShape.close();
}
