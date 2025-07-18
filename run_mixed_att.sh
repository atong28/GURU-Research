cd /Users/atong/Documents/UCSD/Projects/GURU/GURU-Research
experiment=e-spectre-mixedatt
input_types="{hsqc,c_nmr,h_nmr,mw}"
requires="hsqc"
for seed in 1; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_split_exp.yml
    sed -i '' "45s/.*/              torchrun --nproc_per_node=6 mixed_attention_main.py --input_types ${input_types} --requires ${requires} --seed ${seed} --experiment_name ${experiment_name} /" jobs/atong_split_exp.yml
    kubectl create -f jobs/atong_split_exp.yml
done

experiment=e-spectre-ms-mixedatt
input_types="{hsqc,c_nmr,h_nmr,mw,mass_spec}"
requires="hsqc"
for seed in 1; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_split_exp.yml
    sed -i '' "45s/.*/              torchrun --nproc_per_node=6 mixed_attention_main.py --input_types ${input_types} --requires ${requires} --seed ${seed} --experiment_name ${experiment_name} /" jobs/atong_split_exp.yml
    kubectl create -f jobs/atong_split_exp.yml
done

experiment=e-all-inputs-mixedatt
input_types="{hsqc,c_nmr,h_nmr,mw,mass_spec,iso_dist}"
requires="hsqc"
for seed in 1; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_split_exp.yml
    sed -i '' "45s/.*/              torchrun --nproc_per_node=6 mixed_attention_main.py --input_types ${input_types} --requires ${requires} --seed ${seed} --experiment_name ${experiment_name} /" jobs/atong_split_exp.yml
    kubectl create -f jobs/atong_split_exp.yml
done
