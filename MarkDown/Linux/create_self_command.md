# 创建自己控制台命令
使计算机的所有用户都可以使用 Bash 脚本的最简单方法是将它们放在 /usr/local/bin 中。不过，这需要您具有管理员权限。
## 1. 创建你的脚本：
打开您最喜欢的文本编辑器并编写您希望脚本运行的所有命令，每行一个命令。

您可以通过以 # 开头的行向 Bash 脚本添加注释。

完成后，将下面的确切行添加为脚本顶部的第一行。它被称为“shebang”并告诉 shell使用哪个解释器来执行您的脚本。
```
#!/bin/bash
```
这是一个完整脚本的简单示例，运行您在问题中提到的两个命令：
```
#!/bin/bash

# Compile 'file':
gcc file -o file
# Compile 'file1':
gcc file1 -o file1
```
## 2. 将脚本移动到正确的位置：
您应该为所有用户放置自己的脚本的位置是 /usr/local/bin。
由于此目录归用户 root 所有，因此您必须是管理员并使用 sudo 将文件移动到那里。
我假设您在主目录 ~/my_script.sh 中创建了脚本。只需打开一个终端并键入以下命令，将 SCRIPTNAME 替换为您要为其提供的名称。此名称将是您必须键入以运行它的命令。 .sh 文件扩展名不是必需的。
```
sudo mv ~/myscript.sh /usr/local/bin/SCRIPTNAME
由于我想保留sheel源文件，我使用cp命令
sudo cp ~/myscript.sh /usr/local/bin/SCRIPTNAME
```
## 3. 设置正确的所有者和权限：
该脚本应该由 root 拥有并可写，但对每个人都可读和可执行。下面的两个命令确保了这一点：
```
sudo chown root: /usr/local/bin/SCRIPTNAME
sudo chmod 755 /usr/local/bin/SCRIPTNAME

```
## 4. 运行你的脚本并享受：
现在您只需在终端中输入 SCRIPTNAME（或者您如何称呼它），脚本就会被执行。
# 方法有效的：
## 1. 创建好xx.sh文件
## 2. 将文件移入/usr/local/bin
```
 sudo mv 路径/xxx.sh /usr/local/bin/SCRIPNAME(脚本名称（自己定义，该名称是你以后在任意地方执行的名称）)`
## 3. 赋予权限
```
sudo chown root: /usr/local/bin/SCRIPNAME
sudo chmod 755 /usr/local/bin/SCRIPNAME
```
## 4. 现在可以到处使用SCRIPNAME这个指令了
