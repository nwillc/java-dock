
# java-dock

A Dockerfile designed to run a single jar file in a simple and controllable manner. Also
provided are some scripts to work with the Dockerfile.

## Employs

- [Alpine Linux and Oracle JDK 8](https://hub.docker.com/r/anapsix/alpine-java/)
- [Tini](https://github.com/krallin/tini) a tiny init replacement

## Exposes

- Port 8080 from inside the container
- A log folder

## Consul
If you are running Registrator the environment variables in the run.sh will create a service entry that can
be queried with DNS:

```bash
dig @localhost -p 8600 _java-dock._rest.service.consul SRV
```

