
mkdir results

# AUGUR
#Remove lines that dosent start with
grep '^[>]' sequences.fasta > metadata_temp01.txt

#Replace | with Tab
sed 's/|/\t/g' metadata_temp01.txt > metadata_temp02.txt

#Add Header
h="strain	virus	date	region	country"
printf "1\ni\n$h \n.\n\nw\nq\n"|ed -s metadata_temp02.txt

#Edit the metadata_file in Numbers
  #virus = influenza
  #move country to correct column
  #add continent to region column
  #fix date with date converter numbers-file

#make ..outgroup.gb
  #find reference lenght
  #translate reference seqience with https://web.expasy.org/translate/ and find coding region (CDS)
  # copy inn translated sequence
  #format fasta with https://www.ebi.ac.uk/Tools/services/web/toolresult.ebi?jobId=emboss_seqret-I20220904-162831-0273-27324011-p1m

augur index \
  --sequences data/sequences.fasta \
  --output results/sequence_index.tsv

augur filter \
  --sequences data/sequences.fasta \
  --sequence-index results/sequence_index.tsv \
  --metadata data/metadata.tsv \
  --output results/filtered.fasta \
  --group-by country year month \
  --sequences-per-group 20 \
  --min-date 2012

augur align \
--sequences data/sequences.fasta \
--reference-sequence data/reference.fasta \
--output results/aligned.fasta \
--fill-gaps

augur tree \
--alignment results/aligned.fasta \
--output results/tree_raw.nwk

augur refine \
  --tree results/tree_raw.nwk \
  --alignment results/aligned.fasta \
  --metadata data/metadata.tsv \
  --output-tree results/tree.nwk \
  --output-node-data results/branch_lengths.json \
  --timetree \
  --coalescent opt \
  --date-confidence \
  --date-inference marginal \
  --clock-filter-iqd 4

augur traits \
  --tree results/tree.nwk \
  --metadata data/metadata.tsv \
  --output-node-data results/traits.json \
  --columns region country \
  --confidence

augur ancestral \
  --tree results/tree.nwk \
  --alignment results/aligned.fasta \
  --output-node-data results/nt_muts.json \
  --inference joint

augur translate \
  --tree results/tree.nwk \
  --ancestral-sequences results/nt_muts.json \
  --reference-sequence data/influenza_MP_outgroup.gb \
  --output-node-data results/aa_muts.json

augur clades \
  --tree results/tree.nwk \
  --mutations results/aa_muts.json \
              results/nt_muts.json \
  --reference data/reference.fasta \
  --clades data/clades.tsv \
  --output-node-data results/clade.json

augur export v2 \
  --tree results/tree.nwk \
  --metadata data/metadata.tsv \
  --node-data results/branch_lengths.json \
              results/traits.json \
              results/nt_muts.json \
              results/aa_muts.json \
              results/clade.json \
  --colors data/colors.tsv \
  --lat-longs data/lat_longs.tsv \
  --auspice-config data/auspice_config.json \
  --output auspice/influenza_MP.json


nextclade run \
    --input-dataset data \
    --in-order \
    --output-all output \
    data/sequences.fasta \


