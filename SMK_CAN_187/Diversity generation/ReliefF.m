clear;
clc;
close all;

%% load Data
load SMK_CAN_187
load SMK_data
load SMK_lable


   
%% ReliefF algorithm

Sample = SMK_data;
Lable = SMK_lable;
Neighburs = 10;

Ranked_ReliefF = ReliefF_Algorithm(Sample, Lable, Neighburs);


rankRel=[];
for i=1:19993
    for j=1:19993
    if (Ranked_ReliefF(i)==j)
    rankRel(j)=i;
    end;
    end;
end







