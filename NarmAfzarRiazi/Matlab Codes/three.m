fileID = fopen("inputForThree.txt","r");
All = fscanf(fileID,'%c');
C = splitlines(All);
r = 6371;
%read from table
T = readtable('worldcities-short.xlsx','Sheet','Sheet1');
j = 1;
i = 1;
while i < 15494
    if ismember(T.city_name(i), C(j))
            Ai = strcat('A',num2str(i+1));
            Di = strcat('D',num2str(i+1));
            colon_i = ':';
            f = strcat(Ai,colon_i,Di);
            city = readtable('worldcities-short.xlsx','Range',f);
            lat(j) = city.Var2;
            lng(j) = city.Var3;
            j = j + 1;
            i = 0;
    end
    i = i + 1;
    
    if j > length(C)
        break;
    end
end
%calculating distances
for i = 1:length(C)
    for j = 1:length(C)
        deltasigma(j,i) = r * DeltaSigma(deg2rad(lat(j)),deg2rad(lat(i)),deg2rad(lng(j)),deg2rad(lng(i)));
    end
end
%import to excel

for i = 1:(length(C) + 1)
    for j = 1:(length(C) + 1)
        if i == 1 && j == 1
        variable(j,i) = "";
        end
        if j == 1 && i ~= 1
            variable(j,i) = {C(i - 1)};
        end
        if i == 1 && j ~= 1
            variable(j,i) = {C(j - 1)};
        end
    end
end

for i = 1 : length(C)
    for j = 1:length(C)
        variable(i+1,j+1) = deltasigma(i,j);
    end
end

T2 = table(variable);

filename = 'myExcel.xlsx';
writetable(T2, 'myExcel.xlsx', 'WriteVariableNames', 0)


                            %alef
latCities = readtable('worldcities-short.xlsx','Range','B2:B15494');
lngCities = readtable('worldcities-short.xlsx','Range','C2:C15494');

dist = zeros(1,15493);

%tehran
dist(1,28) = r * DeltaSigma(deg2rad(35.6719),deg2rad(table2array(latCities(28,1))),deg2rad(51.4243),deg2rad(table2array(lngCities(28,1))));
temp = dist(1,29)

for i=1:15493
    if ismember(T.city_name(i), 'Tehran')
        adad2 = "" %example distance for tehran;
        dist(1,i) = adad2;
        i = i + 1;
    end
        adad = r * DeltaSigma(deg2rad(35.6719),deg2rad(table2array(latCities(i,1))),deg2rad(51.4243),deg2rad(table2array(lngCities(i,1))));
        dist(1,i) = adad;
end
[maximum,i] = max(dist)
[minimum,j] = min(dist)

                                    
            Ai = strcat('A',num2str(i+1));
            Di = strcat('D',num2str(i+1));
            colon_i = ':';
            f = strcat(Ai,colon_i,Di);
            bishtarin = readtable('worldcities-short.xlsx','Range',f)

            Aj = strcat('A',num2str(j+1));
            Dj = strcat('D',num2str(j+1));
            colon_j = ':';
            g = strcat(Aj,colon_j,Dj);
            kamtarin = readtable('worldcities-short.xlsx','Range',g)

                                     %be

temp = dist(dist < 2000);
disp(size(temp))
k = 1;
for i = 1:15493
    for j = 1:664
        if dist(1,i) == temp(j)
            CitiesforB(j) = i;
            Ai = strcat('A',num2str(i+1));
            Di = strcat('D',num2str(i+1));
            colon_i = ':';
            f = strcat(Ai,colon_i,Di);
            %disp(j)
            %shahr = readtable('worldcities-short.xlsx','Range',f)
        end
    end
end

%pe

%finding cities
l = 1;
for i = 1: 15493
    if ismember(T.country(i), 'Japan')
            Ai = strcat('A',num2str(i+1));
            Di = strcat('D',num2str(i+1));
            colon_i = ':';
            f = strcat(Ai,colon_i,Di);
            cityInJapan = readtable('worldcities-short.xlsx','Range',f);
            distFromJapan(l) = r * DeltaSigma(deg2rad(35.6719),deg2rad(cityInJapan.Var2),deg2rad(51.4243),deg2rad(cityInJapan.Var3));
            indexJapan(l) = i;
            l = l + 1;
    end
end

            [NearestJapanCityToTehran,i] = min(distFromJapan)
            Ai = strcat('A',num2str(indexJapan(i)+1));
            Di = strcat('D',num2str(indexJapan(i)+1));
            colon_i = ':';
            f = strcat(Ai,colon_i,Di);
            cityInIran = readtable('worldcities-short.xlsx','Range',f)
                                    %te
l_iran = 1;
l_iraq = 1;
l_turkey = 1;
for i = 1: 15493
    if ismember(T.country(i), 'Iran')
            indexIran(l_iran) = i;
            l_iran = l_iran + 1;
    end
    if ismember(T.country(i), 'Iraq')
            indexIraq(l_iraq) = i;
            l_iraq = l_iraq + 1;
    end
    if ismember(T.country(i), 'Turkey')
            indexTurkey(l_turkey) = i;
            l_turkey = l_turkey + 1;
    end
end

disp(l_iran)%65
disp(indexIran(1))
disp(l_iraq)%28
disp(indexIraq(1))
disp(l_turkey)%92
disp(indexTurkey(1))
                        %%%             IRAQ        IRAN

%ye list 64*27 %1728 baraye iran iraq
q = 1728 
%1728
for i = 1:64
      Ai = strcat('A',num2str(indexIran(i)+1));
            Di = strcat('D',num2str(indexIran(i)+1));
            colon_i = ':';
            f = strcat(Ai,colon_i,Di);
            cityInIran = readtable('worldcities-short.xlsx','Range',f);
    for j = 1:27
            Aj = strcat('A',num2str(indexIraq(j)+1));
            Dj = strcat('D',num2str(indexIraq(j)+1));
            colon_j = ':';
            g = strcat(Aj,colon_j,Dj);
            cityInIraq = readtable('worldcities-short.xlsx','Range',g);

        distIranIraq(1729 - q) = r * DeltaSigma(deg2rad(cityInIraq.Var2),deg2rad(cityInIran.Var2),deg2rad(cityInIraq.Var3),deg2rad(cityInIran.Var3));
        q = q - 1;
    end
end
    [minimumIranIraq,i] = min(distIranIraq)
%finding in excel
        iraqCityIndex_j = mod(i,27);
        iranCityIndex_i = round(i/27) + 1;

            Aj = strcat('A',num2str(indexIraq(iraqCityIndex_j)+1));
            Dj = strcat('D',num2str(indexIraq(iraqCityIndex_j)+1));
            colon_j = ':';
            f = strcat(Aj,colon_j,Dj);
            iraqCity = readtable('worldcities-short.xlsx','Range',f)
            
            Ai = strcat('A',num2str(indexIran(iranCityIndex_i)+1));
            Di = strcat('D',num2str(indexIran(iranCityIndex_i)+1));
            colon_i = ':';
            g = strcat(Ai,colon_i,Di);
            iranCity = readtable('worldcities-short.xlsx','Range',g)

%%%%            TURKEY   IRAN

%ye list 64*91 = 5824 baraye iran turkey
%min besdast biar o index begu
      q = 64*91 %5824
for i = 1:64
            Ai = strcat('A',num2str(indexIran(i)+1));
            Di = strcat('D',num2str(indexIran(i)+1));
            colon_i = ':';
            f = strcat(Ai,colon_i,Di);
            cityInIran = readtable('worldcities-short.xlsx','Range',f);
    for j = 1:91
            Aj = strcat('A',num2str(indexTurkey(j)+1));
            Dj = strcat('D',num2str(indexTurkey(j)+1));
            colon_j = ':';
            g = strcat(Aj,colon_j,Dj);
            cityInTurkey = readtable('worldcities-short.xlsx','Range',g);

        distIranTurkey(5825 - q) = r * DeltaSigma(deg2rad(cityInTurkey.Var2),deg2rad(cityInIran.Var2),deg2rad(cityInTurkey.Var3),deg2rad(cityInIran.Var3));
        q = q - 1;
    end
end
[minimumIranTurkey,i] = min(distIranTurkey)
%finding in excel
TurkeyCityIndex_j = mod(i,91);
iranCityIndex_i = round(i/91) + 1;

            Aj = strcat('A',num2str(indexIraq(TurkeyCityIndex_j)+1));
            Dj = strcat('D',num2str(indexIraq(TurkeyCityIndex_j)+1));
            colon_j = ':';
            f = strcat(Aj,colon_j,Dj);
            turkeyCity = readtable('worldcities-short.xlsx','Range',f)
            
            Ai = strcat('A',num2str(indexIran(iranCityIndex_i)+1));
            Di = strcat('D',num2str(indexIran(iranCityIndex_i)+1));
            colon_i = ':';
            g = strcat(Ai,colon_i,Di);
            iranCity = readtable('worldcities-short.xlsx','Range',g)
      
function deltasigma = DeltaSigma(phi1,phi2,lambda1,lambda2)
deltasigma = acos(sin(phi1)*sin(phi2)+ cos(phi1)*cos(phi2)*cos(abs(lambda1 - lambda2)));
return;
end



