     With  Diwali_campaign as ( Select category , 
     Round(Sum((
          Case 
          When promo_type = "BOGOF" Then quantity_sold(after_promo)*2
          Else 
          quantity_sold(after_promo)
          End
      - quantity_sold(before_promo)) * 100)
      / Sum(quantity_sold(before_promo)),2) as `ISU%` 
      From fact_events 
      Join 
      dim_products using(product_code)
      Join 
      dim_campaigns using(campaign_id)
      Where campaign_name = "Diwali"
      Group by category)

      Select 
      Category , ISU%, 
      row_number() Over(order by `ISU%` desc) as rank_order 
      From Diwali_campaign ;
