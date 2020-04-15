# OPENCV Installation 
[Opencv](https://opencv.org/)

[Opencv Doc](https://docs.opencv.org/master/d7/d9f/tutorial_linux_install.html)

[Learn OPENCV - Install OpenCV3 on Ubuntu](https://www.learnopencv.com/install-opencv3-on-ubuntu/)
[Learn OPENCV - Install OpenCV3 on Ubuntu](https://www.learnopencv.com/install-opencv-4-on-ubuntu-18-04/#viewSource)

[How to Install OpenCV on Ubuntu 18.04](https://linuxize.com/post/how-to-install-opencv-on-ubuntu-18-04/)

```
git clone https://github.com/opencv/opencv.git 

git clone https://github.com/opencv/opencv_contrib.git 
```

```
cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DINSTALL_C_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON -DOPENCV_GENERATE_PKGCONFIG=ON -DOPENCV_EXTRA_MODULES_PATH=/home/gaurav/Other_Drive/Libraries/opencv_contrib/modules -DBUILD_EXAMPLES=ON ..
```
Same as above
```
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_C_EXAMPLES=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_build/opencv_contrib/modules \
    -D BUILD_EXAMPLES=ON ..
```

 

No of processors - `nproc`  
```
make -j12 
sudo make install
```
This step is not needed always: 

`sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf' `

This is a needed step:

`sudo ldconfig`

[What is Sudo Ldconfig in Linux?](https://www.quora.com/What-is-Sudo-Ldconfig-in-Linux)

# Uninstall Opencv
Go to build directory and: `sudo make uninstall`
or
```
cd ~
cd /usr/local/
```
`cd` to each folder and then 
`sudo rm -rf *opencv*`

*Do not use this it deletes all the opencv* - [How to Uninstall OpenCV](https://medium.com/@changrongko/opencv-how-to-uninstall-opencv-dfe1a5a50193)

`sudo find / -name "*opencv*" -exec rm -rf {} \;`

# Problems
[Anaconda environments prevent CMake from generating a safe runtime search path](https://github.com/pism/pism/issues/356)

To avoid pkgconfig issue set this option `-D OPENCV_GENERATE_PKGCONFIG=ON`

[4.0.0 does not produce pkgconfig file](https://github.com/opencv/opencv/issues/13154#issue-380404751)

https://github.com/Project-OSRM/osrm-backend/issues/5117 

# Linker error

```
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get upgrade
```
[libstdc++.so.6: version `GLIBCXX_3.4.22' not found](
https://github.com/lhelontra/tensorflow-on-arm/issues/13)

# g++ and gcc version

[CMake complains about GCC version but newer is installed](https://github.com/Project-OSRM/osrm-backend/issues/5117) 

`g++ --version`

g++ (GCC) 6.3.0 

Copyright (C) 2016 Free Software Foundation, Inc. 

This is free software; see the source for copying conditions.  There is NO 

warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 

`/usr/bin/g++ --version` 

g++ (GCC) 4.8.5 20150623 (Red Hat 4.8.5-16) 

Copyright (C) 2015 Free Software Foundation, Inc. 

This is free software; see the source for copying conditions.  There is NO 

warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 

  
```
export CC=`which gcc` 
export CXX=`which g++` 
```