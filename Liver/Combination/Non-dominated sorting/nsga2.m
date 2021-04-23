clc;
clear;
close all;

%% Problem Definition

data=LoadData();

nVar=data.nx;             % Number of Decision Variables

VarSize=[1 nVar];   % Size of Decision Variables Matrix

%% NSGA-II Parameters

nPop=nVar;        % Population Size

%% Initialization

empty_individual.Position=[];
empty_individual.Cost=[];
empty_individual.Out=[];
empty_individual.Rank=[];
empty_individual.DominationSet=[];
empty_individual.DominatedCount=[];
empty_individual.CrowdingDistance=[];

pop=repmat(empty_individual,nPop,1);

for i=1:nPop
    
    
        pop(i).Position=zeros(VarSize);
        pop(i).Position(i)=1;
    
    load ranked.mat;
    [pop(i).Cost]=ranked(:,i);
    
end

% Non-Dominated Sorting
[pop, F]=NonDominatedSorting(pop);

% Calculate Crowding Distance
pop=CalcCrowdingDistance(pop,F);

% Sort Population
[pop, F]=SortPopulation(pop);


%% NSGA-II Main Loop

for it=1:1
    
    
    % Merge
    pop=[pop]; %#ok
     
    % Non-Dominated Sorting
    [pop, F]=NonDominatedSorting(pop);

    % Calculate Crowding Distance
    pop=CalcCrowdingDistance(pop,F);

    % Sort Population
    [pop, F]=SortPopulation(pop); %#ok
    
    % Truncate
    pop=pop(1:nPop);
    
    % Non-Dominated Sorting
    [pop, F]=NonDominatedSorting(pop);

    % Calculate Crowding Distance
    pop=CalcCrowdingDistance(pop,F);

    % Sort Population
    [pop, F]=SortPopulation(pop);
    
    % Store F1
    F1=pop(F{1});
    F1=GetUniqueMembers(F1);
    
   F2=pop(F{2});
    F2=GetUniqueMembers(F2);
    
    
    F3=pop(F{3});
    F3=GetUniqueMembers(F3);
    
    F4=pop(F{4});
    F4=GetUniqueMembers(F4);
        
    % Show Iteration Information
    disp(['Iteration ' num2str(it) ': Number of F1 Members = ' num2str(numel(F1))]);
    
    % Plot F1 Costs
    figure(1);
    PlotCosts(F1);
    pause(0.1);
    
end
