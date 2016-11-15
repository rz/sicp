#! /bin/zsh
echo $((`cut -d " " -f 2 log.txt | xargs | tr " " "+"`))

