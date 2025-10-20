cd /Users/atong/Documents/UCSD/Projects/GURU/GURU-Research
experiment="marina-run"
input_types="{hsqc,c_nmr,h_nmr,mw,mass_spec}"
for seed in 0 1 2 3 4 5; do
    experiment_name="${experiment}-seed-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_marina_job.yml
    sed -i '' "39s/.*/              pixi run --manifest-path pixi.toml -- torchrun --nproc_per_node=4 stage1.py --input_types ${input_types} --seed ${seed} --experiment_name ${experiment_name} --num_workers 4 /" jobs/atong_marina_job.yml
    kubectl create -f jobs/atong_marina_job.yml
done