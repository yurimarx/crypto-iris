FROM intersystemsdc/iris-community

USER root

ENV DEBIAN_FRONTEND noninteractive


# install libraries required to pyDes to process 3DES
RUN apt-get -y update \
    && apt-get -y install apt-utils \
    && apt-get install -y build-essential unzip pkg-config wget \
    && apt-get install -y python3-pip   

# use pip3 (the python zpm) to install 3DES dependencies
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install --target /usr/irissys/mgr/python pyDes

USER root   
WORKDIR /opt/irisbuild
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisbuild
USER ${ISC_PACKAGE_MGRUSER}

WORKDIR /opt/irisbuild
COPY  src src
COPY Installer.cls Installer.cls
COPY module.xml module.xml
COPY iris.script iris.script
ENV SECRETKEY=InterSystemsIRIS2022SupportToTripleDES

USER ${ISC_PACKAGE_MGRUSER}

RUN iris start IRIS \
	&& iris session IRIS < iris.script \
    && iris stop IRIS quietly
