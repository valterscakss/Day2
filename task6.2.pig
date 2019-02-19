lines = load 'data/words.txt' as (line);
words = FOREACH lines GENERATE FLATTEN(TOKENIZE(line)) as word;
grouped = GROUP words BY word; 
wordcount = FOREACH grouped GENERATE group, COUNT(words);
Cou = ORDER wordcount by $1 ASC;
dump Cou;

