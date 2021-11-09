# aruco

This repo is modified from the [official source](https://www.uco.es/investiga/grupos/ava/node/26)

To learn the Aruco libaray, read the [official documentation](https://docs.google.com/document/d/1QU9KoBtjSM2kF6ITOjQ76xqL7H0TEtXriJX5kwi9Kgc)

# Installation with vcpkg

First clone this repo

```bash
git clone https://github.com/boxiXia/aruco.git
cd aruco

```
Next copy the ```ports`` folder to the vcpkg root folder
Open a terminal in vcpkg folder

For windows, run:
```bash
# install prerequisite: opencv
vcpkg install opencv[eigen,opengl,openmp]:x64-windows
# install aruco
vcpkg install --head aruco:x64-windows

```

For linux, run:
```bash
# install prerequisite: opencv
vcpkg install opencv[eigen,opengl,openmp]:x64-linux
# install aruco
vcpkg install --head aruco:x64-linux
```

# change log
## [3.1.12.1] - 2021-11-08
Added:
 - Added support for vcpkg

Fixed
 - Fix exported yml header format
Modified
 - Modified sglviewer font scale

