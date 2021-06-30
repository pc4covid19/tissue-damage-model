#!/bin/sh
#SBATCH --partition=debug --qos=debug
#SBATCH --time=01:30:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --constraint=CPU-Gold-6130
#SBATCH --job-name="PhysiCell_run"
#SBATCH --mail-user=maislam4@buffalo.edu
#SBATCH --mail-type=ALL


export OMP_NUM_THREADS=8

echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
echo "SLURMTMPDIR="$SLURMTMPDIR
echo "SLURMSUBMITPDIR="$SLURM_SUBMIT_DIR 

make
make data-cleanup

./COVID19

echo "DONE."
