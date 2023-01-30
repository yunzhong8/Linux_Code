#!/bin/sh

echo 开始
read -p "输入文件夹地址" doc_path
read -p "输入文件名称" doc_name
doc_all_path=$doc_path/"$doc_name".md
tocdoc_all_path=$doc_path/"$doc_name"toc.md
echo 文件完整地址$doc_all_path
echo toc文件完整地址$tocdoc_all_path

rm -rf $tocdoc_all_path
touch $tocdoc_all_path
echo toc文件创建完成
#/home/zzq/code/MarkDown/gh-md-toc $doc_all_path
/home/zzq/code/MarkDown/gh-md-toc $doc_all_path > $tocdoc_all_path
cat $doc_all_path >> $tocdoc_all_path
echo 完成
