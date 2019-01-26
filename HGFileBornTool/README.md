# HGFileBornTool
这个项目主要是用来生成 **fsh** 与 **fpy** 这两个工具的。下载代码之后是这样的。  
![](https://user-gold-cdn.xitu.io/2019/1/26/16888c3e1629fde2?w=410&h=330&f=png&s=34820)  

### 1. command 文件
在上图中有一个文件 **Release.command** 这个文件是 Mac 系统的文件，能直接通过点击就能执行文件中的代码。所以你直接点击这个文件之后，那么在你的终端就可以直接使用 fsh 与 fpy 了，你可以试试。

### 2. HGFileBornTool 项目运行
还有另一种方式是打开项目 **HGFileBornTool**，然后直接快捷键：command + b。这样在你的终端也可以直接使用 **fsh** 与 **fpy** 了。

### 3. 技术实现
关于 **fsh** 与 **fpy** 的生成过程，主要是依赖于 **command** 与 **Makefile** 文件来实现的自动化。具体的细节不展开，一看就懂，很简单的。关于 **fsh** 与 **fpy**的实现，我就不好意思提了，毕竟太简单了，简单得都不好意思拿出手，主要见 **main.m** 文件。 
