Fpath="/home/wanghy/Huh7_chip/NCL"

#cd ${Fpath}/Cleandata && mkdir fastQC
cat ${Fpath}/bash/Filenames.txt | while read i

do
        cd ${Fpath}/${i}/raw/${i}
        trim_galore -q 25 --phred33 --length 35 -e 0.1 --stringency 4 --paired -o ${Fpath}/${i}/clean ${i}_1.fastq.gz ${i}_2.fastq.gz
        cd ${Fpath}/${i}/clean
        fastqc -o ${Fpath}/${i}/qc/ ${i}_1_val_1.fq.gz ${i}_2_val_2.fq.gz
done
