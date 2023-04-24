#!/usr/bin/env bash



## ERNIE 
cd  "pretrained_models"
mkdir "ernie"
wget https://ernie.bj.bcebos.com/ERNIE_Base_en_stable-2.0.0.tar.gz -O "ERNIE_Base_en_stable-2.0.0.tar.gz"
tar xvf ERNIE_Base_en_stable-2.0.0.tar.gz
rm "ERNIE_Base_en_stable-2.0.0.tar.gz"
mv "ERNIE_Base_en_stable-2.0.0/vocab.txt" "ernie/vocab.txt"
mv "ERNIE_Base_en_stable-2.0.0/ernie_config.json" "ernie/ernie_config.json"
rm -r "ERNIE_Base_en_stable-2.0.0/"

python convert_tf_to_pt-ernie.py \
    -- tf-path-model "ernie/params" \
    -- config-file "ernie/ernie_config.json" \
    -- model-type "ernie" \
    -- pytorch-file "ernie_model.pt" \


rm "ernie/ernie_config.json"


rm -r "ernie/"

