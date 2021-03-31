# Java

## maven

### settings.xml

~~~xml
<mirror>  
  <id>nexus-aliyun</id>  
  <mirrorOf>central</mirrorOf>    
  <name>Nexus aliyun</name>  
  <url>http://maven.aliyun.com/nexus/content/groups/public</url>  
</mirror>
~~~

~~~xml
<profile>
  <id>jdk-1.8</id>
  <activation>
    <activeByDefault>true</activeByDefault>
    <jdk>1.8</jdk>
  </activation>
  <properties>
    <maven.compiler.source>1.8</maven.compiler.source>
    <maven.compiler.target>1.8</maven.compiler.target>
    <maven.compiler.compilerVersion>1.8</maven.compiler.compilerVersion>
  </properties>
</profile>
~~~

### mvn -v提示Permission denied

- chmod a+x  /usr/local/apache-maven-3.5.2/bin/mvn  (a:所有用户 +:增加权限  x:执行权限)

### 解决jar包冲突原则

- 第一声明者优先
- 路径近者优先，直接声明 > 间接依赖

### lookup parent from repository

- `<relativePath/>`

### 锁定jar包版本

```xml
<dependencyManagement>
	<dependencies>
  </dependencies>
</dependencyManagement>
```

### 工程和模块以及继承和依赖

- 模块组成工程
- 继承是天生，依赖要自己建立

### Maven中dependencyManagement作用说明

- 说明
  - 使用dependencyManagement可以统一管理项目的版本号，确保应用的各个项目的依赖和版本一致，不用每个模块项目都弄一个版本号，不利于管理，当需要变更版本号的时候只需要在父类容器里更新，不需要任何一个子项目的修改；如果某个子项目需要另外一个特殊的版本号时，只需要在自己的模块dependencies中声明一个版本号即可。子类就会使用子类声明的版本号，不继承于父类版本号。
- 与dependencies区别
  - 1)Dependencies相对于dependencyManagement，所有生命在dependencies里的依赖都会自动引入，并默认被所有的子项目继承。
  - 2)dependencyManagement里只是声明依赖，并不自动实现引入，因此子项目需要显示的声明需要用的依赖。如果不在子项目中声明依赖，是不会从父项目中继承下来的；只有在子项目中写了该依赖项，并且没有指定具体版本，才会从父项目中继承该项，并且version和scope都读取自父pom;另外如果子项目中指定了版本号，那么会使用子项目中指定的jar版本。****

# 开发

## VsCode

### 插件

- Vetur ——语法高亮，智能感知 包含格式化功能，Alt+Shift+F (格式化全文) ，Ctrl+K Ctrl+F (格式化选中代码，两个Ctrl需要同时按着)
- EsLint 一一 语法纠错
- Auto Close Tag 一一 自动闭合HTML/XML标签
- Auto Rename Tag 一一 自动完成另-侧标签的同步修改
- JavaScript(ES6) code snippets 一一 ES6 语法智能提示以及快速输入，除j外还支持.ts, .jsx， .tsx， .html, .vue;省去了配置其支持各种包含is代码文件的时间

## Git

### 初始化

```bash
git config --global credential.helper store # 保存用户名密码
git config --global user.name "xxx"
git config --global user.email "xxx@163.com"
git config --global color.ui true
git config --global alias.co checkout  # 别名
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.ac '!git add -A && git commit'
git config --global core.editor "vim"  # 设置Editor使用vim
git config --global core.quotepath false # 设置显示中文文件名
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h %p%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global push.default matching
git config --global i18n.commitencoding utf-8
git config --global i18n.logoutputencoding utf-8
export LESSCHARSET=utf-8
```



### Git 修改已提交的commit注释

- 通过 git rebase -i HEAD~2
- git commit --amend
- git push --force origin master

### git tag

- 增
  - git tag v1.4 -m 'abc'
  - 推所有 git push origin --tags
  - 推一个 git push origin v2.0
- 删
  - git tag -d v1.0.0
  - git push origin :refs/tags/v1.0.0 或 git push origin --delete tag 2.0
- 查
  - git show v1.4

### 分支改名

- git branch -m old new

### 删除分支

- git br -d deploy
- git push origin :deploy
- 删除分支后 其他地方更新 git pull -p

### 删版本

- git reset HEAD~1
- git push origin :deploy

### 把版本库已有的一部分内容去掉

- git rm -r --cached static

### fork后如何同步源的新更新内容

- git remote add upstream https://github.com/museui/muse-ui.git
- git fetch upstream
- git checkout master
- git merge upstream/master
- git push origin master

### 暂存

- git stash save ff
- git stash pop
- git stash list
- git stash apply
- git stash drop test
- git stash clear

### 变基

- git rebase -i master
- https://juejin.im/entry/5ae9706d51882567327809d0

### 删除git库中untracked files

- git clean -fd

### 版本备注修正

- git commit --amend

## Vagrant

- [app.vagrantup.com](https://app.vagrantup.com/boxes/search)
- box相关
  - vagrant box add xxx
    - vagrant box add centos7 CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box
  - vagrant box list
- vagrant init
  - vagrant init centos/7
- 虚拟机相关
  - vagrant up
  - vagrant ssh
  - vagrant halt
  - vagrant suspend
  - vagrant destroy
  - vagrant reload
  - vagrant reload --provision
- 坑
  - Vagrant was unable to mount VirtualBox shared folders
    - vagrant plugin uninstall vagrant-vbguest
    - vagrant plugin install vagrant-vbguest --plugin-version 0.21

# Google Extensions

# MAC

## iTerm2

- iTerm2 新窗口如何直接跳转到当前窗口的目录？
  - 在 iTerm2 的 Preferences -> Profile 里的 Working Directory 直接选择："Reuse previous session's directory" 