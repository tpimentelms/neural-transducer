run=bash

for lang in afb ame ara aym bul ckb cni evn heb itl kod lud nld pol rus see syc vep ail amh arz bra ces ckt deu gup ind kmr krl mag olo por sah spa tyv
do
    # regular data
    echo "trm" $lang
    $run baselines/neural/example/sigmorphon2021-shared-tasks/task0-trm.sh $lang

    # augmented data
    echo "trm hall" $lang
    $run baselines/neural/example/sigmorphon2021-shared-tasks/task0-hall-trm.sh $lang
done
