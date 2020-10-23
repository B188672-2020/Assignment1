#!/bin/bash
#The shell script:
#	to generate output statistic file with genes counts
#Process:
#	1. Import genome data, sample data, Tbbgenes data to local directory and Sort by data type e.g. life cycle 
#	2. Align pair-end reading and genome data and generate bam file with Bowtie2
#	3. Convert bam files to bed for alignment
#	4. Compair genes bed file and aligned sample with bedtools 
#	5. Generate output statistic text file

#1. Import data
mkdir Tbb_data
cp /localdisk/data/BPSM/Assignment1/fastq/fqfiles Tbb_data
cp /localdisk/data/BPSM/Assignment1/Tbb_genome/

