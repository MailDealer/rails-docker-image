FROM maildealer/rails:ruby2.6-buster

##########################################
######## SVG convertation support ########
##########################################
RUN apt-get update && \
    apt-get install -y --no-install-recommends inkscape

##########################
######### WKHTML #########
##########################
RUN apt-get update && \
    apt-get install -y --no-install-recommends xfonts-75dpi xfonts-base

RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.buster_amd64.deb
RUN dpkg -i wkhtmltox_0.12.5-1.buster_amd64.deb

RUN sed -i 's/name="height" value="16KP"/name="height" value="64KP"/g' /etc/ImageMagick-6/policy.xml

#################################
######## Clean apt cache ########
#################################
RUN rm -rf /var/lib/apt/lists/*
