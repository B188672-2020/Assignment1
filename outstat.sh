#!/bin/bash
#The shell script:
#	to generate output statistic file with genes counts
#Process:
#	1. Convert and Sort the SAM files to BAM files for processing
#	2. Convert BAM files to BED file format
#	4. Compair genes data bed file and aligned sample data with bedtools 
#	5. Generate output statistic text file

#1. Convert and Sort SAM files to BAM files
cd Tbb_data
for i in 216 218 219 220 221 222
do
#	samtools view -bS $i.sam > $i.bam
	echo -e "Generated $i.bam"
#	samtools sort $i.sam -o $i.sort.bam
	echo -e "Generated $i.sort.bam"
#	bedtools bamtobed -i $i.sort.bam > $i.bed
	echo -e "Generated $i.bed"
#	bedtools intersect -a Tbbgenes.bed -b $i.bed -c > output$i.txt   
	echo -e "Generated output$i.txt"
	echo -e "Preview output$i.txt"
	head output$i.txt
	lines=$(grep -n '' output$i.txt | wc -l)
	echo -e "line number of the output: $lines"
	unset lines
done
echo -e "Finished..."




