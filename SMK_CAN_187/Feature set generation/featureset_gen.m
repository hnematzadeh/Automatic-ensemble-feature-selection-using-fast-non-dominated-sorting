load F.mat;
load SMK_data.mat;
load SMK_lable.mat;
 F1=pop(F{1});
    F1=GetUniqueMembers(F1);
    
   F2=pop(F{2});
    F2=GetUniqueMembers(F2);
  F3=pop(F{3});
    F3=GetUniqueMembers(F3);
    
   F4=pop(F{4});
    F4=GetUniqueMembers(F4);
    
    
bestf=[];
N1=numel(F1);
for i=1:N1
    for j=1:19993
        if ((F1(i).Position(j))==1)
          bestf(i)=j;
      
        end;
    end;
end;


besttest=SMK_data(:,[bestf]);
bestlb=SMK_lable;

for i=1:N1
SMK_test(:,i)=besttest(:,i);
end
SMK_test(:,N1+1)=SMK_lable(:,1);



bestf2=[];
N2=numel(F2);
for i=1:N2
    for j=1:19993
        if ((F2(i).Position(j))==1)
          bestf2(i)=j;
      
        end;
    end;
end;


besttest2=SMK_data(:,[bestf2]);
bestlb=SMK_lable;

for i=1:N1
SMK_test2(:,i)=besttest(:,i);
end
for i=1:N2
SMK_test2(:,i+N1)=besttest2(:,i);
end
SMK_test2(:,N1+N2+1)=SMK_lable(:,1);


    
    bestf3=[];
N3=numel(F3);
for i=1:N3
    for j=1:19993
        if ((F3(i).Position(j))==1)
          bestf3(i)=j;
      
        end;
    end;
end;


besttest3=SMK_data(:,[bestf3]);
bestlb=SMK_lable;
T=N1+N2
for i=1:N1
SMK_test3(:,i)=besttest(:,i);
end
for i=1:N2
SMK_test3(:,i+N1)=besttest2(:,i);

end
for i=1:N3
SMK_test3(:,i+T)=besttest3(:,i);
end
SMK_test3(:,N3+T+1)=SMK_lable(:,1);



bestf4=[];
N4=numel(F4);
for i=1:N4
    for j=1:19993
        if ((F4(i).Position(j))==1)
          bestf4(i)=j;
      
        end;
    end;
end;


besttest4=SMK_data(:,[bestf4]);
bestlb=SMK_lable;

for i=1:N1
SMK_test4(:,i)=besttest(:,i);
end
for i=1:N2
SMK_test4(:,i+N1)=besttest2(:,i);
end
for i=1:N3
SMK_test4(:,i+T)=besttest3(:,i);
end
for i=1:N4
SMK_test4(:,i+T+N3)=besttest4(:,i);
end
SMK_test4(:,T+N3+N4+1)=SMK_lable(:,1);


%% Results




