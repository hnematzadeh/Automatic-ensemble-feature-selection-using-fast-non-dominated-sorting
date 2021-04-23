# Automatic-ensemble-feature-selection-using-fast-non-dominated-sorting
ATFS implementation contains four steps:
First, Diversity Generation: Where ReliefF, MC and SLI algorithms are applied on each given dataset to ensure enough diversity for our ensemble method. applying ReliefF.m, SLI.m and MutualCongestion.m on each dataset result in ranked features rankRel.mat, rankb.mat and ranka.mat respectively.
Second, Combination: in this step, ranked-features matrix ( ranked.mat ) is generated applying Ix.m on rankRel.mat, rankb.mat and ranka.mat. Then, nsga2.mat applied on ranked.mat as combination method. the output is ranked feature sets F.mat. 
       Third, Feature Set Generation: in this step, test datasets are generated applying featureset_gen.m using best            feature sets F.mat. 
      Fourth, Test: accu.m applied on test datasets   which is generated from featureset_gen.mat, to evaluate accuracy.
      Figure1 shows the implementation framework.
      
![image](https://user-images.githubusercontent.com/45941996/115833017-d094ec80-a428-11eb-9586-b6911457b28c.png)

