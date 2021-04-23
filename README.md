# Automatic-ensemble-feature-selection-using-fast-non-dominated-sorting
ATFS implementation contains four steps:
STEP 1) Diversity Generation: 
Where ReliefF, MC and SLI algorithms are applied on each given dataset to ensure enough diversity for our ensemble method. applying ReliefF.m, SLI.m and MutualCongestion.m on each dataset results in ranked features rankRel.mat, rankb.mat and ranka.mat respectively.
STEP 2) Combination: 
In this step, ranked-features matrix ( ranked.mat ) is generated applying Ix.m on rankRel.mat, rankb.mat and ranka.mat. Then, nsga2.mat is applied on ranked.mat as a combination method. The output is ranked feature sets F.mat. 
STEP 3) Feature Set Generation: 
In this step, test datasets are generated applying featureset_gen.m using best feature sets F.mat. 
STEP 4) Test:
accu.m is applied on test datasets which is generated from featureset_gen.mat, to evaluate accuracy.
The implementation framework is shown in the following:
      
![image](https://user-images.githubusercontent.com/45941996/115833017-d094ec80-a428-11eb-9586-b6911457b28c.png)

