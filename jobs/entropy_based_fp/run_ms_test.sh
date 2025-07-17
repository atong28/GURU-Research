# everything here is out_dim 16384 and radius 10
mode="create"
cd /Users/atong/Documents/UCSD/Projects/GURU/Guru-research_configs
for seed in 1 2 3; do
    sed -i '' "4s/.*/  name: atong-${seed}-mass-spec-entropy-optional  /" jobs/atong_mfp_job.yml
    sed -i '' "45s/.*/              python train_ranker_transformer.py transformer_2d1d --foldername mass_spec_optional --expname ms_r0_r6_seed${seed} --optional_inputs true --combine_oneD_only_dataset true --random_seed ${seed} --FP_choice Hash_Entropy_FP_R_6  --out_dim 16384 --jittering 1 --optional_MW true --optional_MS true  /" jobs/atong_mfp_job.yml
    kubectl $mode -f jobs/atong_mfp_job.yml
done

for seed in 1 2 3; do
    sed -i '' "4s/.*/  name: atong-${seed}-non-mass-spec-entropy-optional   /" jobs/atong_mfp_job.yml
    sed -i '' "45s/.*/              python train_ranker_transformer.py transformer_2d1d --foldername non_mass_spec_optional --expname nonms_r0_r6_seed${seed} --optional_inputs true --combine_oneD_only_dataset true --random_seed ${seed} --FP_choice Hash_Entropy_FP_R_6  --out_dim 16384 --jittering 1 --use_MS false --optional_MW true /" jobs/atong_mfp_job.yml
    kubectl $mode -f jobs/atong_mfp_job.yml
done

for seed in 1 2 3; do
    sed -i '' "4s/.*/  name: atong-${seed}-mass-spec-entropy-nonoptional   /" jobs/atong_mfp_job.yml
    sed -i '' "45s/.*/              python train_ranker_transformer.py transformer_2d1d --foldername mass_spec_non_optional --expname msnon_r0_r6_seed${seed} --optional_inputs false --combine_oneD_only_dataset true --random_seed ${seed} --FP_choice Hash_Entropy_FP_R_6  --out_dim 16384 --jittering 1 --bs 24 /" jobs/atong_mfp_job.yml
    kubectl $mode -f jobs/atong_mfp_job.yml
done

for seed in 1 2 3; do
    sed -i '' "4s/.*/  name: atong-${seed}-non-mass-spec-entropy-nonoptional   /" jobs/atong_mfp_job.yml
    sed -i '' "45s/.*/              python train_ranker_transformer.py transformer_2d1d --foldername non_mass_spec_non_optional --expname nonmsnon_r0_r6_seed${seed} --optional_inputs false --combine_oneD_only_dataset true --random_seed ${seed} --FP_choice Hash_Entropy_FP_R_6  --out_dim 16384 --jittering 1 --use_MS false --bs 24 /" jobs/atong_mfp_job.yml
    kubectl $mode -f jobs/atong_mfp_job.yml
done