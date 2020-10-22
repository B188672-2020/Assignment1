#!/bin/bash
#The shell script
#	Generate one-time non-interactive fastqc report in a new directory
#	The generation of qc report is not taking much time.
#	Easier coding and better file management with one-time report
#Programmes:
#	1. generate fastqc report
#	2. show data
#	3. reset report and variables for next execution

echo -e "Generating One time Fastqc Report..."

#Guide user to type in file name by showing the file list in fastq
echo -e "Showing the list of files"
echo -e "Files:"
ls -al /localdisk/data/BPSM/Assignment1/fastq
 
#Input the file name
read -p "Please input the target fq.gz filename: " f1
echo -e "file name:$f1"

#Generate output directory
mkdir qcoutput
 
#Generate Fastqc Report in output directory
fastqc /localdisk/data/BPSM/Assignment1/fastq/$f1 -outdir=qcoutput --extract

#Show the report data
read -p "Start reading (y/n): " yn

#Show report data or end the program with resetting directory and variables
if [ $yn = "Y" -o $yn = "y" ]
then
	echo -e "OK, Start"
#Guide for using more command while reading the report
	echo -e "Input enter to continue the reading"
	echo -e "Input Q to quit reading the report"
	more qcoutput/*fastqc/fastqc_data.txt
	echo -e "Resetting..."
	unset f1
	unset yn
	rm -rf qcoutput
elif [ $yn = "N" -o $yn = "n" ]
then
	echo -e "OK, Reset and Closing..."
	unset f1
	unset yn
	rm -rf qcoutput
else
	echo -e "Please start again" 
	unset f1
	unset yn 
	rm -rf qcoutput
fi
