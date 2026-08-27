#!/bin/bash
#SBATCH --job-name=v004_centroid
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=8G
#SBATCH --gres=gpu:1
#SBATCH --constraint=gpu40
#SBATCH --time=24:00:00
#SBATCH --output=/scratch/gpfs/SHAEVITZ/kr3541/crab/centroid_v004_logs/sleap_%j.out
#SBATCH --error=/scratch/gpfs/SHAEVITZ/kr3541/crab/centroid_v004_logs/sleap_%j.err
#SBATCH --mail-type=begin,end,fail
#SBATCH --mail-user=kr3541@princeton.edu

mkdir -p /scratch/gpfs/SHAEVITZ/kr3541/crab/centroid_v004_logs

module purge
module load anaconda3/2024.2
conda activate sleap11

export WANDB_MODE=offline

cd /scratch/gpfs/SHAEVITZ/kr3541/crab

sleap-nn train \
    --config /scratch/gpfs/SHAEVITZ/kr3541/crab/della_centroid_config_dan_v004.yaml \
    "data_config.train_labels_path=[/scratch/gpfs/SHAEVITZ/kr3541/crab/danlabels.v004.slp]" \
    "trainer_config.ckpt_dir=/scratch/gpfs/SHAEVITZ/kr3541/crab/models" \
    "trainer_config.run_name=dan_centroid_v004"
