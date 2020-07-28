# Linux

Linux是一套免费使用和自由传播的类Unix操作系统，是一个基于POSIX和UNIX的多用户、多任务、支持多线程和多CPU的操作系统。

Linux能运行主要的UNIX工具软件、应用程序和网络协议。它支持32位和64位硬件。Linux继承了Unix以网络为核心的设计思想，是一个性能稳定的多用户网络操作系统。

## Linux发行版

Linux的发行版说简单点就是将Linux内核与应用软件做一个打包。

目前市面上比较知名的发行版本有：

Ubuntu、Redhat、CentOS、Debian、Fedora、SuSE、OpenSUSE、Arch Linux、SolusOS等。

## Linux应用领域

Liunx现在已经应用到了各种领域，从嵌入式设备到超级计算机、在服务器领域通常使用LAMP（Linux + Apache + MySQL + PHP）或LNMP（Linux + Nginx + MySQL + PHP）组合。

## Linux安装

这里以CentOS为例。

1.官网下载需要的版本

https://www.centos.org/download/

ISO镜像文件说明：

- CentOS-7.0-x86_64-DVD-1503-01.iso：标准安装版，一般下载这个就可以了（推荐）
- CentOS-7.0-x86_64-NetInstall-1503-01.iso：网络安装镜像（从网络安装或者救援系统）
- ...
- CentOS-7.0-x86_64-minimal-1503-01.iso：精简版，自带软件最少

> 建议安装64位Linux系统

接下来需要将下载的Linux系统刻录成光盘或U盘

注：也可以安装VMware虚拟机来安装Linux

### 安装步骤

https://www.runoob.com/linux/linux-install.html

1.使用光驱或U盘或你下载的Linux ISO文件进行安装

Install or upgrade an existing system 安装或升级现有的系统

install system with basic video driver 安装过程中采用基本的显卡驱动

Rescue installed system 进入系统修复模式

Boot from local drive   退出安装从硬盘启动

Memory test  内存检测

2.直接按"skip"

3.出现引导界面，点击"Next"

4.选中"English"，避免出现乱码

5.键盘布局选择"U.S.English"

6.选择"Basic Storage Devices" 点击 "Next"

7.询问是否忽略所有数据，新电脑安装系统选择"Yes,discard any data"

8.Hostname填写格式“英文名·姓”

9.网络设置

点击Configure Network → 选中System eth0 → 点击右侧的Edit → 勾选Connect automatically → 点击Apply

10.时区可以在地图上点击，选择"shanghai"并取消System clock uses UTC前面的勾

11.设置root的密码

12.硬盘分区

选择 Use All Space 并勾选 Review and modify...

13.调整分区，必须要有/home这个分区，如果没有该分区，安装部分软件会出现不能安装的情况

14.询问是否格式化分区

15.将更改写入到磁盘

16.引导程序安装位置

17.最重要的一步

选中 Minimal Desktop → 勾选 Customize now → Next

18.取消以下内容的所有选项

- Applications
- Base System
- Servers

并对Desktop进行如下设置

- Desktop Debugging and Performance Tools
- Desktop Platform
- Remote Desktop Clients
- Input Methods中仅保留ibus-pinyin-1.3.8-1.el6.x86_64,其他的全部取消

19.选中Language，并选中右侧的Chinese Support，然后点击Optional packages

20.调整后界面

选中 第2、3和最后一个

21.一个最精简的桌面环境就设置好了

22.安装完成后重启

23.重启之后License Information

24.Create User

Username：填写你的英文名（不带姓）
Full Name：填写你的英文名·姓（首字母大写）

25."Date and Time" 选中 "Synchronize data and time over the network"

Finsh之后系统将重启

26.第一次登录，登录前不要做任何更改！登录之后紧接着退出

第二次登录，选择语言，在红色区域选择下拉小三角，选other，选中"汉语（中国）"，点击ok

27.登录之后，请一定按照如下顺序点击

勾选不再询问 → 保留旧名称

至此，CentOS安装完成

## Linux系统启动过程

Linux系统的启动过程可以分为5个阶段:

- 内核的引导

  当计算机打开电源后，首先是BIOS开机自检，按照BIOS中设置的启动设备（通常是硬盘）来启动。操作系统接管硬件后，首先读入/boot目录下的内核文件。

- 运行init

  init进程是系统所有进程的起点，没有这个进程，系统中任何进程都不会启动。init程序首先是需要读取配置文件 /etc/inittab。

  **运行级别**

  许多程序需要开机启动。它们在Windows上叫做“服务”，在Linux上叫做“守护进程（daemon）”。而init进程的一大任务就是去运行这些开机启动的程序。Linux允许为不同的场合，分配不同的开机程序，这叫做“运行级别（runlevel）”。

  Linux系统有7个运行级别：

  1.运行级别0：系统停机状态，系统默认运行级别不能设置为0，否则不能正常启动

  2.运行级别1：单用户工作状态，root权限，用于系统维护，禁止远程登录

  3.运行级别2：多用户状态（没有NFS）（注：NFS即网络文件系统，一个表示层协议，能使使用者访问网络上别处的文件就像在使用自己的计算机一样）

  4.运行级别3：完全的多用户状态（有NFS），登录后进入控制台命令模式

  5.运行级别4：系统未使用，保留

  6.运行级别5：X11控制台，登录后进入图形GUI模式

  7.运行级别6：系统正常关闭并重启，默认运行级别不能设置为6，否则不能正常启动

- 系统初始化

  在init的配置文件中有这么一行： si::sysinit:/etc/rc.d/rc.sysinit　它调用执行了/etc/rc.d/rc.sysinit，而rc.sysinit是一个bash shell的脚本，它主要是完成一些系统初始化的工作，rc.sysinit是每一个运行级别都要首先运行的重要脚本。它主要完成的工作有：激活交换分区，检查磁盘，加载硬件模块以及其它一些需要优先执行任务。真正的rc启动脚本实际上都是放在/etc/rc.d/init.d/目录下。

- 建立终端

  rc执行完毕后，返回init。这时基本系统环境已经设置好了，各种守护进程也已经启动了。init接下来会打开6个终端，以便用户登录系统。在inittab中的以下6行就是定义了6个终端：

  ```
  1:2345:respawn:/sbin/mingetty tty1
  2:2345:respawn:/sbin/mingetty tty2
  3:2345:respawn:/sbin/mingetty tty3
  4:2345:respawn:/sbin/mingetty tty4
  5:2345:respawn:/sbin/mingetty tty5
  6:2345:respawn:/sbin/mingetty tty6
  ```

  > 2345表示2、3、4、5运行级别，它们以respawn方式运行mingetty程序，mingetty程序能够打开终端、设置模式。同时它会显示一个文本登录界面，提示输入用户名，输入的用户名将作为参数传给login程序来验证用户的身份。

- 用户登录系统

  一般来说，用户登录的方式有三种：

  1.命令行登录

  2.ssh登录

  3.图形界面登录

CentOS 7，配置文件：/usr/lib/systemd/system、/etc/systemd/system

## Linux关机

通常不会遇到关机操作，因为服务器上跑服务是永无止境的，除非特殊情况，不得已才会关机。正确的关机流程为：sync → shutdown → reboot → halt

关机指令为：shutdown，可以通过`man shutdown`来查看帮助文档。

```bash
sync # 将数据有内存同步到硬盘中
shutdown # 关机指令

shutdown -h 10 'This server will shutdown after 10 mins' # 计算机将在10分钟后关机，并显示在登录用户的当前屏幕中

shutdown -h/-H now # 立马关机

shutdown -h 20:25 # 系统将在今天的20:25关机

shutdown -h +10 # 10分钟后关机

shutdown -r now # 系统立马重启

shutdown -r +10 # 系统10分钟后重启

shutdown -c # 取消即将进行的关机

reboot # 重启，等同于shutdown -r now

reboot --halt # 关闭系统

halt # 关闭系统，等同于 shutdown -h now 和 poweroff

halt -p # 关闭系统、关闭电源

halt --reboot # 重启机器

poweroff # 关闭机器、关闭电源
```

不管是系统重启还是关闭，首要要运行`sync`命令，把内存中的数据写到磁盘中。关机命令有 shutdown -h now、halt、poweroff和initial 0，重启命令有shutown -r now、reboot和init 6。

## Linux系统目录结构

登录系统后，在当前命令窗口下输入命令 `ls /`，会得到目录结构。

目录 | 用途
:-|:-
/bin | bin是Binary的缩写，这个目录中存放着最经常使用的命令。
/boot | 这里存放的是启动Linux时使用的一些核心文件，包括一些连接文件以及镜像文件。
/dev | dev是Device（设备）的缩写，该目录下存放的是Linux的外部设备，在Linux中访问设备方式和访问文件的方式是相同的。
/etc | 这个目录用来存放所有的系统管理所需要的配置文件和子目录。
/home | 用户主目录。在Linux中，每个用户都有一个自己的目录，一般该目录是以用户的账号命名的。
/lib | 这个目录存放这个系统最基本的动态连接共享库，其作用类似于windows里面的DLL文件。几乎所有的应用程序都需要用到这些共享库。
/lost+found | 这个目录一般情况下是空的，当系统非法关机后，这里就存放了一些文件。
/media | Linux系统会自动识别一些设备，例如光盘、光驱等等。当识别后，Linux会把识别的设别挂载到该目录下。
/mnt | 系统提供该目录是为了让用户临时挂载别的文件系统的，我们可以将光驱挂载到/mnt下，让后进入该目录就可以查看光驱内容了。
/opt | 这是给主机额外安装软件所摆放的目录。默认是空的，比如安装一个ORACLE数据库就可以放在该目录下。
/proc | 这个目录是一个虚拟目录，它是系统内存的映射，我们可以通过访问这个目录来获取系统信息，这个目录的内容不在硬盘上而在内存中。
/root | 该目录为系统管理员，也称为超级管理员权限者的用户主目录。
/sbin | s就是super user的意思，这里存放的是系统管理员使用的系统管理程序。
/selinux | 这个目录是Redhat/CentOS所特有的目录，Selinux是一个安全机制，类似于防火墙，存放selinux相关的文件。
/srv | 该目录存放一些服务启动之后需要提取的数据。
/sys |  这是linux2.6内核的一个很大的变化。该目录下安装了2.6内核中新出现的一个文件系统 sysfs 。sysfs文件系统集成了下面3种文件系统的信息：针对进程信息的proc文件系统、针对设备的devfs文件系统以及针对伪终端的devpts文件系统。该文件系统是内核设备树的一个直观反映。当一个内核对象被创建的时候，对应的文件和目录也在内核对象子系统中被创建。
/tmp | 该目录用于存放一些临时文件。
/usr | 用户的很多应用程序和文件都放在该目录下，类似于windows下的program files目录。
/usr/bin | 系统用户使用的应用程序。
/usr/sbin | 超级用户使用的比较高级的管理程序和系统守护程序。
/usr/src | 内核源代码默认的防止目录。
/var | 这个目录存放着在不断扩充的东西，我们习惯将那些经常被修改的目录放到这个目录下。包括各种日志文件。
/run | 这是一个临时文件系统，存储系统启动以来的信息。当系统重启时，这个目录下的文件应该被删除或清除。如果你的系统上有/var/run目录，应该让他指向run。

## Linux远程登录

Linux一般作为服务器使用，而服务器一般在机房，因此需要远程登录到Linux系统来管理维护系统。

Linux系统中是通过ssh服务实现的远程登陆功能，默认ssh服务端口号为22。登录时提供Host Name（or IP address）输入你要登录的远程服务器IP，用户名及密码就可登陆到系统了。

## Linux文件基本属性

Linux系统是一种典型的多用户系统，不同的用户处于不同的地位，拥有不同的权限。为了保证系统的安全性，Linux系统对不同的用户访问同一文件（包括目录文件）的权限做了不同的规定。在Linux中我们可以使用`ll`或者`ls -l`命令来显示一个文件的属性以及文件所属的用户和组。

```bash
$ ll
total 4838
drwxr-xr-x 1 wb-zyl537012 1049089       0 3月  25  2019  AppData/
drwxr-xr-x 1 wb-zyl537012 1049089       0 5月  15  2019  conf/
drwxr-xr-x 1 wb-zyl537012 1049089       0 7月  20 09:18  Contacts/
...
```

实例中，bin文件的第一个属性用“d”表示。“d”在Linux中表示该文件是个目录文件。在Linux中第一个字符代表这个文件是目录、文件或链接文件。

- 当为 d 则是目录
- 当为 - 则是文件
- 当为 l 则表示为链接文件（link file）
- 当为 b 则表示为装置文件里面的可供储存的接口设备（可随机存取装置）
- 当为 c 则表示为装置文件里面的串行端口设备，例如键盘、鼠标（一次性读取装置）。

接着的字符，三个为一组，且均为【rwx】三个参数的组合。其中 r 代表可读（read），w 代表可写（write），x 代表可执行（execute）。当某一项没有权限时用 - 代替。

除第一位外的其他三个为一组，第一组确定【该文件所有者】对这个文件拥有的权限，第二组确定【该文件所有者所属组】对该文件拥有的权限，第三组确定【其他用户】对该文件拥有的权限。

### Linux文件所有者和所属组

对于文件来说，它都有一个特定的所有者，也就是对该文件具有所有权的用户。同时，在Linux系统中，用户是按组分类的，一个用户属于一个或多个组。文件所有者以外的用户又可以分为文件所有者的同组用户和其他用户。因此，Linux系统按文件所有者、文件所有者同组用户和其他用户来规定了不同的文件访问权限。对于 root 用户来说，一般情况下，文件的权限对其不起作用。

#### 更改文件属性

1.chgrp：更改文件所属组

```bash
chgrp [-R] 所属组名 文件名 # -R表示递归更改文件所属组，即该目录下所有的文件的所属组都会更改
```

2.chown：更改文件所有者，也可以同时更改文件所属组

```bash
chown [-R] 所有者 文件名
chown [-R] 所有者:所属组 文件名
```

3.chmod：更改文件9个属性（权限）

Linux文件属性有两种设置方式，一种是数字，一种是符号。Linux文件的基本权限就有九个，分别是owner/group/others三种身份各有自己的read/write/execute权限。

各权限的分数对照表如下：

- r: 4
- w: 2
- x: 1

每种身份（owner/group/others）各自的三个权限（r/w/x）分数进行累加。如：

- owner = rwx = 4+2+1 = 7
- group = rwx = 4+2+1 = 7
- others = r-- = 4+0+0 = 4

那么该文件的权限数字即为775。变更权限指令chmod的语法为：

```bash
chmod [-R] xyz 文件或目录 # xyz即各组rwx相加的结果 如，775； -R表示递归的持续变更，包含子目录
```

**符号类型改变文件权限**

还有一个改变权限的方法，可以使用 u（user），g（group），o（others） 来代表三种身份的权限。此外，a 代表 all，即全部身份。读写权限可以写成 r，w，x。

```bash
# touch test1 // 创建test1文件
# ls -al test1 // 查看test1默认权限
-rw-r--r-- 1 root root 0 Nov 15 10:32 test1

# chmod u=rwx,g=rx,o=r test1  // 修改test1权限
# ls -al test1
-rwxr-xr-- 1 root root 0 Nov 15 10:32 test1

# chmod g+w test1 // 给所属组添加上可写权限

# chmod g-x test1 // 给所属组去掉可执行权限

#  chmod  a-x test1 // 去掉所有人的全部可执行权限
```

其中，+（添加），-（去掉），=（设定）。

## Linux文件与目录管理

Linux的目录结构为树状结构，最顶级的目录为根目录/。其他目录通过挂载可以将它们添加到树中，通过解除挂载可以移除它们。

- 绝对路径：路径的写法，由根目录/写起，如：/usr/share/doc
- 相对路径：不是由/写起，例如从/usr/share/doc到/usr/share/man下，可以写成：cd ../man

### 处理目录的常用命令

命令 | 用途
:-|:-
ls | 列出目录及文件名
cd | 切换目录
pwd | 显示目前的目录
mkdir | 创建一个新的目录
rmdir | 删除一个空的目录
cp | 复制文件或目录
rm | 移除文件或目录
mv | 移动文件与目录，或修改文件与目录的名称

> 可以使用 man 命令来查看各个命令的使用文档，如：man rm

1.ls（列出目录）

```bash
ls [-aAdfFhilnrRSt] 目录名称
ls [--color={never,auto,always}] 目录名称 # 带上颜色标识
ls [--full-time] 目录名称 # 2019-03-25 15:07:16.043381600 +0800 列出带完整时区的文件修改时间
```

选项与参数：

- -a：全部的文件，连同隐藏文件( 开头为 . 的文件) 一起列出来
- -d：仅列出目录本身，而不是列出目录内的文件数据
- -l：长数据串列出，包含文件的属性与权限等等数据

2.cd（切换目录）

```bash
cd [相对路径或绝对路径]
```

```bash
# 创建test目录
mkdir test
# 使用绝对路径切换到 test目录
cd /root/test
# 使用相对路径切换到 test目录
cd ./test/
# 回到家目录
cd ~
# 回到当前目录的上一级目录
cd ..
```

3.pwd（显示当前所在的目录）

```bash
pwd [-P]
```

- -P：显示出确实的路径，而非使用连接（link）路径

```bash
pwd
# /root
```

4.mkdir（创建新目录）

```bash
mkdir [-mp] 目录名称
```

- -m：配置文件的权限。直接配置，不需要看默认权限（umask）
- -p：帮助你直接将所需要的目录（包含上一级目录）递归创建起来，即你可以创建多级目录

```bash
cd /tmp
mkdir test
mkdir -p /test/test1/test2
mkdir -m 754 test3
```

5.rmdir（删除非空目录）

```bash
rmdir [-p] 目录名称
```

- -p：连同上级目录【空的】也一起删除

```bash
rmdir test/
rmdir -p test1/test2
```
> 该命令仅能删除空目录，rm 命令可以删除非空目录

6.cp（复制文件或目录）

```bash
cp [-adfilprsu] 来源档(source) 目标档(destination)
cp [options] source1 source2 source3 .... directory
```

- -a：相当于-pdr的意思
- -d：若来源档为连接档的属性(link file)，则复制连接档属性而非文件本身
- -f：为强制(force)的意思，若目标文件已经存在且无法开启，则移除后再尝试一次
- -i：若目标档(destination)已经存在时，在覆盖时会先【询问动作】的进行(常用)
- -l：进行硬式连接(hard link)的连接档创建，而非复制文件本身
- -p：连同文件的属性一起复制过去，而非使用默认属性（备份常用）
- -r：递归持续复制，用于目录的复制行为
- -s：复制成为符号连接档（symbolic link），即快捷方式文件
- -u：若 destination 比 source 旧才更新 destination

```bash
cp ~/.bashrc /tmp/bashrc
cp -i ~/.bashrc tmp/bashrc

cp: overwrite `/tmp/bashrc'? n  <==n不覆盖，y为覆盖
```

7.rm (移除文件或目录)

```bash
rm [-fir] 文件或目录
```
- -f：就是 force 的意思，忽略不存在的文件，不会出现警告信息
- -i：互动模式，在删除前会【询问】使用者是否动作
- -r：递归删除，最常用在目录的删除。这是非常危险的选项

```bash
rm -i bashrc

rm: remove regular file `bashrc'? y
```

8.mv (移动文件与目录，或修改名称)

```bash
mv [-fiu] source destination
mv [options] source1 source2 source3 .... directory
```

- -f：force 强制的意思，如果目标文件已经存在，不会询问而直接覆盖
- -i：若目标文件 (destination) 已经存在时，就会【询问】是否覆盖
- -u：若目标文件已经存在，且 source 比较新，才会更新 (update)

```bash
cd /tmp
cp ~/.bashrc bashrc
mkdir mvtest
mv bashrc mvtest  # 将bashrc文件移动到mvtest目录中去

mv mvtest mvtest2 # 将mvtest名称更名为 mvtest2
```

### Linux 文件内容查看

命令 | 用途
:-|:-
cat | 由第一行开始显示文件内容
tac | 从最后一行开始显示，可以看出tac是cat的倒着写
nl | 显示的时候，输出行号
more | 一页一页的显示文件内容
less | 与more相似，但是相比more，它可以往前翻页
head | 只看头几行
tail | 只看尾几行

1.cat

```bash
cat [-AbEnTv]
```

- -A：相当于-vET的整合选择，可列出一些特殊字符而不是空白而已
- -b：列出行号，仅针对非空白行做行号显示，空白行不标行号
- -E：将结尾的断行字节$显示出来
- -n：列出行号，连同空白行也会有行号
- -T：将【tab】按键以 ^| 显示出来
- -v：列出一些看不出来的特殊字符

```bash
cat /etc/issue

#
CentOS release 6.4 (Final)
Kernel \r on an \m
```

2.tac

```bash
tac /etc/issue

#
Kernel \r on an \m
CentOS release 6.4 (Final)
```

3.nl

```bash
nl [-bnw]
```

- -b： 指定行号指定的方式，主要有两种。

  -b a：表示不论是否为空行，也同样列出行号（类似cat -n）
  
  -b t：如果有空行，空的那一行不要列出行号（默认）

- -n：列出行号表示的方法

  -n ln：行号在荧幕的最左方显示

  -n rn：行号在自己栏位的最右方显示，且不加0

  -n rz：行号在自己栏位的最右方显示，且加0

- -w：行号栏位的占用位数

```bash
nl /etc/issue

#
1  CentOS release 6.4 (Final)
2  Kernel \r on an \m
```

4.more

一页一页翻动

```bash
more /etc/man_db.config

#
# Generated automatically from man.conf.in by the
# configure script.
#
# man.conf from man-1.6d
....(中间省略)....
--More--(28%)  <== 重点在这一行 你的光标也会在这里等待你的命令
```

- 空白键 (space)：代表向下翻一页
- Enter：代表向下翻『一行』
- /字串：代表在这个显示的内容当中，向下搜寻『字串』这个关键字
- :f：立刻显示出档名以及目前显示的行数
- q：代表立刻离开 more ，不再显示该文件内容
- b 或 [ctrl]-b：代表往回翻页，不过这动作只对文件有用，对管线无用

5.less

```bash
less /etc/man.config

#
# Generated automatically from man.conf.in by the
# configure script.
#
# man.conf from man-1.6d
....(中间省略)....
:   <== 这里可以等待你输入命令
```

- 空白键：向下翻动一页
- [pagedown]：向下翻动一页
- [pageup]：向上翻动一页
- /字串：向下搜寻『字串』的功能
- ?字串：向上搜寻『字串』的功能
- n：重复前一个搜寻 (与 / 或 ? 有关)
- N：反向的重复前一个搜寻 (与 / 或 ? 有关)
- q：离开 less 这个程序

6.head

```bash
head [-n number] 文件名
```

- -n：后面接数字，代表显示几行的意思。默认的情况中，显示前面10行

```bash
head /etc/man.config

head -n 20 /etc/man.config # 显示前20行
```

7.tail

```bash
tail [-n number] 文件名
```

- -n：后面接数字，代表显示几行的意思。 默认的情况中，显示最后的10行
- -f：表示持续侦测后面所接的档名，要等到按下[ctrl]-c才会结束tail的侦测

```bash
tail /etc/man.config

tail -n 20 /etc/man.config # 显示最后20行
```

## Linux 链接概念

Linux 链接分两种，一种被称为硬链接（Hard Link），另一种被称为符号链接（Symbolic Link）。默认情况下，ln 命令产生硬链接。

### 硬链接

硬链接指通过索引节点来进行连接。

在Linux的文件系统中，保存在磁盘分区中的文件不管是什么类型都给它分配一个编号，称为索引节点（node Index）。

在Liunx中，多个文件名指向同一索引节点是存在的。比如，f1是f2的硬链接，则f1的目录项中的inode节点号与f2的目录项中的inode节点号相同，即一个inode节点对应两个不同的文件名，两个文件名指向同一个文件，f1和f2对文件系统来说是完全平等。伤处其中任何一个都不会影响另一个的访问。

硬链接的作用是允许一个文件拥有多个有效路径，这样用户就可以建议硬链接到重要文件，以防误删。文件真正被删除的条件是与之相关的所有硬链接文件均被删除。

### 软链接

软链接又叫“符号链接（Symbol link）”。软链接文件类似于Windows的快捷方式文件。

它实际上是一个特殊的文件。在符号连接中，文件实际上是一个文本文件，其中包含的另一个文件的位置信息。比如，f1是f2的软链接，f1的目录项中的inode节点号与f2的目录项中的inode节点号不同，f1和f2指向的是两个不同的inode，继而指向两块不同的数据块。但f1的数据块中存放的只是f2的路径名（可以根据这个找到f2的目录项）。f1和f2之间是“主从”关系，如果f2被删除了，那么f1依然存在（因为两个是不同的文件），但指向的是一个无效的链接。

```bash
touch f1  # 创建一个文件f1
ln f1 f2  # 创建f1的一个硬链接文件f2
ln -s f1 f3  # 创建f1的一个软链接文件f3
ls -li  # -i参数显示文件的inode节点信息

total 0
9797648 -rw-r--r--  2 oracle oinstall 0 Apr 21 08:11 f1
9797648 -rw-r--r--  2 oracle oinstall 0 Apr 21 08:11 f2
9797649 lrwxrwxrwx  1 oracle oinstall 2 Apr 21 08:11 f3 -> f1
```

可以看出f2与原文件f1的inode相同，而f3的inode则与f1不同。

```bash
echo "f1" >> f1
cat f1
# "f1"
cat f2
# "f1"
cat f3
# "f1"
rm -f f1
cat f2
# "f1"
cat f3
# cat: f3: No such file or directory
```

可以看出，当删除原文件f1后，硬链接文件f2不受影响，但软链接f3文件无效了。

## Linux 用户和用户组管理

Linux系统是一个多用户多任务的分时操作系统，任何一个要使用系统资源的用户，都必须首先向管理员申请一个账号，然后以这个账号的身份进入系统。

用户的账号一方面可以帮助系统管理员对使用系统的用户进行跟踪，并控制它们对系统资源的访问，另一方面也可以帮助用户组织文件，并为用户提供安全性保护。每个用户账号都拥有一个唯一的用户名和各自的密码。通过登录进入系统和自己的主目录。

实现用户账号的管理，要做到：

- 用户账号的添加、修改与删除
- 用户密码的管理
- 用户组的管理

### Linux系统用户账号的管理

用户账号管理主要涉及用户账号的添加、修改和删除。添加用户账号就是在系统中创建一个新账号，然后为其分配用户号、用户组、主目录和登录shell等资源。刚添加的账号是被锁定的，无法使用。

1.添加新的用户账号

```bash
useradd [选项] 用户名
```

- -c：comment，指定一段注释性描述
- -d：目录，指定用户主目录，如果此此目录不存在，则同时使用-m选项，可以创建主目录。
- -g：用户组，指定用户所属组
- -G：用户组，用户组指定用户所属的附加组
- -s：shell文件，指定用户的登录shell
- -u：用户号，指定用户的用户号，如果同时有-o，则可以重复使用其他用户的标识号

```bash
# 创建用户zhangyanling，并指定用户的主目录为 /home/zhangyanling（/home为默认的用户主目录所在的父目录）
useradd -d /home/zhangyanling -m zhangyanling

# 创建用户zhangsan，该用户登录shell是/bin/sh，她属于group1用户组，同时也属于admin和root用户组，其中group1是其主属组
useradd -s /bin/sh -g group1 -G admin,root zhangsan
```
增加用户账号就是在/etc/passwd文件中为新用户增加一条记录，同时更新其他系统文件如/etc/shadow, /etc/group等。

2.修改帐号

修改用户账号就是根据实际情况更改用户的有关属性，如用户号、主目录、用户组、登录Shell等。

```bash
usermod [选项] 用户名
```

参数同上面添加用户。

```bash
# 将用户zhangyanling的登录Shell修改为csh，主目录改为/home/zyl，用户组改为group2
usermod -s /bin/csh -d /home/zyl –g group2 zhangyanling
```

3.删除帐号

如果一个用户的账号不再使用，可以从系统中删除。删除用户账号就是要将/etc/passwd等系统文件中的该用户记录删除，必要时还删除用户的主目录。

```bash
userdel [选项] 用户名
```

常用的参数是 -r，它的作用是将用户的主目录一起删掉。

```bash
userdel -r zhangyanling
```

删除用户zhangyanling在系统文件中（主要是/etc/passwd, /etc/shadow, /etc/group等）的记录，同时删除用户的主目录。

4.用户密码管理

用户刚创建的时候没有密码，无法使用，必须要为其指定密码后才可以使用，即使指定的是空。超级用户（root）可以为自己和其他用户指定密码，普通用户只能用它修改自己的密码。

```bash
passwd [选项] 用户名
```

- -l：锁定密码，即禁用账号 （lock），使其不能登录
- -u：密码解锁
- -d：使账号无密码
- -f：强迫用户下次登录时修改密码

```bash
# 查看当前用户
whoami
# zhangyanling
passwd
#
Old password:****** 
New password:******* 
Re-enter new password:*******
```

如果是超级用户，可以指定任何用户的密码：

```bash
whoami
# root
passwd zhangyanling
# 
New password:******* 
Re-enter new password:*******
```

可以看出，普通用户在修改自己的密码时，会先询问原来的密码，验证后再要求用户输入新密码并确认输入一遍。而超级用户为任何用户指定密码时，不需要知道原密码。设置的密码可以包含有大写、小写字母和数字等，设置较为复杂可提高安全性。

### Linux系统用户组的管理

每个用户都有一个用户组，系统可以对一个用户组中的所有用户进行集中管理。在Linux中的用户属于与它同名的用户组，这个用户组在创建用户时同时创建。

1.增加一个新的用户组

```bash
groupadd [选项] 用户组
```

- -g：GID，指定新用户组的组标识号（GID）
- -o：一般与-g同时使用，表示新用户组的GID可以与系统已有用户的GID相同

> 新组的组标识号是在当前已有的最大组标识号的基础上加1。

```bash
# 添加一个用户组group1
groupadd group1

# 增加了一个新组group2，同时指定新组的组标识号是101
groupadd -g 101 group2
```

2.修改用户组的属性

```bash
groupmod [选项] 用户组
```

- -g：GID，指定新用户组的组标识号（GID）
- -o：一般与-g同时使用，表示新用户组的GID可以与系统已有用户的GID相同
- -n：新用户组，将用户组的名字改为新的名字

```bash
# 修改group2的组标识号为102
groupmod -g 102 group2

# 将组group2的标识号改为103，组名修改为group3
groupmod –g 103 -n group3 group2
```

3.删除一个已有的用户组

```bash
groupdel 用户组
```

```bash
# 删除用户组group1
groupdel group1
```

4.如果一个用户同时属于多个用户组，用户可以在用户组之间切换，以便具有其他用户组的权限

```bash
# newgrp切换到root用户组，前提条件是root用户组确实是该用户的主组或附加组
newgrp root
```

### 与用户账号有关的系统文件

Linux系统中的每个用户都在`/etc/passwd`文件中有一个对应的记录行，它记录了这个用户的一些基本属性。这个文件对所有用户都是可读的。

#### /etc/passwd文件

/etc/passwd中一行记录对应着一个用户，每行记录又被冒号(:)分隔为7个字段，其格式和具体含义如下：

```
用户名:密码:用户标识号:组标识号:注释性描述:主目录:登录Shell
```

1.用户名

指代用户账号的字符串

2.密码

这个字段存放的只是用户密码的加密串，不是明文，但是由于/etc/passwd文件对所有用户都可读，所以这仍是一个安全隐患，因此通过shadow技术，把真正的加密后的用户密码存放到/etc/shadow文件中，而在/etc/passwd文件的口令字段中只存放一个特殊的字符，例如“x”或者“*”。

3.用户标识号

是一个整数，系统内部用它来标识用户。一般情况下它与用户名是一一对应的。如果几个用户名对应的用户标识号是一样的，系统内部将把它们视为同一个用户，但是它们可以有不同的密码、不同的主目录以及不同的登录Shell等。

通常用户标识号的取值范围是0～65535。0是超级用户root的标识号，1～99由系统保留，作为管理账号，普通用户的标识号从100开始。在Linux系统中，这个界限是500。

4.组标识号

记录用户所属的用户组，它对应着/etc/group文件中的一条记录。

5.注释性描述

记录着用户的一些个人信息。例如用户的真实姓名、电话、地址等，这个字段并没有什么实际的用途。在不同的Linux 系统中，这个字段的格式并没有统一。在许多Linux系统中，这个字段存放的是一段任意的注释性描述文字，用做finger命令的输出。

6.主目录

也就是用户的起始工作目录。它是用户在登录到系统之后所处的目录。在大多数系统中，各用户的主目录都被组织在同一个特定的目录下，而用户主目录的名称就是该用户的登录名。各用户对自己的主目录有读、写、执行（搜索）权限，其他用户对此目录的访问权限则根据具体情况设置。

7.登录Shell

用户登录后，要启动一个进程，负责将用户的操作传给内核，这个进程是用户登录到系统后运行的命令解释器或某个特定的程序，即Shell。

Shell是用户与Linux系统之间的接口。Linux的Shell有许多种，每种都有不同的特点。常用的有sh(Bourne Shell), csh(C Shell), ksh(Korn Shell), tcsh(TENEX/TOPS-20 type C Shell), bash(Bourne Again Shell)等。

系统管理员可以根据系统情况和用户习惯为用户指定某个Shell。如果不指定Shell，那么系统使用sh为默认的登录Shell，即这个字段的值为/bin/sh。用户的登录Shell也可以指定为某个特定的程序（此程序不是一个命令解释器）。因此我们可以限制用户只能运行指定的应用程序，在该应用程序运行结束后，用户就自动退出了系统。有些Linux 系统要求只有那些在系统中登记了的程序才能出现在这个字段中。

8.伪用户（pseudo users）

这些用户在/etc/passwd文件中也占有一条记录，但是不能登录，因为它们的登录Shell为空。它们的存在主要是方便系统管理，满足相应的系统进程对文件属主的要求。

```
伪用户含义：
bin 拥有可执行的用户命令文件 
sys 拥有系统文件 
adm 拥有帐户文件 
uucp UUCP使用 
lp lp或lpd子系统使用 
nobody NFS使用
```

#### /etc/shadow文件

/etc/shadow中的记录行与/etc/passwd中的一一对应，它由pwconv命令根据/etc/passwd中的数据自动产生。它的格式与/etc/passwd类似：

```
登录名:密码（加密）:最后一次修改时间:最小时间间隔:最大时间间隔:警告时间:不活动时间:失效时间:标志
```

1.登录名

是与/etc/passwd文件中的登录名相一致的用户账号

2.加密密码

存放的是加密后的用户口密码，长度为13个字符。如果为空，则对应用户没有口令，登录时不需要密码；如果含有不属于集合 { ./0-9A-Za-z }中的字符，则对应的用户不能登录。

3.最后一次修改时间

表示的是从某个时刻起，到用户最后一次修改密码时的天数。时间起点对不同的系统可能不一样。例如在SCO Linux 中，这个时间起点是1970年1月1日。

4.最小时间间隔

指的是两次修改密码之间所需的最小天数。

5.最大时间间隔

指的是密码保持有效的最大天数。

6.警告时间

表示的是从系统开始警告用户到用户密码正式失效之间的天数。

7.不活动时间

表示的是用户没有登录活动但账号仍能保持有效的最大天数。

8.失效时间

给出的是一个绝对的天数，如果使用了这个字段，那么就给出相应账号的生存期。期满后，该账号就不再是一个合法的账号，也就不能再用来登录了。


#### /etc/group文件

用户组的所有信息都存放在/etc/group文件中。每个用户都属于某个用户组；一个组中可以有多个用户，一个用户也可以属于不同的组。格式与/etc/passwd格式类似：

```
组名:密码:组标识号:组内用户列表
```

1.组名

是用户组的名称，由字母或数字构成。与/etc/passwd中的登录名一样，组名不应重复。

2.密码

存放的是用户组加密后的密码。一般Linux 系统的用户组都没有密码，即这个字段一般为空，或者是*。

3.组标识号

与用户标识号类似，也是一个整数，被系统内部用来标识组。

4.组内用户列表

是属于这个组的所有用户的列表，不同用户之间用逗号(,)分隔。这个用户组可能是用户的主组，也可能是附加组。

#### 添加批量用户

Linux系统提供了创建大量用户的工具，可以立即创建大量用户。方法如下：

1.先编辑一个文本用户文件

每一列按照/etc/passwd密码文件的格式书写，要注意每个用户的用户名、UID、宿主目录都不可以相同，其中密码栏可以留做空白或输入x号。一个范例文件user.txt内容如下：

```
user001::600:100:user:/home/user001:/bin/bash
user002::601:100:user:/home/user002:/bin/bash
user003::602:100:user:/home/user003:/bin/bash
user004::603:100:user:/home/user004:/bin/bash
user005::604:100:user:/home/user005:/bin/bash
user006::605:100:user:/home/user006:/bin/bash
```

2.以root身份执行命令 `/usr/sbin/newusers`，从刚创建的用户文件`user.txt`中导入数据

```bash
newusers < user.txt
```

然后可以执行命令 `vipw` 或 `vi /etc/passwd` 检查 `/etc/passwd` 文件是否已经出现这些用户的数据，并且用户的宿主目录是否已经创建。

3.执行命令`/usr/sbin/pwunconv`

将 `/etc/shadow` 产生的 `shadow` 密码解码，然后回写到 `/etc/passwd` 中，并将`/etc/shadow`的`shadow`密码栏删掉。这是为了方便下一步的密码转换工作，即先取消 shadow password 功能。

```bash
pwunconv
```

4.编辑每个用户的密码对照文件

```bash
用户名:密码
```

如，passwd.txt：

```
user001:123456
user002:123456
user003:123456
user004:123456
user005:123456
user006:123456
```

5.以 root 身份执行命令 `/usr/sbin/chpasswd`

创建用户密码，chpasswd 会将经过 `/usr/bin/passwd` 命令编码过的密码写入 `/etc/passwd` 的密码栏。

```bash
chpasswd < passwd.txt
```

6.确定密码经编码写入/etc/passwd的密码栏后

执行命令 `/usr/sbin/pwconv` 将密码编码为 shadow password，并将结果写入 `/etc/shadow`。

```bash
pwconv
```

## Linux 磁盘管理

Linux磁盘管理好坏直接关系到整个系统的性能问题。Linux磁盘管理常用的三个命令为df、du和fdisk。

命令 | 用途
:-|:-
df | 列出文件系统的整体磁盘使用量
du | 检查磁盘空间使用量
fdisk | 用于磁盘分区

### df

df命令参数功能：检查文件系统的磁盘占用情况。可以利用该命令来获取硬盘被占用了多少空间，目前还剩下多少空间等信息。

```bash
df [-ahikHTm] [目录或文件名]
```

参数 | 作用
:-|:-
-a | 列出所有的文件系统，包括系统特有的/proc等文件系统
-k | 以KBytes的容量显示各文件系统
-m | 以MBytes的容量显示各文件系统
-h | 以人们较易阅读的 GBytes、MBytes、KBytes等格式自行显示
-H | 以M=1000k取代M=1024K的进位方式
-T | 显示文件系统类型，连同该partition（分区）的filesystem名称（如ext3）也列出
-i | 不用硬盘容量，而以inode的数量来显示

```bash
df # 将系统内所有的文件系统列出来，以KBytes的容量列出(不含特殊内存内的文件系统与 swap) 

Filesystem      1K-blocks      Used Available Use% Mounted on
/dev/hdc2         9920624   3823112   5585444  41% /
/dev/hdc3         4956316    141376   4559108   4% /home
/dev/hdc1          101086     11126     84741  12% /boot
tmpfs              371332         0    371332   0% /dev/shm                   147391484 16386844 131004640  12% /d
##
df -h # 将容量结果以易读的容量格式显示出来

Filesystem            Size  Used Avail Use% Mounted on
/dev/hdc2             9.5G  3.7G  5.4G  41% /
/dev/hdc3             4.8G  139M  4.4G   4% /home
/dev/hdc1              99M   11M   83M  12% /boot
tmpfs                 363M     0  363M   0% /dev/shm
##
df -aT # 将系统内的所有特殊文件格式及名称都列出来

Filesystem    Type 1K-blocks    Used Available Use% Mounted on
/dev/hdc2     ext3   9920624 3823112   5585444  41% /
....中间省略....
/dev/hdc3     ext3   4956316  141376   4559108   4% /home
/dev/hdc1     ext3    101086   11126     84741  12% /boot
....中间省略....
sunrpc  rpc_pipefs         0       0         0   -  /var/lib/nfs/rpc_pipefs
##
df -h /etc # 将 /etc 底下的可用的磁盘容量以易读的容量格式显示

Filesystem            Size  Used Avail Use% Mounted on
/dev/hdc2             9.5G  3.7G  5.4G  41% /
```

### du

du命令用于查看磁盘使用空间的，但该命令是对文件和目录磁盘使用的空间的查看。

```bash
du [-ahskm] 文件或目录名
```

参数 | 作用
:-|:-
-a | 列出所有的文件与目录容量，因为默认仅统计目录底下的文件量
-h | 以人们较易阅读的容量格式（G/M）显示
-s | 列出总量，不列出每个各别的目录占用容量
-S | 不包括子目录下的总计，与-s有区别
-k | 以KBytes列出容量显示
-m | 以MBytes列出容量显示

```bash
du # 只列出当前目录下的所有文件夹容量（包括隐藏文件夹）

8       ./test4     # 每个目录都会列出来
....中间省略....
12      ./.gconfd   # 包括隐藏文件的目录
220     .           # 这个目录(.)所占用的总量
##
du -a # 将文件的容量也列出来

12      ./install.log.syslog   # 有文件的列表了
8       ./.bash_logout
....中间省略....
220     .
##
du -sm /* # 检查根目录底下每个目录所占用的容量，通配符 * 来代表每个目录

7       /bin
6       /boot
.....中间省略....
0       /proc
.....中间省略....
1       /tmp
3859    /usr     # 系统初期最大就是它
77      /var
```

### fdisk

fdisk命令是Linux的磁盘分区表操作工具。

```bash
fdisk [-l] 装置名称
```

参数 | 作用
:-|:-
-l | 输出后面接的装置所有分区的内容。若仅有 `fdisk -l` 时，则系统将会把整个系统内能够搜寻到的装置的分区列出来。

```bash
fdisk -l # 列出所有分区信息

Disk /dev/xvda: 21.5 GB, 21474836480 bytes
255 heads, 63 sectors/track, 2610 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x00000000

    Device Boot      Start         End      Blocks   Id  System
/dev/xvda1   *           1        2550    20480000   83  Linux
/dev/xvda2            2550        2611      490496   82  Linux swap / Solaris

Disk /dev/xvdb: 21.5 GB, 21474836480 bytes
255 heads, 63 sectors/track, 2610 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x56f40944

    Device Boot      Start         End      Blocks   Id  System
/dev/xvdb2               1        2610    20964793+  83  Linux
##
df / # 找出系统中的根目录所在磁盘，并查阅该硬盘内的相关信息(注意：重点在找出磁盘文件名而已)

Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/hdc2              9920624   3823168   5585388  41% /

## 开始分区
fdisk /dev/hdc  # 不要加上数字

The number of cylinders for this disk is set to 5005.
There is nothing wrong with that, but this is larger than 1024,
and could in certain setups cause problems with:
1) software that runs at boot time (e.g., old versions of LILO)
2) booting and partitioning software from other OSs
   (e.g., DOS FDISK, OS/2 FDISK)

Command (m for help):     # 等待你的输入

# 输入 m 后，就会看到底下这些命令介绍

Command (m for help): m
Command action
   a   toggle a bootable flag
   b   edit bsd disklabel
   c   toggle the dos compatibility flag
   d   delete a partition            # 删除一个partition
   l   list known partition types
   m   print this menu
   n   add a new partition           # 新增一个partition
   o   create a new empty DOS partition table
   p   print the partition table     # 在屏幕上显示分割表
   q   quit without saving changes   # 不储存离开fdisk程序
   s   create a new empty Sun disklabel
   t   change a partition s system id
   u   change display/entry units
   v   verify the partition table
   w   write table to disk and exit  # 将刚刚的动作写入分割表
   x   extra functionality (experts only)

## 离开 fdisk 时按下q，所有的动作都不会生效。相反的，按下w动作生效。

Command (m for help): p  # 这里可以输出目前磁盘的状态，可以列出目前这颗磁盘的分割表信息

Disk /dev/hdc: 41.1 GB, 41174138880 bytes        # 这个磁盘的文件名与容量
255 heads, 63 sectors/track, 5005 cylinders      # 磁头、扇区与磁柱大小
Units = cylinders of 16065 * 512 = 8225280 bytes # 每个磁柱的大小

   Device Boot      Start         End      Blocks   Id  System
/dev/hdc1   *           1          13      104391   83  Linux
/dev/hdc2              14        1288    10241437+  83  Linux
/dev/hdc3            1289        1925     5116702+  83  Linux
/dev/hdc4            1926        5005    24740100    5  Extended
/dev/hdc5            1926        2052     1020096   82  Linux swap / Solaris
# 装置文件名 启动区否 开始磁柱    结束磁柱  1K大小容量 磁盘分区槽内的系统

Command (m for help): q
```

### 磁盘格式化

磁盘分割完后就要进行文件系统的格式化，命令是mkfs（make filesystem）。

```bash
mkfs [-t 文件系统格式] 装置文件名
```

参数 | 作用
:-|:-
-t | 可以接文件系统格式，例如ext3,ext2,vfat等（系统支持的才会生效）

```bash
mkfs[tab][tab] # 查看 mkfs 支持的文件格式

mkfs         mkfs.cramfs  mkfs.ext2    mkfs.ext3    mkfs.msdos   mkfs.vfat
## 
mkfs -t ext3 /dev/hdc6 # 将分区 /dev/hdc6（可指定你自己的分区） 格式化为 ext3 文件系统

mke2fs 1.39 (29-May-2006)
Filesystem label=                # 这里指的是分割槽的名称(label)
OS type: Linux
Block size=4096 (log=2)          # block 的大小配置为 4K 
Fragment size=4096 (log=2)
251392 inodes, 502023 blocks     # 由此配置决定的inode/block数量
25101 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=515899392
16 block groups
32768 blocks per group, 32768 fragments per group
15712 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912

Writing inode tables: done
Creating journal (8192 blocks): done # 有日志记录
Writing superblocks and filesystem accounting information: done

This filesystem will be automatically checked every 34 mounts or
180 days, whichever comes first.  Use tune2fs -c or -i to override.
# 这样就创建出了 Ext3 文件系统
```

### 磁盘检验

fsck（file system check）用来检查和维护不一致的文件系统。若系统掉电或磁盘发生问题，可以利用fsck命令对文件系统进行检查。

```bash
fsck [-t 文件系统] [-ACay] 装置名称
```

参数 | 作用
:-|:-
-t | 给定档案系统的形式，若在 /etc/fstab 中已有定义或 kernel 本身已支援的则不需加上此参数
-s | 依序一个一个的执行fsck的指令来检查
-A | 对/etc/fstab中所有列出来的分区做检查
-C | 显示完整的检查进度
-d | 打印出e2fsck的debug结果
-p | 同时有-A时，同时有多个fsck的检查一起执行
-R | 同时有-A时，忽略/不检查
-V | 详细显示模式
-a | 如果检查有错则自动修复
-r | 如果检查有错则自动修复
-y | 选项指定检测每个文件是自动输入yes，在不确定哪些是不正常的时候，可以执行 `fsck -y` 全部检查修复

```bash
fsck[tab][tab] # 查看系统有多少文件系统支持的 fsck 命令

fsck         fsck.cramfs  fsck.ext2    fsck.ext3    fsck.msdos   fsck.vfat
## 
fsck -C -f -t ext3 /dev/hdc6 # 强制检测 /dev/hdc6 分区，加上 -f 强制检查，才会一项一项的显示过程

fsck 1.39 (29-May-2006)
e2fsck 1.39 (29-May-2006)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
vbird_logical: 11/251968 files (9.1% non-contiguous), 36926/1004046 blocks
```

### 磁盘挂载与卸载

Linux的磁盘挂载使用mount命令，卸载使用umount命令。

```bash
mount [-t 文件系统] [-L Label名] [-o 额外选项] [-n] 装置文件名 挂载点
```

```bash
mkdir /mnt/hdc6 # 创建挂载点
mount /dev/hdc6 /mnt/hdc6 # 将/dev/hdc6 挂载到 /mnt/hdc6 上面
df

Filesystem           1K-blocks      Used Available Use% Mounted on
.....中间省略.....
/dev/hdc6              1976312     42072   1833836   3% /mnt/hdc6
```

```bash
umount [-fn] 装置文件名或挂载点
```

参数 | 作用
:-|:-
-f | 强制卸除。可用在类似网络文件系统 (NFS) 无法读取到的情况下
-n | 不升级/etc/mtab情况下卸载

```bash
umount /dev/hdc6 # 卸载/dev/hdc6
```

## Linux yum 命令

yum（ Yellow dog Updater, Modified）是一个在Fedora和RedHat以及SUSE中的Shell前端软件包管理器。yum提供了查找、安装、删除某一个、一组甚至全部软件包的命令，基于RPM包管理，能够从指定的服务器自动下载RPM包并且安装，可以自动处理依赖性关系，并且一次安装所有依赖的软体包，无须繁琐地一次次下载、安装。

语法：

```bash
yum [options] [command] [package ...]
```

- options：可选，选项包括-h（帮助），-y（当安装过程提示选择全部为"yes"）， - q（不显示安装的过程）等等。
- command：要进行的操作
- package：操作的对象

### yum常用命令

命令 | 用途
:-|:-
yum check-update | 列出所有可更新的软件清单命令
yum update | 更新所有软件命令
`yum install <package_name>` | 仅安装指定的软件命令
`yum update <package_name>` | 仅更新指定的软件命令
yum list | 列出所有可安裝的软件清单命令
`yum remove <package_name>` | 删除软件包命令
`yum search <keyword>` | 查找软件包命令
yum clean packages | 清除缓存目录下的软件包
yum clean headers | 清除缓存目录下的 headers
yum clean oldheaders | 清除缓存目录下旧的 headers
yum clean, yum clean all (= yum clean packages; yum clean oldheaders) | 清除缓存目录下的软件包及旧的headers
