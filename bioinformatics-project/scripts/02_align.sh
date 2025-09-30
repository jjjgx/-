#!/bin/bash
# 比对脚本示例 (HISAT2)

# 创建输出文件夹
mkdir -p ../results/align

# 比对示例，替换 sample_1/2.fastq.gz 为你的数据
hisat2 -x ../reference/genome \
  -1 ../data/trimmed/sample_1.fq.gz \
  -2 ../data/trimmed/sample_2.fq.gz \
  -S ../results/align/sample.sam

# SAM 转 BAM
samtools view -bS ../results/align/sample.sam > ../results/align/sample.bam
