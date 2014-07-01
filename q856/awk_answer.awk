# 問1. Speciesの列を表示させなさい。
awk -F"," 'NR>1 {print $6}' iris.csv

# 問2. 行ごとにSepal.LengthとSepal.Widthの合計を求めなさい。
awk -F"," 'NR>1 {print $2+$3}' iris.csv

# 問3. Sepal.Lengthの列の合計を求めなさい。
awk -F"," 'NR>1 {total+=$2} END{print total}' iris.csv

# 問4. setosa,versicolor,virginicaがそれぞれ何レコードあるかを求めなさい。
awk -F"," 'BEGIN{count=0} NR>1 {if(DATA[$6]==0){DATA_NAME[count]=$6;count++;}DATA[$6]++;} END{for(i=0;i<count;i++){printf("%s\t%d\n",DATA_NAME[i],DATA[DATA_NAME[i]]);}}' iris.csv

# 問5. setosa,versicolor,virginicaごとにSepal.Lengthの合計を求めなさい。
awk -F"," 'BEGIN{count=0} NR>1 {if(DATA[$6]==0){DATA_NAME[count]=$6;count++;}DATA[$6]++;DATA_SUM[$6]+=$2;} END{for(i=0;i<count;i++){printf("%s\t%f\n",DATA_NAME[i],DATA_SUM[DATA_NAME[i]]);}}' iris.csv

# 問6. setosa,versicolor,virginicaごとにSepal.Lengthの平均を求めなさい。
awk -F"," 'BEGIN{count=0} NR>1 {if(DATA[$6]==0){DATA_NAME[count]=$6;count++;}DATA[$6]++;DATA_SUM[$6]+=$2;} END{for(i=0;i<count;i++){printf("%s\t%f\n",DATA_NAME[i],DATA_SUM[DATA_NAME[i]]/DATA[DATA_NAME[i]]);}}' iris.csv

# 問7. setosa,versicolor,virginicaごとにSepal.Lengthの最小値を求めなさい。
awk -F"," 'BEGIN{count=0} NR>1 {if(DATA[$6]==0){DATA_NAME[count]=$6;MIN_DATA[$6]=$2;count++;}DATA[$6]++;{if(MIN_DATA[$6]>$2){MIN_DATA[$6]=$2;}}} END{for(i=0;i<count;i++){printf("%s\t%f\n",DATA_NAME[i],MIN_DATA[DATA_NAME[i]]);}}' iris.csv
