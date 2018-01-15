FROM centos@81c4e5d1b337

# install prerequisites
RUN yum update
RUN yum -y install yum-utils
RUN yum -y groupinstall development
RUN yum -y install git
RUN yum -y install java-1.8.0-openjdk
RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm
RUN yum -y install python36u python36u-pip python36u-devel

# install spark
RUN yum -y install wget
RUN wget --progress=dot:giga https://github.com/0u812/distributed-tellurium/releases/download/0.0.1/spark-2.2.1-bin-hadoop2.7.tgz -O /opt/spark.tgz
RUN mkdir /opt/spark
RUN tar -xf /opt/spark.tgz -C /opt/spark --strip-components=1
ENV SPARK_HOME /opt/spark

# install pyspark
RUN python3.6 -m pip install pyspark

# install tellurium
RUN mkdir -p /opt/tellurium
RUN git clone -b param-est https://github.com/sys-bio/tellurium.git /opt/tellurium
RUN python3.6 -m pip install -r /opt/tellurium/requirements.txt
WORKDIR /opt/tellurium
RUN python3.6 setup.py develop

