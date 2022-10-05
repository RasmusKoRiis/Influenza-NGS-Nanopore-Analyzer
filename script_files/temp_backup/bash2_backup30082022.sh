#!/usr/bin/env bash

start_dir=$(pwd)
cd ../data/H3
H3_seq=$(pwd)
cd ../H1
H1_seq=$(pwd)
cd ../Bvic
Bvic_seq=$(pwd)

# H3 mutations  nexclade #

FILE_H3=${H3_seq}/HA.fa

if test -f "$FILE_H3"; then

    cd ../../nextclade_dataset/dataset-H3N2/data/flu_h3n2_ha
    h3n2_nextclade_data_dir=$(pwd)
    cd ../flu_h3n2_ha_norway-3275-2018
    h3n2_ha_norway_3275_2018_dir=$(pwd)
    cd ../flu_h3n2_ha_Cambodia_e0826360_2020
    h3n2_ha_Cambodia_e0826360_2020_dir=$(pwd)
    cd ../flu_h3n2_ha_norway-3275-2018_no_seperation
    h3n2_ha_norway_3275_2018_no_seperation_dir=$(pwd)
    cd ../flu_h3n2_na_norway-3275-2018
    h3n2_na_norway_3275_2018_dir=$(pwd)
   

    cd ${start_dir}
    mkdir results

    #HA

    cd ${start_dir}/results
    nextclade run \
        --input-dataset ${h3n2_nextclade_data_dir} \
        --in-order \
        --output-all output \
        ${H3_seq}/HA.fa \

    mv output H3_HA_clade

    cd ${start_dir}/results
    nextclade run \
        --input-dataset ${h3n2_ha_norway_3275_2018_dir} \
        --in-order \
        --output-all output \
        ${H3_seq}/HA.fa \

    mv output H3_HA_Norway

    cd ${start_dir}/results
    nextclade run \
        --input-dataset ${h3n2_ha_Cambodia_e0826360_2020_dir} \
        --in-order \
        --output-all output \
        ${H3_seq}/HA.fa \

    mv output H3_HA_Cambodia

    cd ${start_dir}/results
    nextclade run \
        --input-dataset ${h3n2_ha_norway_3275_2018_no_seperation_dir} \
        --in-order \
        --output-all output \
        ${H3_seq}/HA.fa \

    mv output H3_HA_Norway_NO_SEP

    cd ${start_dir}/results/H3_HA_clade
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f1 > mutations1_temp.csv
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f2 > mutations2_temp.csv
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f26 > mutations3_temp.csv
    paste mutations*.csv > ${PWD##*/}_mutations.csv
    rm *temp.csv
    mv ${PWD##*/}_mutations.csv ..

    cd ${start_dir}/results/H3_HA_Norway
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f1 > mutations1_temp.csv
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f26 > mutations3_temp.csv
    paste mutations*.csv > ${PWD##*/}_mutations.csv
    rm *temp.csv
    mv ${PWD##*/}_mutations.csv ..

    cd ${start_dir}/results/H3_HA_Cambodia
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f1 > mutations1_temp.csv
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f26 > mutations3_temp.csv
    paste mutations*.csv > ${PWD##*/}_mutations.csv
    rm *temp.csv
    mv ${PWD##*/}_mutations.csv ..

    cd ${start_dir}/results/H3_HA_Norway_NO_SEP
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f1 > mutations1_temp.csv
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f26 > mutations3_temp.csv
    paste mutations*.csv > ${PWD##*/}_mutations.csv
    rm *temp.csv
    mv ${PWD##*/}_mutations.csv ..

    cd ${start_dir}/results/H3_HA_Norway
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f1 > mutations1_temp.csv
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f26 > mutations3_temp.csv
    paste mutations*.csv > ${PWD##*/}_mutations.csv
    rm *temp.csv
    mv ${PWD##*/}_mutations.csv ..

    cd ${start_dir}/results

fi 

# H3 mutations end necalde #

# H1 mutations nexclade #

FILE_H1=${H1_seq}/HA.fa

if test -f "$FILE_H1"; then

   cd ${start_dir}
    cd ../nextclade_dataset/dataset-H1N1/data/flu_h1n1pdm_ha
    h1n1pdm_nextclade_data_dir=$(pwd)
    cd ../switzerland33302017_C2_ha
    switzerland33302017_C2_ha_dir=$(pwd)
    cd ../switzerland33302017_C2_ha_vaks
    switzerland33302017_C2_ha_vaks_dir=$(pwd)
    cd ../switzerland33302017_C2_no_sep
    switzerland33302017_C2_ha_no_sep_dir=$(pwd)

    cd ${start_dir}/results

    echo ${H1_seq}

    cd ${start_dir}/results
    nextclade run \
        --input-dataset ${h1n1pdm_nextclade_data_dir} \
        --in-order \
        --output-tsv=output/nextclade.tsv \
        ${H1_seq}/HA.fa \

    mv output H1_HA_clade

    cd ${start_dir}/results
    nextclade run \
        --input-dataset ${switzerland33302017_C2_ha_dir} \
        --in-order \
        --output-tsv=output/nextclade.tsv \
        ${H1_seq}/HA.fa \

    mv output H1_HA_Switzerland

    cd ${start_dir}/results
    nextclade run \
        --input-dataset ${switzerland33302017_C2_ha_vaks_dir} \
        --in-order \
        --output-tsv=output/nextclade.tsv \
        ${H1_seq}/HA.fa \

    mv output H1_HA_Switzerland_Vaks

    cd ${start_dir}/results
    nextclade run \
        --input-dataset ${switzerland33302017_C2_ha_no_sep_dir} \
        --in-order \
        --output-all output \
        ${H1_seq}/HA.fa \

    mv output H1_HA_Switzerland_NO_SEP

    cd ${start_dir}/results/H1_HA_clade
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f1 > mutations1_temp.csv
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f2 > mutations2_temp.csv
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f26 > mutations3_temp.csv
    paste mutations*.csv > ${PWD##*/}_mutations.csv
    rm *temp.csv
    mv ${PWD##*/}_mutations.csv ..

    cd ${start_dir}/results/H1_HA_Switzerland
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f1 > mutations1_temp.csv
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f26 > mutations3_temp.csv
    paste mutations*.csv > ${PWD##*/}_mutations.csv
    rm *temp.csv
    mv ${PWD##*/}_mutations.csv ..

    cd ${start_dir}/results/H1_HA_Switzerland_Vaks
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f1 > mutations1_temp.csv
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f26 > mutations3_temp.csv
    paste mutations*.csv > ${PWD##*/}_mutations.csv
    rm *temp.csv
    mv ${PWD##*/}_mutations.csv ..

    cd ${start_dir}/results/H1_HA_Switzerland_No_SEP
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f1 > mutations1_temp.csv
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f26 > mutations3_temp.csv
    paste mutations*.csv > ${PWD##*/}_mutations.csv
    rm *temp.csv
    mv ${PWD##*/}_mutations.csv ..

    cd ${start_dir}/results 
fi 

# H1 mutations end nexclade #

node ../../script_files/text-handler-withClade.js
node ../../script_files/text-handler-withoutClade.js


#H3 HA mutations organized
printf '1i\nSample;Clade;HA1_root;HA2_root;SigPep_root\n.\nwq!\n' | ex H3_HA_clade_mutations_toBN.csv
printf '1i\nSample;Mut_HA1;Mut_HA2;SigPep_Norway\n.\nwq!\n' | ex H3_HA_Norway_mutations_toBN.csv
printf '1i\nSample;Mut_HA1_Vaksine;Mut_HA2_Vaksine;SigPep_Combodia\n.\nwq!\n' | ex H3_HA_Cambodia_mutations_toBN.csv
printf '1i\nSample;Mut_HA\n.\nwq!\n' | ex H3_HA_Norway_NO_SEP_mutations_toBN.csv


#H1 HA mutations organized
printf '1i\nSample;Clade;HA1_root;HA2_root;SigPep_root\n.\nwq!\n' | ex H1_HA_clade_mutations_toBN.csv
printf '1i\nSample;Mut_HA1;Mut_HA2;SigPep_Switzerland\n.\nwq!\n' | ex H1_HA_Switzerland_mutations_toBN.csv
printf '1i\nSample;Mut_HA1_Vaksine;Mut_HA2_Vaksine;SigPep_Vaks\n.\nwq!\n' | ex H1_HA_Switzerland_Vaks_mutations.csv_toBN.csv
printf '1i\nSample;Mut_HA\n.\nwq!\n' | ex H1_HA_Switzerland_NO_SEP_mutations_toBN.csv


python3 ../../script_files/dataframes.py

# Cleanup
rm *toBN.csv
rm *mutations.csv
rm -rf H3_HA*
rm -rf H1_HA*

# Merge all mutation results into one file
sed -i '' 1d H1_mutations_results.csv
cat H3_mutations_results.csv H1_mutations_results.csv > HA_mutation_results.csv
awk -F',' '$3 != ""' HA_mutation_results.csv

# HA FRAGMENT END









#implement mutation-finder for H1, BVic and BYam, first HA, then NA, then all fragments
     # final output should have  this format:  Sample, Clade, HA1, HA2, SigPep, NA1, NA2, (resistance mutations?) all other fragments
     # One for eacg fragment or a file for all together?
     #


#get list from fluserver GISAID, check if samples have mutations fro resitance

#organize the results into files, one for BioNumerics and one for PowerBI

#export results for visulaztion with javascript

#merge files horizontally
