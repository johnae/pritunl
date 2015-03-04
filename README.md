## Pritunl as a Docker container

Just build it or pull it from johnae/docker-pritunl. Run it something like this:

```
docker run -d -privileged -p 1194:1194/udp -p 1194:1194/tcp -p 9700:9700/tcp johnae/docker-pritunl
```

Then you can login to your pritunl web ui at https://docker-host-address:9700
Username: admin Password: admin

Then you're on your own, but take a look at http://pritunl.com or https://github.com/pritunl/pritunl
