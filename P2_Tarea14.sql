WITH  trade_balance_all AS (
    SELECT tt1.transaction_id,
    SUM (tt1.balance_direction) as all_time_trade_balance,
    SUM (tt1.value) as all_time_trade_value,
    COUNT(trader_id) AS total_trading_partners
    
    From TRADE_TRANSACTIONS tt1 
    Left join TRADES tr
    group by tt1.transaction_id
    
  ), caravan_trade_data AS (
    SELECT cv.caravan_id AScaravan_id , cv.civilization_type    
    COUNT (cv.caravan_id) AS total_caravans,
    
    SUM (tt.value) AS total_trade_value,
    SUM (tt.balance_direction) AS trade_balance,
    CORR (tt.value, de.relationship_change) AS diplomatic_correlation
 
    From CARAVANS cv
    Left join CARAVANS_GOODS cg ON cg.caravan_id = cv.caravan_id
    Left join TRADE_TRANSACTIONS tt ON tt.caravan_id = cv.caravan_id
    left join DIPLOMATIC_EVENT de ON de.caravan_id = cv.caravan_id AND  tt.caravan_id = cv.caravan_id  
    group by cv.caravan_id, tt.value, tt.balance_direction

), caravan_import_data AS (
   Select
    cg1.material_type AS material_type,
    cv2.caravan_id AS caravan_id AS,
    SUM (cg1.quantity) AS total_imported,  
    Count (cg2.good_id)  AS import_diversity   
  
    From CARAVAN_GOODS cg1,  CARAVANS cv2
    left join CARAVAN_GOODS cg2 ON cg2.original_product_id is not null AND cg2.type = "Import"
    where cg1.type = "Import"  AND cv2.caravan_id = cg1.caravan_id
    group by cv1.material_type
   
),  ws_export_data AS (
   Select ws.workshop_id AS workshop_id,
  pr.product_type AS  product_type ,
  (SUM (cg3.quantity)- cv_imp.total_imported)/(Coalesce (cv_imp.total_imported, 1)) AS export_ratio,
   AVG (cv3.price_fluctation) AS avg.markup
    
From WORKSHOP_PRODUCTS wsp
left join CARAVANS cv3 
left join workshops ws ON cv3.fortress_id = ws.fortress_id
left join products pr ON  ws.workshop_id = wsp.wokshop_id AND wsp.product_id = pr.product_id
left join  CARAVAN_GOODS cg3 ON cg3_caravan_id = cv3.caravan_id
left join caravan_import_data cv_imp ON cv_imp.caravan_id = cv3.caravan_id
group by ws.workshop_id, pr.product_type

), trade_time_data AS (
    Select tt2.transaction_id,
    EXTRACT( YEAR FROM tt2.date) as year,
    QUARTER (tt2.date) as quarter
   From TRADE_TRANSACTIONS tt2
    
 ), trade_quarter_data AS (
    Select tt3.transaction_id,
    QUARTER (tt3.date) as quarter3,
    EXTRACT( YEAR FROM tt3.date) as year3,
    SUM (ttd.value) AS quarterly_value,
    SUM (ttd.balance) AS quarterly_balance,
    COUNT (distinct ttd.caravan_items)+ COUNT (distinct ttd.fortress_items) AS trade_diversity
    
    From TRADE_TRANSACTIONS tt3
    Left join trade_time_data ttd ON ttd.quarter3 = tt2.quarter AND ttd.year3 = tt2.year
    Group by tt3.transaction_id, tt3.date
    ), 

    SELECT 
    tba.total_trading_partners,
    tba.all_time_trade_balance,
    tba.all_time_trade_value,
    
    civilization_type AS [ctd.civilization_type],
    total_caravans AS [ctd.total_caravans],
    total_caravans AS [ctd.total_caravans],
    total_trade_value AS [ctd.total_trade_value],
    trade_balance  AS [ctd.trade_balance],
    trade_relationship AS [ctd,trade_relationship],
    trade_balance AS [ctd,trade_balance],
    diplomatic_correlation AS [ctd, diplomatic_correlation],
    JSON_OBJECT('caravan_ids', (SELECT JSON_ARRAYAGG (cv4.caravan_id)
    FROM CARAVANS cv4 WHERE cv4.caravan_id =ctd.caravan_id),
     
    material_type AS [cid.material_type],
    total_imported AS [cid.total_imported],
    import_diversity AS [cid.import_diversity],
    JSON_OBJECT('resource_ids', (SELECT JSON_ARRAYAGG (fr.resourse_id)
    FROM FORTRES_RESOURCES fr WHERE fr.fortress_id =cid.foreress_id),

     workshop_type AS [wed.workshop_type],
     product_type AS [wed.product_type],
     export_ratio AS [wed.export_ratio],
     avg_markup   AS [wed.avg_markup],
    JSON_OBJECT('workshop_ids', (SELECT JSON_ARRAYAGG (wsh.workshops_id)
    FROM WORK_SHOP wsh WHERE (wsh.workshops_id =(wed.workshops_id),
         
    year AS [tqd.year],
    quarter AS [tqd.quarter],
    quarterly_value AS [tqd.quarterly_value], 
    quarterly_balance AS [tqd.quarterly_balance],    
    trade_diversity AS [tqd.trade_diversity] 
    
    From trade_balance_all,
    join caravan_trade_data ctd FOR JSON PATH, ROOT('civilization_trade_data')
    join caravan_import_data cid FOR JSON PATH ROOT('critical_import_dependencies')
    join ws_export_data wed FOR JSON PATH ROOT ('export_effectiveness')
    join trade_quarter_data tqd FOR JSON PATH ROOT ('trade_timeline')


  

