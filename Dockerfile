# Use the official Elasticsearch image as the base image
FROM docker.elastic.co/elasticsearch/elasticsearch:7.15.0

# Set some environment variables
ENV discovery.type=single-node
ENV ES_JAVA_OPTS="-Xms2g -Xmx2g"

# Copy over our custom configuration file
COPY elasticsearch.yml /usr/share/elasticsearch/config/

# Set the user and group ownership of the Elasticsearch files and directories
RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch && \
    chown -R elasticsearch:elasticsearch /usr/local/bin/docker-entrypoint.sh

# Set the working directory
WORKDIR /usr/share/elasticsearch

# Expose Elasticsearch ports
EXPOSE 9200 9300

# Set the user to run Elasticsearch as
USER elasticsearch

# Start Elasticsearch
# CMD ["/usr/local/bin/docker-entrypoint.sh", "--quiet"]