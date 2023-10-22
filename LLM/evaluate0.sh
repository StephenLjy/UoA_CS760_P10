#!/bin/bash

CUDA_ID=$1
train_data_name=$2
test_data_name=$3
base_model='decapoda-research/llama-7b-hf'
# model_path='./alpaca-lora-7B'
model_path=$(ls -d ./$train_data_name/model_A0*)
for path in $model_path; do
    echo "$path"
    CUDA_VISIBLE_DEVICES=$CUDA_ID python evaluate.py \
        --base_model $base_model \
        --lora_weights "$path" \
        --train_data_name "$train_data_name" \
        --test_data_name "$test_data_name" \
        --result_data "./metrics.csv"
done
