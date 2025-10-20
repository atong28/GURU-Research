cd /Users/atong/Documents/UCSD/Projects/GURU/GURU-Research
experiment="spectre-v2-dropout-scheduler"
input_types="{hsqc,c_nmr,h_nmr,mw,mass_spec}"
for seed in 0 1 2; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_spectre_job.yml
    sed -i '' "43s/.*/              torchrun --nproc_per_node=4 stage1.py --input_types ${input_types} --seed ${seed} --experiment_name ${experiment_name} --modality_dropout_scheduler scheduled /" jobs/atong_spectre_job.yml
    kubectl create -f jobs/atong_spectre_job.yml
done

experiment="spectre-v2-dropout-constant"
input_types="{hsqc,c_nmr,h_nmr,mw,mass_spec}"
for seed in 0 1 2; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_spectre_job.yml
    sed -i '' "43s/.*/              torchrun --nproc_per_node=4 stage1.py --input_types ${input_types} --seed ${seed} --experiment_name ${experiment_name} --modality_dropout_scheduler constant  /" jobs/atong_spectre_job.yml
    kubectl create -f jobs/atong_spectre_job.yml
done