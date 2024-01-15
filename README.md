# JonRyn_infra
JonRyn Infra repository

1.
подключение к удаленной машине одной командой
ssh -J appuser@158.160.97.156 appuser@10.128.0.20
ssh -A -t appuser@158.160.97.156 ssh -A appuser@10.128.0.20


2.
подключение через алиас
joni@joni-VirtualBox:~/.ssh$ cat ./config
Host bastion
	HostName 158.160.97.156
	User appuser
	IdentityFile ~/.ssh/id_ed25519

Host someinternalhost
	HostName 10.128.0.20
	User appuser
	IdentityFile ~/.ssh/id_ed25519
	ProxyJump appuser@158.160.105.9


joni@joni-VirtualBox:~/.ssh$ ssh someinternalhost


3.

добавление сертификата через nip.io:
1) поставили certbot
2) сгенерировали сертификат
	sudo certbot certonly --standalone
3) сгенерировали для doname_name = 158.160.97.156.nip.io
4) после этого подключение к серверу через web-брайзер по адресу 158.160.97.156.nip.io.


4.

bastion_IP = 158.160.97.156
someinternalhost_IP = 10.128.0.20
