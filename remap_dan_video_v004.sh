#!/bin/bash
module purge
module load anaconda3/2024.2
conda activate sleap11

python - <<'EOF'
import sleap_io as sio
labels = sio.load_slp('/scratch/gpfs/SHAEVITZ/kr3541/crab/danlabels.v004.slp')
labels.videos[0].replace_filename('/scratch/gpfs/SHAEVITZ/kr3541/crab/clip_cam2_8k.mp4')
labels.save('/scratch/gpfs/SHAEVITZ/kr3541/crab/danlabels.v004.slp')
print("Done - video remapped to clip_cam2_8k.mp4")
EOF
