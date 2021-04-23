function W = ReliefF_Algorithm(Sample, Lable, Neighburs)

    [y,x] = size(Sample); 
    W = zeros(1,x);
    
    % mohasebe ehtemel lable,ha
    LRange = max(Lable)-min(Lable)+1;
    LCount = zeros(1,LRange);
    LProb = zeros(1,LRange);

    for i = 1:y
        LCount(Lable(i)) = LCount(Lable(i)) + 1;   
    end
    for j = 1:LRange
        LProb(j) = LCount(j) / y;
    end

    Distance = zeros(y-1,2);

    Weight = zeros(x,2);
    Diff = 0;       

    for i = 1:x
        dominoDiff(i) = max(Sample(:,i)) - min(Sample(:,i));
    end

    % tedad tekrar,haye asli barname
    for NumN = 1:10
     
        %entekhab tasadofi nemune,ha
        SampleId = round([y.*rand]);
        while SampleId == 0,
            SampleId = round([y.*rand]);
        end
        index = 1;
        
        %mohasebe fasele nemune entekhab shode  
        for i=1:y
            if (i~=SampleId)
                for j=1:x
                    Distance(index,1) = Distance(index,1)+...
                        (Sample(i,j) - Sample(SampleId,j))^2;
                end
                Distance(index,1) = (Distance(index,1)/x)^(0.5);
                Distance(index,2) = i;
                index = index + 1;
            end
        end
        
        %moratabsazi   
        Distance = sortrows(Distance,1);

        Result = zeros(LRange,y);
        classSize = zeros(1,LRange);
        for i=1:y-1
            class = Lable(Distance(i,2));     
            classSize(class) = classSize(class) + 1;
            Result(class,classSize(class)) = Distance(i,2);
        end

         
        MissW = 0; 
        HitW = 0;
        for AttributeNum = 1:x
            %fasele bein min va max 
            diff = Weight(AttributeNum,1);
            if (dominoDiff(AttributeNum) < 0.0000001)
                Weight(AttributeNum,1) = 0;
                Weight(AttributeNum,2) = AttributeNum;
                continue;
            end

            %mohasebe vazn             
            for i = 1:Neighburs        
                idHit = Result(Lable(SampleId),Neighburs);
                diff = diff - abs(Sample(idHit, AttributeNum) -...
                    Sample(SampleId, AttributeNum) )...
                    /dominoDiff(AttributeNum)/Neighburs;                
            end


            for c = 1:LRange
                if (c == Lable(SampleId))
                    continue;
                end

                P=LProb(c)/(1-LProb(Lable(SampleId)));
                for i = 1:Neighburs
                    idMiss = Result(c,i);
                    diff = diff + P*abs( Sample(idMiss, AttributeNum) -...
                        Sample(SampleId, AttributeNum) )...
                        /dominoDiff(AttributeNum)/Neighburs; 
                end
            end 
            
            Weight(AttributeNum,1) = diff;
            Weight(AttributeNum,2) = AttributeNum;
            
            W1 = sortrows(Weight);
            for i = 1:x
                W(i) = W1(x-i+1,2);
            end

        end 
    end 
    
end