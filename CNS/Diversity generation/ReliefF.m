clear;
clc;
close all;

%% load Data
load CNS.mat



    for j=1:7129
        cns_data(:,j)=CNS(:,j);
    end


    
        cns_lable(:,1)=CNS(:,7130);
        
    for i=1:60
        if cns_lable(i)==1
            cns_lable(i)=1
        else
            cns_lable(i)=2
        end
    end
            
            

%% ReliefF algorithm

Sample = cns_data;
Lable = cns_lable;
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



