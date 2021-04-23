function data=LoadData()
load ('wisconsin.mat');
load ('wi_data.mat');
load ('wi_lable.mat');
x=wi_data';
t=wi_lable';

   
    data.x=x;
    data.t=t;
    
    data.nx=size(x,1);
    data.nt=size(t,1);
    data.nSample=size(x,2);

end