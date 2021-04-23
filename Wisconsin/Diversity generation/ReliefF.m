clear;
clc;
close all;

%% load Data
load wisconsin.mat



    for j=1:33
        wi_data(:,j)=wisconsin(:,j);
    end


    
        wi_lable(:,1)=wisconsin(:,34);
        
    for i=1:194
        if wi_lable(i)==-1
            wi_lable(i)=2
        
        end
    end
            
            

%% ReliefF algorithm

Sample = wi_data;
Lable = wi_lable;
Neighburs = 10;

Ranked_ReliefF = ReliefF_Algorithm(Sample, Lable, Neighburs);


rankRel=[];
for i=1:33
    for j=1:33
    if (Ranked_ReliefF(i)==j)
    rankRel(j)=i;
    end;
    end;
end



