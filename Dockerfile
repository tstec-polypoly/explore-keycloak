FROM maven:latest as magic-link-builder

WORKDIR /
RUN git clone https://github.com/p2-inc/keycloak-magic-link.git
WORKDIR /keycloak-magic-link
RUN git checkout 71b611716a6cebd68590b28aa6bce9c3003c0e32
RUN mvn clean install

FROM quay.io/keycloak/keycloak:latest as builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_FEATURES=token-exchange
ENV KC_DB=postgres

#############################
# Set up custom providers

# A Service Provider that adds a metrics endpoint to Keycloak.
# https://github.com/aerogear/keycloak-metrics-spi
RUN curl -sL https://github.com/aerogear/keycloak-metrics-spi/releases/download/2.5.3/keycloak-metrics-spi-2.5.3.jar -o /opt/keycloak/providers/keycloak-metrics-spi-2.5.3.jar

# Magic link plugin
# https://github.com/p2-inc/keycloak-magic-link
COPY --from=magic-link-builder /keycloak-magic-link/target/keycloak-magic-link-0.1-SNAPSHOT.jar /opt/keycloak/providers/keycloak-magic-link-0.1-SNAPSHOT.jar

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest
COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak

# for demonstration purposes only, please make sure to use proper certificates in production instead
RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" -keystore conf/server.keystore

# Download wait-for-it.sh
RUN curl -sL https://raw.githubusercontent.com/vishnubob/wait-for-it/81b1373f17855a4dc21156cfe1694c31d7d1792e/wait-for-it.sh -o /opt/keycloak/wait-for-it.sh
RUN chmod +x /opt/keycloak/wait-for-it.sh

ENTRYPOINT ["/opt/keycloak/wait-for-it.sh", "--strict", "keycloak_pgsql:5432", "--", "/opt/keycloak/bin/kc.sh", "start", "--optimized"]
