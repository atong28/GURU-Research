# everything here is out_dim 16384 and radius 10

for seed in 1 2 3; do



    # only HSQC 
    sed -i "4s/.*/  name: wangdong-all-data-only-hsqc-trail${seed}-hyun-fp/" jobs/morgan_fp_job.yml
    sed -i "41s/.*/              python train_ranker_transformer.py transformer_2d1d --foldername train_on_all_data_possible --random_seed ${seed} --expname only_hsqc_trial_${seed} --use_oneD_NMR_no_solvent false  --scheduler attention  --wavelength_bounds 0.01 400.0 --wavelength_bounds 0.01 20.0 --FP_choice DB_specific_FP_R_10  --out_dim 16384   /" jobs/morgan_fp_job.yml
    kubectl $mode  -f  jobs/morgan_fp_job.yml



done