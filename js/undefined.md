I prefer to use `typeof` to test for variables that are undefined. This has the advantage of still working if the variable is undeclared (i.e. if `var myVar;` is removed).

    var myVar;
    alert(typeof myVar == 'undefined');

The argument for using `myVar === undefined` instead is [here](https://stackoverflow.com/a/3390635/), but an error will be raised if the variable is undeclared:

    try {
        myVar2 === undefined;
    } catch (e) {
        alert(e.toString());
    }
