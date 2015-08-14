# vultr-scripts
scripts and snippets for vultr

- [vultr-cli](https://github.com/JamesClonk/vultr)

## Create CentOS 7 x64 1GB Sydney $8/mo
vultr server create -n "sam" -r 19 -p 106 -o 167 -s 6652 -k "55cd67050194f"

## list servers
vultr servers

## ssh into only server
ssh $(vultr servers | tail -1 | awk '{print $3}')

## Delete only server
vultr server delete $(vultr servers | tail -1 | awk '{print $1}')
