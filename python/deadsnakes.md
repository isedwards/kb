```
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install python3.5
sudo apt-get install python3.6
sudo apt-get install python3.7
```

The default version of python inside a virtualenv is the version used to create the environment, e.g.
```
python3.6 -m venv my-venv-name
```

Note for example that Python2.7 and Python3.6 are not dead snakes on Ubuntu 18.04 (although Python2.7 needs to be installed with `sudo apt install python2.7-minimal`)


`$ sudo add-apt-repository ppa:deadsnakes/ppa`

> This PPA contains more recent Python versions packaged for Ubuntu.
> 
> Disclaimer: there's no guarantee of timely updates in case of security problems or other issues. If you want to use them in a security-or-otherwise-critical environment (say, on a production server), you do so at your own risk.
> 
> Update Note
> ===========
> Please use this repository instead of ppa:fkrull/deadsnakes.
> 
> Reporting Issues
> ================
> 
> Issues can be reported in the master issue tracker at:
> https://github.com/deadsnakes/issues/issues
> 
> Supported Ubuntu and Python Versions
> ====================================
> 
> - Ubuntu 16.04 (xenial) Python 2.3 - Python 2.6, Python 3.1 - Python3.4, Python 3.6 - Python3.9
> - Ubuntu 18.04 (bionic) Python2.3 - Python 2.6, Python 3.1 - Python 3.5, Python3.7 - Python3.9
> - Ubuntu 20.04 (focal) Python3.5 - Python3.7, Python3.9
> - Note: Python2.7 (all), Python 3.5 (xenial), Python 3.6 (bionic), Python 3.8 (focal) are not provided by deadsnakes as upstream ubuntu provides those packages.
> - Note: for focal, older python versions require libssl1.0.x so they are not currently built
> 
> The packages may also work on other versions of Ubuntu or Debian, but that is not tested or supported.
> 
> Packages
> ========
> 
> The packages provided here are loosely based on the debian upstream packages with some modifications to make them more usable as non-default pythons and on ubuntu.  As such, the packages follow debian's patterns and often do not include a full python distribution with just `apt install python#.#`.  Here is a list of packages that may be useful along with the default install:
> 
> - `python#.#-dev`: includes development headers for building C extensions
> - `python#.#-venv`: provides the standard library `venv` module
> - `python#.#-distutils`: provides the standard library `distutils` module
> - `python#.#-lib2to3`: provides the `2to3-#.#` utility as well as the standard library `lib2to3` module
> - `python#.#-gdbm`: provides the standard library `dbm.gnu` module
> - `python#.#-tk`: provides the standard library `tkinter` module
> 
> Third-Party Python Modules
> ==========================
> 
> Python modules in the official Ubuntu repositories are packaged to work with the Python interpreters from the official repositories. Accordingly, they generally won't work with the Python interpreters from this PPA. As an exception, pure-Python modules for Python 3 will work, but any compiled extension modules won't.
> 
> To install 3rd-party Python modules, you should use the common Python packaging tools.  For an introduction into the Python packaging ecosystem and its tools, refer to the Python Packaging User Guide:
> https://packaging.python.org/installing/
> 
> Sources
> =======
> The package sources are available at:
> https://github.com/deadsnakes/
> 
> Nightly Builds
> ==============
> 
> For nightly builds, see ppa:deadsnakes/nightly https://launchpad.net/~deadsnakes/+archive/ubuntu/nightly
>  More info: https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa
