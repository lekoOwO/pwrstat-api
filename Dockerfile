FROM python:3-stretch
MAINTAINER Daniel Winks

VOLUME /src
COPY pwrstat-api.py requirements.txt init.sh /src/
WORKDIR /src
RUN chmod +x /src/init.sh
RUN chmod +x /src/pwrstat-api.py
RUN pip install --trusted-host pypi.python.org -r requirements.txt

COPY PPL-*-64bit.deb powerpanel_*_amd64.deb PPL_64bit_*.deb /src/
RUN dpkg -i *.deb
ENTRYPOINT "/src/init.sh"
