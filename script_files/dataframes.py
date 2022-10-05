#import pandas from the library
import pandas as pd
import os

cwd = os.getcwd()

#H3 HA

H3cladeDF = pd.read_csv ('{}/H3_HA_clade_mutations_toBN.csv'.format(cwd) , usecols= ['Sample','Clade'], sep=';')
H3mutDF = pd.read_csv ('{}/H3_HA_Norway_mutations_toBN.csv'.format(cwd) , usecols= ['Mut_HA1','Mut_HA2'], sep=';')
H3vaksDF = pd.read_csv ('{}/H3_HA_Cambodia_mutations_toBN.csv'.format(cwd) , usecols= ['Mut_HA1_Vaksine','Mut_HA2_Vaksine'], sep=';')
H3mutnoSEP_DF = pd.read_csv ('{}/H3_HA_Norway_NO_SEP_mutations_toBN.csv'.format(cwd) , usecols= ['Mut_HA'], sep=';')


H3cladeDF  = H3cladeDF .join(H3mutDF)
H3cladeDF  = H3cladeDF .join(H3vaksDF)
H3cladeDF = H3cladeDF .join(H3mutnoSEP_DF)

#H3cladeDF["Mut_HA_Vaksine"] = pd.NaT
H3cladeDF["Mut_HA_Referanse"] = "flu_h3n2_ha_norway-3275-2018"
H3cladeDF["Mut_HA_Vaksine_Referanse"] = "flu_h3n2_ha_Cambodia_e0826360_2020"

H3cladeDF .to_csv('H3_mutations_results.csv', index=False)


#H1 HA

H1cladeDF = pd.read_csv ('{}/H1_HA_clade_mutations_toBN.csv'.format(cwd) , usecols= ['Sample','Clade'], sep=';')
H1mutDF = pd.read_csv ('{}/H1_HA_Switzerland_mutations_toBN.csv'.format(cwd) , usecols= ['Mut_HA1','Mut_HA2'], sep=';')
H1vaksDF = pd.read_csv ('{}/H1_HA_Switzerland_Vaks_mutations.csv_toBN.csv'.format(cwd) , usecols= ['Mut_HA1_Vaksine','Mut_HA2_Vaksine'], sep=';')
H1mutnoSEP_DF = pd.read_csv ('{}/H1_HA_Switzerland_NO_SEP_mutations_toBN.csv'.format(cwd) , usecols= ['Mut_HA'], sep=';')


H1cladeDF = H1cladeDF.join(H1mutDF)
H1cladeDF = H1cladeDF.join(H1vaksDF)
H1cladeDF = H1cladeDF.join(H1mutnoSEP_DF)


#H1cladeDF["Mut_HA_Vaksine"] = pd.NaT
H1cladeDF["Mut_HA_Referanse"] = "switzerland33302017_C2_ha"
H1cladeDF["Mut_HA_Vaksine_Referanse"] = "switzerland33302017_C2_ha_vaksine"

H1cladeDF.to_csv('H1_mutations_results.csv', index=False)


#H3 NA
H3mutNADF = pd.read_csv ('{}/H3_NA_Norway_mutations_toBN.csv'.format(cwd) , usecols= ['Sample','Mut_NA'], sep=';')

H3mutNADF .to_csv('H3_NA_mutations_results.csv', index=False)

#H1 NA
H1mutNADF = pd.read_csv ('{}/H1_NA_Switzerland_mutations_toBN.csv'.format(cwd) , usecols= ['Sample','Mut_NA'], sep=';')

H1mutNADF .to_csv('H1_NA_mutations_results.csv', index=False)

#H3 MP
H3mutMPDF = pd.read_csv ('{}/H3_MP_Norway_mutations_toBN.csv'.format(cwd) , usecols= ['Sample','Mut_MP'], sep=';')

H3mutMPDF .to_csv('H3_MP_mutations_results.csv', index=False)

#H1 MP
H1mutMPDF = pd.read_csv ('{}/H1_MP_Switzerland_mutations_toBN.csv'.format(cwd) , usecols= ['Sample','Mut_MP'], sep=';')

H1mutMPDF .to_csv('H1_MP_mutations_results.csv', index=False)

#H3 MP2
H3mutMP2DF = pd.read_csv ('{}/H3_MP2_Norway_mutations_toBN.csv'.format(cwd) , usecols= ['Sample','Mut_MP2'], sep=';')

H3mutMP2DF .to_csv('H3_MP2_mutations_results.csv', index=False)

#H1 MP2
H1mutMP2DF = pd.read_csv ('{}/H1_MP2_Switzerland_mutations_toBN.csv'.format(cwd) , usecols= ['Sample','Mut_MP2'], sep=';')

H1mutMP2DF .to_csv('H1_MP2_mutations_results.csv', index=False)