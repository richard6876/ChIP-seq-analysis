Fpath="/home/wanghy/Huh7_chip/NCL"

#cd ${Fpath}/Cleandata && mkdir fastQC
cat ${Fpath}/bash/Filenames.txt | while read i

do
       cd ${Fpath}/${i}/align
       /home/wanghy/sambamba markdup  --overflow-list-size 600000 -r ${i}.sortP.bam  -t 16 ${i}.rmdup.bam
       samtools view  -h  -f 2 -q 30 ${i}.rmdup.bam |grep -v chrM |samtools sort  -O bam  -@ 15 -o - >${i}.last.bam
       samtools index ${i}.last.bam
       samtools flagstat ${i}.last.bam > bam_last.stat
         
       
done