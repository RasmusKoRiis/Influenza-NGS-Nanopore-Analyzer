#import pandas from the library
import pandas as pd


NA = pd.read_csv ('/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/NA_mutation_results_final.csv' , usecols= ['Sample','Mut_NA'], sep=',')
HA = pd.read_csv ('/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/HA_mutation_results_final.csv' , sep=',')
MP = pd.read_csv ('/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/MP_mutation_results_final.csv' , usecols= ['Sample','Mut_MP'], sep=',')
MP2 = pd.read_csv ('/Users/rasmuskopperudriis/Coding/projects/nextclade_influenza_mutations/start_dir/results/MP2_mutation_results_final.csv' , usecols= ['Sample','Mut_MP2'], sep=',')


df3 = pd.concat([HA,NA,MP], ignore_index=True)
df4 = df3[["Sample"]]
df4 = df4.drop_duplicates(keep='last', subset=['Sample'])
df5 = df4.merge(HA, on='Sample', how='left').fillna('None/Failed/Frameshift')
df6 = df5.merge(NA, on='Sample', how='left').fillna('None/Failed/Frameshift')
df7 = df6.merge(MP, on='Sample', how='left').fillna('None/Failed/Frameshift')
df8 = df7.merge(MP2, on='Sample', how='left').fillna('None/Failed/Frameshift')


df8["Mut_HA1"]=df8["Mut_HA1"].str.replace(',',';')
df8["Mut_HA2"]=df8["Mut_HA2"].str.replace(',',';')
df8["Mut_HA1_Vaksine"]=df8["Mut_HA1_Vaksine"].str.replace(',',';')
df8["Mut_HA2_Vaksine"]=df8["Mut_HA2_Vaksine"].str.replace(',',';')
df8["Mut_HA"]=df8["Mut_HA"].str.replace(',',';')
df8["Mut_NA"]=df8["Mut_NA"].str.replace(',',';')
df8["Mut_MP"]=df8["Mut_MP"].str.replace(',',';')
df8["Mut_MP2"]=df8["Mut_MP2"].str.replace(',',';')


df8.to_csv('mutation_summary_temp.csv', index=False)
