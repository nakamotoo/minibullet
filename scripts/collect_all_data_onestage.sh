envs=(BinSort-v0)
perc=(1.0)
noise=(0.1 0.02 0.05 0.03)
timesteps=200
policy=(binsortneutralmultstored)
trunc=(2 4)

counter=0
num_parallel=2

for no in ${noise[@]}; do
    for tr in ${trunc[@]}; do
        for per in ${perc[@]}; do
            for env in ${envs[@]}; do
                for pi in ${policy[@]}; do
                    if [ $pi = "stitching" ]; then
                        num=100
                    else # binsort
                        num=1000
                    fi
                    path=/nfs/kun2/users/asap7772/onestage_binsort1K_diffper/${pi}_binper${per}_noise${no}_trunc${tr}/

                    command="python scripts/scripted_collect.py -e ${env} -pl ${pi} \
                    -n ${num} -t ${timesteps} -d ${path} -a place_success_target \
                    --noise ${no} --save-all --p_place_correct ${per} --trunc=${tr}"

                    echo ${command}
                    ${command} &

                    sleep 2.0
                    
                    counter=$((counter+1))
                    if [ $counter -ge $num_parallel ]; then
                        wait
                        counter=0
                    fi
                done
            done
        done
    done
done


