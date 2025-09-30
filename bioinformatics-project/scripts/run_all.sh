#!/bin/bash
# 一键运行 RNA-seq 分析流程

set -e  # 出错就停止运行

# Step 1: 质控
echo "=== Step 1: FastQC & MultiQC 质控 ==="
bash scripts/01_qc.sh

# Step 2: 比对
echo "=== Step 2: HISAT2 比对 ==="
bash scripts/02_align.sh

# Step 3: 表达定量 (featureCounts)
echo "=== Step 3: featureCounts 表达定量 ==="
mkdir -p data/counts
featureCounts -a reference/annotation.gtf \
              -o data/counts/count_matrix.txt \
              results/align/*.bam

# Step 4: 差异表达分析 (DESeq2)
echo "=== Step 4: DESeq2 差异分析 ==="
Rscript scripts/04_deseq2.R

echo "=== 🎉 流程结束，结果已保存到 results/ ==="
