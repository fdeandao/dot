FROM phusion/baseimage:latest
ENV HOME /root
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
CMD ["/sbin/my_init"]
EXPOSE 22

WORKDIR /tmp

RUN apt-get -qq update && apt-get -qq upgrade
RUN apt-get install -y --no-install-recommends \
    git python-pip gcc python-mysqldb patch \
    libxml2-dev libxslt1-dev python-dev libfreetype6-dev \
    texlive-latex-base \
    libjpeg-dev \
    pandoc

#Large libs
RUN pip install Django==1.6.5 djutils==0.3.2 Genshi==0.7 Pillow==2.4.0

#FIX django
ADD files/cache.patch /usr/local/lib/python2.7/dist-packages/djutils/cache.patch
WORKDIR /usr/local/lib/python2.7/dist-packages/djutils/
RUN patch < cache.patch

WORKDIR /
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
