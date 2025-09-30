#!/bin/bash
# FastQC + MultiQC 质控脚本示例

# 创建输出文件夹
mkdir -p ../data/qc

# 对原始数据进行质控
fastqc ../data/raw/*.fastq.gz -o ../data/qc

# 汇总报告
multiqc ../data/qc -o ../data/qc
