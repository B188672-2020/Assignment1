#!/bin/bash
#The shell script:
#	to generate output statistic file with genes counts
#Process:
#	1. Import genome data, sample data, Tbbgenes data to local directory
#	2. Align pair-end reading and genome data and generate BAM file with Bowtie2 and Generate SAM files.

#1. Import data
mkdir Tbb_data
cp /localdisk/data/BPSM/Assignment1/fastq/fqfiles Tbb_data
cp /localdisk/data/BPSM/Assignment1/Tbb_genome/Tb927_genome.fasta.gz Tbb_data
cp /localdisk/data/BPSM/Assignment1/Tbbgenes.bed Tbb_data
cd Tbb_data
echo -e "Copy completed. File list:"
ls -al

#2. Alignment
#Unzip to build bowtie genome index for alignment
gunzip Tb927_genome.fasta.gz
bowtie2-build Tb927_genome.fasta Tb927_genome
echo -e "Index built"

#Generate SAM files
echo -e "Alignment would take 10 - 15 minutes."
read -p "Start alignment (y/n):" yn

# Start alignment or end the process
# Terminate script when input is no
if [ $yn = "N" -o $yn = "n" ]
then
        echo -e "OK, Terminating gensam.sh"
	unset yn
	echo -e "End"
# Start Alignment when the intput is YES
elif [ $yn = "Y" -o $yn = "y" ]
then
        echo -e "OK, Start generateing 216.sam..."
        unset yn
#Generate sam files with bowtie2
	bowtie2 -x Tb927_genome -1 /localdisk/data/BPSM/Assignment1/fastq/216_L8_1.fq.gz -2 /localdisk/data/BPSM/Assignment1/fastq/216_L8_2.fq.gz -S 216.sam
	echo -e "216.sam is generated"
	echo -e "Generating 218.sam"

	bowtie2 -x Tb927_genome -1 /localdisk/data/BPSM/Assignment1/fastq/218_L8_1.fq.gz -2 /localdisk/data/BPSM/Assignment1/fastq/218_L8_2.fq.gz -S 218.sam
	echo -e "218.sam is generated"
	echo -e "Generating 219.sam"

	bowtie2 -x Tb927_genome -1 /localdisk/data/BPSM/Assignment1/fastq/219_L8_1.fq.gz -2 /localdisk/data/BPSM/Assignment1/fastq/219_L8_2.fq.gz -S 219.sam
	echo -e "219.sam is generated"
	echo -e "Generating 220.sam"

	bowtie2 -x Tb927_genome -1 /localdisk/data/BPSM/Assignment1/fastq/220_L8_1.fq.gz -2 /localdisk/data/BPSM/Assignment1/fastq/220_L8_2.fq.gz -S 220.sam
	echo -e "220.sam is generated"
	echo -e "Generating 221.sam"

	bowtie2 -x Tb927_genome -1 /localdisk/data/BPSM/Assignment1/fastq/221_L8_1.fq.gz -2 /localdisk/data/BPSM/Assignment1/fastq/221_L8_2.fq.gz -S 221.sam
	echo -e "221.sam is generated"
	echo -e "Generating 222.sam"

	bowtie2 -x Tb927_genome -1 /localdisk/data/BPSM/Assignment1/fastq/222_L8_1.fq.gz -2 /localdisk/data/BPSM/Assignment1/fastq/222_L8_2.fq.gz -S 222.sam
	echo -e "222.sam is generated"
	echo -e "Finished."
#Terminate when input is other than yes and no
else
        echo -e "Please start again"
        unset yn
fi

#Termination: echo message and unset variables
