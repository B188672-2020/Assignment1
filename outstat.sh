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
#convert all data using for loop
for i in 216 218 219 220 221 222
do
	#converting sam to bam and give message telling processing
	samtools view -bS $i.sam > $i.bam
	echo -e "Generated $i.bam"
	#sort bam file
	samtools sort $i.sam -o $i.sort.bam
	echo -e "Generated $i.sort.bam"
	#convert bam to bed for better comparsion of genes data and sample data
	bedtools bamtobed -i $i.sort.bam > $i.bed
	echo -e "Generated $i.bed"
	#Compair the data using bedtools
	bedtools intersect -a Tbbgenes.bed -b $i.bed -c > output$i.txt   
	echo -e "Generated output$i.txt"
	#Giving a preview of output and line number
	echo -e "Preview output$i.txt"
	head output$i.txt
	lines=$(grep -n '' output$i.txt | wc -l)
	echo -e "line number of the output: $lines"
	#Unset Variable for next loop
	unset lines
done
echo -e "Finished..."
#Return the line number for loop purpose
lines=$(grep -n '' output216.txt | wc -l)
echo -e "line number of output: $lines"
#Remove outstattxt file in case this shell script ran before
rm -f outstat.txt
touch outstat.txt
#For loop to read the gene name and data
for (( i=1; i<=$lines; i++))
do
	read gn v216 <<< $(sed "${i}q;d" output216.txt | cut -f4,7)
	read v218 <<< $(sed "${i}q;d" output218.txt | cut -f7)
        read v219 <<< $(sed "${i}q;d" output219.txt | cut -f7)
        read v220 <<< $(sed "${i}q;d" output220.txt | cut -f7)
        read v221 <<< $(sed "${i}q;d" output221.txt | cut -f7)
        read v222 <<< $(sed "${i}q;d" output222.txt | cut -f7)
#slv and stv variables for calculating the mean
	slv=$((($v216 + $v218 + $v219)/ 3))
	stv=$((($v220 + $v221 + $v222)/ 3))
#Append the result to the outstat file
	echo -e "$gn	$slv	$stv" >> outstat.txt
#Unset all the variables for next loop
	unset gn v216 v218 v219 v220 v221 v222 slv stv
done

#Unset variable
unset lines

