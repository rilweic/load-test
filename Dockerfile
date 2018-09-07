FROM python:2.7-wheezy

# Install locust
RUN pip install pyzmq==17.1.2 locustio==0.8.1 faker==0.8.17

ADD locustfile.py /config/locustfile.py
ADD runLocust.sh /usr/local/bin/runLocust.sh

ENV LOCUST_FILE /config/locustfile.py

ADD run.sh /usr/local/bin/run.sh

EXPOSE 8089


ENTRYPOINT ["/usr/local/bin/runLocust.sh","edge-router"]
# CMD [ "edge-router" ]