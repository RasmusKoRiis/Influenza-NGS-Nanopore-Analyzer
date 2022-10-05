#!/usr/bin/env bash

start_dir=$(pwd)
cd ../data/H3
H3_seq=$(pwd)
cd ../H1
H1_seq=$(pwd)
cd ../Bvic
Bvic_seq=$(pwd)

# Generation of MP2 sequences

cd ${H1_seq}

#seqkit seq -m 982 MP.fa > MP_temp.fa

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < MP.fa > MP_temp.fa
cat MP_temp.fa \ | seqkit locate -p ATGAGTCTTCTAACCGAGGTCGAAAC --gtf -m 5 > first.gtf 
cat MP_temp.fa \ | seqkit locate -p GCCTACCAGAAGCGAATGGGAGTGCAGATGCAGCGGTTCAAATGATCCTCTCGTCATTGCAGCAAACATCATTGGGATCTTGCACCTGATATTGTGGATTACTGATCGTCTTTTTTTCAAATGCATTTATCGTCGCTTTAAATACGGTTTGAAAAGAGGGCCTTCTACGGAAGGAGTGCCTGAGTCCATGAGGGAAGAATATCAACAGGAGCAGCAGAGTGCTGTGGATGTTGACGATGGTCATTTTGTCAACATAGAGCTAGAGTAA --gtf -m 30 > last.gtf 
seqkit subseq --gtf first.gtf MP_temp.fa > first_MP2_temp.fa
seqkit subseq --gtf last.gtf MP_temp.fa > last_MP2_temp.fa
seqkit sort first_MP2_temp.fa > first_sorted_temp.fa
seqkit sort last_MP2_temp.fa > last_sorted_temp.fa
cut -d '_' -f1 first_sorted_temp.fa > first_sorted_header_temp.fa
cut -d '_' -f1 last_sorted_temp.fa > last_sorted_header_temp.fa
#check if equle number of sequenses then proceed else print error
seqkit concat first_sorted_header_temp.fa last_sorted_header_temp.fa > MP2.fa

# Cleanup
rm *temp.fa
rm *gtf
rm *fai

cd ${H3_seq}

#seqkit seq -m 21 in.fq/in.fastq

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < MP.fa > MP_temp.fa
cat MP_temp.fa \ | seqkit locate -p ATGAGCCTTCTTACCGAGGTCGAAAC --gtf -m 5 > first.gtf 
cat MP_temp.fa \ | seqkit locate -p ACCTATCAGAAACGAATGGGGGTGCAGATGCAACGATTCAAGTAACCCGCTTGTTGTTGCCGCGAATATCATTGGGATCTTGCACTTGATATTATGGATTCTTGATCGTCTTTTTTTCAAATGCGTCTATCGACTCTTCAAACACGGCCTTAAAAGAGGCCCTTCTACGGAAGGTGTACCTGAGTCTATGAGGGAAGAATACCGAAAGGAACAGCAGAATGCTGTGGATGCTGACGACAGTCATTTTGTCAGCATAGAATTGGAGTAA --gtf -m 30 > last.gtf 
seqkit subseq --gtf first.gtf MP_temp.fa > first_MP2_temp.fa
seqkit subseq --gtf last.gtf MP_temp.fa > last_MP2_temp.fa
seqkit sort first_MP2_temp.fa > first_sorted_temp.fa
seqkit sort last_MP2_temp.fa > last_sorted_temp.fa
cut -d '_' -f1 first_sorted_temp.fa > first_sorted_header_temp.fa
cut -d '_' -f1 last_sorted_temp.fa > last_sorted_header_temp.fa
#check if equle number of sequenses then proceed else print error
seqkit concat first_sorted_header_temp.fa last_sorted_header_temp.fa > MP2.fa

# Cleanup
rm *temp.fa
rm *gtf
rm *fai

# Generation of MP2 sequences end


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
    cd ../flu_h3n2_mp_norway-3275-2018
    h3n2_mp_norway_3275_2018_dir=$(pwd)
    cd ../flu_h3n2_mp2_norway-3275-2018
    h3n2_mp2_norway_3275_2018_dir=$(pwd)
   

    cd ${start_dir}
    mkdir results

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

    cd ${start_dir}/results
    nextclade run \
        --input-dataset ${h3n2_na_norway_3275_2018_dir} \
        --in-order \
        --output-all output \
        ${H3_seq}/NA.fa \

    mv output H3_NA_Norway

    cd ${start_dir}/results
    nextclade run \
        --input-dataset ${h3n2_mp_norway_3275_2018_dir} \
        --in-order \
        --output-all output \
        ${H3_seq}/MP.fa \

    mv output H3_MP_Norway

    cd ${start_dir}/results
    nextclade run \
        --input-dataset ${h3n2_mp2_norway_3275_2018_dir} \
        --in-order \
        --output-all output \
        ${H3_seq}/MP2.fa \

    mv output H3_MP2_Norway

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

    cd ${start_dir}/results/H3_NA_Norway
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f1 > mutations1_temp.csv
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f26 > mutations3_temp.csv
    paste mutations*.csv > ${PWD##*/}_mutations.csv
    rm *temp.csv
    mv ${PWD##*/}_mutations.csv ..

    cd ${start_dir}/results/H3_MP_Norway
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f1 > mutations1_temp.csv
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f26 > mutations3_temp.csv
    paste mutations*.csv > ${PWD##*/}_mutations.csv
    rm *temp.csv
    mv ${PWD##*/}_mutations.csv ..

    cd ${start_dir}/results/H3_MP2_Norway
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
    cd ../switzerland33302017_C2_na
    switzerland33302017_C2_na_dir=$(pwd)
    cd ../switzerland33302017_C2_mp
    switzerland33302017_C2_mp_dir=$(pwd)
    cd ../switzerland33302017_C2_mp2
    switzerland33302017_C2_mp2_dir=$(pwd)

    cd ${start_dir}/results

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


    cd ${start_dir}/results
    nextclade run \
        --input-dataset ${switzerland33302017_C2_na_dir} \
        --in-order \
        --output-tsv=output/nextclade.tsv \
        ${H1_seq}/NA.fa \

    mv output H1_NA_Switzerland


    cd ${start_dir}/results
    nextclade run \
        --input-dataset ${switzerland33302017_C2_mp_dir} \
        --in-order \
        --output-tsv=output/nextclade.tsv \
        ${H1_seq}/MP.fa \

    mv output H1_MP_Switzerland

    cd ${start_dir}/results
    nextclade run \
        --input-dataset ${switzerland33302017_C2_mp2_dir} \
        --in-order \
        --output-tsv=output/nextclade.tsv \
        ${H1_seq}/MP2.fa \

    mv output H1_MP2_Switzerland

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

    cd ${start_dir}/results/H1_NA_Switzerland
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f1 > mutations1_temp.csv
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f26 > mutations3_temp.csv
    paste mutations*.csv > ${PWD##*/}_mutations.csv
    rm *temp.csv
    mv ${PWD##*/}_mutations.csv ..

    cd ${start_dir}/results/H1_MP_Switzerland
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f1 > mutations1_temp.csv
    cat nextclade.tsv| tr "\t" "~" | cut -d"~" -f26 > mutations3_temp.csv 
    paste mutations*.csv > ${PWD##*/}_mutations.csv
    rm *temp.csv
    mv ${PWD##*/}_mutations.csv ..

    cd ${start_dir}/results/H1_MP2_Switzerland
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
printf '1i\nSample;Mut_NA\n.\nwq!\n' | ex H3_NA_Norway_mutations_toBN.csv
printf '1i\nSample;Mut_MP\n.\nwq!\n' | ex H3_MP_Norway_mutations_toBN.csv
printf '1i\nSample;Mut_MP2\n.\nwq!\n' | ex H3_MP2_Norway_mutations_toBN.csv



#H1 HA mutations organized
printf '1i\nSample;Clade;HA1_root;HA2_root;SigPep_root\n.\nwq!\n' | ex H1_HA_clade_mutations_toBN.csv
printf '1i\nSample;Mut_HA1;Mut_HA2;SigPep_Switzerland\n.\nwq!\n' | ex H1_HA_Switzerland_mutations_toBN.csv
printf '1i\nSample;Mut_HA1_Vaksine;Mut_HA2_Vaksine;SigPep_Vaks\n.\nwq!\n' | ex H1_HA_Switzerland_Vaks_mutations.csv_toBN.csv
printf '1i\nSample;Mut_HA\n.\nwq!\n' | ex H1_HA_Switzerland_NO_SEP_mutations_toBN.csv
printf '1i\nSample;Mut_NA\n.\nwq!\n' | ex H1_NA_Switzerland_mutations_toBN.csv
printf '1i\nSample;Mut_MP\n.\nwq!\n' | ex H1_MP_Switzerland_mutations_toBN.csv
printf '1i\nSample;Mut_MP2\n.\nwq!\n' | ex H1_MP2_Switzerland_mutations_toBN.csv



python3 ../../script_files/dataframes.py

# Merge all mutation results into one file HA
sed -i '' 1d H1_mutations_results.csv
cat H3_mutations_results.csv H1_mutations_results.csv > HA_mutation_results.csv
awk -F',' '$3 != ""' HA_mutation_results.csv > HA_mutation_results_final.csv

# Merge all mutation results into one file NA
sed -i '' 1d H1_NA_mutations_results.csv
cat H3_NA_mutations_results.csv H1_NA_mutations_results.csv > NA_mutation_results.csv
awk -F',' '$2 != ""' NA_mutation_results.csv > NA_mutation_results_final.csv

# Merge all mutation results into one file MP
sed -i '' 1d H1_MP_mutations_results.csv
cat H3_MP_mutations_results.csv H1_MP_mutations_results.csv > MP_mutation_results.csv
awk -F',' '$2 != ""' MP_mutation_results.csv > MP_mutation_results_final.csv

# Merge all mutation results into one file MP2
sed -i '' 1d H1_MP2_mutations_results.csv
cat H3_MP2_mutations_results.csv H1_MP2_mutations_results.csv > MP2_mutation_results.csv
awk -F',' '$2 != ""' MP2_mutation_results.csv > MP2_mutation_results_final.csv

python3 ../../script_files/csv_merger.py

# Cleanup
rm *toBN.csv
rm *mutations.csv
rm -rf H3_HA*
rm -rf H1_HA*
rm -rf H3_NA*
rm -rf H1_NA*
rm -rf H3_MP*
rm -rf H1_MP*
rm *results.csv
rm *final.csv


