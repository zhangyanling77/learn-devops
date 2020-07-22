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



