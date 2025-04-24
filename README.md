# Knot Resolver for Raspberry Pi

This repository contains a Dockerfile and configuration for running [Knot Resolver](https://www.knot-resolver.cz/) on a Raspberry Pi or other ARM64 devices.

## Contents

- `Dockerfile`: Builds a Docker image for Knot Resolver on ARM64 architecture.
- `conf/config.yaml`: Basic configuration file for Knot Resolver.
- `LICENSE`: The Unlicense, placing this project in the public domain.

## Pulling the Image from Docker Hub

You can pull the pre-built image directly from Docker Hub:

```bash
docker pull danielkubat/knot-resolver-rpi
```

This is the easiest way to get started with Knot Resolver on your Raspberry Pi or other ARM64 device.

## Building the Image

To build the Docker image, run:

```bash
docker build -t knot-resolver-rpi .
```

## Running the Container

To run the Knot Resolver container:

```bash
docker run -d --name knot-resolver -p 53:53/udp -p 53:53/tcp knot-resolver-rpi
```

## Configuration

The `config.yaml` file in the `conf` directory sets up basic configuration for Knot Resolver:

- Listens on all interfaces (0.0.0.0) on port 53
- Disable using IPv6 for contacting upstream nameservers
- Uses 1 worker thread
- Stores cache in `/var/cache/knot-resolver`
- Sets logging level to "info"
- Use [Open DNSSEC Validating Resolvers](https://www.nic.cz/odvr/) for forwarding (DoT)

## License

This project is released under the [Unlicense](LICENSE). See the [LICENSE](LICENSE) file for details.
