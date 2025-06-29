#!/bin/bash

# Blender render script for AGN simulation video

# This is the SLURM header.
# It is ignored by the bash interpreter,
# but parsed by sbatch.
# Complete list of options: https://slurm.schedmd.com/sbatch.html
# Note that on Elysium partition, time, and account must be provided.

#SBATCH --nodes=1                       # Request 1 Node
#SBATCH --partition=gpu     # Run in partition cpu
#SBATCH --gpus=1                  # number of GPUs to reserve
#SBATCH --cpus-per-gpu=4	# number of CPUs per each GPU
#SBATCH --job-name=agn_video_simulation     # name of the job in squeue
#SBATCH --time=02-00:00:00                 # estimated runtime (dd-hh:mm:ss)
#SBATCH --account=beckej58_0000         # Project ID (check with rub-acclist)
#SBATCH --mail-type=ALL
#SBATCH --mail-user=vladimir.kiselev@rub.de


export OUTPUT_DIR=/lustre/kiselvwq/render_video/

# Load the AGNPropa environment
source "${HOME}/anaconda3/etc/profile.d/conda.sh"

conda activate AGN_video_simulation

# Start preparing for the simulation

cd /home/kiselvwq/AGN_simulation_video

echo "[$date] Starting rendering"

python render.py \
    --output-dir $OUTPUT_DIR \
    --render-file AGN_simulation.blend

echo "[$date] Finished rendering"
