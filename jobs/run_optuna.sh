mode=create

# exps=(  "Con_DG/single_old_20")
exps=("SNR/v1" ) 
# exps=("Con_DG/only_JSD" "MMD_AAE/tuning_mmd")
# exps=("MMD_AAE/only_recons" "MMD_AAE/only_recons_pretrain")
# exps=("Con_DG/VLCS" "Con_DG/single")
# exps=("MMD_AAE/only_adv" "MMD_AAE/only_recons" "MMD_AAE/only_mmd" "MMD_AAE/single" "MMD_AAE/pretrain_only_adv" "MMD_AAE/pretrain_only_recons" "MMD_AAE/pretrain_only_mmd" "MMD_AAE/pretrain_single")


for ((i=1; i<=4; i++))

do
    for exp in "${exps[@]}"
    do
        name=${exp,,}
        name=${name//\//_}
        sed -i "4s/.*/  name: wangdong-${name//_/-}-${i}/" jobs/device_fp.yaml
        sed -i "39s|.*|          python main.py $exp |" jobs/device_fp.yaml
        kubectl $mode  -f  jobs/device_fp.yaml
    done
done
