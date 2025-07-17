for seed in 1 2; do

    for out_dim in 32768 65536; do
        #9
        sed -i "4s/.*/  name: wangdong-$seed-entropy-select-out-dim-${out_dim}/" jobs/morgan_fp_job.yml
        sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --train_on_all_info_set true --foldername entropy_radius_exps_all_info --random_seed $seed --expname select_dim_${out_dim}_all_info_trial_$seed --out_dim $out_dim --FP_choice DB_specific_FP_R_10 --scheduler attention  --wavelength_bounds 0.01 400.0 --wavelength_bounds 0.01 20.0   /" jobs/morgan_fp_job.yml
        kubectl $mode  -f  jobs/morgan_fp_job.yml
    done
done