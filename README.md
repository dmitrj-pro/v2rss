NGinx + V2Ray + ShadowSocks Heroku
=============

Deploy [ng+v2r+ss](https://github.com/dmitrj-pro/v2rss) to [Heroku](https://www.heroku.com/) as a [SOCKS5](https://en.wikipedia.org/wiki/SOCKS) proxy.

### Getting started

Use this button [![Heroku Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/dmitrj-pro/v2rss)

Or create a Heroku app manually:

```
$ heroku create
$ heroku stack:set container
$ heroku config:set ShadowSocksPassword=1234
$ heroku config:set ShadowSocksMethod=AEAD_CHACHA20_POLY1305
$ heroku config:set V2RayPath=/v2ray
$ git push heroku master
...
remote: Verifying deploy... done.
To https://git.heroku.com/young-chamber-29987.git
 * [new branch]      master -> master
```

Connect your V2Ray + ShadowSocks client:

```
$ ./v2ray --version
v2ray-plugin v1.3.1
Go version go1.14.3
Yet another SIP003 plugin for shadowsocks

ss - ShadowSocks
$ ./ss -c young-chamber-29987.herokuapp.com:443 -cipher AEAD_CHACHA20_POLY1305 -password 1234 -plugin ./v2ray -plugin-opts "tls;host=young-chamber-29987.herokuapp.com;mode=websocket;path=/v2ray" -socks 127.0.0.1:1080

Point your SOCKS5 clients to `127.0.0.1:1080`

```
$ curl --socks5 127.0.0.1:1080 ifconfig.co
54.80.138.214
```
