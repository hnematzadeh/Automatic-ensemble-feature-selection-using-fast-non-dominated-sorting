function data=LoadData()
load ('Ovarian.mat');
load ('ov_data.mat');
load ('ov_lable.mat');
x=ov_data';
t=ov_lable';

   
    data.x=x;
    data.t=t;
    
    data.nx=size(x,1);
    data.nt=size(t,1);
    data.nSample=size(x,2);

end