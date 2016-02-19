FROM m4rkw/ubuntu

MAINTAINER m4rkw

RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get install -yq --no-install-recommends nginx
RUN apt-get install -yq --no-install-recommends ruby2.2 ruby2.2-dev ruby-passenger ruby-dev ruby-json ruby-net-http-persistent rake mysql-client libmysqlclient-dev build-essential

RUN gem install rack-slashenforce
RUN gem install erubis
RUN gem install mysql

RUN useradd -m lean

ADD assets /

RUN ln -s /etc/nginx/sites-available/lean.conf /etc/nginx/sites-enabled/lean.conf
RUN rm /etc/nginx/sites-enabled/default

WORKDIR /root
RUN git clone https://github.com/m4rkw/lean

WORKDIR /root/lean
RUN gem build lean.gemspec
RUN gem install lean*.gem

EXPOSE 80 443

WORKDIR /var/www/lean
