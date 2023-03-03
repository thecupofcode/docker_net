# How to use Docker with already configured firewall
## For example, here is modified docker-compose.yaml for MediaWiki (https://hub.docker.com/_/mediawiki)
### /etc/docker/daemon.json
Use these settings for disable iptables auto-adjustment
```
{
  ...
  "iptables": false,
  ...
}
```
### docker-compose.yaml
You can configure IPAM for created networks (usable with iptables rules):
```
networks:
  mw:
    driver: bridge
    ipam:
      config:
        - subnet: 192.168.221.0/28
          gateway: 192.168.221.1
```
You can also assign static IP to container:
```
    networks:
      mw:
        ipv4_address: 192.168.221.2
```
