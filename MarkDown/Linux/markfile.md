# 目录
[toc]

学习困难（记录原因：等直自己学会了后就记不清新手学习难度哪里了）

目前正在学习makefile，发现教学资料逻辑很差会，看完视频或博客，看视频的时候，使用到的指令和格式都没有太清晰的介绍，直接掏出来用，我直接懵逼，我希望所讲和所用的东西必须是前面视频介绍过的，这样都是一步依赖一步

博客介绍了命令，可是没有运行图片，命令格式我也看不懂。不确定如何在linux的终端运行，或如何写在makefile中

由于之前是window系统使用id，不太清楚代码文件到可执行文件过程的编译过程，什么编译，链接，中间文件格式

还有makefile知识框架是如何，目前阅读内容都没有清晰的介绍过，
教学视频链接http://【makefile从入门到项目编译实战】 https://www.bilibili.com/video/BV1Xt4y1h7rH/?share_source=copy_web&vd_source=9bde3253403585a8653b051b6c6d021d
makefile是什么

makefiles是一个文件，规定了一些代码文件的编译顺序和规则（不支持跨平台），
make是什么

make是执行makefile的程序，运行make执行makefile文件，进行便于编译文件(不支持跨平台),（cmake支持跨平台）

## make安装
### makefile基本语法

基本格式： 目标：依赖

                      tab 命令

#### 目标：
一般指要编译的目标，也就是一个动作

#### 依赖：
执行当前目标所依赖的先前项，包括其他目标

#### 命令：
 该目标下要执行的具体命令，可以没有，eg:

    a:b#文件a依赖b
        @echo "hello world"#执行命令，打印"hello word"

make以其他文件作为makefile文件

make命令的选项-f表示：可以指定除上述文件名之外的文件作为输入文件

#### 选项 

-v表示：显示版本号

-n表示：只输出命令，但并不执行，一般用于测试

-s表示：只执行命令，但不显示具体命令，此chu

-w表示:显示执行前执行后的路径

-C dir表示：指定makefile所在的目录
## makefile变量
### 系统变量

$*不包括扩展名的目标文件名称

$+所有依赖文件，以空格分隔

$<表示：规则中的第一个条件

$?表示：所有时间戳比目标文件晚的依赖文件，以空格隔开

$@目标文件的完整名称

$^所有不重复的依赖文件，以空格分隔

$%if目标是归档成员，then该变量表示目标的归档成员名称
### 系统常量(可用make -p查看)

AS 汇编程序名称，默认为as


CC C编辑器名称 默认cc

CPP C预编辑器名称 默认 cc-E

CXX C++编译器名称 默认g++

RM 文件删除程序别名 默认 rm-f

### 自定义定量

定义：变量名=变量值

使用；$(变量名)/${变量名}

    object = program.o foo.o utils.o#定义变量object,其值是 3个.o文件即program.o foo.o utils.o，
    #所以凡是那里要用到这三个.o文件位置可直接用object这个变量代替即$(object)
    program: $(object)#program这个文件依赖变量object代指的文件

## 一个hello word
需要新建一个main.cpp文件
```
 //一个简单c程序，运行即打印hello word
     #include <stdio.h>
     int main()
     {
         printf("hello word \n");
         return 0;
     }

```
makefile写法如下
```
 main:main.o#编译结束的可执行程序名为:main,其依赖main.o
         gcc main.o -o main#gcc表示编译器是c++,将文件main.o编译为main
     main.o:main.cpp#中间文件main.o依赖mian.cpp
         gcc -c main.cpp -o main.o#使用c++编译器将mian.cpp编译为main.o文件
     clean:#清理文件
         rm -rf *.o main#rm -rf表示清理，*.o表示全部以.o结尾的文件，main表示可执行文件
     #即将所以.o文件和可执行文件main都删除
     #在命令框中输入：make clean即可清理上一次执行得到的文件

```

两者需要在同一文件夹下
运行make clean清理上一次编译结果
重新编译
 运行可执行文件

命令:./main

执行表示当前文件夹的mian文件，不写.会导致识别为其他命令导致错误
进阶案例
代码文件

包含add.h,add.cpp,sub.h,sub.cpp,mul.h,mul.cpp,calc.cpp文件
```

add.h文件

int add (int a,int b);

add.cpp文件

    #include"add.h"
    int add(int a,int b){
    return a+b;
    }


sub.h文件

int sub(int a,int b);

sub.cpp

    #include"sub.h"
    int sub(int a,int b)

    {
        return a-b;
    }

 mul.h文件

int mul(int a,int b);

mul.cpp文件

    #ifndef INC_0228_MUL_H
    #define INC_0228_MUL_H
    int mul(int a,int b)
    {return a*b;
    }
    #endif

 calc.cpp文件

    #include<stdio.h>
    #include"add.h"
    #include"sub.h"
    #include"mul.h"
    #include"ulimit.h"

    int main()
    {
        int a=1;
        int b=2;
        printf("a+b=%d\n",add(a,b));

        printf("a-b=%d\n",sub(a,b));
        printf("a*b=%d\n",mul(a,b));

        return 0;
    }
```





### makefile文件写法1
```

    OBJ = add.o sub.o mul.o calc.o#定义变量OBJ，变量值是4个.o文件，add.o sub.o mul.o calc.o
    TARGET = calc#定义变量TAGET，变量值是calc
    TARGET :$(OBJ)#变量TAGET依赖变量OBJ
    	gcc $(OBJ) -o $(TARGET)#用编译器将OBJ代指4个.o文件，编译成可执行文件TARGET代指的calc
    add.o:add.cpp#add.o文件依赖add.cpp
    	gcc -c add.cpp -o add.o
    sub.o:sub.cpp
    	gcc -c sub.cpp -o sub.o
    mul .o:mul.cpp
    	gcc -c mul.cpp -o mul.o
    calc.o:calc.cpp
    	gcc -c calc.cpp -o calc.o
    clean:
    	rm -rf *.o calc
```



### makefile文件写法2
'''
OBJ = add.o sub.o mul.o calc.o#define a varial that name is obj  by self
TARGET = calc
$(TARGET):$(OBJ)
    	gcc $^ -o $@ #"$^"代指TARGET,"$@"代指OBJ即依赖文件
    add.o:add.cpp
    	#gcc -c add.cpp -o add.o
    	gcc -c $^ -o $@
    sub.o:sub.cpp
    	#gcc -c sub.cpp -o sub.o
 
    	gcc -c $^ -o $@
        mul .o:mul.cpp
         #gcc -c mul.cpp -o mul.o
         gcc -c $^ -o $@
     calc.o:calc.cpp
         #gcc -c calc.cpp -o calc.o
         gcc -c  $^ -o $@
     clean:
         rm -rf *.o $(TARGET)
'''

### makefile版本3
```
    OBJ = add.o sub.o mul.o calc.o
    TARGET = calc
    $(TARGET):$(OBJ)
    	$(CXX) $^ -o $@
    add.o:add.cpp
    	#gcc -c add.cpp -o add.o
    	$(CXX) -c $^ -o $@#本出将gcc改为CXX，可实现跨平台使用makefile
    sub.o:sub.cpp
    	#gcc -c sub.cpp -o sub.o
    	$(CXX) -c $^ -o $@
    mul .o:mul.cpp
    	#gcc -c mul.cpp -o mul.o
    	$(CXX) -c $^ -o $@
    calc.o:calc.cpp
    	#gcc -c calc.cpp -o calc.o
    	$(CXX) -c  $^ -o $@
    clean:
    	$(RM) *.o $(TARGET)	#将rm -rf改为RM
    show:#make show 可执行show的内容
    	echo $(AS)#输出系统变量AS的值
        echo $(CC)
    	echo $(CPP)
    	echo $(CXX)#输出系统变量CXX的值，因为本系统为linux，所以值为gcc
    	echo $(RM)#值为rm -rf
```
## Makefile 的伪目标和模式匹配

### 伪目标 PHONY:clean

        声明目标伪目标之后，makefile将不会判断目标是否存在或目标是否需要更新

%.o：%.cpp    .o依赖与对应的.cpp

wildcard     $(wildcard  ./*.cpp)获取当前目录下所有的.cpp文件按

patsubst    $(patsubst %.cpp,%.o,./*.cpp)将对应的cpp文件名替换伪.o文件名,该段代码就表示所有.o文件
```
.PHONY:clean show #声明clean,show为伪目标，这样如果和该makefile同文件夹里面如果有文件名为clean,show的文件，也能执行make clean,make show命令，因为如果有文件名为clean,show，如果没声明为目标会导致make clean，make show无法执行
     
    OBJ = add.o sub.o mul.o calc.o#define a varial that name is obj  by self
    TARGET = calc
    $(TARGET):$(OBJ)
    	gcc $^ -o $@
    #add.o:add.cpp
    %.o:%.cpp#匹配，%.o匹配所有.0文件，%.cpp匹配所有.cpp文件，则替代下面杯注释的文件
    	#gcc -c add.cpp -o add.o
    	$(CXX) -c $^ -o $@
     
    #sub.o:sub.cpp
    #	#gcc -c sub.cpp -o sub.o
    #	$(CXX) -c $^ -o $@
    #mul .o:mul.cpp
    #	#gcc -c mul.cpp -o mul.o
    #	$(CXX) -c $^ -o $@
    #calc.o:calc.cpp
    #	#gcc -c calc.cpp -o calc.o
    #	$(CXX) -c  $^ -o $@
     
     
    clean:
    	$(RM) *.o $(TARGET)	
    show:
        echo $(AS)
    	echo $(CC)
    	echo $(CPP)
    	echo $(CXX)
    	echo $(RM)
```
### 四种等于号 -------->>"=，：=，？=，+=”
#### =

表示变量赋值。A=B，表示变量A的值是B,在makefile彻底展开后将A的值修改为B
#### :=

表示变量赋值，同=，区别在：=是展开makefile过程中就讲A修改为B
#### ?=

A？=B表示；A如果没有经过赋值，则默认值为B,
#### +=

A+=B表示：A的值里面再添加一个B







