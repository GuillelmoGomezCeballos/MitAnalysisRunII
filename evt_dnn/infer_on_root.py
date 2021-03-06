from __future__ import division

import ROOT
from ROOT import gROOT, TFile, TTree, TChain, gPad, gDirectory, AddressOf, TLorentzVector
from multiprocessing import Process
from optparse import OptionParser
from operator import add
import math 
import sys
import time
import array
import numpy as np
import os
import json

gROOT.ProcessLine(
"struct TreeStruct {\
Float_t dnnoutput;\
}")

##############################################################################

from ROOT import TreeStruct
from PandaCore.Tools.root_interface import Selector
import PandaCore.Tools.Functions
from keras.models import load_model 

treestruct = TreeStruct()

def main(options):

      ifile = options.ifile
      tf = ROOT.TFile(ifile);
      tt = tf.Get("mvaTree");
      nent = int(tt.GetEntries())
      with open(options.json) as fjson:
	payload = json.load(fjson)
	if(options.sel == "ZH_boosted"):
            features = payload['features_ZH_boosted']
	elif(options.sel == "ZH_resolved"):
            features = payload['features_ZH_resolved']
	elif(options.sel == "WH_boosted"):
            features = payload['features_WH_boosted']
	elif(options.sel == "WH_resolved"):
            features = payload['features_WH_resolved']
	else:
            logger.error(sys.argv[0], 'Could not identify selection '+options.sel)
            sys.exit(1)
      h5 = options.model

      Apply = True;

      if Apply: infer(tt,ifile,payload,features,h5);

######--------------------------------------------------------------------------------------------------------
######--------------------------------------------------------------------------------------------------------
def infer(tt,ifile,payload,features,h5):

       	nent = int(tt.GetEntries())
	
	if (0!=tt.FindBranch("dnnoutput")):
		tt.SetBranchStatus("dnnoutput",0);

	output = ifile + "_tmp"
	ofile = ROOT.TFile(output,"RECREATE");

	otree = tt.CloneTree()
	dnnoutput = array.array( 'f', [-99.0])
	o_dnnoutput = otree.Branch("dnnoutput" , AddressOf(treestruct,'dnnoutput'), "dnnoutput/F" )

	model = load_model(h5)
	s = Selector()
	s.read_tree(tt, branches=features)

	for i in range(int(tt.GetEntries())):

		tt.GetEntry(i)

		treestruct.dnnoutput = -99.

		if(i % (1 * nent/100) == 0):
			sys.stdout.write("\r[" + "="*int(20*i/nent) + " " + str(round(100.*i/nent,0)) + "% done")
			sys.stdout.flush()

                #treestruct.mT = 2*1.5*3*3

		x = np.array([float(s[f][i]) for f in features])
		x = x.reshape((1,x.shape[0]))
#  print model.predict(x)                                                                                                     
		treestruct.dnnoutput = model.predict(x)[0,0]
		print treestruct.dnnoutput
		
		o_dnnoutput.Fill()
		
		
	ofile.Write()
	ofile.Close()
	os.system("mv -f %s %s" % (output, ifile))


##----##----##----##----##----##----##
if __name__ == '__main__':
	parser = OptionParser()
	parser.add_option('-i','--ifile', dest='ifile', default = 'file.root',help='MC/data file to add the N2DDT branch to', metavar='ifile')
	parser.add_option('-j','--json', dest='json', default = 'root.json',help='JSON with input samples', metavar='json')
	parser.add_option('-m','--model', dest='model', default = 'model.h5',help='h5 file', metavar='model')
	parser.add_option('-s','--sel', dest='sel', default = 'dummy',help='selection', metavar='sel')

	(options, args) = parser.parse_args()
	 
	main(options)
