clear
clc

dailyUserCntBase = 5000;
daysCnt = 31;
maxChanceToReturnOrder = 0.1;
month = 7;

rowCnt = 1;
wp=fopen('.\\sigma_012324.txt','w');
fprintf(wp, 'month\tdate\tevent_name\tuser_id\titem_name\tprice\n');
for i=1:daysCnt
    userCnt = dailyUserCntBase + ceil(rand(1)*(dailyUserCntBase/2)); % daily user count within (base x 1) and (base x 1.5)
    for j=1:userCnt
        greenTeaPurchaseCnt = round(rand(1)*5);
        redTeaPurchaseCnt = round(rand(1)*8);
        greenTeaReturnCnt = round(rand(1)*maxChanceToReturnOrder*greenTeaPurchaseCnt);
        redTeaReturnCnt = round(rand(1)*maxChanceToReturnOrder*redTeaPurchaseCnt);

        userId = char(randperm(10,10)+47);

        fprintf(wp,'%d\t%d\tapp_open\t%s\t\t\n', month, i, userId);
        for k=1:greenTeaPurchaseCnt
            fprintf(wp,'%d\t%d\tpurchase\t%s\tgreen_tea_x20\t11.99\n', month, i, userId);
        end
        for k=1:redTeaPurchaseCnt
            fprintf(wp,'%d\t%d\tpurchase\t%s\tred_tea_x20\t12.99\n', month, i, userId);
        end
        for k=1:greenTeaReturnCnt
            fprintf(wp,'%d\t%d\treturn_order\t%s\tgreen_tea_x20\t11.99\n', month, i, userId);
        end
        for k=1:redTeaReturnCnt
            fprintf(wp,'%d\t%d\treturn_order\t%s\tred_tea_x20\t12.99\n', month, i, userId);
        end
        rowCnt = rowCnt + 1+greenTeaPurchaseCnt+redTeaPurchaseCnt+greenTeaReturnCnt+redTeaReturnCnt;
    end
end
fclose(wp);
fprintf('%d rows are written\n', rowCnt);





