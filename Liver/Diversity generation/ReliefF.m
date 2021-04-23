clear;
clc;
close all;

%% load Data
load Liver.mat



    for j=1:30
        liv_data(:,j)=Liver(:,j);
    end


    
        liv_lable(:,1)=Liver(:,31);
        
    for i=1:569
        if liv_lable(i)==1
            liv_lable(i)=1
        else
            liv_lable(i)=2
        end
    end
            
            

%% ReliefF algorithm

Sample = liv_data;
Lable = liv_lable;
Neighburs = 10;

Ranked_ReliefF = ReliefF_Algorithm(Sample, Lable, Neighburs);


rankRel=[];
for i=1:30
    for j=1:30
    if (Ranked_ReliefF(i)==j)
    rankRel(j)=i;
    end;
    end;
end



