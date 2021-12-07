FROM rocker/rstudio:4.1.1

# Install Ubuntu packages
RUN apt-get update && apt-get install -y \
    sudo \
    gdebi-core \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libxml2-dev \
    libnlopt-dev \
    libudunits2-dev \
    libgeos-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    git         \
    libgdal-dev \
    python3-venv \
    build-essential\
    libglpk40	
    
# Install Shiny server
RUN wget --no-verbose https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/VERSION -O "version.txt" && \
    VERSION=$(cat version.txt) && \
    wget "https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/shiny-server-$VERSION-amd64.deb" -O ss-latest.deb && \
    gdebi -n ss-latest.deb && \
    rm -f version.txt ss-latest.deb
    
##### Install R packages that are required ######
## CRAN packages
RUN R -e "install.packages(c('BiocManager','shiny','shinythemes','Seurat', 'markdown','shinybusy','tidyverse','enrichR','imager','waiter','DT','igraph','readxl','shinyWidgets','shinyjs','RColorBrewer', 'devtools', 'rsconnect'))"

## GITHUB
# RUN R -e "devtools::install_github('sqjin/CellChat')" 
RUN R -e "devtools::install_github('GreenleafLab/ArchR', ref='master', repos = BiocManager::repositories())"

## BIOCONDUCTOR
RUN R -e "BiocManager::install(c('BiocGenerics', 'DelayedArray', 'DelayedMatrixStats','limma', 'S4Vectors', 'SingleCellExperiment','SummarizedExperiment','batchelor', 'Matrix.utils', 'rDGIdb'))"

## SPECIFIC FOR MONOCLE3
RUN R -e "devtools::install_github('cole-trapnell-lab/leidenbase')"
RUN R -e "devtools::install_github('cole-trapnell-lab/monocle3')"

## SPECIFIC FOR ARCHR
RUN R "ArchR::installExtraPackages()"
