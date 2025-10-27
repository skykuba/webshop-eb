FROM prestashop/prestashop:1.7.8.10-fpm

RUN apt-get update && \
    apt-get install -y default-mysql-client && \
    rm -rf /var/lib/apt/lists/*

# Copy modified start script
COPY docker_run.sh /tmp/docker_run.sh
RUN chmod +x /tmp/docker_run.sh

RUN chown -R www-data:www-data /var/www/html

CMD ["/tmp/docker_run.sh"]
