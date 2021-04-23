clear;
clc;
close all;

%% load Data
load colon.mat



    for j=1:2000
        co_data(:,j)=colon(:,j);
    end


    
        co_lable(:,1)=colon(:,2001);
        
    for i=1:62
        if co_lable(i)==1
            co_lable(i)=1
        else
            co_lable(i)=2
        end
    end
            
            

%% ReliefF algorithm

Sample = co_data;
Lable = co_lable;
Neighburs = 10;

Ranked_ReliefF = ReliefF_Algorithm(Sample, Lable, Neighburs);


rankRel=[];
for i=1:2000
    for j=1:2000
    if (Ranked_ReliefF(i)==j)
    rankRel(j)=i;
    end;
    end;
end



