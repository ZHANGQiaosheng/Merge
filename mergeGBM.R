#######
rm(list = ls())
setwd("D:/zqs/experiment_result/RAW_data/GBM/6811115b-c3db-4f12-8689-c4deef8252fd/Expression-Genes/UNC__AgilentG4502A_07_2")                                     #设定工作目录为D盘
a = list.files("Level_3")                          #list.files命令将input文件夹下所有文件名输入a
dir = paste("./Level_3/",a,sep="")                   #用paste命令构建路径变量dir
n = length(dir)                                                                 #读取dir长度，也就是文件夹下的文件个数
## merge.data = read.csv(file = dir[1],header=T,sep=",")   #读入第一个文件内容（可以不用先读一个，但是为了简单，省去定义data.frame的时间，我选择先读入一个文件。
merge.data = read.delim(file = dir[1],header=T,sep="\t")
for (i in 2:n)
{
  new.data = read.delim(file = dir[i], header=T, sep="\t")
  merge.data = merge(merge.data,new.data,sort = FALSE)
}
write.table(merge.data,"MergeData.txt",quote = F,row.names = F,col.names = F,sep = "\t")