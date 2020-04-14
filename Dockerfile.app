FROM maildealer/rails:ruby2.6-buster

##########################################
######## SVG convertation support ########
##########################################
RUN apt-get update && \
    apt-get install -y --no-install-recommends inkscape

##########################
######### WKHTML #########
##########################
RUN apt-get install -y --no-install-recommends wkhtmltopdf xfonts-75dpi xfonts-base

RUN sed -i 's/name="height" value="16KP"/name="height" value="64KP"/g' /etc/ImageMagick-6/policy.xml

#################################
######## Clean apt cache ########
#################################
RUN rm -rf /var/lib/apt/lists/*
