mode="create"
cd /Users/atong/Documents/UCSD/Projects/GURU/Guru-research_configs
experiment=d-lr-1e-5-spectre
input_types="{hsqc,c_nmr,h_nmr,mw}"
requires="hsqc"
for seed in 1 2 3; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_split_exp.yml
    sed -i '' "45s/.*/              torchrun --nproc_per_node=6 self_attention_main.py --input_types ${input_types} --requires ${requires} --seed ${seed} --experiment_name ${experiment_name} --jittering 1.0 --lr 1e-5 /" jobs/atong_split_exp.yml
    kubectl $mode -f jobs/atong_split_exp.yml
done

experiment=d-lr-2e-5-spectre
input_types="{hsqc,c_nmr,h_nmr,mw}"
requires="hsqc"
for seed in 1 2 3; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_split_exp.yml
    sed -i '' "45s/.*/              torchrun --nproc_per_node=6 self_attention_main.py --input_types ${input_types} --requires ${requires} --seed ${seed} --experiment_name ${experiment_name} --jittering 1.0 --lr 2e-5 /" jobs/atong_split_exp.yml
    kubectl $mode -f jobs/atong_split_exp.yml
done

experiment=d-lr-5e-5-spectre
input_types="{hsqc,c_nmr,h_nmr,mw}"
requires="hsqc"
for seed in 1 2 3; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_split_exp.yml
    sed -i '' "45s/.*/              torchrun --nproc_per_node=6 self_attention_main.py --input_types ${input_types} --requires ${requires} --seed ${seed} --experiment_name ${experiment_name} --jittering 1.0 --lr 5e-5 /" jobs/atong_split_exp.yml
    kubectl $mode -f jobs/atong_split_exp.yml
done

experiment=d-lr-1e-5-spectre-ms
input_types="{hsqc,c_nmr,h_nmr,mw,mass_spec}"
requires="hsqc"
for seed in 1 2 3; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_split_exp.yml
    sed -i '' "45s/.*/              torchrun --nproc_per_node=6 self_attention_main.py --input_types ${input_types} --requires ${requires} --seed ${seed} --experiment_name ${experiment_name} --jittering 1.0 --lr 5e-5 /" jobs/atong_split_exp.yml
    kubectl $mode -f jobs/atong_split_exp.yml
done

experiment=d-lr-1e-5-all-inputs
input_types="{hsqc,c_nmr,h_nmr,mw,mass_spec,iso_dist}"
requires="hsqc"
for seed in 1 2 3; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_split_exp.yml
    sed -i '' "45s/.*/              torchrun --nproc_per_node=6 self_attention_main.py --input_types ${input_types} --requires ${requires} --seed ${seed} --experiment_name ${experiment_name} --jittering 1.0 --lr 5e-5 /" jobs/atong_split_exp.yml
    kubectl $mode -f jobs/atong_split_exp.yml
done