# Shell编程

## Shell变量

定义变量时，变量名不加“$”符号。需要注意的是，变量名和等号之间不能有空格。变量名的命名需要遵循以下规则：

- 命名只能使用英文字母、数字、下划线，首个字符不能以数字开头
- 中间不能有空格，可以使用下划线
- 不能使用标点符号
- 不能使用bash里的关键字（可以用help命令查看保留关键字）

除了显式地直接赋值，还可以用语句给变量赋值，如：

```bash
# 将 /etc 下目录的文件名循环出来
for file in `ls /etc`
或
for file in $(ls /etc)
```

### 使用变量

使用一个定义过的变量，只要在变量名前面加$符号即可，如：

```bash
my_name='zhangyanling'
echo $my_name
echo ${my_name}
```

变量名外面的花括号是可选的，加不加都行，推荐给所有变量加上花括号，这是个好的编程习惯。加花括号是为了帮助解释器识别变量的边界，如：

```bash
for lng in Action Coffe Java; do
  echo "I am good at ${lng}Script"
done
```

### 只读变量

使用 readonly 命令可以将变量定义为只读变量，只读变量的值不能被改变。

```bash
my_name=zhangyanling
readonly my_name # my_name只读，将不能被改变
```

### 删除变量

使用 unset 命令可以删除变量，变量被删除后不能再次使用。注意，该命令不能删除只读变量。

```bash
unset my_name
```

### 变量类型

- 局部变量

  指在脚本或命令中定义，仅在当前shell实例中有效，其他shell启动的程序不能访问局部变量。

- 环境变量

  所有的程序，包括shell启动的程序，都能访问环境变量，有些程序需要环境变量来保证其正常运行。必要的时候shell脚本也可以定义环境变量。

- shell变量

  是指由shell程序设置的特殊变量。shell变量中有一部分是环境变量，有一部分是局部变量，这些变量保证了shell的正常运行。

## Shell字符串

字符串是shell编程中最常用最有用的数据类型，字符串可以用单引号，也可以用双引号，也可以不用引号。

### 单引号

```bash
my_name='zhangyanling'
```

单引号字符串的限制：

- 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的
- 单引号字符串中不能出现单独一个的单引号（对单引号使用转义符后也不行），但可成对出现，作为字符串拼接使用

### 双引号

```bash
my_name='zhangyanling'
str="Hello, I know you are \"$my_name\"! \n"
echo -e $str

# 输出：Hello, I know you are "zhangyanling"!
```

双引号的优点：

- 双引号里面可以有变量
- 双引号可以出现转义字符

### 拼接字符串

```bash
my_name='zhangyanling'
# 使用双引号拼接
str="hello, "$my_name" !"
str_1="hello, ${my_name} !"
echo $str $str_1

# 输出：hello, zhangyanling ! hello, zhangyanling !

str_2='hello, '$my_name' !'
str_3='hello, ${my_name} !'
echo $str_2 $str_3

# 输出：hello, zhangyanling ! hello, ${my_name} !
```

### 获取字符串长度

```bash
my_name='zhangyanling'
echo ${#my_name}

# 输出：12
```

### 提取子字符串

```bash
str="my name is zhangyanling"
echo ${str:1:4} # 表示从字符串第2个字符串开始截取4个字符（索引从0开始算）

# 输出：y na
```

### 查找子字符串

```bash
str="my name is zhangyanling"
echo `expr index "$str" in` # 查找字符 i 或 n 的位置(哪个字母先出现就计算哪个)

# 输出：4
```

## Shell 数组

Bash Shell支持一维数组（不支持多维数组），并且没有限定数组的大小。数组可以存放多个值，其元素的下标索引从0开始编号，获取元素通过下标获取（下标可以是整数或运算表达式，其值大于等于0）。Shell 数组用括号来表示，元素用"空格"符号分割开。

### 定义数组

```bash
数组名=(值1 值2 ... 值n)
```

```bash
my_array=(value0 value1 value2)
或
my_array=(
  value0
  value1
  value2
)

# 还可以单独定义数组的各个分量。可以不使用连续的下标，而且下标的范围没有限制
my_array[0]=value0
my_array[1]=value1
...
my_array[n]=valuen
```

### 读取数组

```bash
${数组名[下标]}
```

```bash
value1=${my_array[1]}

# 使用 @ 符号可以获取数组中的所有元素
echo ${my_array[@]}
```

### 获取数组的长度

```bash
# 获取数组元素的个数
length=${#my_array[@]}
或
length=${#my_array[*]}

# 输出：4

# 获取数组单个元素的长度
lengthn=${#my_array[n]}
```

## Shell注释

以“#”开头的行就是注释，挥别解释器忽略。当遇到多行内容需要注释时，每一行加个#符号太费劲，可以把这一段要注释的代码用一对花括号括起来，定义成一个函数，没有地方调用这个函数，这块代码就不会执行，达到了和注释一样的效果。

```bash
# 这是一个注释

# 多行注释
:<<EOF
注释内容...
注释内容...
注释内容...
EOF

# EOF 也可以使用其他符号：
:<<'
注释内容...
注释内容...
注释内容...
'

:<<!
注释内容...
注释内容...
注释内容...
!
```

## Shell传参

在执行shell脚本时，向脚本内获取参数的格式为：$n。n 代表一个数字，1为执行脚本的第一个参数，以此类推……

```bash
#!/bin/bash
# author: zhangyanling

echo "Shell 传递参数实例！";
echo "执行的文件名：$0";
echo "第一个参数为：$1";
echo "第二个参数为：$2";
echo "第三个参数为：$3";

## 输出 ##
$ ./hello.sh 1 2 3
Shell 传递参数实例！
执行的文件名：./hello.sh
第一个参数为：1
第二个参数为：2
第三个参数为：3
```

特殊字符用来处理参数：

参数处理 | 说明
:-|:-
$# | 传递到脚本的参数个数
$* | 以一个单字符串显示所有向脚本传递的参数。如"$*"用`"`括起来的情况、以"$1 $2 … $n"的形式输出所有参数。
$$ | 脚本运行的当前进程ID号
$! | 后台运行的最后一个进程的ID号
$@ | 与$*相同，到那时使用时加引号，并在引号中返回每个参数。如"$@"用`"`括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数。
$- | 显示Shell使用的当前选项，与set命令功能相同
$? | 显示最后命令的退出状态。0表示没有错误，其他任何值都表明有错误

```bash
#!/bin/bash
# author: zhangyanling

echo "Shell 传递参数实例！";
echo "第一个参数为：$1";

echo "参数个数为：$#";
echo "传递的参数作为一个字符串显示：$*";

## 输出 ##
$ ./hello.sh 1 2
Shell 传递参数实例！
第一个参数为：1
参数个数为：2
传递的参数作为一个字符串显示：1 2
```

$* 与 $@ 区别：

- 相同点：都是引用所有参数
- 不同点：只有在双引号中体现出来。假设在脚本运行时写了三个参数 1、2、3，则 "*" 等价于 "1 2 3"（传递了一个参数），而 "@" 等价于 "1" "2" "3"（传递了三个参数）

```bash
#!/bin/bash
# author: zhangyanling

echo "-- \$* 演示 ---"
for i in "$*";do
  echo $i
done

echo "-- \$@ 演示 ---"
for i in "$@"; do
    echo $i
done

## 输出 ##
$ ./hello.sh 1 2 3
-- $* 演示 ---
1 2 3
-- $@ 演示 ---
1
2
3
```

## Shell基本运算符

Shell支持多种运算符，包括：

- 算数运算
- 关系运算
- 布尔运算
- 字符串运算
- 文件测试运算

原生bash不支持简单的数学运算，但是可以通过其他命令来实现，例如 awk 和 expr，expr 最常用。expr 是一款表达式计算工具，使用它能完成表达式的求值操作。

```bash
#!/bin/bash
sum=`expr 1 + 1`
echo "两数之和为：$sum"

## 输出 ##
两数之和为：2
```

两点注意：

- 表达式和运算符之间要有空格，例如 `2+2` 是不对的，必须写成 `2 + 2`
- 完整的表达式要被 `` 包含

### 算术运算符

假设变量a为10，变量b为20：

运算符 | 说明 | 示例
:-|:-|:-
`+` | 加法 | `expr $a + $b` 结果为 30
`-` | 减法 | `expr $a - $b` 结果为 -10
`*` | 乘法 | `expr $a \* $b` 结果为 200
`/` | 除法 | `expr $b / $a` 结果为 2
`%` | 取余 | `expr $b % $a` 结果为 0
`=` | 赋值 | a=$b 将把变量 b 的值赋给 a
`==` | 相等。用于比较两个数字，相同则返回 true。| [ $a == $b ] 返回 false
`!=` | 不相等。用于比较两个数字，不相同则返回 true。| [ $a != $b ] 返回 true

注意：条件表达式要放在方括号之间，并且要有空格。例如，[$a==$b] 是错误的，必须写成 [ $a == $b ]。

```bash
#!/bin/bash
a=10
b=20

val=`expr $a + $b`
echo "a + b : $val"

val=`expr $a - $b`
echo "a - b : $val"

val=`expr $a \* $b`
echo "a * b : $val"

val=`expr $b / $a`
echo "b / a : $val"

val=`expr $b % $a`
echo "b % a : $val"

if [ $a == $b ]
then
   echo "a 等于 b"
fi
if [ $a != $b ]
then
   echo "a 不等于 b"
fi

## 输出 ##
a + b : 30
a - b : -10
a * b : 200
b / a : 2
b % a : 0
a 不等于 b
```

> 注意：1.乘号（*）前面需要加反斜杠（\） 2.if...then...fi是条件语句 3.在Mac中expr的语法是：$((表达式))，此处表达式中的“*”不需要转义符号“\”。

### 关系运算符

关系运算符只支持数字，不支持字符串，除非字符串的值是数字。

假设变量a为10，变量b为20：

运算符 | 说明 | 示例
:-|:-|:-
`-eq` | 检测两个数是否相等，相等返回true | [ $a -eq $b ] 返回 false
`-ne` | 检测两个数是否不相等，不相等返回true | [ $a -ne $b ] 返回 true
`-gt` | 检测左边的数是否大于右边的，如果是，则返回true | [ $a -gt $b ] 返回 false
`-lt` | 检测左边的数是否小于右边的，如果是，则返回true | [ $a -lt $b ] 返回 true
`-ge` | 检测左边的数是否大于等于右边的，如果是，则返回 true | [ $a -ge $b ] 返回 false
`-le` | 检测左边的数是否小于等于右边的，如果是，则返回 true | [ $a -le $b ] 返回 true

```bash
#!/bin/bash
a=10
b=20

if [ $a -eq $b ]
then
   echo "$a -eq $b: a 等于 b"
else
   echo "$a -eq $b: a 不等于 b"
fi
if [ $a -ne $b ]
then
   echo "$a -ne $b: a 不等于 b"
else
   echo "$a -ne $b: a 等于 b"
fi
if [ $a -gt $b ]
then
   echo "$a -gt $b: a 大于 b"
else
   echo "$a -gt $b: a 不大于 b"
fi
if [ $a -lt $b ]
then
   echo "$a -lt $b: a 小于 b"
else
   echo "$a -lt $b: a 不小于 b"
fi
if [ $a -ge $b ]
then
   echo "$a -ge $b: a 大于或等于 b"
else
   echo "$a -ge $b: a 小于 b"
fi
if [ $a -le $b ]
then
   echo "$a -le $b: a 小于或等于 b"
else
   echo "$a -le $b: a 大于 b"
fi

## 输出 ##
10 -eq 20: a 不等于 b
10 -ne 20: a 不等于 b
10 -gt 20: a 不大于 b
10 -lt 20: a 小于 b
10 -ge 20: a 小于 b
10 -le 20: a 小于或等于 b
```

### 布尔运算符

假设变量a为10，变量b为20：

运算符 | 说明 | 示例
:-|:-|:-
`!` | 非运算，表达式为true则返回false，否则返回true | [ !false ] 返回true
`-o` | 或运算，有一个表达式为true 则返回true | [ $a -lt 20 -o $b -gt 100 ] 返回 true
`-a` | 与运算，两个表达式均为true 才返回true | [ $a -lt 20 -a $b -gt 100 ] 返回 false

```bash
#!/bin/bash
a=10
b=20

if [ $a != $b ]
then
  echo "$a != $b : a 不等于 b"
else
  echo "$a == $b : a 等于 b"
fi
if [ $a -lt 100 -a $b -gt 15 ]
then
   echo "$a 小于 100 且 $b 大于 15 : 返回 true"
else
   echo "$a 小于 100 且 $b 大于 15 : 返回 false"
fi
if [ $a -lt 100 -o $b -gt 100 ]
then
   echo "$a 小于 100 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 100 或 $b 大于 100 : 返回 false"
fi
if [ $a -lt 5 -o $b -gt 100 ]
then
   echo "$a 小于 5 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 5 或 $b 大于 100 : 返回 false"
fi

## 输出 ##
10 != 20 : a 不等于 b
10 小于 100 且 20 大于 15 : 返回 true
10 小于 100 或 20 大于 100 : 返回 true
10 小于 5 或 20 大于 100 : 返回 false
```

### 逻辑运算符

假设变量a为10，变量b为20：

运算符 | 说明 | 示例
:-|:-|:-
`&&` | 逻辑的 AND | [[ $a -lt 100 && $b -gt 100 ]] 返回 false
`\|\|' | 逻辑的 OR | [[ $a -lt 100 `\|\|` $b -gt 100 ]] 返回 true

```bash
#!/bin/bash
a=10
b=20

if [[ $a -lt 100 && $b -gt 100 ]]
then
   echo "返回 true"
else
   echo "返回 false"
fi

if [[ $a -lt 100 || $b -gt 100 ]]
then
   echo "返回 true"
else
   echo "返回 false"
fi

## 输出 ##
返回 false
返回 true
```

### 字符串运算符

假设变量 a 为 "abc"，变量 b 为 "efg"：

运算符 | 说明 | 示例
:-|:-|:-
`=` | 检测两个字符串是否相等，相等返回 true | [ $a = $b ] 返回 false
`!=` | 检测两个字符串是否相等，不相等返回 true | [ $a != $b ] 返回 true
`-z` | 检测字符串长度是否为0，为0返回 true | [ -z $a ] 返回 false
`-n` | 检测字符串长度是否不为 0，不为 0 返回 true | [ -n "$a" ] 返回 true
`$` | 检测字符串是否为空，不为空返回 true | [ $a ] 返回 true

```bash
#!/bin/bash
a="abc"
b="efg"

if [ $a = $b ]
then
   echo "$a = $b : a 等于 b"
else
   echo "$a = $b: a 不等于 b"
fi
if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a != $b: a 等于 b"
fi
if [ -z $a ]
then
   echo "-z $a : 字符串长度为 0"
else
   echo "-z $a : 字符串长度不为 0"
fi
if [ -n "$a" ]
then
   echo "-n $a : 字符串长度不为 0"
else
   echo "-n $a : 字符串长度为 0"
fi
if [ $a ]
then
   echo "$a : 字符串不为空"
else
   echo "$a : 字符串为空"
fi

## 输出 ##
abc = efg: a 不等于 b
abc != efg : a 不等于 b
-z abc : 字符串长度不为 0
-n abc : 字符串长度不为 0
abc : 字符串不为空
```

### 文件测试运算符

文件测试运算符用于检测 Unix 文件的各种属性。

操作符 | 说明 | 示例
:-|:-|:-
-b file | 检测文件是否是块设备文件，如果是，则返回 true | [ -b $file ] 返回 false
-c file | 检测文件是否是字符设备文件，如果是，则返回true | [ -c $file ] 返回 false
-d file | 检测文件是否是目录，如果是，则返回 true | [ -d $file ] 返回 false
-f file | 检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true | [ -f $file ] 返回 true
-g file | 检测文件是否设置了 SGID 位，如果是，则返回 true | [ -g $file ] 返回 false
-k file | 检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true | [ -k $file ] 返回 false
-p file | 检测文件是否是有名管道，如果是，则返回 true | [ -p $file ] 返回 false
-u file | 检测文件是否设置了 SUID 位，如果是，则返回 true | [ -u $file ] 返回 false
-r file | 检测文件是否可读，如果是，则返回 true | [ -r $file ] 返回 true
-w file | 检测文件是否可写，如果是，则返回 true | [ -w $file ] 返回 true
-x file | 检测文件是否可执行，如果是，则返回 true | [ -x $file ] 返回 true
-s file | 检测文件是否为空（文件大小是否大于0），不为空返回 true | [ -s $file ] 返回 true
-e file | 检测文件（包括目录）是否存在，如果是，则返回 true | [ -e $file ] 返回 true
-S file | 判断某文件是否 socket | -
-L file | 检测文件是否存在并且是一个符号链接 | -

```bash
#!bin/bash
file="/var/www/zhangyanling/hello.sh"

if [ -r $file ]
then
   echo "文件可读"
else
   echo "文件不可读"
fi
if [ -w $file ]
then
   echo "文件可写"
else
   echo "文件不可写"
fi
if [ -x $file ]
then
   echo "文件可执行"
else
   echo "文件不可执行"
fi
if [ -f $file ]
then
   echo "文件为普通文件"
else
   echo "文件为特殊文件"
fi
if [ -d $file ]
then
   echo "文件是个目录"
else
   echo "文件不是个目录"
fi
if [ -s $file ]
then
   echo "文件不为空"
else
   echo "文件为空"
fi
if [ -e $file ]
then
   echo "文件存在"
else
   echo "文件不存在"
fi

## 输出 ##
文件可读
文件可写
文件可执行
文件为普通文件
文件不是个目录
文件不为空
文件存在
```

## Shell echo命令

echo命令用于字符串输出。可以使用echo实现更复杂的输出格式控制。

```bash
echo 字符串
```

### 显示普通字符串

```bash
echo "My name is zhangyanling" # 双引号可以省略
或
echo My name is zhangyanling

## 输出 ##
My name is zhangyanling
```

### 显示转义字符

```bash
echo "\"My name is zhangyanling\""

## 输出 ##
"My name is zhangyanling"
```

### 显示变量

read 命令从标准输入中读取一行,并把输入行的每个字段的值指定给 shell 变量。

```bash
#!/bin/bash
read my_name
echo "$name is a girl"

## 输出 ##
$ ./hello.sh # 回车后输入下面这个
zhangyanling # 标准输入
zhangyanling is a girl # 输出
```

### 显示换行

```bash
#!/bin/bash
echo -e "Hello! \n" # -e 开启转义 \n 换行
echo "My name is zhangyanling"

## 输出 ##
Hello!

My name is zhangyanling
```

### 显示不换行

```bash
#!/bin/bash
echo -e "Hello! \c" # -e 开启转义 \c 不换行
echo "My name is zhangyanling"

## 输出 ##
Hello! My name is zhangyanling
```

### 显示结果定向至文件

```bash
#!/bin/bash
echo "My name is zhangyanling" > file1
```

### 原样输出字符串，不进行转义或取变量(用单引号)

```bash
#!/bin/bash
echo '$my_name\"'

## 输出 ##
$my_name\"
```

### 显示命令执行结果

```bash
echo `date` # 结果将显示当前日期 （注意： 这里使用的是反引号 `, 而不是单引号 '）

## 输出 ##
2020年07月28日 16:02:06
```

## Shell printf 命令

printf 由 POSIX 标准所定义，因此使用 printf 的脚本比使用 echo 移植性好。printf 使用引用文本或空格分隔的参数，外面可以在 printf 中使用格式化字符串，还可以制定字符串的宽度、左右对齐方式等。默认 printf 不会像 echo 自动添加换行符，可以手动添加 \n。

```bash
printf format-string [arguments...]
```

- format-string：格式控制字符串
- arguments：参数列表

```bash
echo "Hello, Shell"
# 等价于
printf "Hello, Shell\n"
```

示例：

```bash
#!/bin/bash

# %s %c %d %f都是格式替代符
# %-10s 指一个宽度为10个字符（-表示左对齐，没有则表示右对齐），任何字符都会被显示在10个字符宽的字符内，如果不足则自动以空格填充，超过也会将内容全部显示出来
# %-4.2f 指格式化为小数，其中.2指保留2位小数
printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg  
printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234 
printf "%-10s %-8s %-4.2f\n" 杨过 男 48.6543 
printf "%-10s %-8s %-4.2f\n" 郭芙 女 47.9876

## 输出 ##
姓名     性别   体重kg
郭靖     男      66.12
杨过     男      48.65
郭芙     女      47.99

#---------- 其他示例 ----------
# format-string为双引号
printf "%d %s\n" 1 "abc"

# 单引号与双引号效果一样 
printf '%d %s\n' 1 "abc" 

# 没有引号也可以输出
printf %s abcdef

# 格式只指定了一个参数，但多出的参数仍然会按照该格式输出，format-string 被重用
printf %s abc def

printf "%s\n" abc def

printf "%s %s %s\n" a b c d e f g h i j

# 如果没有 arguments，那么 %s 用NULL代替，%d 用 0 代替
printf "%s and %d \n"

## 输出 ##
1 abc
1 abc
abcdefabcdefabc
def
a b c
d e f
g h i
j
 and 0
```

### printf的转义序列

序列 | 说明
:-|:-
`\a` | 警告字符，通常为ASCII的BEL字符
`\b` | 后退
`\c` | 抑制（不显示）输出结果中任何结尾的换行字符（只在%b格式指示符控制下的参数字符串中有效），而且，任何留在参数里的字符、任何接下来的参数以及任何留在格式字符串中的字符，都被忽略
`\f` | 换页（formfeed）
`\n`| 换行
`\r` | 回车（Carriage return）
`\t` | 水平制表符
`\v` | 垂直制表符
`\\` | 一个字面上的反斜杠字符
`\ddd` | 表示1到3位数八进制值的字符。仅在格式字符串中有效
`\0ddd` | 表示1到3位的八进制值字符

```bash
#!/bin/bash
printf "a string, no processing:<%s>\n" "A\nB"

printf "a string, no processing:<%b>\n" "A\nB"

printf "www.zhangyanling77.com \a"

## 输出 ##
a string, no processing:<A\nB>
a string, no processing:<A
B>
www.zhangyanling77.com # 不换行
```

## Shell test 命令

test命令用于检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试。

### 数值测试

参数 | 说明
:-|:-
-eq | 等于则为真
-ne | 不等于则为真
-gt | 大于则为真
-ge | 大于等于则为真
-lt | 小于则为真
-le | 小于等于则为真

```bash
num1=100
num2=100

if test $[num1] -eq $[num2]
then
   echo '两数相等'
else
   echo '两数不等'
fi

## 输出 ##
两数相等
```

代码中的 [] 执行基本的算数运算，如：

```bash
#!/bin/bash
a=5
b=6

result=$[a+b] # 注意等号两边不能有空格
echo "result 为： $result"

## 输出 ##
result 为： 11
```

### 字符串测试

参数 | 说明
:-|:-
= | 相等则为真
!= | 不相等则为真
-z 字符串 | 字符串的长度为0则为真
-n 字符串 | 字符串的长度不为0则为真

```bash
str1="zhangyanling"
str2="zhangyanqiu"

if test $str1 = $str2
then
   echo '两个字符串相等'
else
   echo '两个字符串不相等'
fi

## 输出 ##
两个字符串不相等
```

### 文件测试

参数 | 说明
:-|:-
-e 文件名 | 如果文件存在则为真
-r 文件名 | 如果文件存在且可读则为真
-w 文件名 | 如果文件存在且可写则为真
-x 文件名 | 如果文件存在且可执行则为真
-s 文件名 | 如果文件存在且至少有一个字符则为真
-d 文件名 | 如果文件存在且为目录则为真
-f 文件名 | 如果文件存在且为普通文件则为真
-c 文件名 | 如果文件存在且为字符型特殊文件则为真
-b 文件名 | 如果文件存在且为特殊文件则为真

```bash
cd /bin
if test -e ./bash
then
    echo '文件已存在!'
else
    echo '文件不存在!'
fi

## 输出 ##
文件已存在!
```

另外，Shell还提供了与( -a )、或( -o )、非( ! )三个逻辑操作符用于将测试条件连接起来，其优先级为："!"最高，"-a"次之，"-o"最低。

## Shell 流程控制

sh的流程控制不可为空，如果else分支没有语句执行，就不要写这个else。

### if else

```bash
# 1 if
if condition
then
    command1 
    command2
    ...
    commandN 
fi
# 2 if else
if condition
then
    command1 
    command2
    ...
    commandN
else
    command
fi
# 3 if else-if else
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

### for 循环

in列表可以包含替换、字符串和文件名。in列表是可选的，如果不用它，for循环使用命令行的位置参数。

```bash
# 1 for
for var in item1 item2 ... itemN
do
    command1
    command2
    ...
    commandN
done
# 2 无限循环
for (( ; ; ))
```

```bash
for loop in 1 2 3
do
    echo "The value is: $loop"
done

## 输出 ##
The value is: 1
The value is: 2
The value is: 3
```

### while 语句

while循环用于不断执行一系列命令，也用于从输入文件中读取数据；命令通常为测试条件。

```bash
# 1 while
while condition
do
    command
done

# 2 无限循环
while :
do
    command
done
或
while true
do
    command
done
```

```bash
#!/bin/bash
num=1
while(( $num<=3 ))
do
    echo $num
    let "num++" # let 命令，它用于执行一个或多个表达式，变量计算中不需要加上 $ 来表示变量
done

## 输出 ##
1
2
3
```

### until 循环

until 循环执行一系列命令直至条件为 true 时停止。与 while 循环在处理方式上刚好相反。一般 while 循环优于 until 循环，但在某些时候—也只是极少数情况下，until 循环更加有用。

```bash
# condition 一般为条件表达式，如果返回值为 false，则继续执行循环体内的语句，否则跳出循环。
until condition
do
    command
done
```

```bash
a=0

until [ ! $a -lt 3 ]
do
   echo $a
   a=`expr $a + 1`
done

## 输出 ##
0
1
2
```

### case

case语句为多选择语句。可以用case语句匹配一个值与一个模式，如果匹配成功，执行相匹配的命令。

```bash
case 值 in
模式1)
    command1
    command2
    ...
    commandN
    ;;
模式2)
    command1
    command2
    ...
    commandN
    ;;
esac
```

取值后面必须为单词in，每一模式必须以右括号结束。取值可以为变量或常数。匹配发现取值符合某一模式后，其间所有命令开始执行直至 ;;。取值将检测匹配的每一个模式。一旦模式匹配，则执行完匹配模式相应命令后不再继续其他模式。如果无一匹配模式，使用星号 * 捕获该值，再执行后面的命令。

```bash
echo '输入1到3之间的数字'
echo '你输入的数字是：'
read num
case $num in
   1) echo '你选择了 1'
   ;;
   2) echo '你选择了 2'
   ;;
   3) echo '你选择了 3'
   ;;
   *) echo '你没有输入 1 到 3 之间的数字'
   ;;
esac

## 输出 ##
输入1到3之间的数字
你输入的数字是：
2
你选择了 2
```

### 跳出循环

Shell使用两个命令来实现该功能：break和continue。

1.break命令

break命令允许跳出所有循环（终止执行后面的所有循环）。

```bash
while :
do
   echo -n "输入 1 到 5 之间的数字:"
   read num
   case $num in
      1|2|3|4|5) echo "你输入的数字为 $num!"
      ;;
      *) echo "你输入的数字不是 1 到 5 之间的! 游戏结束"
         break
      ;;
   esac
done

## 输出 ##
输入 1 到 5 之间的数字:3
你输入的数字为 3!
输入 1 到 5 之间的数字:6
你输入的数字不是 1 到 5 之间的! 游戏结束
```

2.continue

continue命令它不会跳出所有循环，仅仅跳出当前循环。

```bash
while :
do
   echo -n "输入1 到 5之间的数字："
   read num
   case $num in
      1|2|3|4|5) echo "你输入的数字为 $num!"
      ;;
      *) echo "你输入的数字不是 1 到 5 之间的!"
         continue
         echo "游戏结束"
   esac
done

## 输出 ##
输入1 到 5之间的数字：3
你输入的数字为 3!
输入1 到 5之间的数字8
你输入的数字不是 1 到 5 之间的!
输入1 到 5之间的数字：
```

## Shell 函数

linux shell 可以用户定义函数，然后在shell脚本中可以随便调用。

```bash
[ function ] funName [()]

{
   action;

   [return int;]
}
```

- 可以带function fun()定义，也可以直接fun()定义，不带任何参数
- 参数返回，可以显式加return返回，如果不加，将以最后一条命令运行结果，作为返回值。return后跟数值n（0-255）。

```bash
#!/bin/bash

# 1 函数
aFun() {
   echo "这是一个shell函数"
}
echo "-----函数开始执行-----"
aFun
echo "-----函数执行结束-----"

## 输出 ##
-----函数开始执行-----
这是一个shell函数
-----函数执行结束-----

# 2 带返回值
funWithReturn() {
   echo "该函数将对输入的两个数组做相加运算"
   echo "输入第一个数字："
   read num1
   echo "输入第二个数字："
   read num2
   echo "两个数字分别为 $num1 和 $num2 "
   return $(($num1+$num2))
}
funWithReturn
echo "输入的两个数字之和为：$? " # 函数返回值在调用该函数后通过 $? 来获得

## 输出 ##
该函数将对输入的两个数组做相加运算
输入第一个数字：
12
输入第二个数字：
5
两个数字分别为 12 和 5
输入的两个数字之和为：17
```
> 注意：所有函数在使用前必须定义。如果将函数放在脚本开始部分，直至shell解释器首次发现它时，才可以使用。调用函数仅使用其函数名即可。

### 函数参数

调用函数时，可以向其传递参数。在函数体内部，通过`$n`的形式来获取参数的值。例如，$1 表示第一个参数，$2 表示第二个参数……

```bash
#!/bin/bash

funWithParam() {
   echo "第一个参数为 $1 "
   echo "第二个参数为 $2 "
   echo "第十个参数为 $10 "
   echo "第十个参数为 ${10} "
   echo "参数总个数有 $# 个 "
   echo "作为一个字符串输出所有参数 $* "
}
funWithParam 1 2 3 4 5 6 7 8 9 34 76

## 输出 ##
第一个参数为 1
第二个参数为 2
第十个参数为 10
第十个参数为 34
参数总个数有 11 个
作为一个字符串输出所有参数 1 2 3 4 5 6 7 8 9 34 76
```

当n>=10时，需要使用${n}来获取参数。

## Shell 输入/输出重定向

一个命令通常从一个叫标准输入的地方读取输入，默认情况下，这恰好是你的终端。同样，一个命令通常将其输出写入到标准输出，默认情况下也是你的终端。

命令 | 说明
:-|:-
command > file | 将输出重定向到 file
command < file | 将输入重定向到 file
command >> file | 将输出以追加的方式重定向到 file
n > file | 将文件描述符为n的文件重定向到 file
n >> file | 将文件描述符为n的文件以追加的方式重定向到 file
n >& m | 将输出文件m和n合并
n <& m | 将输入文件m和n合并
<< tag | 将开始标记tag和结束标记tag之间的内容作为输入

> 注意：文件描述符 0 通常是标准输入（STDIN），1 是标准输出（STDOUT），2 是标准错误输出（STDERR）。

### 输出重定向

重定向一般通过在命令间插入特定的符号来实现。输出重定向会覆盖文件内容，如果不希望文件内容被覆盖，可以使用 `>>` 追加到文件末尾。

```bash
# 执行command1然后将输出的内容存入file1
command1 > file1
```
> 注意：任何file1内的已经存在的内容将被新内容替代。如果要将新内容添加在文件末尾，请使用>>操作符。

### 输入重定向

可以从文件获取输入，这样，本来需要从键盘获取输入的命令会转移到文件读取内容。

```bash
# 执行command1，读取file1的内容，然后输出结果
command1 < file1 

# 同时替换输入和输出，执行command1，从文件infile读取内容，然后将输出写入到outfile中
command1 < infile > outfile
```

例如，

```bash
touch test.txt
echo "this is a girl" > test.txt
cat test.txt
# this is a girl
touch test2.txt
# 统计test.txt文件的行数，然后将结果写入到test2.txt中
wc -l < test.txt > test2.txt
cat test2.txt
# 1
```

### 其他

一般情况下，每个 Unix/Linux 命令运行时都会打开三个文件：

- 标准输入文件（stdin）：stdin的文件描述符为0，Unix程序默认从stdin读取数据
- 标准输出文件（stdout）：stdout的文件描述符为1，Unix程序默认向stdout输出数据
- 标准错误文件（stderr）：stderr的文件描述符为2，Unix程序会向stderr流中写入错误信息

默认情况下，`command > file` 将 stdout 重定向到 file，`command < file` 将stdin 重定向到 file。2 表示标准错误文件(stderr)。

1.如果希望 stderr 重定向到 file，可以这样写：

```bash
command 2 > file
```

2.如果希望 stderr 追加到 file 文件末尾，可以这样写：

```bash
command 2 >> file
```

3.如果希望将 stdout 和 stderr 合并后重定向到 file，可以这样写：

```bash
command > file 2>&1
或者
command >> file 2>&1
```

4.如果希望对 stdin 和 stdout 都重定向，可以这样写：

```bash
# command 命令将 stdin 重定向到 file1，将 stdout 重定向到 file2
command < file1 > file2
```

### Here Document

Here Document 是 Shell 中的一种特殊的重定向方式，用来将输入重定向到一个交互式 Shell 脚本或程序。

```bash
# 将两个 delimiter 之间的内容(document) 作为输入传递给 command
command << delimiter
   document
delimiter
```

> 注意：1.结尾的delimiter 一定要顶格写，前面不能有任何字符，后面也不能有任何字符，包括空格和 tab 缩进 2.开始的delimiter前后的空格会被忽略掉

在命令行中通过 wc -l 命令计算 Here Document 的行数：

```bash
wc -l << EOF
    欢迎来到
    一江西流的网站
    www.zhangyanling77.com
EOF

## 输出 ##
3
```

### /dev/null 文件

如果希望执行某个命令，但又不希望在屏幕上显示输出结果，那么可以将输出重定向到 `/dev/null`。

```bash
command > /dev/null
```

`/dev/null` 是一个特殊的文件，写入到它的内容都会被丢弃；如果尝试从该文件读取内容，那么什么也读不到。

## Shell 文件包含

Shell也可以包含外部脚本。这样可以很方便的封装一些公用的代码作为一个独立的文件。

```bash
. filename # 注意点号（.）和文件名间有一个空格
或
source filename
```

### 实例

创建test1.sh如下：

```bash
#!/bin/bash

url="http://www.zhangyanling77.com"
```

创建test2.sh如下：

```bash
#!/bin/bash

# 使用 . 来引用test1.sh
. ./test1.sh
# 或使用以下包含文件代码
# source ./test1.sh

echo "一江西流的网站地址：$url"

# 执行 ./test2.sh，输出：
一江西流的网站地址：http://www.zhangyanling77.com
```
