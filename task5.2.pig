Twitter_Count = load 'data/tw.txt' using PigStorage('\t') as (USER_ID:int, FOLLOWER_ID:int);
Followers = group Twitter_Count by USER_ID;
result = foreach Followers generate group, COUNT(Twitter_Count);
outliers = FILTER result BY Twitter_Count > 2;
Dump outliers;
