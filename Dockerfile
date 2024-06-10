# Use the official Apache image as the base image
FROM httpd:latest

# Create necessary directories and set permissions
RUN mkdir -p /var/cache/httpd/client_temp /var/run/httpd /tmp \
    && chmod -R 777 /var/cache/httpd /var/run/httpd /tmp

# Copy custom Apache configuration file to the container

ADD https://github.com/sachin78y/docker-images/raw/master/httpd.conf /tmp
RUN cp  /tmp/httpd.conf /usr/local/apache2/conf/httpd.conf
RUN rm -rf /tmp/httpd.conf

# Expose port 8080
EXPOSE 8080
