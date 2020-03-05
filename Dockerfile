FROM continuumio/miniconda3
MAINTAINER Pablo Campos Viana

RUN apt-get update \
	&& apt-get -y install gcc g++ make cmake unzip

RUN git clone https://github.com/pjcv89/AutoTag.git \
	&& cd AutoTag && pip install -r requirements.txt 
#	&& chmod u+x install_fasttext.sh install_starspace.sh \
#	&& ./install_fasttext.sh \
#	&& ./install_starspace.sh

RUN pip install jupyter

WORKDIR /AutoTag
ENTRYPOINT ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888","--allow-root"]
