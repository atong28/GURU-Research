# everything here is out_dim 16384 * 2

out_dim=16384
r=6
FP_version="Hash_Entropy"

for seed in 1 2 3; do

    # all three
    sed -i "4s/.*/  name: wangdong-all-data-only-all-3-trail${seed}-i/" jobs/morgan_fp_job.yml
    sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --train_on_all_info_set true --foldername train_on_all_data_possible --random_seed $seed --expname all_info_trial_${seed} --out_dim $out_dim --FP_choice ${FP_version}_FP_R_${r}  /" jobs/morgan_fp_job.yml
    kubectl $mode  -f  jobs/morgan_fp_job.yml

    # only C
    sed -i "4s/.*/  name: wangdong-all-data-only-c-trail${seed}-i/" jobs/morgan_fp_job.yml
    sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --foldername train_on_all_data_possible --random_seed ${seed} --only_C_NMR true --only_oneD_NMR true --combine_oneD_only_dataset true --expname only_c_trial_${seed}   --FP_choice ${FP_version}_FP_R_${r}  --out_dim $out_dim   /" jobs/morgan_fp_job.yml
    kubectl $mode  -f  jobs/morgan_fp_job.yml
    
    # only H
    sed -i "4s/.*/  name: wangdong-all-data-only-h-trail${seed}-i/" jobs/morgan_fp_job.yml
    sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --foldername train_on_all_data_possible --random_seed ${seed} --only_H_NMR true --only_oneD_NMR true --combine_oneD_only_dataset true --expname only_h_trial_${seed}    --FP_choice ${FP_version}_FP_R_${r}  --out_dim $out_dim   /" jobs/morgan_fp_job.yml
    kubectl $mode  -f  jobs/morgan_fp_job.yml

    # only H + C
    sed -i "4s/.*/  name: wangdong-all-data-only-1d-trail${seed}-i/" jobs/morgan_fp_job.yml
    sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --foldername train_on_all_data_possible --random_seed ${seed} --only_oneD_NMR true --combine_oneD_only_dataset true --expname only_1d_trial_${seed}    --FP_choice ${FP_version}_FP_R_${r}  --out_dim $out_dim   /" jobs/morgan_fp_job.yml
    kubectl $mode  -f  jobs/morgan_fp_job.yml

    # only HSQC 
    sed -i "4s/.*/  name: wangdong-all-data-only-hsqc-trail${seed}-i/" jobs/morgan_fp_job.yml
    sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --foldername train_on_all_data_possible --random_seed ${seed} --expname only_hsqc_trial_${seed} --use_oneD_NMR_no_solvent false  --FP_choice ${FP_version}_FP_R_${r}  --out_dim $out_dim   /" jobs/morgan_fp_job.yml
    kubectl $mode  -f  jobs/morgan_fp_job.yml


    # only HSQC + C
    sed -i "4s/.*/  name: wangdong-hsqc-and-c-trail${seed}-i/" jobs/morgan_fp_job.yml
    sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d  --foldername train_on_all_data_possible --random_seed ${seed} --expname HSQC_and_C_trial_${seed} --only_C_NMR true  --FP_choice ${FP_version}_FP_R_${r}  --out_dim $out_dim   /" jobs/morgan_fp_job.yml
    kubectl $mode  -f  jobs/morgan_fp_job.yml



    # only HSQC + H
    sed -i "4s/.*/  name: wangdong-hsqc-and-h-trail${seed}-i/" jobs/morgan_fp_job.yml
    sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d  --foldername train_on_all_data_possible --random_seed ${seed} --expname HSQC_and_H_trial_${seed} --only_H_NMR true   --FP_choice ${FP_version}_FP_R_${r}  --out_dim $out_dim   /" jobs/morgan_fp_job.yml
    kubectl $mode  -f  jobs/morgan_fp_job.yml


done


# train_ranker_transformer.py transformer_2d1d --train_on_all_info_set true --foldername train_on_all_data_possible  --expname all_info_trial_ --out_dim 16384 --FP_choice Hash_Entropy_FP_R_6 