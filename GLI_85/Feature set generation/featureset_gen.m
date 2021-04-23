load F.mat
load GLI_data.mat;
load GLI_lable.mat;
% Store F1
    F1=pop(F{1});
    F1=GetUniqueMembers(F1);
    
   F2=pop(F{2});
    F2=GetUniqueMembers(F2);
        
     
bestf=[];
N1=numel(F1);
for i=1:N1
    for j=1:22283
        if ((F1(i).Position(j))==1)
          bestf(i)=j;
      
        end;
    end;
end;

besttest=GLI_data(:,[bestf]);
bestlb=GLI_lable;

for i=1:N1
GLI_test(:,i)=besttest(:,i);
end
GLI_test(:,N1+1)=GLI_lable(:,1);



bestf2=[];
N2=numel(F2);
for i=1:N2
    for j=1:22283
        if ((F2(i).Position(j))==1)
          bestf2(i)=j;
      
        end;
    end;
end;


besttest2=GLI_data(:,[bestf2]);
bestlb=GLI_lable;

for i=1:N1
GLI_test2(:,i)=besttest(:,i);
end
for i=1:N2
GLI_test2(:,i+N1)=besttest2(:,i);
end
GLI_test2(:,N1+N2+1)=GLI_lable(:,1);


F3=pop(F{3});
    F3=GetUniqueMembers(F3);
bestf3=[];
N3=numel(F3);
for i=1:N3
    for j=1:22283
        if ((F3(i).Position(j))==1)
          bestf3(i)=j;
      
        end;
    end;
end;


besttest3=GLI_data(:,[bestf3]);
bestlb=GLI_lable;

for i=1:N1
GLI_test3(:,i)=besttest(:,i);
end
for i=1:N2
GLI_test3(:,i+N1)=besttest2(:,i);
end

for i=1:N3
GLI_test3(:,i+N1+N2)=besttest3(:,i);
end
GLI_test3(:,N1+N2+N3+1)=GLI_lable(:,1);


F4=pop(F{4});
    F4=GetUniqueMembers(F4);
bestf4=[];
N4=numel(F4);
for i=1:N4
    for j=1:22283
        if ((F4(i).Position(j))==1)
          bestf4(i)=j;
      
        end;
    end;
end;

besttest4=GLI_data(:,[bestf4]);
bestlb=GLI_lable;

for i=1:N1
GLI_test4(:,i)=besttest(:,i);
end
for i=1:N2
GLI_test4(:,i+N1)=besttest2(:,i);
end

for i=1:N3
GLI_test4(:,i+N1+N2)=besttest3(:,i);
end
for i=1:N4
GLI_test4(:,i+N1+N2+N3)=besttest4(:,i);
end
GLI_test4(:,N1+N2+N3+N4+1)=GLI_lable(:,1);



%% Results

