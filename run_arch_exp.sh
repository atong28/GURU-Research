cd /Users/atong/Documents/UCSD/Projects/GURU/GURU-Research
experiment="i-spectre-ms-arch-fc-512"
input_types="{hsqc,c_nmr,h_nmr,mw,mass_spec}"
for seed in 1 2 3; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_split_exp.yml
    sed -i '' "43s/.*/              torchrun --nproc_per_node=4 main.py --model_mode mixed_attention --input_types ${input_types} --seed ${seed} --experiment_name ${experiment_name} --cls_dim 512 /" jobs/atong_split_exp.yml
    kubectl create -f jobs/atong_split_exp.yml
done

experiment="i-spectre-ms-arch-fc-784"
input_types="{hsqc,c_nmr,h_nmr,mw,mass_spec}"
for seed in 1 2 3; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_split_exp.yml
    sed -i '' "43s/.*/              torchrun --nproc_per_node=4 main.py --model_mode mixed_attention --input_types ${input_types} --seed ${seed} --experiment_name ${experiment_name} /" jobs/atong_split_exp.yml
    kubectl create -f jobs/atong_split_exp.yml
done

experiment="i-spectre-ms-arch-fc-1024"
input_types="{hsqc,c_nmr,h_nmr,mw,mass_spec}"
for seed in 1 2 3; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_split_exp.yml
    sed -i '' "43s/.*/              torchrun --nproc_per_node=4 main.py --model_mode mixed_attention --input_types ${input_types} --seed ${seed} --experiment_name ${experiment_name} --cls_dim 1024 /" jobs/atong_split_exp.yml
    kubectl create -f jobs/atong_split_exp.yml
done

experiment="i-spectre-ms-arch-fc-1536"
input_types="{hsqc,c_nmr,h_nmr,mw,mass_spec}"
for seed in 1 2 3; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_split_exp.yml
    sed -i '' "43s/.*/              torchrun --nproc_per_node=4 main.py --model_mode mixed_attention --input_types ${input_types} --seed ${seed} --experiment_name ${experiment_name} --cls_dim 1536 /" jobs/atong_split_exp.yml
    kubectl create -f jobs/atong_split_exp.yml
done

experiment="i-spectre-ms-arch-mlp-784"
input_types="{hsqc,c_nmr,h_nmr,mw,mass_spec}"
for seed in 1 2 3; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_split_exp.yml
    sed -i '' "43s/.*/              torchrun --nproc_per_node=4 main.py --model_mode mixed_attention --input_types ${input_types} --seed ${seed} --experiment_name ${experiment_name} --arch 1 /" jobs/atong_split_exp.yml
    kubectl create -f jobs/atong_split_exp.yml
done
