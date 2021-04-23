clear;
clc;
close all;

%% load Data
load GLI_85



    for j=1:22283
        GLI_data(:,j)=GLI_85(:,j);
    end


    
        GLI_lable(:,1)=GLI_85(:,22284);
        
    for i=1:85
        if GLI_lable(i)==1
            GLI_lable(i)=2
        else
            GLI_lable(i)=1
        end
    end
            
            

%% ReliefF algorithm

Sample = GLI_data;
Lable = GLI_lable;
Neighburs = 10;

Ranked_ReliefF = ReliefF_Algorithm(Sample, Lable, Neighburs);


rankRel=[];
for i=1:22283
    for j=1:22283
    if (Ranked_ReliefF(i)==j)
    rankRel(j)=i;
    end;
    end;
end



