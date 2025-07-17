mode="create"
cd /Users/atong/Documents/UCSD/Projects/GURU/Guru-research_configs
#experiment_name=b-spectre-reproduce
#input_types="{hsqc,c_nmr,h_nmr,mw}"
#requires="hsqc"
#for seed in 1 2 3; do
#    sed -i '' "4s/.*/  name: atong-${seed}-${experiment_name} /" jobs/atong_mfp_job.yml
#    sed -i '' "45s/.*/              torchrun --nproc_per_node=6 main.py --input_types ${input_types} --requires ${requires} --seed ${seed} --experiment_name ${experiment_name} /" jobs/atong_mfp_job.yml
#    kubectl $mode -f jobs/atong_mfp_job.yml
#done

#experiment_name=b-ms-only
#input_types="{mass_spec,mw}"
#requires="mass_spec"
#for seed in 1 2 3; do
#    sed -i '' "4s/.*/  name: atong-${seed}-${experiment_name} /" jobs/atong_mfp_job.yml
#    sed -i '' "45s/.*/              torchrun --nproc_per_node=6 main.py --input_types ${input_types} --requires ${requires} --seed ${seed} --experiment_name ${experiment_name} /" jobs/atong_mfp_job.yml
#    kubectl $mode -f jobs/atong_mfp_job.yml
#done

#experiment_name=b-all-optional
#input_types="{hsqc,c_nmr,h_nmr,mw,mass_spec,iso_dist}"
#requires="hsqc"
#for seed in 1 2 3; do
#    sed -i '' "4s/.*/  name: atong-${seed}-${experiment_name} /" jobs/atong_mfp_job.yml
#    sed -i '' "45s/.*/              torchrun --nproc_per_node=6 main.py --input_types ${input_types} --requires ${requires} --seed ${seed} --experiment_name ${experiment_name} /" jobs/atong_mfp_job.yml
#    kubectl $mode -f jobs/atong_mfp_job.yml
#done

experiment_name=b-all-except-id
input_types="{hsqc,c_nmr,h_nmr,mw,mass_spec}"
requires="hsqc"
for seed in 3; do
    sed -i '' "4s/.*/  name: atong-${seed}-${experiment_name} /" jobs/atong_mfp_job.yml
    sed -i '' "45s/.*/              torchrun --nproc_per_node=6 main.py --input_types ${input_types} --requires ${requires} --seed ${seed} --experiment_name ${experiment_name} /" jobs/atong_mfp_job.yml
    kubectl $mode -f jobs/atong_mfp_job.yml
done