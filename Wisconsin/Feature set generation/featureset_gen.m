load F.mat;
load wi_data.mat;
load wi_lable.mat;
 % Store F1
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
    for j=1:33
        if ((F1(i).Position(j))==1)
          bestf(i)=j;
      
        end;
    end;
end;

besttest=wi_data(:,[bestf]);
bestlb=wi_lable;

for i=1:N1
wi_test(:,i)=besttest(:,i);
end
wi_test(:,N1+1)=wi_lable(:,1);



bestf2=[];
N2=numel(F2);
for i=1:N2
    for j=1:33
        if ((F2(i).Position(j))==1)
          bestf2(i)=j;
      
        end;
    end;
end;

besttest2=wi_data(:,[bestf2]);
bestlb=wi_lable;

for i=1:N1
wi_test2(:,i)=besttest(:,i);
end
for i=1:N2
wi_test2(:,i+N1)=besttest2(:,i);
end
wi_test2(:,N1+N2+1)=wi_lable(:,1);



bestf3=[];
N3=numel(F3);
for i=1:N3
    for j=1:33
        if ((F3(i).Position(j))==1)
          bestf3(i)=j;
      
        end;
    end;
end;

besttest3=wi_data(:,[bestf3]);
bestlb=wi_lable;

for i=1:N1
wi_test3(:,i)=besttest(:,i);
end
for i=1:N2
wi_test3(:,i+N1)=besttest2(:,i);
end

for i=1:N3
wi_test3(:,i+N1+N2)=besttest3(:,i);
end
wi_test3(:,N1+N2+N3+1)=wi_lable(:,1);


bestf4=[];
N4=numel(F4);
for i=1:N4
    for j=1:33
        if ((F4(i).Position(j))==1)
          bestf4(i)=j;
      
        end;
    end;
end;

besttest4=wi_data(:,[bestf4]);
bestlb=wi_lable;

for i=1:N1
wi_test4(:,i)=besttest(:,i);
end
for i=1:N2
wi_test4(:,i+N1)=besttest2(:,i);
end

for i=1:N3
wi_test4(:,i+N1+N2)=besttest3(:,i);
end

for i=1:N4
wi_test4(:,i+N1+N2+N3)=besttest4(:,i);
end
wi_test4(:,N1+N2+N3+N4+1)=wi_lable(:,1);



%% Results

