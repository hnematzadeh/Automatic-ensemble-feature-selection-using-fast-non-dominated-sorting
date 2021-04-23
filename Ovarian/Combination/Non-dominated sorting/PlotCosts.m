function PlotCosts(pop)

    Costs=[pop.Cost];
    
    plot(Costs(1,:),Costs(2,:),'r*','MarkerSize',8);
    xlabel('relieff');
    ylabel('svm_ranked');
    grid on;

end