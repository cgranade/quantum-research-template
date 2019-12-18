#!/bin/bash
# Copyright (c) Chris Granade.
# Licensed under the MIT License.

# Add the appropriate paths to $PATH through the bash profile.
cat << \EOF >> ~/.bashrc
export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT/tools:$HOME/.local/bin:$PATH"
alias python=python3.8
EOF

# Also apply changes to PATH immediately. We can't just source .bashrc,
# as we are not in an interactive session.
export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT/tools:$HOME/.local/bin:$PATH"
alias python=python3.8

# Print out some diagnostics before proceeding:
echo "## Diagnostics ##"
which dotnet
dotnet --info
echo "## /Diagnostics ##"

# Install Python requirements.
pip3 install --user notebook qsharp
# Install required .NET Global Tools.
dotnet tool install -g Microsoft.Quantum.IQSharp --version 0.10.1912.501
dotnet tool install -g PowerShell
# Install project templates.
dotnet new -i Microsoft.Quantum.ProjectTemplates
# Configure IQ# for use with Jupyter and qsharp.py.
dotnet iqsharp install --user
# Install required PowerShell modules for demos.
# Note that the global tool version of pwsh uses different args.
pwsh "Install-Module -Force posh-tex"

# Install LaTeX.
sudo apt-get update && \
sudo apt-get install -y texlive \
                        texlive-latex-recommended \
                        texlive-latex-extra \
                        texlive-fonts-extra \
                        texlive-publishers \
                        texlive-science \
                        latexmk \
                        xzdec

# Install required LaTeX packages.
tlmgr init-usertree
tlmgr install revquantum
tlmgr install qsharp
tlmgr install quantumarticle


# Pre-build C# project. This prevents the C# extension
# from raising errors.
pushd ~/workspace/src/
    dotnet build
popd

# Print out some diagnostic info.
echo "dotnet: $(which dotnet)"
echo "pwsh: $(which pwsh)"
echo "dotnet iqsharp: $(which dotnet-iqsharp)"
echo "latexmk: $(which latexmk)"
echo "pdflatex: $(which pdflatex)"
