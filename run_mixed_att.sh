cd /Users/atong/Documents/UCSD/Projects/GURU/GURU-Research
experiment="h-spectre-ms-mixedatt"
input_types="{hsqc,c_nmr,h_nmr,mw,mass_spec}"
for seed in 1 2 3; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_split_exp.yml
    sed -i '' "43s/.*/              CUDA_LAUNCH_BLOCKING=1 torchrun --nproc_per_node=4 main.py --model_mode mixed --input_types ${input_types} --seed ${seed} --experiment_name ${experiment_name} /" jobs/atong_split_exp.yml
    kubectl create -f jobs/atong_split_exp.yml
done

experiment="h-spectre-mixedatt"
input_types="{hsqc,c_nmr,h_nmr,mw}"
for seed in 1 2 3; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_split_exp.yml
    sed -i '' "43s/.*/              CUDA_LAUNCH_BLOCKING=1 torchrun --nproc_per_node=4 main.py --model_mode mixed --input_types ${input_types} --seed ${seed} --experiment_name ${experiment_name} /" jobs/atong_split_exp.yml
    kubectl create -f jobs/atong_split_exp.yml
done

experiment="h-spectre-ms-mixedatt-with-formula"
input_types="{hsqc,c_nmr,h_nmr,mw,mass_spec,formula}"
for seed in 1 2 3; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_split_exp.yml
    sed -i '' "43s/.*/              CUDA_LAUNCH_BLOCKING=1 torchrun --nproc_per_node=4 main.py --model_mode mixed --input_types ${input_types} --seed ${seed} --experiment_name ${experiment_name} /" jobs/atong_split_exp.yml
    kubectl create -f jobs/atong_split_exp.yml
done

experiment="h-spectre-mixedatt-with-formula"
input_types="{hsqc,c_nmr,h_nmr,mw,formula}"
for seed in 1 2 3; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_split_exp.yml
    sed -i '' "43s/.*/              CUDA_LAUNCH_BLOCKING=1 torchrun --nproc_per_node=4 main.py --model_mode mixed --input_types ${input_types} --seed ${seed} --experiment_name ${experiment_name} /" jobs/atong_split_exp.yml
    kubectl create -f jobs/atong_split_exp.yml
done