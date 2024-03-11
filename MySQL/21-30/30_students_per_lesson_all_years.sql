select et.subject_id,st.subject_name,
sum(no_of_student) as 'Students for all year' 
from exam_test as et join subject_test as st 
on et.subject_id=st.subject_id group by et.subject_id,st.subject_name
