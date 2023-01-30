# 环境变量添加
## 简易环境变量添加
### 1. 修改/etc/bashrc或者～/.bashrc文件，
对于/etc/bashrc文件，修改的作用于所以用户，
但对于~/.bashrc文件，修改的仅仅作用于当前用户。
这种修改的作用也是永久性的，添加方法有下面两种：
```
export PATH=$PATH:[your path] #方法1 
 export PATH=[your path]:[...]:$PATH #方法2
```

### 2. 使环境变量生效 
```
source ~/.bashrc
```
##其他环境添加方法
        注：若只想简单地实现环境变量的添加，那看到这里就可以了；若要了解环境变量的详细介绍和其他添加方法，感兴趣的可以继续阅读

###详解：
#### 添加位置
        以下是5个添加环境变量的位置，其作用时间和作用域有所不同。

        1. /etc/profile

        此文件为系统的每个用户设置环境信息,当用户第一次登录时,该文件被执行.并从/etc/profile.d目录的配置文件中搜集shell的设置；

        2. /etc/environment

        在登录时操作系统使用的第二个文件,系统在读取你自己的profile前,设置环境文件的环境变量；

        3. /etc/bashrc

        为每一个运行bash shell的用户执行此文件.当bash shell被打开时,该文件被读取；

        4. ~/.profile

        每个用户都可使用该文件输入专用于自己使用的shell信息，当用户登录时，该文件仅仅执行一次！默认情况下,它设置一些环境变量,执行用户的.bashrc文件；

        5. ~/.bashrc

        该文件包含专用于你的bash shell的bash信息,当登录时以及每次打开新的shell时,该文件被读取；

#### 添加方法
1. 方法一：

直接修改/etc/enviroment文件，这种方法的作用域是全局的，永久性的。

#打开/etc/environment文件，其内容如下：
 
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games" 
 
#在环境变量PATH中添加你要添加的路径即可。
2. 方法二：修改/etc/profile文件，这种方法的作用域是全局的，永久性的。

#这个文件不是保存环境变量信息的文件，在登录时，系统只是根据它的内容对环境变量进行设置。
#其中，各个PATH之间用冒号分隔，$PATH指代添加your path前的环境变量。
 

    export PATH=$PATH:[your path1]:[your path2]:[...]  
    export PATH=[your path1]:[your path2]:[...]:$PATH


3. 方法三：修改/etc/bashrc或者～/.bashrc文件，这两个文件同样不是为了保存环境变量，只是在使用bash shell时进行设置而已，所以设置方法和二中一样。对于/etc/bashrc文件，修改的作用于所以用户，但对于~/.bashrc文件，修改的仅仅作用于当前用户。这种修改的作用也是永久性的。

    export PATH=$PATH:[your path1]:[your path2]:[...]  
    export PATH=[your path1]:[your path2]:[...]:

原文链接：https://blog.csdn.net/lau_jw/article/details/126053815
常用环境变量意义
+ PATH：决定了 shell 将到哪些目录中寻找命令或程序
+ HOME：当前用户主目录
+ HISTSIZE：历史记录数
+ LOGNAME：当前用户的登录名
+ HOSTNAME：指主机的名称
+ SHELL：当前用户 Shell 类型
+ LANGUGE：语言相关的环境变量，多语言可以修改此环境变量
+ MAIL：当前用户的邮件存放目录
+ PS1：基本提示符，对于 root 用户是 #，对于普通用户是 $
原文链接：https://blog.csdn.net/qq_20986663/article/details/126854343
