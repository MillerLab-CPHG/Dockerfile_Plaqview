FROM rocker/rstudio:4.2

ARG BUILDDIR="/tmp/build"
ARG PYTHON_VER="3.6.8"
WORKDIR ${BUILDDIR}

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
    libbz2-dev\ 
    liblzma-dev\
    build-essential\
    libglpk40\
    libmagick++-6.q16-dev\
    libgsl-dev	
    
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
RUN R -e "devtools::install_github('satijalab/seurat-data')"
RUN R -e "devtools::install_github('mojaveazure/seurat-disk')"
RUN R -e "devtools::install_github('welch-lab/liger')"

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
## MONOCLE3
RUN R -e "devtools::install_github('cole-trapnell-lab/leidenbase')"
RUN R -e "devtools::install_github('cole-trapnell-lab/monocle3')"

## SYMPHONY
RUN R -e "devtools::install_github('immunogenomics/symphony')"

## DROPLETUTIL
RUN R -e "BiocManager::install('DropletUtils')"

## ENSEMBLE
RUN R -e "BiocManager::install('ensembldb')"

## SingleCellExperiment (scater)
RUN R -e "BiocManager::install('scater')"

## ggtheme assist
RUN R -e "install.packages('ggThemeAssist')"

## reactlog
RUN R -e "install.packages('reactlog')"

## Signac and genomes
RUN R -e "BiocManager::install('Rsamtools')"
RUN R -e "install.packages('Signac')"
RUN R -e "BiocManager::install(c('BSgenome.Hsapiens.UCSC.hg38', 'EnsDb.Hsapiens.v86'))"
RUN R -e "BiocManager::install(c('BSgenome.Mmusculus.UCSC.mm10', 'EnsDb.Mmusculus.v79'))"

## CIPR
RUN R -e "devtools::install_github('atakanekiz/CIPR-Package', build_vignettes = F)"

## UPDATED DT
RUN R -e "remotes::install_github('rstudio/DT')"

## reactable
RUN R -e "devtools::install_github('glin/reactable')"


## cellchat
RUN R -e "devtools::install_github('sqjin/CellChat')"

# dependency for signac annotation
RUN R -e "BiocManager::install('biovizBase')"

# FigR multiominc analysis 
RUN R -e "devtools::install_github('buenrostrolab/FigR')"

# Giotto multiominc analysis 
RUN R -e "remotes::install_github('RubD/Giotto@suite')"
RUN R -e "Giotto::installGiottoEnvironment()"

# Seurat Wrapper
RUN R - e "remotes::install_github('satijalab/seurat-wrappers')"

# CellChat
RUN R -e "devtools::install_github('sqjin/CellChat')"

RUN R -e "install.packages('NMF')"
RUN R -e "devtools::install_github('jokergoo/circlize')"
RUN R -e "devtools::install_github('jokergoo/ComplexHeatmap')"

# scCustomize
RUN R -e "devtools::install_github('samuel-marsh/scCustomize')"

# Harmony
RUN R -e "install.packages('harmony')"

# cluster profiler
RUN R -e "BiocManager::install(c('clusterProfiler', 'org.Hs.eg.db', 'AnnotationHub', 'ReactomePA'))"

