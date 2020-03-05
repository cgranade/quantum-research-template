FROM mcr.microsoft.com/quantum/iqsharp-base:0.10.2002.2610

USER root

RUN apt-get update && \
    # Install LaTeX.
    apt-get install -y texlive \
                       texlive-latex-recommended \
                       texlive-latex-extra \
                       texlive-fonts-extra \
                       texlive-publishers \
                       texlive-science \
                       latexmk \
                       # Also upgrade .NET Core SDK to the LTS release.
                       dotnet-sdk-3.1 && \
    # We clean the apt cache at the end of each apt command so that the caches
    # don't get stored in each layer.
    apt-get clean && rm -rf /var/lib/apt/lists/

USER ${USER}

# Install PowerShell so that we can use posh-tex.
RUN dotnet tool install --global PowerShell && \
    pwsh -Command "Install-Module -Force posh-tex"
