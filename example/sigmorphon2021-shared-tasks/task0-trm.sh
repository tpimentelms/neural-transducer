#!/bin/bash
lang=$1
arch=tagtransformer

res=high
lr=0.001
scheduler=warmupinvsqr
max_steps=20000
warmup=4000
beta2=0.98       # 0.999
label_smooth=0.1 # 0.0
total_eval=50
bs=400 # 256

# transformer
layers=4
hs=1024
embed_dim=256
nb_heads=4
dropout=.4

data_dir=part1/processed/
ckpt_dir=checkpoints/transformer

python baselines/neural/src/train.py \
    --dataset sigmorphon17task1 \
    --train $data_dir/$lang.train \
    --dev $data_dir/$lang.dev \
    --model $ckpt_dir/$arch/default/$lang \
    --embed_dim $embed_dim --src_hs $hs --trg_hs $hs --dropout $dropout --nb_heads $nb_heads \
    --label_smooth $label_smooth --total_eval $total_eval \
    --src_layer $layers --trg_layer $layers --max_norm 1 --lr $lr --shuffle \
    --arch $arch --gpuid 0 --estop 1e-8 --bs $bs --max_steps $max_steps \
    --scheduler $scheduler --warmup_steps $warmup --cleanup_anyway --beta2 $beta2 --bestacc
