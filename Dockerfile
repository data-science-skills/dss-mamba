FROM condaforge/mambaforge

# Install quarto
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.2.280/quarto-1.2.280-linux-amd64.deb
RUN dpkg -i quarto*
RUN rm quarto*

RUN wget https://github.com/data-science-skills/dsk/blob/initial-site/environment.yml
RUN mamba env create -f environment.yml

