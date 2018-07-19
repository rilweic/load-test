FROM python:2.7-wheezy

# Install locust
RUN pip install pyzmq locustio faker

ADD locustfile.py /config/locustfile.py
ADD runLocust.sh /usr/local/bin/runLocust.sh

RUN apt-get update && apt-get install -y vim net-tools
ENV LOCUST_FILE /config/locustfile.py

ADD run.sh /usr/local/bin/run.sh

EXPOSE 8089


ENTRYPOINT ["/usr/local/bin/run.sh"]
# CMD [ "edge-router" ]