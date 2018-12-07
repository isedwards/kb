## Multilingual App Toolkit

- [Homepage](https://marketplace.visualstudio.com/items?itemName=MultilingualAppToolkit.MultilingualAppToolkit-18308) (via extension information in Visual Studio). Includes link to standalone [Multilingual App Toolkit 4.0 Editor tool](https://developer.microsoft.com/en-us/windows/develop/multilingual-app-toolkit).
- After installation, the `Project` menu gains a new option for the `Multilingual App Toolkit`
- The MAT is enabled for a project `resx` files are added for each language choice and a new `MultilingualResources` directory is added to the project containing the `xlf` files.

**Localization**

> One thing we found ... is that we only wanted to change CurrentUICulture and not CurrentCulture. This was because setting CurrentCulture to say French meant that some VB functions behaved differently. The worst one for us was IsNumeric("2.3") returning True in English but False in French because for French it needed to be IsNumeric("2,3") to return True. Setting CurrentUICulture seemed much safer as it only effects visual aspects
([original code](https://github.com/opencdms/Climsoft/blob/0b205d8ef56fc88c367760cf5f078aed8116658f/ClimsoftVer4/ClimsoftVer4/frmLanguage.vb)).

**Resource files**

- [Prevent translation of resource file](https://stackoverflow.com/questions/35577608/prevent-language-translation-of-resource-file-in-visual-studio-2015)
