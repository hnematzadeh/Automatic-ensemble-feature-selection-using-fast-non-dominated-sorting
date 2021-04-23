function data=LoadData()
load ('colon.mat');
load ('co_data.mat');
load ('co_lable.mat');
x=co_data';
t=co_lable';

   
    data.x=x;
    data.t=t;
    
    data.nx=size(x,1);
    data.nt=size(t,1);
    data.nSample=size(x,2);

end