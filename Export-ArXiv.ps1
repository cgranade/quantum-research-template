# Copyright (c) Chris Granade.
# Licensed under the MIT License.

#region Bootstrap PoShTeX
$modules = Get-Module -ListAvailable -Name posh-tex;
if (!$modules) {Install-Module posh-tex -Scope CurrentUser}
if (!($modules | ? {$_.Version -ge "0.1.7.4"})) {Update-Module posh-tex}
Import-Module posh-tex -Version "0.1.7.4"
#endregion

Export-ArXivArchive -RunNotebooks @{
    ProjectName = "manuscript";
    TeXMain = "tex/manuscript.tex";
    AdditionalFiles = @{
        "fig/*.pdf" = "fig/";
        "src/*.qs" = "anc/src/";
        "src/*.cs" = "anc/src/";
        "src/*.csproj" = "anc/src/";
        
        "README.md" = "anc/";
        "LICENSE" = "anc/"
    };
    RenewCommands = @{
        "figurefolder" = "fig";
        "sourcefolder" = "anc/src";
    };
    Notebooks = @(
    )
}
