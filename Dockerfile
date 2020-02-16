FROM ubuntu:bionic

ADD PythonSelfTest.tar.gz /sonos-self-test

WORKDIR "/sonos-self-test/smapi/content_workflow"

RUN apt-get update && \
        apt-get install -y \
            python-pip \
            libxml2-dev \
            libxslt1-dev \
            libssl-dev && \
        pip install psutil==2.2.1 && \
        pip install -r requirements.txt

#RUN pip install -r requirements.txt

ENTRYPOINT [ "python", "suite_selftest.py" ]