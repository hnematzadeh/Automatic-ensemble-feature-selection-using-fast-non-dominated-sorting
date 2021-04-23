clc;
clear;
close all;
load('Liver.mat')

for i=1 :30
    for j=1 :569
        data(j,i).val=Liver(j,i);
        data(j,i).label=Liver(j,31);
        
    end
        f(i).m1=0;
        f(i).m2=0;
        f(i).m3=0;
        f(i).m4=0;
        f(i).m5=0;
        f(i).m6=0;
        f(i).m7=0;
end
% %% ordering each col based on theri labels
for i=1 : 30
    for j=1 : 569
        for k=j+1 :569
            if data(k,i).val<data(j,i).val
                 temp=data(k,i);
                 data(k,i)=data(j,i);
                 data(j,i)=temp;
            end
        end
    end
end


j=1;
for i=1 :30
    if data(j,i).label==1
        while data(j,i).label==1
           f(i).m1=f(i).m1+1;
           j=j+1;
        end
    else
        while data(j,i).label==0
            f(i).m1=f(i).m1+1;
            j=j+1;
        end
    end
    j=1;
end
 c=0;
 
for i=1 : 30
  if data(1,i).label==0
    for j=1 :569 
        if data(j,i).label==0
            c=c+1;
            if c==184
              jj(i)=j;
%               a(i).zero=jj;
              j=30000;
           end
        end
    end
  else
      for s=1 :569
        if data(s,i).label==1
            c=c+1;
            if c==328
              jj(i)=s;
%               a(i).one=jj;
              s=300000;
            end
        end
        
      end
  end
        f(i).m4=569-jj(i);
        c=0;
end
  c0=0;  c1=0;
for i=1 :30
  if data(1,i).label==0 
      for j=2 :569
        if data(j,i).label==1
            cc(i)=j;
           % j=63;
           break;
        end
      end
      for j=cc(i) : jj(i)
          if data(j,i).label==0
             f(i).m3=f(i).m3+1;
          end
          if data(j,i).label==1
             f(i).m2=f(i).m2+1;
          end
      end
%       f(i).m2=c0;
%       f(i).m3=c1;
  else
      for j=2 :569
        if data(j,i).label==0
            cc(i)=j;
           % j=63;
           break;
        end
      end
      for j=cc(i) : jj(i)
          if data(j,i).label==0
             f(i).m2=f(i).m2+1;
          end
          if data(j,i).label==1
             f(i).m3=f(i).m3+1;
          end
      end
%       f(i).m2=c1;
%       f(i).m3=c0;
 end
   c0=0; c1=0;
end


for i=1 : 30
   f(i).m5= (f(i).m2+ f(i).m3) /(f(i).m1+ f(i).m2+f(i).m3+ f(i).m4);
end
for i=1 : 30
    f(i).m6= (f(i).m2) /(f(i).m4+ f(i).m2);
end
for i=1 : 30
    f(i).m7= 2/((1/(f(i).m5))+(1/(f(i).m6)));
end


for i=1 : 30
    d(i)= f(i).m5;
end
[value, ind]= sort(d);

for i=1:30
    for j=1:30
    if (ind(i)==j)
    ranka(j)=i;
    end;
    end;
end
