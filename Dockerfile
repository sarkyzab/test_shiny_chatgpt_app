FROM rocker/shiny:4

RUN R -e ‘install.packages(c("shiny","dplyr","ggplot2"))

WORKDIR /test-shiny_chatgpt_app

COPY app.R app.R

CMD Rscript app.R
