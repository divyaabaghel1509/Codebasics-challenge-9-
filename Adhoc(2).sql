select City, count(store_id) as Total_Stores from dim_stores group by city order by Total_Stores DESC;
