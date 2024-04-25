#!/usr/bin/env bash
for i in 'twitter2017' 'twitter2015' # 'twitter'
do
    echo ${i}
    for k in 'TomBert' # 'TomBert' 'MBert' 'TomBertNoPooling' 'MBertNoPooling' 'ResBert'
    do
        echo ${k}
        for j in 'first' # 'first' 'cls' 'both'
        do
            echo ${j}
            PYTHONIOENCODING=utf-8 CUDA_VISIBLE_DEVICES=0 python run_multimodal_classifier.py --data_dir \
            ../../input/twitter15-and-17/twi_data/IJCAI2019_data/${i} --task_name ${i} --output_dir ./output/${i}_${k}_${j}_mm_output/ \
            --bert_model bert-base-uncased --do_eval --mm_model ${k} --pooling ${j}
        done
    done
done