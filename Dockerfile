FROM rocker/rstudio:4.1.1


#### ESSENTIAL UBUNTU PKGS ####
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
    
#### ESSENTIAL R PACKAGES ####
## FROM CRAN 
RUN install2.r --error --skipinstalled --ncpus -1 \
    BiocManager \
    shiny \
    shinythemes \
    Seurat\
    markdown\
    shinybusy\
    tidyverse \
    enrichR\
    imager\
    waiter\
    DT\
    igraph\
    readxl\
    shinyWidgets\
    shinyjs\
    RColorBrewer\
    devtools\
    tidyverse\
    magrittr\
    ggrepel\
    data.table\
    matrixStats\
    Matrix

## FROM GITHUB
RUN installGithub.r --error --skipinstalled --ncpus -1 \
    sqjin/CellChat \
    satijalab/seurat-data \
    mojaveazure/seurat-disk

## FROM BIOCONDUCTOR
RUN R -e "BiocManager::install('BiocGenerics')"
RUN R -e "BiocManager::install('DelayedArray')"
RUN R -e "BiocManager::install('DelayedMatrixStats')"
RUN R -e "BiocManager::install('limma')"
RUN R -e "BiocManager::install('SingleCellExperiment')"
RUN R -e "BiocManager::install('SummarizedExperiment')"
RUN R -e "BiocManager::install('batchelor')"
RUN R -e "BiocManager::install('Matrix.utils')"
RUN R -e "BiocManager::install('rDGIdb')"

RUN R -e "BiocManager::install('SingleR')"
RUN R -e "BiocManager::install('celldex')"
RUN R -e "BiocManager::install('bayNorm')"

#### SPECIFIC R PACKAGES
## SPECIFIC FOR MONOCLE3
RUN R -e "devtools::install_github('cole-trapnell-lab/leidenbase')"
RUN R -e "devtools::install_github('cole-trapnell-lab/monocle3')"

## SPECIFIC FOR ARCHR
RUN R -e "devtools::install_github('GreenleafLab/ArchR', ref='master', repos = BiocManager::repositories())"
RUN R "ArchR::installExtraPackages()"

