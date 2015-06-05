FROM phusion/passenger-ruby22

# We offload our gems through a container
ENV GEM_HOME /ruby_gems/2.2

ADD docker/app.conf /etc/nginx/sites-enabled/app.conf
ADD docker/nginx-env.conf /etc/nginx/main.d/
ADD . /home/app

RUN rm -f /etc/service/nginx/down; \
    rm /etc/nginx/sites-enabled/default; \
    mkdir -p /ruby_gems/2.2; \
    chown -R app:app /home/app /ruby_gems

VOLUME /ruby_gems/2.2

ENV HOME /home/app
WORKDIR /home/app
