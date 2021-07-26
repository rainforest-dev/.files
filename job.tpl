#!/bin/bash
#SBATCH --job-name="$NAME"
#SBATCH --partition=$PARTITION
#SBATCH --ntasks=2
#SBATCH --gres=gpu:$GPU
#SBATCH --time=3-0:0
#SBATCH --chdir=./
#SBATCH --output=./log/cout.$NAME.txt
#SBATCH --error=./log/cerr.$NAME.txt

echo
echo "============================ Messages from Goddess ============================"
echo " * Job starting from: "`date`
echo " * Job ID           : "$SLURM_JOBID
echo " * Job name         : "$SLURM_JOB_NAME
echo " * Job partition    : "$SLURM_JOB_PARTITION
echo " * Nodes            : "$SLURM_JOB_NUM_NODES
echo " * Cores            : "$SLURM_NTASKS
echo " * Working directory: "${SLURM_SUBMIT_DIR}
echo "==============================================================================="
echo

module load opt gcc cuda/11
/share/home/rainforest/research/.venv/bin/python main.tnt.regression.train.py \
  --accelerator dp --batch-size 128 --train-dataset-ratio 0.75

echo
echo "============================ Messages from Goddess ============================"
echo " * Jab ended at     : "`date`
echo "==============================================================================="
echo