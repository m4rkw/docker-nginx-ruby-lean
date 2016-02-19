FROM m4rkw/ubuntu

MAINTAINER m4rkw

RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get install -yq --no-install-recommends nginx
RUN apt-get install -yq --no-install-recommends ruby2.2 ruby2.2-dev ruby-passenger ruby-dev ruby-json ruby-net-http-persistent rake

ADD assets /

RUN ln -s /etc/nginx/sites-available/lean.conf /etc/nginx/sites-enabled/lean.conf
RUN rm /etc/nginx/sites-enabled/default

EXPOSE 80 443

WORKDIR /var/www/lean
