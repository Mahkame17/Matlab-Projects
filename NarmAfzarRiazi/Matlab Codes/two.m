
fileID = fopen("in.txt","r");
All = fscanf(fileID,'%c');
newAll = lower(All);
C = splitlines(newAll);
box = newAll(7:108);

F = splitlines(box);
K = cell2mat(F);

text = cell2mat(C(1));
numbers = str2num(text);
m = numbers(1);
n = numbers(2);
text2 = cell2mat(C(10));
k = str2num(text2);

    j = 1;       
        for i=11:14
            word(j) = C(i);
            j = j + 1;
        end
class(word);
cell2mat(word(1));
        for i=1:k
            check_match(m,n,K,cell2mat(word(i)));
        end
       


function check_match(m,n,box,word)
direct_x1 = {1,1,0,-1,-1,-1,0,1};
direct_y1 = {0,1,1,1,0,-1,-1,-1};
direct_x = cell2mat(direct_x1);
direct_y = cell2mat(direct_y1);
match_len = length(word);
l = 1;
    for i=1:m
            for j=1:n
                for d=1:8   % check 8 directions
                   for k=1:match_len
                        %if j >= n || i >= m
                            %fprintf("%s %d %d\n",word,0,0);
                            %return;
                        %end
                    
                        if (i+((k-1)*direct_y(d)) == 0)
                            i = i + 1;
                        end
                        if(j+((k-1)*direct_x(d)) == 0)
                            j = j + 1;
                        end
                        if word(k) ~= box(i+((k-1)*direct_y(d)),j+((k-1)*direct_x(d)))
                            break;
                        end
                        
                           if(k==match_len)
                            fprintf("%s %d %d\n",word,i,j);
                            return;
                           end
                     end
                 end
           end
    end

end
