
# write a for loop of seed 101, 202, 303

for seed in 1 2 3; do


    #9
    sed -i "4s/.*/  name: wangdong-$seed-entropy-allinfo-2/" jobs/morgan_fp_job.yml
    sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --train_on_all_info_set true --foldername entropy_radius_exps_all_info --random_seed $seed --expname R0_to_R2_all_info_trial_$seed  --FP_choice DB_specific_FP_R_2 --scheduler attention  --wavelength_bounds 0.01 400.0 --wavelength_bounds 0.01 20.0   /" jobs/morgan_fp_job.yml
    kubectl $mode  -f  jobs/morgan_fp_job.yml

    #9
    sed -i "4s/.*/  name: wangdong-$seed-entropy-allinfo-3/" jobs/morgan_fp_job.yml
    sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --train_on_all_info_set true --foldername entropy_radius_exps_all_info --random_seed $seed --expname R0_to_R3_all_info_trial_$seed  --FP_choice DB_specific_FP_R_3 --scheduler attention  --wavelength_bounds 0.01 400.0 --wavelength_bounds 0.01 20.0   /" jobs/morgan_fp_job.yml
    kubectl $mode  -f  jobs/morgan_fp_job.yml

    #9
    sed -i "4s/.*/  name: wangdong-$seed-entropy-allinfo-4/" jobs/morgan_fp_job.yml
    sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --train_on_all_info_set true --foldername entropy_radius_exps_all_info --random_seed $seed --expname R0_to_R4_all_info_trial_$seed  --FP_choice DB_specific_FP_R_4 --scheduler attention  --wavelength_bounds 0.01 400.0 --wavelength_bounds 0.01 20.0   /" jobs/morgan_fp_job.yml
    kubectl $mode  -f  jobs/morgan_fp_job.yml

    #9
    sed -i "4s/.*/  name: wangdong-$seed-entropy-allinfo-5/" jobs/morgan_fp_job.yml
    sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --train_on_all_info_set true --foldername entropy_radius_exps_all_info --random_seed $seed --expname R0_to_R5_all_info_trial_$seed  --FP_choice DB_specific_FP_R_5 --scheduler attention  --wavelength_bounds 0.01 400.0 --wavelength_bounds 0.01 20.0   /" jobs/morgan_fp_job.yml
    kubectl $mode  -f  jobs/morgan_fp_job.yml

    #9
    sed -i "4s/.*/  name: wangdong-$seed-entropy-allinfo-6/" jobs/morgan_fp_job.yml
    sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --train_on_all_info_set true --foldername entropy_radius_exps_all_info --random_seed $seed --expname R0_to_R6_all_info_trial_$seed  --FP_choice DB_specific_FP_R_6 --scheduler attention  --wavelength_bounds 0.01 400.0 --wavelength_bounds 0.01 20.0   /" jobs/morgan_fp_job.yml
    kubectl $mode  -f  jobs/morgan_fp_job.yml

    #9
    sed -i "4s/.*/  name: wangdong-$seed-entropy-allinfo-7/" jobs/morgan_fp_job.yml
    sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --train_on_all_info_set true --foldername entropy_radius_exps_all_info --random_seed $seed --expname R0_to_R7_all_info_trial_$seed  --FP_choice DB_specific_FP_R_7 --scheduler attention  --wavelength_bounds 0.01 400.0 --wavelength_bounds 0.01 20.0   /" jobs/morgan_fp_job.yml
    kubectl $mode  -f  jobs/morgan_fp_job.yml

    #9
    sed -i "4s/.*/  name: wangdong-$seed-entropy-allinfo-8/" jobs/morgan_fp_job.yml
    sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --train_on_all_info_set true --foldername entropy_radius_exps_all_info --random_seed $seed --expname R0_to_R8_all_info_trial_$seed  --FP_choice DB_specific_FP_R_8 --scheduler attention  --wavelength_bounds 0.01 400.0 --wavelength_bounds 0.01 20.0   /" jobs/morgan_fp_job.yml
    kubectl $mode  -f  jobs/morgan_fp_job.yml

    #9
    sed -i "4s/.*/  name: wangdong-$seed-entropy-allinfo-9/" jobs/morgan_fp_job.yml
    sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --train_on_all_info_set true --foldername entropy_radius_exps_all_info --random_seed $seed --expname R0_to_R9_all_info_trial_$seed  --FP_choice DB_specific_FP_R_9 --scheduler attention  --wavelength_bounds 0.01 400.0 --wavelength_bounds 0.01 20.0   /" jobs/morgan_fp_job.yml
    kubectl $mode  -f  jobs/morgan_fp_job.yml

    #9
    sed -i "4s/.*/  name: wangdong-$seed-entropy-allinfo-10/" jobs/morgan_fp_job.yml
    sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --train_on_all_info_set true --foldername entropy_radius_exps_all_info --random_seed $seed --expname R0_to_R10_all_info_trial_$seed  --FP_choice DB_specific_FP_R_10 --scheduler attention  --wavelength_bounds 0.01 400.0 --wavelength_bounds 0.01 20.0   /" jobs/morgan_fp_job.yml
    kubectl $mode  -f  jobs/morgan_fp_job.yml


done