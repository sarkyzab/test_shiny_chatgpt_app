FROM rocker/shiny:4

RUN R -e "install.packages(c('shiny', 'ggplot2', 'dplyr'))"
WORKDIR /test-shiny_chatgpt_app

COPY app.R app.R

CMD Rscript app.R
