#include <TROOT.h>
#include <TMVA/DataLoader.h>
#include <TMVA/Factory.h>
#include <TMVA/Types.h>
#include <TFile.h>
#include <TCut.h>
#include <TTree.h>
#include <TString.h>
#include <TStyle.h>

#include "MitAnalysisRunII/panda/macros/9x/common.h"

void ewkvbsMVA(
  TString inputFileName,
  int nsel = 0,
  TString extraString="v0",
  bool moreMVAs = false,
  bool dodnn = false,
  bool useGaussDeco=false
) {
  gROOT->ProcessLine("TMVA::gConfig().GetVariablePlotting().fMaxNumOfAllowedVariablesForScatterPlots = 50");
  TFile *output_file;
  TMVA::Factory *factory;
  TString trainTreeEventSplitStr="(eventNum % 10)<3";
  TString testTreeEventSplitStr="(eventNum % 10)>=3";

  // Determine the input trees
  TFile *inputFile = TFile::Open(inputFileName,"READ");
  TTree *mvaTree = (TTree*)inputFile->Get("mvatree");
  
  // Initialize the factory
  output_file=TFile::Open(Form("MVA_%s.root",extraString.Data()), "RECREATE");
  factory = new TMVA::Factory("bdt", output_file, "!V:!Silent:DrawProgressBar:Transformations=I;D;P;G,D:AnalysisType=Multiclass");
  TString factoryOptions="!V:!Silent:DrawProgressBar";
  //TString factoryOptions="!V:!Silent:!DrawProgressBar";
  if(nsel != 2)factoryOptions+=":AnalysisType=Classification";
  if(useGaussDeco)  factoryOptions += ":Transformations=G,D";
  //else              factoryOptions += ":Transformations=I";
  factory = new TMVA::Factory("bdt", output_file, factoryOptions);
  TMVA::DataLoader *dataloader=new TMVA::DataLoader("MitEWKVBSAnalysis");

  TCut cutTrainSignal = Form("%s && mvajetpt1 > 50 && mvajetpt2 > 50 && mvanlep == 3 && category==%d",trainTreeEventSplitStr.Data(),kPlotEWKWZ);
  TCut cutTrainBkg    = Form("%s && mvajetpt1 > 50 && mvajetpt2 > 50 && mvanlep == 3 && category==%d",trainTreeEventSplitStr.Data(),kPlotWZ);
  TCut cutTestSignal  = Form("%s && mvajetpt1 > 50 && mvajetpt2 > 50 && mvanlep == 3 && category==%d",testTreeEventSplitStr.Data(), kPlotEWKWZ);
  TCut cutTestBkg     = Form("%s && mvajetpt1 > 50 && mvajetpt2 > 50 && mvanlep == 3 && category==%d",testTreeEventSplitStr.Data(), kPlotWZ);
  if     (nsel == 1){
    cutTrainSignal = Form("%s && mvajetpt1 > 50 && mvajetpt2 > 50 && mvanlep == 2 && category==%d",                  trainTreeEventSplitStr.Data(),kPlotBSM);
    cutTrainBkg    = Form("%s && mvajetpt1 > 50 && mvajetpt2 > 50 && mvanlep == 2 && (category==%d || category==%d)",trainTreeEventSplitStr.Data(),kPlotSignal1,kPlotSignal2);
    cutTestSignal  = Form("%s && mvajetpt1 > 50 && mvajetpt2 > 50 && mvanlep == 2 && category==%d",                  testTreeEventSplitStr.Data(), kPlotBSM);
    cutTestBkg     = Form("%s && mvajetpt1 > 50 && mvajetpt2 > 50 && mvanlep == 2 && (category==%d || category==%d)",testTreeEventSplitStr.Data(), kPlotSignal1,kPlotSignal2);
  }
  else if(nsel == 2){
    cutTrainSignal = Form("%s && mvajetpt1 > 50 && mvajetpt2 > 50 && mvanlep == 2 && (category==%d || category==%d)",trainTreeEventSplitStr.Data(),kPlotBSM,kPlotSignal1);
    cutTrainBkg    = Form("%s && mvajetpt1 > 50 && mvajetpt2 > 50 && mvanlep == 2 && category==%d",                  trainTreeEventSplitStr.Data(),kPlotSignal2);
    cutTestSignal  = Form("%s && mvajetpt1 > 50 && mvajetpt2 > 50 && mvanlep == 2 && (category==%d || category==%d)",testTreeEventSplitStr.Data(), kPlotBSM,kPlotSignal1);
    cutTestBkg     = Form("%s && mvajetpt1 > 50 && mvajetpt2 > 50 && mvanlep == 2 && category==%d",                  testTreeEventSplitStr.Data(), kPlotSignal2);
  }
  else if(nsel == 3){
    cutTrainSignal = Form("%s && mvajetpt1 > 50 && mvajetpt2 > 50 && mvanlep == 2 && (category==%d || category==%d|| category==%d)",trainTreeEventSplitStr.Data(),kPlotSignal1,kPlotSignal2,kPlotBSM);
    cutTrainBkg    = Form("%s && mvajetpt1 > 50 && mvajetpt2 > 50 && mvanlep == 2 && category==%d",                                 trainTreeEventSplitStr.Data(),kPlotWS);
    cutTestSignal  = Form("%s && mvajetpt1 > 50 && mvajetpt2 > 50 && mvanlep == 2 && (category==%d || category==%d|| category==%d)",testTreeEventSplitStr.Data(), kPlotSignal1,kPlotSignal2,kPlotBSM);
    cutTestBkg     = Form("%s && mvajetpt1 > 50 && mvajetpt2 > 50 && mvanlep == 2 && category==%d",                                 testTreeEventSplitStr.Data(), kPlotWS);
  }
  dataloader->AddTree(mvaTree, "Signal"    , 1.0, cutTrainSignal, "train");
  dataloader->AddTree(mvaTree, "Background", 1.0, cutTrainBkg	, "train");
  dataloader->AddTree(mvaTree, "Signal"    , 1.0, cutTestSignal , "test");
  dataloader->AddTree(mvaTree, "Background", 1.0, cutTestBkg    , "test");
  dataloader->SetWeightExpression("abs(weight)", "Signal");
  dataloader->SetWeightExpression("abs(weight)", "Background");
  
  if(nsel == 1 || nsel == 2){
    dataloader->AddVariable("mvadphijj"  , "mvadphijj"  , "", 'F');
    dataloader->AddVariable("mvajetpt1"  , "mvajetpt1"  , "", 'F');
    dataloader->AddVariable("mvajetpt2"  , "mvajetpt2"  , "", 'F');
    dataloader->AddVariable("mvaWpt"	 , "mvaMet"	, "", 'F');
    dataloader->AddVariable("mvaZpt"	 , "mvaZpt"	, "", 'F');
    dataloader->AddVariable("mvaVVmt"    , "mvaVVmt"	, "", 'F');
    dataloader->AddVariable("mvazep1"    , "mvazep1"	, "", 'F');
    dataloader->AddVariable("mvazep2"    , "mvazep2"	, "", 'F');
    dataloader->AddVariable("mvaj1Zdr"   , "mvaj1Zdr"	, "", 'F');
    dataloader->AddVariable("mvaj2Zdr"   , "mvaj2Zdr"	, "", 'F');
    dataloader->AddVariable("mvaleppt1"  , "mvaleppt1"  , "", 'F');
    dataloader->AddVariable("mvaleppt2"  , "mvaleppt2"  , "", 'F');
    dataloader->AddVariable("mvadphill"  , "mvadphill"  , "", 'F');
    dataloader->AddVariable("mvamll"	 , "mvamll"	, "", 'F');
    dataloader->AddVariable("(mvaleppt1*mvaleppt2)/(mvajetpt1*mvajetpt2)"  , "mvaptrel"  , "", 'F');
    //dataloader->AddVariable("mvamjj"	 , "mvamjj"	, "", 'F');
    //dataloader->AddVariable("mvadetajj"  , "mvadetajj"  , "", 'F');
    //dataloader->AddVariable("mvajeteta1" , "mvajeteta1" , "", 'F');
    //dataloader->AddVariable("mvajeteta2" , "mvajeteta2" , "", 'F');
    //dataloader->AddVariable("mvazstar"   , "mvazstar"	, "", 'F');
    //dataloader->AddVariable("mvamaxzep"  , "mvamaxzep"  , "", 'F');
    //dataloader->AddVariable("mvapttot/mvasumpttot" , "mvapttotN" , "", 'F');
    //dataloader->AddVariable("mvapttot"   , "mvapttot"	, "", 'F');
    //dataloader->AddVariable("mvasumpttot", "mvasumpttot", "", 'F');
    //dataloader->AddVariable("mvalepeta1" , "mvalepeta1" , "", 'F');
    //dataloader->AddVariable("mvalepeta2" , "mvalepeta2" , "", 'F');
    //dataloader->AddVariable("mvadrll"	 , "mvadrll"	, "", 'F');  
  }
  else if(nsel == 3){
    dataloader->AddVariable("mvadphijj"  , "mvadphijj"  , "", 'F');
    dataloader->AddVariable("mvajetpt1"  , "mvajetpt1"  , "", 'F');
    dataloader->AddVariable("mvajetpt2"  , "mvajetpt2"  , "", 'F');
    dataloader->AddVariable("mvaWpt"	 , "mvaMet"	, "", 'F');
    dataloader->AddVariable("mvaZpt"	 , "mvaZpt"	, "", 'F');
    //dataloader->AddVariable("mvaVVmt"    , "mvaVVmt"	, "", 'F');
    dataloader->AddVariable("mvazep1"    , "mvazep1"	, "", 'F');
    dataloader->AddVariable("mvazep2"    , "mvazep2"	, "", 'F');
    //dataloader->AddVariable("mvaj1Zdr"   , "mvaj1Zdr"	, "", 'F');
    //dataloader->AddVariable("mvaj2Zdr"   , "mvaj2Zdr"	, "", 'F');
    dataloader->AddVariable("mvaleppt1"  , "mvaleppt1"  , "", 'F');
    //dataloader->AddVariable("mvaleppt2"  , "mvaleppt2"  , "", 'F');
    //dataloader->AddVariable("mvadphill"  , "mvadphill"  , "", 'F');
    //dataloader->AddVariable("mvamll"	 , "mvamll"	, "", 'F');//10var
    //dataloader->AddVariable("(mvaleppt1*mvaleppt2)/(mvajetpt1*mvajetpt2)"  , "mvaptrel"  , "", 'F');
    dataloader->AddVariable("mvamjj"	 , "mvamjj"	, "", 'F');
    dataloader->AddVariable("mvadetajj"  , "mvadetajj"  , "", 'F');
    //dataloader->AddVariable("mvajeteta1" , "mvajeteta1" , "", 'F');
    //dataloader->AddVariable("mvajeteta2" , "mvajeteta2" , "", 'F');
    //dataloader->AddVariable("mvazstar"   , "mvazstar"	, "", 'F');
    //dataloader->AddVariable("mvamaxzep"  , "mvamaxzep"  , "", 'F');
    //dataloader->AddVariable("mvapttot/mvasumpttot" , "mvapttotN" , "", 'F');
    //dataloader->AddVariable("mvapttot"   , "mvapttot"	, "", 'F');
    //dataloader->AddVariable("mvasumpttot", "mvasumpttot", "", 'F');
    //dataloader->AddVariable("mvalepeta1" , "mvalepeta1" , "", 'F');
    //dataloader->AddVariable("mvalepeta2" , "mvalepeta2" , "", 'F');
    //dataloader->AddVariable("mvadrll"	 , "mvadrll"	, "", 'F');  
  }
  else {
    dataloader->AddVariable("mvamjj"    , "mvamjj"    , "", 'F');
    dataloader->AddVariable("mvadetajj" , "mvadetajj"   , "", 'F');
    dataloader->AddVariable("mvadphijj" , "mvadphijj"   , "", 'F');
    dataloader->AddVariable("mvajetpt1" , "mvajetpt1" , "", 'F');
    dataloader->AddVariable("mvajetpt2" , "mvajetpt2" , "", 'F');
    dataloader->AddVariable("mvajeteta1", "mvajeteta1", "", 'F');
    dataloader->AddVariable("mvaWlZdeta", "mvaWlZdeta", "", 'F');
    dataloader->AddVariable("mvazstar"  , "mvazstar"  , "", 'F');
    dataloader->AddVariable("mvazep1"   , "mvazep1"   , "", 'F');
    dataloader->AddVariable("mvazep2"   , "mvazep2"   , "", 'F');
    dataloader->AddVariable("mvazep3"   , "mvazep3"   , "", 'F');
    dataloader->AddVariable("mvaj1Zdr"  , "mvaj1Zdr"  , "", 'F');
    dataloader->AddVariable("mvapttot/mvasumpttot" , "mvapttotN" , "", 'F');
    //dataloader->AddVariable("mvamaxzep" , "mvamaxzep" , "", 'F');
    //dataloader->AddVariable("mvajeteta2", "mvajeteta2", "", 'F');
    //dataloader->AddVariable("mvaWpt"	, "mvaWpt"    , "", 'F');
    //dataloader->AddVariable("mvaZpt"	, "mvaZpt"    , "", 'F');
    //dataloader->AddVariable("mvaVVmt"	, "mvaVVmt"   , "", 'F');
    //dataloader->AddVariable("mvaj2Zdr"  , "mvaj2Zdr"  , "", 'F');
    //dataloader->AddVariable("mvasumpttot"  , "mvasumpttot"  , "", 'F');
    //dataloader->AddVariable("mvanjets"  , "mvanjets"  , "", 'F');
  }

  TString prepareOptions="NormMode=None";
    prepareOptions+=":SplitMode=Block"; // use e.g. all events selected by trainTreeEventSplitStr for training
    prepareOptions+=":MixMode=Random";
  dataloader->PrepareTrainingAndTestTree("", prepareOptions);

  TString hyperparameters;

  hyperparameters=
  "!H:!V:NTrees=1000:BoostType=Grad:MinNodeSize=5%:NegWeightTreatment=IgnoreNegWeightsInTraining:Shrinkage=0.10:UseBaggedBoost:GradBaggingFraction=0.5:nCuts=10000:MaxDepth=2";
  factory->BookMethod(dataloader, TMVA::Types::kBDT, Form("BDTG_%s",extraString.Data()), hyperparameters);

  TString layoutString ("Layout=TANH|100,TANH|50,TANH|10,LINEAR");

  TString training0 ("LearningRate=1e-1,Momentum=0.0,Repetitions=1,ConvergenceSteps=300,BatchSize=20,TestRepetitions=15,WeightDecay=0.001,Regularization=NONE,DropConfig=0.0+0.5+0.5+0.5,DropRepetitions=1,Multithreading=True");
  TString training1 ("LearningRate=1e-2,Momentum=0.5,Repetitions=1,ConvergenceSteps=300,BatchSize=30,TestRepetitions=7,WeightDecay=0.001,Regularization=L2,Multithreading=True,DropConfig=0.0+0.1+0.1+0.1,DropRepetitions=1");
  TString training2 ("LearningRate=1e-2,Momentum=0.3,Repetitions=1,ConvergenceSteps=300,BatchSize=40,TestRepetitions=7,WeightDecay=0.0001,Regularization=L2,Multithreading=True");
  TString training3 ("LearningRate=1e-3,Momentum=0.1,Repetitions=1,ConvergenceSteps=200,BatchSize=70,TestRepetitions=7,WeightDecay=0.0001,Regularization=NONE,Multithreading=True");
  
  TString trainingStrategyString ("TrainingStrategy=");
  //trainingStrategyString += training0 + "|" + training1 + "|" + training2 + "|" + training3;
  trainingStrategyString += training0 + "|" + training1 + "|" + training2;

  // General Options.
  TString dnnOptions ("!H:V:ErrorStrategy=CROSSENTROPY:VarTransform=N:"
		      "WeightInitialization=XAVIERUNIFORM");
  dnnOptions.Append (":"); dnnOptions.Append (layoutString);
  dnnOptions.Append (":"); dnnOptions.Append (trainingStrategyString);
  
  // Standard implementation, no dependencies.
  TString stdOptions = dnnOptions + ":Architecture=CPU";
  if(dodnn)
    factory->BookMethod(dataloader, TMVA::Types::kDNN, "DNN", stdOptions);

  if(moreMVAs){
  hyperparameters=
  "!H:!V:BoostType=AdaBoost:MinNodeSize=5%:NegWeightTreatment=IgnoreNegWeightsInTraining:SeparationType=MisClassificationError:NTrees=1000:MaxDepth=3:AdaBoostBeta=0.12:nCuts=10000";
  factory->BookMethod(dataloader, TMVA::Types::kBDT, Form("BDTA_%s",extraString.Data()), hyperparameters);

  hyperparameters=
  "!H:!V:VarTransform=None";
  factory->BookMethod(dataloader, TMVA::Types::kHMatrix, Form("HMatrix_%s",extraString.Data()), hyperparameters);

  hyperparameters=
  "!H:!V:!TransformOutput:PDFInterpol=Spline2:NSmoothSig[0]=20:NSmoothBkg[0]=20:NSmooth=5:NAvEvtPerBin=50:VarTransform=PCA";
  factory->BookMethod(dataloader, TMVA::Types::kLikelihood, Form("LikelihoodPCA_%s",extraString.Data()), hyperparameters);

  hyperparameters=
  "!H:!V:TransformOutput:PDFInterpol=Spline2:NSmoothSig[0]=20:NSmoothBkg[0]=20:NSmoothBkg[1]=10:NSmooth=1:NAvEvtPerBin=50";
  factory->BookMethod(dataloader, TMVA::Types::kLikelihood, Form("Likelihood_%s",extraString.Data()), hyperparameters);

  hyperparameters=
  "!H:!V:Fisher:CreateMVAPdfs:PDFInterpolMVAPdf=Spline2:NbinsMVAPdf=40:NsmoothMVAPdf=10";
  factory->BookMethod(dataloader, TMVA::Types::kFisher, Form("Fisher_%s",extraString.Data()), hyperparameters);

  hyperparameters=
  "!H:!V:!TransformOutput:PDFInterpol=KDE:KDEtype=Gauss:KDEiter=Adaptive:KDEFineFactor=0.3:KDEborder=None:NAvEvtPerBin=50";
  factory->BookMethod(dataloader, TMVA::Types::kLikelihood, Form("LikelihoodKDE_%s",extraString.Data()), hyperparameters);

  hyperparameters=
  "H:!V:Boost_Num=20:Boost_Transform=log:Boost_Type=AdaBoost:Boost_AdaBoostBeta=0.2:!Boost_DetailedMonitoring";
  factory->BookMethod(dataloader, TMVA::Types::kFisher, Form("BoostedFisher_%s",extraString.Data()), hyperparameters);

   hyperparameters=
  "!H:!V:NeuronType=tanh:VarTransform=N:NCycles=800:HiddenLayers=N+1:TestRate=5:!UseRegulator";
  factory->BookMethod(dataloader, TMVA::Types::kMLP, Form("MLP_%s",extraString.Data()), hyperparameters);
  }

  factory->TrainAllMethods();
  factory->TestAllMethods();
  factory->EvaluateAllMethods();
  output_file->Close();
}
