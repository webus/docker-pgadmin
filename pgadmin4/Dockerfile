FROM python:3.5-slim

WORKDIR /home

RUN apt-get update -y && \
  apt-get install -y --no-install-recommends libpq-dev python3-dev wget && \
  apt-get install -y --no-install-recommends build-essential expect && \
  wget -c http://ftp.postgresql.org/pub/pgadmin/pgadmin4/v1.4/pip/pgadmin4-1.4-py2.py3-none-any.whl && \
  pip install pgadmin4-1.4-py2.py3-none-any.whl

RUN apt-get remove --purge -y build-essential && apt-get autoremove -y && apt-get autoclean -y

EXPOSE 5050

ADD config_local.py /usr/local/lib/python3.5/site-packages/pgadmin4
COPY entrypoint.sh /root/entrypoint.sh
RUN chmod 755 /root/entrypoint.sh

ENV PGADMIN_USER root@localhost
ENV PGADMIN_PASSWORD aWeSm#PwD2

ENTRYPOINT ["/root/entrypoint.sh"]

CMD ["/usr/local/bin/python", "/usr/local/lib/python3.5/site-packages/pgadmin4/pgAdmin4.py"]
