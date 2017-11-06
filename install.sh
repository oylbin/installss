
if [ -z ${SS_PASSWORD+x} ]; then 
	export SS_PASSWORD="this_is_a_default_password"
fi
if [ -z ${SS_PORT+x} ]; then 
	export SS_PORT=443
fi
if [ -z ${SS_METHOD+x} ]; then 
	export SS_METHOD="aes-256-gcm"
fi
if [ -z ${SS_PATH+x} ]; then 
	export SS_PATH=/root/ss/
fi

echo "SS_PASSWORD='$SS_PASSWORD'"
echo "SS_PORT='$SS_PORT'"
echo "SS_PATH='$SS_PATH'"

mkdir -p $SS_PATH
cat > $SS_PATH/server.json <<- EOM
{
	"server":"0.0.0.0",
	"server_port": $SS_PORT,
	"local_port":1080,
	"password":"$SS_PASSWORD",
	"timeout":3600,
	"method":"$SS_METHOD",
	"fast_open": true,
	"plugin": "obfs-server",
	"plugin_opts": "obfs=tls;failover=bing.com;fast-open"
}
EOM

#cat  $SS_PATH/server.json
apt update
apt install -y docker.io
systemctl start docker

docker run -it -v $SS_PATH:/config --name ss-server --net=host -d \
	hitian/ss ss-server -c /config/server.json

# netstat -nltp | grep ":$SS_PORT[[:blank:]]"