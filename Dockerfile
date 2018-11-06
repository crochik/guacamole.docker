# generate sql file
FROM guacamole/guacamole as guacamole
WORKDIR /opt/guacamole/bin/
RUN /opt/guacamole/bin/initdb.sh --postgres > /opt/guacamole/bin/initdb.sql

# generate postgres with init script
FROM postgres
WORKDIR /docker-entrypoint-initdb.d/
COPY --from=guacamole /opt/guacamole/bin/initdb.sql /docker-entrypoint-initdb.d/
