clear;
clc;
close all;

%% load Data
load LeukemiaB.mat



    for j=1:7129
        leu_data(:,j)=leukemiaB(:,j);
    end


    
        leu_lable(:,1)=leukemiaB(:,7130);
        
    for i=1:72
        if leu_lable(i)==1
            leu_lable(i)=1
        else
            leu_lable(i)=2
        end
    end
            
            

%% ReliefF algorithm

Sample = leu_data;
Lable = leu_lable;
Neighburs = 10;

Ranked_ReliefF = ReliefF_Algorithm(Sample, Lable, Neighburs);


rankRel=[];
for i=1:7129
    for j=1:7129
    if (Ranked_ReliefF(i)==j)
    rankRel(j)=i;
    end;
    end;
end



