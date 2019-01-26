# HGFileBornTool
实现一键式自动化操作（快速创建 Python 与 Shell 文件）

## 一、生成 fsh 与 fpy
![](https://user-gold-cdn.xitu.io/2019/1/26/16888c3e1629fde2?w=410&h=330&f=png&s=34820)  
下载代码之后是这样的。
### 1.1 command 文件
在上图中有一个文件 **Release.command** 这个文件是 Mac 系统的问题，能直接通过点击就能执行文件中的代码。所以你直接点击这个文件之后，那么在你的终端就可以直接使用 fsh 与 fpy 了，你可以试试。

### 1.2 HGFileBornTool 项目运行
还有另一种方式是打开项目 **HGFileBornTool**，然后直接快捷键：command + b。这样在你的终端也可以直接使用 fsh 与 fpy 了。

### 1.3 技术实现
关于 **fsh** 与 **fpy** 的生成过程，主要是依赖于 **command** 与 **Makefile** 文件来实现的自动化。具体的细节不展开，一看就懂，很简单的。关于 **fsh** 与 **fpy**的实现，我就不好意思提了，毕竟太简单了，简单得都不好意思拿出手，主要见 **main.m** 文件。 

## 二、 使用效果
### 2.1 Shell 文件的创建
关键字：fsh。  
通过如下指令：  
> fsh filename  

生成一个 filename.sh 的文件：  

![](https://user-gold-cdn.xitu.io/2019/1/26/16888a502f1ebe9f?w=1200&h=700&f=png&s=40880)


### 2.2 Python 文件的创建
关键字：fpy。
### 2.2.1 普通文件
通过如下指令：  
> fpy filename  

生成一个 filename.py 文件：  

![](https://user-gold-cdn.xitu.io/2019/1/26/16888a706e0d8910?w=1200&h=700&f=png&s=57455)

### 2.2.2 包文件
通过如下指令：  
> fpy packagename p

**注意**：这个指令与普通创建就多了一个参数作为区分。  
生成一个 packagename 的包文件，如下所示：

![](https://user-gold-cdn.xitu.io/2019/1/26/16888a94aec7c23e?w=822&h=266&f=png&s=26375)


> **从不浪费时间的人，没有工夫抱怨时间不够。 —— 杰弗逊**

## 三、技术同步
已分别同步简书与掘金：   
简书：[实现一键式自动化操作（快速创建 Python 与 Shell 文件）](https://www.jianshu.com/p/c752298bf4a1)  
掘金：[实现一键式自动化操作（快速创建 Python 与 Shell 文件）](https://juejin.im/post/5c4b0fcd51882525da266cfc)  
