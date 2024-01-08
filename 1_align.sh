Fpath="/home/wanghy/Huh7_chip/NCL"

#cd ${Fpath}/Cleandata && mkdir fastQC
cat ${Fpath}/bash/Filenames.txt | while read i

do
       cd ${Fpath}/${i}/clean
       bwa mem -t 30 /home/baix/SARS-CoV-2/Reference/T2T_V1.1-CoV/bwa.index/T2T-CoV2.fa ${i}_1_val_1.fq.gz ${i}_2_val_2.fq.gz > ${Fpath}/${i}/align/${i}.sam
       cd ${Fpath}/${i}/align
       samtools sort -@ 15 -m 1G ${i}.sam -o ${i}.sortP.bam
       samtools index ${i}.sortP.bam
done

