function data=LoadData()
load ('Liver.mat');
load ('liv_data.mat');
load ('liv_lable.mat');
x=liv_data';
t=liv_lable';

   
    data.x=x;
    data.t=t;
    
    data.nx=size(x,1);
    data.nt=size(t,1);
    data.nSample=size(x,2);

end