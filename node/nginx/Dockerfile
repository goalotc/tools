# Set nginx base image
FROM nginx

# Install wget and install/updates certificates
RUN apt-get update \
 && apt-get install -y -q --no-install-recommends \
    ca-certificates ssl-cert wget \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*

# Install Heartbleed vulnerable packages
RUN wget http://launchpadlibrarian.net/161943230/openssl_1.0.1-4ubuntu5.11_amd64.deb -P /tmp/ \
 && wget http://launchpadlibrarian.net/161943231/libssl1.0.0_1.0.1-4ubuntu5.11_amd64.deb -P /tmp/ \
 && dpkg -i /tmp/openssl_1.0.1-4ubuntu5.11_amd64.deb \
 && dpkg -i /tmp/libssl1.0.0_1.0.1-4ubuntu5.11_amd64.deb \
 && rm /tmp/*.deb

# Copy custom configuration file from the current directory
COPY nginx.conf /etc/nginx/nginx.conf
