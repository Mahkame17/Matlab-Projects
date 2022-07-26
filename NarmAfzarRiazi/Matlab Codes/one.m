
fileID = fopen("text1.txt","r");
All = fscanf(fileID,'%c');
C = splitlines(All);

%vector A
for i = 1:((length(C)+1)/3)

    A = cell2mat(C(3*i));
    state = {
    A,
    keyOne(A),
    keyTwo(A),
    keyThree(A),
    keyFour(A),
    keyTwo(keyOne(A)),
    keyThree(keyOne(A)),
    keyFour(keyOne(A)),
    keyThree(keyTwo(A)),
    keyFour(keyTwo(A)),
    keyFour(keyOne(A)),
    keyThree(keyTwo(keyOne(A))),
    keyFour(keyThree(keyTwo(A))),
    keyFour(keyThree(keyOne(A))),
    keyFour(keyTwo(keyOne(A))),
    keyFour(keyThree(keyTwo(keyOne(A)))),
    };
    
    stateNum = {'no change','1','2','3','4','1 2','1 3','1 4','2 3','2 4','3 4', '1 2 3','2 3 4' ,'1 3 4','1 2 4', '1 2 3 4'};
    
   
    B = cell2mat(C((3*i)+1));

    flag = 0;
    imp = "impossible";
    for i = 1:16
        if(cell2mat(state(i)) == B)
            j = i;
            flag = 1;
        end
    end
    if flag == 1
    %disp(stateNum(j))
    fprintf("%c",cell2mat(stateNum(j)))
    end
    fprintf("\n")
    if flag == 0
        disp(imp)
    end
end

 %F = {1,2,3,4}
 %subsF = nchoosek(F,2)

function x = keyOne(x)

        for i = 1:length(x)
            if x(i) == '*'
                x(i) = '.';
            elseif x(i) == '.'
                x(i) = '*';
            end
        end 
end

function x = keyTwo(x)

        for i = 1:+2:length(x)
            if x(i) == '*'
                x(i) = '.';
            elseif x(i) == '.'
                x(i) = '*';
            end
        end 
end

function x = keyThree(x)
  
        for i = 2:+2:length(x)
            if x(i) == '*'
                x(i) = '.';
            elseif x(i) == '.'
                x(i) = '*';
            end
        end 
end

function x = keyFour(x)

        for i = 1:+3:length(x)
            if x(i) == '*'
                x(i) = '.';
            elseif x(i) == '.'
                x(i) = '*';
            end
        end 
end