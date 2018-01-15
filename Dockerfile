FROM centos@81c4e5d1b337

RUN yum update
RUN yum -y install yum-utils
RUN yum -y groupinstall development
RUN yum -y install git
RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm
RUN yum -y install python36u python36u-pip python36u-devel

RUN mkdir -p /opt/tellurium
RUN git clone -b param-est https://github.com/sys-bio/tellurium.git /opt/tellurium
RUN python3.6 -m pip install -r /opt/tellurium/requirements.txt
RUN python3.6 -V
