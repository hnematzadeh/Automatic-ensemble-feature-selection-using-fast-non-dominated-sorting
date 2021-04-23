clear;
clc;
close all;

%% load Data
load Ovarian.mat



    for j=1:15154
        ov_data(:,j)=Ovarian(:,j);
    end


    
        ov_lable(:,1)=Ovarian(:,15155);
        
    for i=1:253
        if ov_lable(i)==1
            ov_lable(i)=1
        else
            ov_lable(i)=2
        end
    end
            
            

%% ReliefF algorithm

Sample = ov_data;
Lable = ov_lable;
Neighburs = 10;

Ranked_ReliefF = ReliefF_Algorithm(Sample, Lable, Neighburs);


rankRel=[];
for i=1:15154
    for j=1:15154
    if (Ranked_ReliefF(i)==j)
    rankRel(j)=i;
    end;
    end;
end



