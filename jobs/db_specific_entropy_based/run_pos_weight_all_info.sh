mode=$mode




sed -i '4s/.*/  name: wangdong-db-specific-allinfo-r2-pos-weight-32/' jobs/morgan_fp_job.yml
sed -i '41s/.*/              python train_ranker_transformer.py transformer_2d1d --train_on_all_info_set true --foldername db_specific_fp_exps_all_info --random_seed 101 --expname R2_all_info_pos_weight_32  --FP_choice DB_specific_FP_R_10 --scheduler attention  --wavelength_bounds 0.01 400.0 --wavelength_bounds 0.01 20.0  --pos_weight 32 /' jobs/morgan_fp_job.yml
kubectl $mode  -f  jobs/morgan_fp_job.yml

sed -i '4s/.*/  name: wangdong-db-specific-allinfo-r2-pos-weight-16/' jobs/morgan_fp_job.yml
sed -i '41s/.*/              python train_ranker_transformer.py transformer_2d1d --train_on_all_info_set true --foldername db_specific_fp_exps_all_info --random_seed 101 --expname R2_all_info_pos_weight_16  --FP_choice DB_specific_FP_R_10 --scheduler attention  --wavelength_bounds 0.01 400.0 --wavelength_bounds 0.01 20.0  --pos_weight 16 /' jobs/morgan_fp_job.yml
kubectl $mode  -f  jobs/morgan_fp_job.yml

sed -i '4s/.*/  name: wangdong-db-specific-allinfo-r2-pos-weight-8/' jobs/morgan_fp_job.yml
sed -i '41s/.*/              python train_ranker_transformer.py transformer_2d1d --train_on_all_info_set true --foldername db_specific_fp_exps_all_info --random_seed 101 --expname R2_all_info_pos_weight_8  --FP_choice DB_specific_FP_R_10 --scheduler attention  --wavelength_bounds 0.01 400.0 --wavelength_bounds 0.01 20.0  --pos_weight 8 /' jobs/morgan_fp_job.yml
kubectl $mode  -f  jobs/morgan_fp_job.yml