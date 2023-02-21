FROM condaforge/mambaforge

# Install quarto
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.202/quarto-1.3.202-linux-amd64.deb

RUN dpkg -i quarto*
RUN rm quarto*

RUN wget https://raw.githubusercontent.com/data-science-skills/dsk/initial-site/environment.yml
RUN mamba env update -n base -f environment.yml \
    && conda clean --all --yes --force-pkgs-dirs \
    && find ${CONDA_DIR} -follow -type f -name '*.a' -delete \
    && find ${CONDA_DIR} -follow -type f -name '*.pyc' -delete \
    && find ${CONDA_DIR} -follow -type f -name '*.js.map' -delete
