for seed in 1 ; do

        #9
        sed -i "4s/.*/  name: wangdong-$seed-entropy-all-out/" jobs/morgan_fp_job.yml
        sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --train_on_all_info_set true --foldername all_out_dim --random_seed $seed --expname all_info_trial_$seed --out_dim inf --FP_choice DB_specific_FP_R_10 --scheduler attention  --wavelength_bounds 0.01 400.0 --wavelength_bounds 0.01 20.0   /" jobs/morgan_fp_job.yml
        kubectl $mode  -f  jobs/morgan_fp_job.yml
done


# python train_ranker_transformer.py transformer_2d1d --train_on_all_info_set true --foldername debug  --expname all_info_trial --out_dim inf --FP_choice DB_specific_FP_R_10 --scheduler attention  --wavelength_bounds 0.01 400.0 --wavelength_bounds 0.01 20.0 