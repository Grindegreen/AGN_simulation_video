#!/bin/bash

# Blender render script for AGN simulation video

# This is the SLURM header.
# It is ignored by the bash interpreter,
# but parsed by sbatch.
# Complete list of options: https://slurm.schedmd.com/sbatch.html
# Note that on Elysium partition, time, and account must be provided.

#SBATCH --nodes=1                       # Request 1 Node
#SBATCH --partition=gpu     # Run in partition cpu
#SBATCH --job-name=agn_video_simulation     # name of the job in squeue
#SBATCH --time=02-00:00:00                 # estimated runtime (dd-hh:mm:ss)
#SBATCH --account=beckej58_0000         # Project ID (check with rub-acclist)
#SBATCH --ntasks=1               # Number of tasks per node
#SBATCH --gpus-per-task=24               # Number of CPU cores per task
#SBATCH --mail-type=ALL
#SBATCH --mail-user=vladimir.kiselev@rub.de


ITER=${SLURM_ARRAY_TASK_ID}

export OUTPUT_DIR=/lustre/kiselvwq/render_video/

# Load the AGNPropa environment
source "${HOME}/anaconda3/etc/profile.d/conda.sh"

conda activate AGN_video_simulation

# Start preparing for the simulation

cd /home/kiselvwq/AGN_video_simulation

echo "[$date] Starting rendering"

python render.py \
    --output-dir $OUTPUT_DIR \
    --render-file AGN_simulation.blend

echo "[$date] Finished rendering"
