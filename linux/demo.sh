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
function echo_color(){
  if [ $1 == "green" ]; then
     echo -e "\033[32;40m$2\033[0m"
  elif [ $1 == "red" ]; then
     echo -e "\033[31;40m$2\033[0m"  
  fi    
}

echo -e "\033[32;40mshell\033[0m"
echo -e "\033[33;40mshell\033[0m"

echo_color red hello
