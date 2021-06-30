#!/bin/sh
#SBATCH --partition=general-compute --qos=general-compute
#SBATCH --time=04:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=24
#SBATCH --constraint=MRI|NIH
#SBATCH --job-name="PhysiCell_run"
#SBATCH --mail-user=maislam4@buffalo.edu
#SBATCH --mail-type=ALL


export OMP_NUM_THREADS=24

echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
echo "SLURMTMPDIR="$SLURMTMPDIR
echo "SLURMSUBMITPDIR="$SLURM_SUBMIT_DIR

make data-cleanup
make

./COVID19

echo "DONE."
