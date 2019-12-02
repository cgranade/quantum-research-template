# Quantum Computing Research Template (Preview) #

This template repository contains everything needed to quickly start working on a research project in quantum computing using Visual Studio Online from your browser or from Visual Studio Code.
The devcontainer in this repository installs a full LaTeX compiler toolchain, as well as the .NET Core SDK and the Quantum Development Kit, making it easy to use Q# in your reproducible research papers.

## Getting Started ##

1. **Make a new repository using this template.**
   Go to https://github.com/microsoft/quantum-research-template/generate, provide a name for your new repository, and choose whether you'd like for your repository to be private or public.
   This will make an entirely new repository from this template, ready for you to add your own research to.
2. **Create and connect to a new Visual Studio Online environment for your repository.**
   Following the steps at https://docs.microsoft.com/en-us/visualstudio/online/quickstarts/browser, create a new Visual Studio Online environment, replacing `microsoft/vsonline-quickstart` with the name of the repository you created.
3. **Write your Q# and LaTeX!**
   From your new environment, modify the Q# source code in `src/Operations.qs`, or start writing your paper in `tex/manuscript.tex`!

### Known Issues ###

Since this template is currently a preview, there are some known issues that we are still working to fix:

- It may take a few minutes after creating a new environment before all of the Quantum Development Kit is made available.
- PDF previews only work when connecting to your environment from Visual Studio Code, not from the browser.

## Folder Layout in Detail ##

- `.devcontainer`: Metadata needed by Visual Studio Online to create your reproducible research environment.
- `.vscode`: Settings and preferences for Visual Studio Online.
- `fig`: Figures and images for your manuscript.
- `src`: Q# source code and classical host programs for your research project.
- `tex`: LaTeX source code for your research manuscript.

## Publishing to arXiv ##

When you're ready to publish your work to arXiv, use the [`Export-ArXiv.ps1`](./Export-ArXiv.ps1) script to prepare a single ZIP file that you can upload to arxiv.org, and that includes all the relevant source code for your project.

Since the arXiv has a few restrictions on folder layouts, this export script will automatically add commands to your LaTeX file to locate your source code and figures in arXiv's preferred folder layout.
This is done using the `RenewCommands` part of the arXiv manifest in `Export-ArXiv.ps1`.
