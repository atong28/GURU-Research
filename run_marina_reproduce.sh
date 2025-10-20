cd /Users/atong/Documents/UCSD/Projects/GURU/GURU-Research
experiment="marina-reproduce"
input_types="{hsqc,c_nmr,h_nmr,mw,mass_spec}"
for seed in 0 1 2; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_marina_reproduce.yml
    sed -i '' "43s/.*/              torchrun --nproc_per_node=4 stage1.py --input_types ${input_types} --seed ${seed} --experiment_name ${experiment_name} --lambda_bce 0 --hybrid_loss /" jobs/atong_marina_reproduce.yml
    kubectl create -f jobs/atong_marina_reproduce.yml
done