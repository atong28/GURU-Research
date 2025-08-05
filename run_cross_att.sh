cd /Users/atong/Documents/UCSD/Projects/GURU/GURU-Research
experiment=f-spectre-ms-crossatt
for seed in 1 2 3; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_split_exp.yml
    sed -i '' "45s/.*/              torchrun --nproc_per_node=4 cross_attention_main.py --seed ${seed} --experiment_name ${experiment_name} /" jobs/atong_split_exp.yml
    kubectl create -f jobs/atong_split_exp.yml
done

