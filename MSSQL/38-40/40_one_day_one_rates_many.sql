select rated_by as 'Topic rated by the writer' from topics group by rated_by,date_of_rating having count(topic_id)>1