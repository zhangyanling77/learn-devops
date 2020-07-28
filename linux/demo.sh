#!/bin/bash
# echo -e "\e[1;35m hello world \e[0m"

# num1=$1
# num2=$2
# sum=$((num1+num2))
# echo $sum

# for i in "$@"
#  do
#   echo "i=$i"
#  done

# read -p 'please input your name:' -t 5 name
# echo -e "\n"
# read -p 'please input your gender[m/f]:' -n 1 gender
# echo -e "\n"
# read -p 'please input your password:' -s password
# echo -e "\n"
# echo $name,$gender,$password

# a=1
# b=2
# c=$a+$b
# echo $c
# 结果：1+2

# declare -i c=$a+$b
# echo $c
# 结果：3

# declare +i c=$a+$b
# echo $c
# 结果：1+2

# declare -p c
# 结果：declare -- c="1+2"

# declare -i c="3"
# echo $c
# 结果：3

# 声明环境变量
# declare -x kk=1
# bash
# set | grep kk

# 只读
# declare -r x
# x=2
# 结果：报错 ./hello.sh: line 50: x: readonly variable

# 数组
# names[0]=zhangyanling
# names[1]=maling
# 声明为数组类型
# declare -a names;
# 默认只打印第一个元素
# echo ${names}
# 打印第二个元素
# echo ${names[1]}
# 打印全部
# echo ${names[*]}

# echo -e "\033[m hello \033[m"
# echo -e "\033[0;31;46m hello \033[m"

#description: test
# function echo_color(){
#   if [ $1 == "green" ]; then
#      echo -e "\033[32;40m$2\033[0m"
#   elif [ $1 == "red" ]; then
#      echo -e "\033[31;40m$2\033[0m"  
#   fi    
# }

# echo -e "\033[32;40mshell\033[0m"
# echo -e "\033[33;40mshell\033[0m"

# echo_color red hello

# my_name='zhangyanling'
# str="Hello, I know you are \"$my_name\"! \n"
# echo -e $str

# 使用双引号拼接
# str="hello, "$my_name" !"
# str_1="hello, ${my_name} !"
# echo $str $str_1

# str_2='hello, '$my_name' !'
# str_3='hello, ${my_name} !'
# echo $str_2 $str_3

# echo ${#my_name}

# str="my name is zhangyanling"
# echo ${str:1:4}

# echo `expr index "$str" in`

# my_array=(
#   1
#   2
#   3
#   4
# )
# echo ${my_array[@]}

# length=${#my_array[@]}
# length=${#my_array[*]}
# echo $length

# length1=${#my_array[1]}
# echo $length1

# echo "Shell 传递参数实例！";
# echo "执行的文件名：$0";
# echo "第一个参数为：$1";
# echo "第二个参数为：$2";
# echo "第三个参数为：$3";

# echo "Shell 传递参数实例！";
# echo "第一个参数为：$1";

# echo "参数个数为：$#";
# echo "传递的参数作为一个字符串显示：$*";

# echo "-- \$* 演示 ---"
# for i in "$*";do
#   echo $i
# done

# echo "-- \$@ 演示 ---"
# for i in "$@"; do
#     echo $i
# done

# sum=`expr 1 + 1`
# echo "两数之和为：$sum"

# a=10
# b=20

# val=`expr $a + $b`
# echo "a + b : $val"

# val=`expr $a - $b`
# echo "a - b : $val"

# val=`expr $a \* $b`
# echo "a * b : $val"

# val=`expr $b / $a`
# echo "b / a : $val"

# val=`expr $b % $a`
# echo "b % a : $val"

# if [ $a == $b ]
# then
#    echo "a 等于 b"
# fi
# if [ $a != $b ]
# then
#    echo "a 不等于 b"
# fi

# if [ $a -eq $b ]
# then
#    echo "$a -eq $b: a 等于 b"
# else
#    echo "$a -eq $b: a 不等于 b"
# fi
# if [ $a -ne $b ]
# then
#    echo "$a -ne $b: a 不等于 b"
# else
#    echo "$a -ne $b: a 等于 b"
# fi
# if [ $a -gt $b ]
# then
#    echo "$a -gt $b: a 大于 b"
# else
#    echo "$a -gt $b: a 不大于 b"
# fi
# if [ $a -lt $b ]
# then
#    echo "$a -lt $b: a 小于 b"
# else
#    echo "$a -lt $b: a 不小于 b"
# fi
# if [ $a -ge $b ]
# then
#    echo "$a -ge $b: a 大于或等于 b"
# else
#    echo "$a -ge $b: a 小于 b"
# fi
# if [ $a -le $b ]
# then
#    echo "$a -le $b: a 小于或等于 b"
# else
#    echo "$a -le $b: a 大于 b"
# fi

# if [ $a != $b ]
# then
#   echo "$a != $b : a 不等于 b"
# else
#   echo "$a == $b : a 等于 b"
# fi
# if [ $a -lt 100 -a $b -gt 15 ]
# then
#    echo "$a 小于 100 且 $b 大于 15 : 返回 true"
# else
#    echo "$a 小于 100 且 $b 大于 15 : 返回 false"
# fi
# if [ $a -lt 100 -o $b -gt 100 ]
# then
#    echo "$a 小于 100 或 $b 大于 100 : 返回 true"
# else
#    echo "$a 小于 100 或 $b 大于 100 : 返回 false"
# fi
# if [ $a -lt 5 -o $b -gt 100 ]
# then
#    echo "$a 小于 5 或 $b 大于 100 : 返回 true"
# else
#    echo "$a 小于 5 或 $b 大于 100 : 返回 false"
# fi

# if [[ $a -lt 100 && $b -gt 100 ]]
# then
#    echo "返回 true"
# else
#    echo "返回 false"
# fi

# if [[ $a -lt 100 || $b -gt 100 ]]
# then
#    echo "返回 true"
# else
#    echo "返回 false"
# fi


# a="abc"
# b="efg"

# if [ $a = $b ]
# then
#    echo "$a = $b : a 等于 b"
# else
#    echo "$a = $b: a 不等于 b"
# fi
# if [ $a != $b ]
# then
#    echo "$a != $b : a 不等于 b"
# else
#    echo "$a != $b: a 等于 b"
# fi
# if [ -z $a ]
# then
#    echo "-z $a : 字符串长度为 0"
# else
#    echo "-z $a : 字符串长度不为 0"
# fi
# if [ -n "$a" ]
# then
#    echo "-n $a : 字符串长度不为 0"
# else
#    echo "-n $a : 字符串长度为 0"
# fi
# if [ $a ]
# then
#    echo "$a : 字符串不为空"
# else
#    echo "$a : 字符串为空"
# fi

# echo "\"My name is zhangyanling\""

# read my_name
# echo "$my_name is a girl"

# echo -e "Hello! \n" # -e 开启转义
# echo "My name is zhangyanling"

# echo -e "Hello! \c" # -e 开启转义
# echo "My name is zhangyanling"

# echo '$my_name\"'

# echo `date`

# echo "Hello, Shell"

# printf "Hello, Shell\n"

# printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg  
# printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234 
# printf "%-10s %-8s %-4.2f\n" 杨过 男 48.6543 
# printf "%-10s %-8s %-4.2f\n" 郭芙 女 47.9876

# printf "%d %s\n" 1 "abc"

# 单引号与双引号效果一样 
# printf '%d %s\n' 1 "abc" 

# 没有引号也可以输出
# printf %s abcdef

# 格式只指定了一个参数，但多出的参数仍然会按照该格式输出，format-string 被重用
# printf %s abc def

# printf "%s\n" abc def

# printf "%s %s %s\n" a b c d e f g h i j

# 如果没有 arguments，那么 %s 用NULL代替，%d 用 0 代替
# printf "%s and %d \n"

printf "a string, no processing:<%s>\n" "A\nB"

printf "a string, no processing:<%b>\n" "A\nB"

printf "www.zhangyanling77.com \a"
