#!/bin/bash -l

#SBATCH -A m225
#SBATCH --output=%J.out
#SBATCH --error=%J.error
#SBATCH -N 1
#SBATCH -C cpu
#SBATCH -q regular
#SBATCH -J basic
#SBATCH -t 00:10:00

ssh -Nf -L 9999:localhost:27017 angush@129.10.50.208

export PATH="$PATH:/global/homes/a/angush/openmx/source"
module load PrgEnv-intel
module load intel-classic/2023.2.0
module load cray-fftw
module load conda 

conda activate /global/cfs/cdirs/m225/angush/atomate/atomate_env

$${pre_rocket}
cd $${launch_dir}
$${rocket_launch}
$${post_rocket}

# CommonAdapter (SLURM) completed writing Template
