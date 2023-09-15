FROM condaforge/mambaforge

# Install quarto
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.202/quarto-1.3.202-linux-amd64.deb
RUN dpkg -i quarto*
RUN rm quarto*

# Install hugo extended version with scss support
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.118.2/hugo_extended_0.118.2_linux-amd64.deb
RUN dpkg -i hugo*
RUN rm hugo*

# Install Go
ENV GOLANG_VERSION=1.17
ENV GOLANG_OS=linux
ENV GOLANG_ARCH=amd64
RUN wget -q https://golang.org/dl/go$GOLANG_VERSION.$GOLANG_OS-$GOLANG_ARCH.tar.gz && \
    tar -C /usr/local -xzf go$GOLANG_VERSION.$GOLANG_OS-$GOLANG_ARCH.tar.gz && \
    rm go$GOLANG_VERSION.$GOLANG_OS-$GOLANG_ARCH.tar.gz

# Install Node.js and npm
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl && \
    curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Add Go binary directory to PATH
ENV PATH=$PATH:/usr/local/go/bin

# Verify Go installation
RUN go version

# Install website environment
RUN wget https://raw.githubusercontent.com/data-science-skills/dss-web/main/environment.yml
RUN mamba env update -n base -f environment.yml \
    && conda clean --all --yes --force-pkgs-dirs \
    && find ${CONDA_DIR} -follow -type f -name '*.a' -delete \
    && find ${CONDA_DIR} -follow -type f -name '*.pyc' -delete \
    && find ${CONDA_DIR} -follow -type f -name '*.js.map' -delete
