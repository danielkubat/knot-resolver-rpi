# Use Debian Bullseye as the base image
FROM arm64v8/debian:bullseye-20241016

# Set the SHELL to bash with pipefail option
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    wget

# Setup Knot repository
RUN wget -O - https://pkg.labs.nic.cz/doc/scripts/enable-repo-cznic-labs.sh | bash -s - knot-resolver

# Install Knot resolver
RUN apt-get update && apt-get install -y \
    knot-resolver6=6.0.9-cznic.1~bullseye \
    knot-dnsutils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /conf

COPY conf/config.yaml /conf/config.yaml

# Expose plain DNS
EXPOSE 53/UDP 53/TCP

ENTRYPOINT ["/usr/bin/knot-resolver"]
CMD ["-c", "/conf/config.yaml"]
