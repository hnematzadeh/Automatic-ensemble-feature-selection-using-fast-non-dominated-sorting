clc;
clear;
close all;
for i=1 :100
load('wi_test.mat');
data=wi_test;
[n,m]=size(data);
rows=(1:n);
testcount=floor((0.2)*n);
    acc1=0; SenAr=0;  SpeAr=0; MCCAr=0;
kk=10;
  for k=1: kk
    test_rows=randsample(rows,testcount);
    train_rows=setdiff(rows,test_rows);
    test=data(test_rows,:);
    train=data(train_rows,:);
    xtest=test(:,1:m-1);
    ytest=test(:,m);
    xtrain=train(:,1:m-1);
    ytrain=train(:,m);
    % NB=NaiveBayes.fit(xtrain,ytrain);
    % out=NB.predict(xtest);
      mysvm=svmtrain(xtrain,ytrain,'kernel_function','linear','boxconstraint',2);
     out=svmclassify(mysvm,xtest);
 %DT=ClassificationTree.fit(xtrain,ytrain);
 %out=DT.predict(xtest);
      sum=0;
    for j=1 : testcount
        if out(j)==ytest(j)
            sum=sum+1;
        end
    end
    acc=sum/testcount;
    acc1=acc1+acc;
    %%% TP - TN - FP -FN  
    TP(i)=0;  TN(i)=0;  FP(i)=0;  FN(i)=0;  
    for j=1 : testcount
        %TP%
        if out(j)==-1 && ytest(j)==-1
           TP(i)=TP(i)+1;
        end
        %TN%
        if out(j)==1 && ytest(j)==1
           TN(i)=TN(i)+1;
        end
        %FP%
        if out(j)==-1&& ytest(j)==1
           FP(i)=FP(i)+1;
        end
        %FN%
        if out(j)==1 && ytest(j)==-1
           FN(i)=FN(i)+1;
        end
    end
    SEN= TP(i)/(TP(i)+FN(i));
    SenAr=SEN+SenAr;
    SPE= TN(i)/(TN(i)+FP(i));
    SpeAr=SPE+SpeAr;
    mcc= (((TP(i)*TN(i)) - (FP(i)*FN(i)))/sqrt((TP(i)+FP(i))*(TP(i)+FN(i))*(TN(i)+FP(i))*(TN(i)+FN(i))));
    MCCAr=mcc+MCCAr;
  end
  as=acc1/kk;
  ass(i)=round(as,2);
  s1=SenAr/kk;
  s2=SpeAr/kk;
  s3=MCCAr/kk;
  sensitivity(i)=round(s1,2);
  if ~isnan(s2)
    specificity(i)=round(s2,2);
  end
  if isnan(s2)
  specificity(i)=specificity(i-1);
  end
  
  if ~isnan(s3)
    MCCC(i)=round(s3,2);
  end
  if isnan(s3)
  MCCC(i)=MCCC(i-1);
  end
  MCCC(i)=round(s3,2);
end
maximum=max(ass);
maxSen=max(sensitivity);
maxSpe=max(specificity);
maxMcc=max(MCCC);
maxSen=round(maxSen,2);
maxSpe=round(maxSpe,2);
maxMcc=round(maxMcc,2);
sum=0;  sumsen=0;  sumspe=0; summcc=0;
for i=1 : 100
    sum=ass(i)+sum;
    sumsen=sensitivity(i)+sumsen;
    sumspe=specificity(i)+sumspe;
    summcc=MCCC(i)+summcc;
end
avg=sum/100;
maximum=round(maximum,2);
avg=round(avg,2);
senave=sumsen/100;
senave=round(senave,2);
speave=sumspe/100;
speave=round(speave,2);
mccave=summcc/100;
mccave=round(mccave,2);
disp(['Max Acc =   ', num2str(maximum)]);
disp(['Avg Acc =   ', num2str(avg)]);
disp(['Max Sensitivity =  ' ,  num2str(maxSen)]);
disp(['Avg Sensitivity =  ' ,  num2str(senave)]);
disp(['Max Specificity =  ' ,  num2str(maxSpe)]);
disp(['Avg Specificity =  ' ,  num2str(speave)]);
disp(['Avg 1-Specificity (FPR) =  ' ,  num2str(1-speave)]);
disp(['Max MCC =  ' ,  num2str(maxMcc)]);
disp(['Avg MCC =  ' ,  num2str(mccave)]);
% disp(['TP = ' ,num2str(TP)] ); 
% disp(['TN = ' ,num2str(TN)] ); 
% disp(['FP = ' ,num2str(FP)] );
% disp(['FN = ' ,num2str(FN)] );