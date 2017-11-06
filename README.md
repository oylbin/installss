使用方法：

1. 安装shadowsocks + obfs

        export SS_PASSWORD='set_your_ss_password'
        export SS_METHOD='aes-256-gcm'
        export SS_PORT=443
        curl -fsSL https://github.com/oylbin/installss/raw/master/install_with_obfs.sh | sudo -E bash -

2. 安装shadowsocks（不含obfs）

        export SS_PASSWORD='set_your_ss_password'
        export SS_METHOD='aes-256-gcm'
        export SS_PORT=443
        curl -fsSL https://github.com/oylbin/installss/raw/master/install.sh | sudo -E bash -