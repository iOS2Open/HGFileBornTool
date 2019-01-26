# 终端批量修改文件名(方便又实用)

有一个这样的文件夹：
 
![image.png](https://upload-images.jianshu.io/upload_images/1198135-04fe49d677099d0d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


## 1.场景一
把所有的文件都加一个前缀 **hg_** ：
```
for file in *;do mv $file `echo "hg_"$file`;done
```  
没错， 一个终端命令就可以了：

![image.png](https://upload-images.jianshu.io/upload_images/1198135-a3ceddaf0de35ead.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


## 2.场景二
把每种文件加上一个后缀 **_hg**:
```
 for file in *.sample;do mv "$file" "${file%.sample}"_hg".sample" ;done
```

修改之后，是这样的：

![image.png](https://upload-images.jianshu.io/upload_images/1198135-ec04d0766644fbf0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

就这种情况，如果把后缀名都去掉，name 可以这样:
```
 for file in *.sample;do mv "$file" "${file%.sample}" ;done
```

修改之后， 是这样的：

![image.png](https://upload-images.jianshu.io/upload_images/1198135-dab1943e2afe93c9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


## 3.场景三
文件名大小写转换, 比如小写转大写：
```
 for file in * ;do mv  $file `echo $file |  tr 'a-z' 'A-Z'`;done
```

修改之后，是这样的：

![image.png](https://upload-images.jianshu.io/upload_images/1198135-2e933d61ee8e825f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

同样的道理，大写转小写：
```
for file in * ;do mv  $file `echo $file |  tr 'A-Z' 'a-z'`;done
```

结果回到原来的样子:

![image.png](https://upload-images.jianshu.io/upload_images/1198135-d551c16a11b2543b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 场景四
修改一个文件夹中的所有文件权限，cd 到文件夹的父级目录，然后执行：
> chmod +x hooks/

其中 **hooks** 就是所有文件的的文件夹。


## 4.练习题
将上面的所有文件，去掉前缀 **hg_** 与 后缀 **_hg**。其中的一个方法是分别执行下面的这两句指令：
###### ~~去 掉 前 缀~~
```
 for file in hg_*_hg;do mv "$file" "${file##*hg_}" ;done
```

###### ~~去 掉 后 缀~~
```
for file in *_hg;do mv "$file" "${file%%_hg}" ;done
```

这种方式太繁琐了，下面有更加简单的。
 ###### 高大上的方法：
```
for file in *; do newFile=${file##*hg_} ; newFile=${file%%_hg}; mv "$file" "${file%%_hg}" ;done
```

 一句命令， 直接搞定。



## 5.温馨提示

这个实验并非凭空而来，大家可以参考这篇文章 [Git - 钩子](https://git-scm.com/book/zh/v2/自定义-Git-Git-钩子)。上面带有 **.sample** 的文件，一般都会在 **.git/hooks** 目录中，但是实际使用中需要将这些文件的后缀都去掉，然后再给这些文件附以执行权限。如果使用手工修改的话，其实工作量也不小。
