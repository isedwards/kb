## Multilingual App Toolkit

> One thing we found ... is that we only wanted to change CurrentUICulture and not CurrentCulture. This was because setting CurrentCulture to say French meant that some VB functions behaved differently. The worst one for us was IsNumeric("2.3") returning True in English but False in French because for French it needed to be IsNumeric("2,3") to return True. Setting CurrentUICulture seemed much safer as it only effects visual aspects.
([original code](https://github.com/opencdms/Climsoft/blob/0b205d8ef56fc88c367760cf5f078aed8116658f/ClimsoftVer4/ClimsoftVer4/frmLanguage.vb))

**Resource files**

- [Prevent translation of resource file](https://stackoverflow.com/questions/35577608/prevent-language-translation-of-resource-file-in-visual-studio-2015)
