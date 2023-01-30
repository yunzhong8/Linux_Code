## 目录
[toc]
## 安装指令：

unbutun上我执行该指令成功下载了
```
sudo apt-get install translate-shell
```

## 命令
### 翻译单词

命令：trans :语言 单词
```
eg:trans :zh word
```


将word翻译成中文
### 将单词翻译成多种语言

命令：trans :语言1+语言2 单词
```
trans: ta+hi saudos
```

### 翻译一整个句子

命令：trans :语言  ”句子“
```
trans :es ”what is going on your life“
```


### 翻译一个文件

命令:trans :语言 路径
```
eg trans :es file :///home
```


### 输出语言简写
```
trans -R
     或trans -T

```



### 帮助
```
man trans 
```




