function data=LoadData()
load ('SMK_CAN_187.mat');
load ('SMK_data.mat');
load ('SMK_lable.mat');
x=SMK_data';
t=SMK_lable';

   
    data.x=x;
    data.t=t;
    
    data.nx=size(x,1);
    data.nt=size(t,1);
    data.nSample=size(x,2);

end