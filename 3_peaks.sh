Fpath="/home/wanghy/Huh7_chip/NCL"

cat ${Fpath}/bash/Filenames.txt | while read i

do         
       macs2 callpeak -t ${Fpath}/${i}/align/${i}.last.bam -c /home/wanghy/Huh7_chip/input/align/bwa.T2T.input.last.bam -f BAM -g 3.055e9 -n H3K27ac -B -q 0.05

done
