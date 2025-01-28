ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache python3 py3-pip
COPY requirements.txt /tmp/
RUN pip3 install -r /tmp/requirements.txt --break-system-packages

COPY gateway.py /
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
