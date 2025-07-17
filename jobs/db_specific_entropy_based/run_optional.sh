out_dim=16384
r=6
FP_version="Hash_Entropy"

for seed in 1 ; do

    # sed -i "4s/.*/  name: wangdong-optional-model-${seed}-run/" jobs/morgan_fp_job.yml
    # sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --foldername flexible_models  --expname r0_r6_trial_${seed} --optional_inputs true --combine_oneD_only_dataset true --random_seed ${seed} --FP_choice ${FP_version}_FP_R_${r}  --out_dim $out_dim /" jobs/morgan_fp_job.yml
    # kubectl $mode  -f  jobs/morgan_fp_job.yml


    
    # sed -i "4s/.*/  name: wangdong-optional-model-${seed}-optional-mw/" jobs/morgan_fp_job.yml
    # sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --foldername flexible_models_flexible_MW  --expname r0_r6_trial_${seed} --optional_inputs true --combine_oneD_only_dataset true --random_seed ${seed} --FP_choice ${FP_version}_FP_R_${r}  --out_dim $out_dim --optional_MW true  /" jobs/morgan_fp_job.yml
    # kubectl $mode  -f  jobs/morgan_fp_job.yml

    # # jitter
    # sed -i "4s/.*/  name: wangdong-optional-model-${seed}-run-jitter-1/" jobs/morgan_fp_job.yml
    # sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --foldername flexible_models_jittering_size_1  --expname r0_r6_trial_${seed} --optional_inputs true --combine_oneD_only_dataset true --random_seed ${seed} --FP_choice ${FP_version}_FP_R_${r}  --out_dim $out_dim --jittering 1 /" jobs/morgan_fp_job.yml
    # kubectl $mode  -f  jobs/morgan_fp_job.yml

    sed -i "4s/.*/  name: wangdong-optional-model-${seed}-run-jitter-optional-mw/" jobs/morgan_fp_job.yml
    sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --foldername flexible_models_jittering_flexible_MW  --expname r0_r6_trial_${seed} --optional_inputs true --combine_oneD_only_dataset true --random_seed ${seed} --FP_choice ${FP_version}_FP_R_${r}  --out_dim $out_dim --optional_MW true  --jittering 1/" jobs/morgan_fp_job.yml
    kubectl $mode  -f  jobs/morgan_fp_job.yml

done


# python train_ranker_transformer.py transformer_2d1d --foldername debug  --expname xx --optional_inputs true --combine_oneD_only_dataset true --FP_choice Hash_Entropy_FP_R_6 --out_dim 16384 --jittering 1 --debug 1 --bs 32
