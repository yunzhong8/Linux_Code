
Table of Contents
=================

* [shell编程笔记](#shell编程笔记)
   * [Shell](#shell)
      * [什么是shell](#什么是shell)
      * [shell类型](#shell类型)
      * [编码格式：](#编码格式)
      * [注释符号](#注释符号)
      * [使用流程](#使用流程)
      * [shell案例2](#shell案例2)
      * [符号：](#符号)
      * [变量：](#变量)
      * [字符串拼接](#字符串拼接)
      * [接受用户输入](#接受用户输入)
      * [删除变量](#删除变量)
      * [shell内部执行sudo名](#shell内部执行sudo名)
         * [使用文本块输入重定向](#使用文本块输入重定向)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
# shell编程笔记

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
```
#!/bin/bash 表示指定系统当前脚本要使用的shell解释器
#!/usr/bin/python 开头的脚本文件表示使用python解释器去执行
#!/usr/bin/env 解释器名称，是一种在不同平台上都能正确找到解释器的办法
```

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

```
### 使用流程

1. 创建.sh文件    指令：touch/vim zzgg.sh

2. 编写shell代码 

3. 执行shell脚本   注意：脚本必须得有执行权限
bash执行失败，提示权限不够可以
```
chomid 777 ./zzgg.sh
```
进行赋予权限
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
命令:cat 待合并文件1 待合并文件2.....
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
### shell内部执行sudo名
```
密码是数字时
echo 123 | sudo -S 命令
密码时字符串时
echo "zzqgyy" | sudo -S 命令
```
#### 使用文本块输入重定向
```
sudo -S sh zzgg.sh <<EOF
[password]
EOF
```
使用举例：
```
sudo -S sh zzgg.sh<<EOF
123456
EOF
```

