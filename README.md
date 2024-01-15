# JonRyn_infra
JonRyn Infra repository


testapp_IP = 158.160.105.9
testapp_port = 22




подключение к удаленной машине одной командой
ssh -J appuser@158.160.105.9 appuser@10.128.0.20
ssh -A -t appuser@158.160.105.9 ssh -A appuser@10.128.0.20

подключение через алиас
joni@joni-VirtualBox:~/.ssh$ cat ./config
Host bastion
	HostName 158.160.105.9
	User appuser
	IdentityFile ~/.ssh/id_ed25519

Host someinternalhost
	HostName 10.128.0.20
	User appuser
	IdentityFile ~/.ssh/id_ed25519
	ProxyJump appuser@158.160.105.9


joni@joni-VirtualBox:~/.ssh$ ssh someinternalhost




добавление сертификата через nip.io:
1) поставили certbot
2) сгенерировали сертификат
	sudo certbot certonly --standalone
3) сгенерировали для doname_name = 158.160.105.9.nip.io
4) после этого подключение к серверу через web-брайзер по адресу 158.160.105.9.nip.io.
