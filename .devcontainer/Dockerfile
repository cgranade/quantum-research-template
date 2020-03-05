FROM mcr.microsoft.com/quantum/iqsharp-base:0.10.2002.2610

USER root

# Use method at https://github.com/wmacevoy/latex-docker/blob/master/dockers/latex-base/Dockerfile to
# get a TeX Live 2019 install not managed by apt.
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz; \
	mkdir /install-tl-unx; \
	tar -xvf install-tl-unx.tar.gz -C /install-tl-unx --strip-components=1; \
    echo "selected_scheme scheme-basic" >> /install-tl-unx/texlive.profile; \
	/install-tl-unx/install-tl -profile /install-tl-unx/texlive.profile; \
    rm -r /install-tl-unx; \
	rm install-tl-unx.tar.gz
ENV TEXLIVE_DIR="/usr/local/texlive/2019"
ENV TEXLIVE_BIN="${TEXLIVE_DIR}/bin/x86_64-linux"
ENV PATH="${TEXLIVE_BIN}:${PATH}"

# Install non-relocatable LaTeX packages.
RUN tlmgr install latexmk

RUN apt-get update && \
    # Upgrade .NET Core SDK to the LTS release.
    apt-get install -y dotnet-sdk-3.1 && \
    # We clean the apt cache at the end of each apt command so that the caches
    # don't get stored in each layer.
    apt-get clean && rm -rf /var/lib/apt/lists/

USER ${USER}

# Add TeX Live to PATH.
RUN echo "export PATH=\"\${TEXLIVE_BIN}:\$PATH\"" >> ~/.bashrc

# Install required LaTeX usermode packages.
RUN tlmgr init-usertree && \
    tlmgr --usermode install revquantum && \
    tlmgr --usermode install qsharp && \
    tlmgr --usermode install quantumarticle

# Install PowerShell so that we can use posh-tex.
RUN dotnet tool install --global PowerShell && \
    pwsh -Command "Install-Module -Force posh-tex"
