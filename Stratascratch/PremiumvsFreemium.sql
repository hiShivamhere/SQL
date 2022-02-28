SELECT date,paying,non_paying
FROM
 ( SELECT date,sum (CASE 
                         WHEN paying_customer ='yes' THEN downloads
                         END) AS paying,
                sum (CASE 
                         WHEN paying_customer='no' THEN downloads
                         END) AS non_paying
    FROM ms_user_dimension AS users
    INNER JOIN ms_acc_dimension AS accounts ON users.acc_id=accounts.acc_id
    INNER JOIN ms_download_facts AS downloadtable ON users.user_id=downloadtable.user_id
    GROUP BY date
    ORDER BY date) AS newtable
    WHERE (non_paying-paying)>0
    ORDER BY newtable.date ASC
