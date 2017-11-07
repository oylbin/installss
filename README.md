使用方法，在ubuntu 16.04系统下执行以下命令：

1. 安装shadowsocks + obfs (obfs=tls)

        export SS_PASSWORD='set_your_ss_password'
        export SS_METHOD='aes-256-gcm'
        export SS_PORT=443
        curl -fsSL https://github.com/oylbin/installss/raw/master/install_with_obfs.sh | sudo -E bash -

2. 安装shadowsocks（不含obfs）

        export SS_PASSWORD='set_your_ss_password'
        export SS_METHOD='aes-256-gcm'
        export SS_PORT=443
        curl -fsSL https://github.com/oylbin/installss/raw/master/install.sh | sudo -E bash -

提示：

1. GFW开始封境外IP非443的所有端口了。所以ss server对外的端口建议改成443，不然可能连不通。
2. ss协议有被识别出来的可能了，所以建议使用 ss + obfs 的方式，对应的客户端也需要支持obfs。
