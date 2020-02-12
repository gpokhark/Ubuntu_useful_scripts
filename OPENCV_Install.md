# OPENCV Installation 
https://opencv.org/ 

https://docs.opencv.org/master/d7/d9f/tutorial_linux_install.html 

https://www.learnopencv.com/install-opencv3-on-ubuntu/ 

```
git clone https://github.com/opencv/opencv.git 

git clone https://github.com/opencv/opencv_contrib.git 
```

```
cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DINSTALL_C_EXAMPLES=ON -DWITH_TBB=ON -DWITH_V4L=ON -DWITH_QT=ON -DWITH_OPENGL=ON -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules .. 
```

OR
```
cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DOPENCV_EXTRA_MODULES_PATH=/home/gaurav/Downloads/opencv_contrib/modules .. 
```
 

No of processors - `nproc`  
```
make -j12 
sudo make install 
sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf' 
sudo ldconfig
```


https://github.com/Project-OSRM/osrm-backend/issues/5117 

 
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
[How to Uninstall OpenCV](https://medium.com/@changrongko/opencv-how-to-uninstall-opencv-dfe1a5a50193)

*Do not use this it deletes all the opencv*

`sudo find / -name "*opencv*" -exec rm -rf {} \;`