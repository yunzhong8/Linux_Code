# 目录
[toc]
# what is .bashrc
.bashrc是home目录下的一个shell文件，用于储存用户的个性化设置。在bash每次启动时都会加载.bashrc文件中的内容，并根据内容定制当前bash的配置和环境。

补充： .bash_profile和.bashrc的区别？
两者在登陆bash时都会被bash执行，但是.bash_profile只在会话开始时被读取，而
.bashrc在每次打开新的终端时都会被读取。
##### 如何打开.bashrc
'''
vim ~/.bahsrc
'''

————————————————
版权声明：本文为CSDN博主「E.die」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/Heyyellman/article/details/111565781
## 指令
指令结构：指令主体 【选项】【操作对象】

选项可以有多个（顺序无关）， 操作对象也可以有多个

指令易错点:空格，指令间有些必须有空格
### root权限执行指令
指令：sudo

在终端输入sudo+其他指令，则其他指令想到在root权限执行，用于解决某些指令只能在root权限下执行
### 路径
1. ./表示当前目录下
2. ../表示上级目录
3. /表示：根目录
4. “-”表示该行对应文档类型是文件
5. “d”表示文档类型为文件夹
6. “.”开头的文件名为隐藏文件
7. 输出结果中：第一列字符为文档类型，
8. 数字为文档大小，
9. “~”表示当前用户的家目录
### 符号
#### *---->>通配符

linux*表示以linux开头后续是任何的文件或文件夹
#### ”“------->>整体符号

引号表示将引号内部分的视为一个整体

单引号和双引号含义一致
## 基础指令
### ls指令---->列出当前目录所有文件夹和文件名称

ls是单词list的简写，

**用法**

+ #ls:列出当前目录所有文件夹和文件名
+ #ls+路径：表示列出该路径下的所有文件夹和文件名称
+ #ls 选项 路径：

+ -l 表示以详细列表的形式进行展示
+ -a表示：显示所有文件和文件夹，包括隐藏文件和文件名
+ -h表示以列表形式列出文件夹和文件名

颜色:蓝色表示文件夹，黑色表示文件，绿色表示该用户对其具有全部权限
![](https://gitee.com/zz--yy/mark-down-picture/raw/master/Linx_MD/2023-01-29%2022-41-32.png)
![](https://github.com/yunzhong8/MarkDownPicture/raw/master/Linx_MD/2023-01-29%2022-41-32.png)
### pwd命令----->>打印当前工作的路径

命令：#pwd

是:print working directory 的简写

用于一些路径问题，可以该命令查看路径

### cd命令-------->>切换路径

命令：#cd 目录

if:当前在“/”下，需要使用绝对路径进行切换
命令：#cd ~

切换到当前用户的家目录
### mkdir命令------>>创建目录

命令：#mkdir 路径（文件夹名称也可使）
指令路径下创建文件夹

命令：# mkdir  ./zzq/ss

-p表示：实现多层目录创建
创建多个目录

命令：mkdir 目录1 目录2 目录3......
### 创建多个目录
命令：mkdir 目录1 目录2 目录3......
### touch指令-------->>创建文件

命令：#touch 文件路径（可是路径，也可以文件名）

创建多个文件
命令：touch 文件路径1 文件路径2 文件路径3.....
### cp指令------>>复制文件/文件夹到指定位置

命令：#cp 被复制文件路径 复制到的文件路径

复制多个文件夹中全部文件到另外一个文件夹，可以使用通配符*
### mv指令-------->>移动文档到新位置

命令：#mv 需要移动的文件路径 新的保存位置路径

移动后原路径就不再有被移到的文件
### 重命名：mv命令

命令：mv 代改名路径  要改成名的路径
### rm命令---->>删除文件和文件夹

命令：rm 选项 路径

-y：表示：

-f表示：强制删除（避免弹出一大堆选项）force简写

-r:表示：删除目录
 rm 路径1，路径2，路径3.....
vim指令----->>进入vim编辑器

命令：vim
### >/>>指令--------->>输入输出重定向

#### 命令：>

覆盖输出，会覆盖原先的文件内容

#### 命令：>>

追加输出，不会覆盖原始文件内容，会在原始内容末尾继续添加

例子：使用覆盖重定向，保存ls-la的执行结果，到其他地方

命令：ls -la > ls.txt
例子：>>

命令：pwd >> ls.txt

将pwd的运行结果添加入ls.txt
### cat指令-------->>直接打开文件， 合并文件

命令：cat 文件路径
命令:cat 待合并文件1 待合并文件2.....
### passwd命令------>>修改用户密码

命令格式：passwd 用户名

passwd必须在root权限下执行，本应该切换到root用户，但可以用前面提到的sudo命令

sudo passwd zzqgyy

修改用户zzqgyy的密码
## 进阶指令
### df指令----->>查看磁盘空间

命令：# df

命令：#df -h 以表格形式显示
### free指令------------>>查看内存空间

指令：free
### head指令----------->>查看文件前n行

指令: tail 数字  文件路径
### tail指令------------->>查看文件末尾n行

指令: tail 数字  文件路径
### less指令--------->>查看文件

指令：less 文件路径
### wc------------->>统计文件内容信息（行数，单词数，字节数）

指令：wc  l 选项 文件路径

-l :表示行数

-w:表示单词数

-c:表示字节数
### date--------------->>操作时间（设置，获取）

#### 指令：date 

输出系统当前时间：eg：2023年1月19 星期 12：43：（不常用）

cst表示中国时间

%F表示完整的年月日

%T:表示完整的时分秒

%Y:表示四位年份

%m:表示2位月份（带前导0）

%d:表示日期（带前导0）

%H:表示小时（带前导0）

%M表示分钟（带前导0）

%S表示秒数（带前导0）

#### 指令：date +%F 等价（date +"%Y-%m-%d"）

输出形为：2023-1-19

指令：date “+%F%T"

输出年月日时分秒

指令:date  -d "-1day"  ”+%F“

-d表示获取过去未来时间

单位:day 天

-1:表示前一天
+1：表示未来的一天

其他单位；year month
获取之前或之后的某个时间（用于定期备份）
### cal指令-------------->>操作日历

指令：cal

等价指令：cal -1

输入：当月份日历
### clear/ctrl+L---------------->>清口控制台

## 管道：

### 管道符号：”|“

作用:管道一般可以用于”过滤“，”特殊“，”扩展处理“

语法：管道不能单独使用，必须配合前面所讲的一些指令来一起使用，其作用主要是辅助作用。

管道符号前面指令的输出就是管道符号后面指令的输入，以管道符号位分界符号
过滤l：s/gerp

需要通过管道查询出根目录下包含”y“字母的文档名称

指令：ls /| grep y

特殊：cat/less

扩展处理：ls/wc
## 高级指令
### hostname----------->>查看主机名

命令：hostname

表示输出当前完整的主机名
 命令：hostname -f

表示输出当前主机名的全限名称
### id指令----------------->>查看用户基本信息

指令：id

输出当前用户的基本信息
指令 ：id 用户名

输出特定用户名的基本信息
### whoami指令---------------->>我是谁即当前用户名
指令：whoami
 一般用于shell脚本编写
### ps ------------>>查看当前进程信息

选项

-e表示列出全部进程

-f表示列出全部的列

指令：ps -ef
### top指令----------------->>查看进程占用资源

指令：top
### du指令-------->>查看目录大小
### find指令--------->>查找文件

指令:find 路径 选项 选项的值（eg：文件类型，文件名）

选项：

-name 按照文档名称进行搜索（支持模糊搜索）

-type 按照文档的类型
###  service指令------------>>用于控制一些软件的复位启动/停止/重启

指令：service 服务名 start/stop/restart
### kill ---------->>杀死进程

指令：kill   进程名
### chmod指令--------->>给文添加权限

指令：chmod 选项 文件路径
### ll -------------->>列出文件，包括文件权限
## Shell
### 什么是shell

使一个用c语言编写的程序，它是用户使用Linux的桥梁，shell命令语言，又是一种程序设计语言。

shell是指一种应用程序，这个应用程序提供了一个界面，用户通过这个界面访问操作系统内核的服务

 linux中的默认的shell是/bin/bash(重点)

前面所学的linux命令都是shell命令，可直接写在shell文件中
### shell类型
csh：shell使用的”类C“语法，是c语言风格,52个指令
ksh:语法和Bourne shell相同，具备Cshell易用特点

sh:

zsh:

bash:大多数linux默认的shell

直接输入help可以看到shell的命令
### 编码格式：
代码规范：

#!/bin/bash 表示指定系统当前脚本要使用的shell解释器
文件命名规范:

文件名.sh

.sh是linux下bash shell的默认后缀名
### 注释符号

单行:
```
#
```
多行：
```
:<<eof
注释
eof
```
```
    ：<<!
    z注释
    ！
```
```
    ：'
    注释
    '
```
### 使用流程

1. 创建.sh文件    指令：touch/vim zzgg.sh

2. 编写shell代码 

3. 执行shell脚本   注意：脚本必须得有执行权限
shell的hello word
```
#'/bin/bash  #表示解释器在/bin/bash
echo "hello word" #表示输出hello word
```
 运行

注意：要写出./形式，表明文件路径
### shell案例2
```
#'/bin/bath
touch ./try.html
```
### 符号：

A+=B表示将B的值添加入A,用于拼接字符串
### 变量：

单引号：’$zzqgyy‘zzqgyy将视为字符串

双引号：’$zzqgyy‘zzqgyy将视为变量

定义形式：class_name ="zzq" （等于号作用不能有间隔，不然会被识别成命令）

定义变量class_name其值是zzq

变量使用形式：$cllass_name

表示这部分是一个变量其值是zzq
```
#'/bin/bash
doc_name="try2.html"
doc_route=$(pwd)#将pwd命令的结果赋值给变量doc_route
echo $doc_route
```
### 字符串拼接
```
#'/bin/bash
doc_name="try2.html"
doc_route=$(pwd)

echo $doc_route$doc_name#拼接两个变量的字符
```
### 接受用户输入

指令：read -p  提示信息 变量x

输入值传给变量x
```
#'/bin/bash
doc_name="try2.html"
doc_route=$(pwd)
read -p "please input hello wrod" data#用户输入数据保存到data
echo "congraculate you input right $data"#输出：恭喜用户正确输入hello word
echo $doc_route$doc_name
```
### 删除变量
指令：unset 变量名
 条件判断语句
 ```
 if condition

then

        command1

fi
```
语法2
```
if condition

then

        command1

else

        command

fi
```
语法3
```
if condition1

then

        command1

elif condition2

then

command2

else

        commandN

fi
```
### 运算符
算术运算符

+ 加法

-减法

*乘法

/除法

%取余

=赋值

==相等

!=不等

表达式和运算符间必须有空格，
杂项

截屏方法：

直接到设置里面查看截屏快捷键

>>设置>>键盘>>截图
## 杂项

### 截屏方法：

直接到设置里面查看截屏快捷键

>>设置>>键盘>>截图
### 开启多个终端的方法

需要同时开启多个终端完成任务，可以安装一个软件，terminator
安装指令：
sudo apt-get install terminator
随后点击输入y
安装完毕 

在terminal中运行命令:termiantor，则会打开一个新的终端（由termiantor管理的

 终端在一直运行termiantor这个程序

#### 1.分割终端窗口

　　如何通过Terminator来运行多个GNOME终端窗口呢?我们在Terminator窗口的空白区域点击鼠标右键，在弹出的快捷菜单中可以看到“水平分割”和“垂直分割”两项。“水平分割”是从水平方向将窗口分为左右两个部分，每部分放置一个终端窗口;“垂直分割”是从竖直方向将当前窗口分为上下两个部分，每部分放置一个终端窗口。


### 查看网络状态
#### 安装网络工具组件
```
sudo apt install net-tools
```
#### 查看网络基本信息
```
ifconfig
```
#### 网卡
```
ifconfig 网卡名 down #关闭使用中的网卡
ifconfig 网卡名 up  #打开使用中的网卡
ifconfig 网卡名 ip地址 #更改当前的ip地址
```
#### 查看网络链接
```
ping url #ping一个网络地址，检查是否ping成功，
```
## 实现实时显示网速
```
#安装speedtest
sudo apt install speedtest-cli
#运行speedtest
speedtest-cli
```
## Linux常见文件后缀
### 压缩和打包文件
+ .bz2 — 使用bzip2命令压缩的文件，可以使用bzip2 -d filename 解包
+ .gz — 使用gzip命令压缩的文件，可以使用gunzip -d filename 解包
+ .tar — 使用tar打包的文件，即tarball文件，可以使用tar xf filename 解包
+ .tbz — 使用tar打完包后再以bzip2命令压缩的文件，可以使用tar jxf filename 解包
+ .tgz — 使用tar打完包后再以gzip命令压缩的文件，可以使用tar zxf filename 解包
### 普通文件
+ .au — 声音文件，可以使用系统的声音播放器或者是JAVA程序播放
+ .gif — GIF图像文件，可以使用WEB浏览器查看
+ .html/.htm — HTML文件，可以使用WEB浏览器查看
+ .jpg — JPEG图像文件，可以使用WEB浏览器查看
+ .pdf — 文档的电子版本，PDF是一种电子文档的标准，可以使用xpdf或者是adobe acrobat reader阅读
+ .png — PNG图像文件，PNG是Portable Network Graphic的简写，可以使用WEB浏览器或者图像浏览器查看
+ .ps — PostScript文件，一种打印格式文件，可以使用ghostview或者是支持ps查看的图像浏览器查看，也可以直接输出给打印机打印
+ .txt — 文本格式文件，可以使用任何编辑器查看
+ .wav — 声音文件，可以使用声音播放器播放
+ .xpm — XPM图像文件，可以使用图像查看器查看
### 系统文件
+ .conf — 某个程序的配置文件，一般可以使用vi进行编辑
+ .lock — 某个程序的锁定文件，用于检测某个程序在执行或者某个设备或者资源正在使用
+ .rpm — RedHat的软件包管理器文件，用于安装软件
### 程序和脚本文件
+ c — C语言程序源码文件
+ .cpp — C++语言程序源码文件
+ .h — C或C++语言的头文件
+ .o — 程序对象文件
+ .pl — Perl脚本文件
+ .so — 动态链接库文件
+ .tcl — TCL脚本文件
## Linux常见文件
### Vim配置文件
.vimrc
route: ~/.vimrc

