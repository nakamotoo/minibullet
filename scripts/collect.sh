# env_name=Putbullet_vaseintoBowlDiverseTwoDistractors-v0
# env_name=Putglass_half_gallonintoBowlDiverseTwoDistractors-v0
# env_name=PutT_cupintoBowlDiverseTwoDistractors-v0
# env_name=Putcolunnade_topintoBowlDiverseTwoDistractors-v0
env_name=PutBallintoBowlDiverseBallPosition-v0
python scripts/scripted_collect.py \
-e $env_name \
-pl pickplace \
-n 250 \
-t 30 \
-d /home/mitsuhiko/dataset/cog_collect \
-a place_success_target \
--noise 0.1
