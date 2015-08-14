Scripts and snippets for vultr

<a href="https://www.vultr.com/?ref=6844672"><img src="https://www.vultr.com/media/468x60_03.gif" width="468" height="60"></a>

- [vultr-cli](https://github.com/JamesClonk/vultr)

### Create CentOS 7 x64 1GB Sydney $8/mo
`vultr server create -n "sam" -r 19 -p 106 -o 167 -s 6652 -k "55cd67050194f"`

### list servers
`vultr servers`

### ssh into first running server
`ssh $(vultr servers | tail -1 | awk '{print $3}')`

### Delete first running server
`vultr server delete $(vultr servers | tail -1 | awk '{print $1}')`
