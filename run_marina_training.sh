cd /Users/atong/Documents/UCSD/Projects/GURU/GURU-Research
experiment="marina-run-no-warmup-fixed-logs"
input_types="{hsqc,c_nmr,h_nmr,mw,mass_spec}"
for seed in 0 1 2; do
    experiment_name="${experiment}-num-${seed}"
    sed -i '' "4s/.*/  name: atong-${experiment_name} /" jobs/atong_marina_job.yml
    sed -i '' "41s/.*/              pixi run --manifest-path pixi.toml -- torchrun --nproc_per_node=4 stage1.py --input_types ${input_types} --seed 0 --experiment_name ${experiment_name} --no_warmup /" jobs/atong_marina_job.yml
    kubectl create -f jobs/atong_marina_job.yml
done
