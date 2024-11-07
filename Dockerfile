# Use the rocker/shiny image as the base
FROM rocker/shiny:latest

# Install necessary R packages
RUN R -e "install.packages('shiny')"
RUN R -e "install.packages('ggplot2')"

# Copy the app files into the container
COPY . /srv/shiny-server/

# Expose the port that Shiny Server runs on
EXPOSE 3838

# Set the working directory to the Shiny app folder
WORKDIR /srv/shiny-server

# Start Shiny Server when the container starts
CMD ["/usr/bin/shiny-server"]
