for seed in 1 2 3 ; do

    for r in 2 3 4 5 6 7 8 9 10; do
    # for r in 1 2 3 4 5 6 7 8 9 ; do
        for out_dim in 2048 4096 8192 16384 32768 ; do
        # for out_dim in 65536 131072; do
            #9
            sed -i "4s/.*/  name: wangdong-$seed-unique-fp-${out_dim}-radius-$r/" jobs/morgan_fp_job.yml
            sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --train_on_all_info_set true --foldername grid_search --random_seed $seed --expname select_dim_${out_dim}_all_info_trial_${seed}_radius_$r --out_dim $out_dim --FP_choice DB_specific_FP_R_$r --rank_by_test_set 1 /" jobs/morgan_fp_job.yml
            kubectl $mode  -f  jobs/morgan_fp_job.yml
        done
    done
done
            # --scheduler attention  --wavelength_bounds 0.01 400.0 --wavelength_bounds 0.01 20.0  --dim_model 784 --dim_coords 365 365 54 --layer 16 --ff_dim 1536 --warm_up_steps 8000 