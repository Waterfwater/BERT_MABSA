#!/usr/bin/env bash
for i in 'depression' #'twitter2017' 'twitter2015' # 'twitter' 'twitter2015' --bertlayer
do
    echo ${i}
    PYTHONIOENCODING=utf-8 CUDA_VISIBLE_DEVICES=1 python run_classifier.py --data_dir ../../input/twitter15-and-17/depression/${i} \
    --task_name ${i} --output_dir ./output/${i}_noBL_output/ --bert_model bert-base-uncased --do_train --do_eval \
    --train_batch_size 32
done
