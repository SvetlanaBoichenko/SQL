WITH trade_stats AS (
    SELECT cv.caravan_id, cv.civilization_type
    COUNT (cv.caravan_id) AS total_caravans,
    SUM (cg.value) AS total_caravan_value,
    SUM (tt.balance_direction) AS trade_balance,
    de.relationship.change AS trade_relationship,
    diplomatic_correlation
    
    From CARAVANS cv
    Left join CARAVANS_GOODS cg where cg.caravan_id = cv.caravan_id
    Left join TRADE_TRANSACTIONS tt where tt.caravan_id = cv.caravan_id
    left join DIPLOMATIC_EVENT de where de.caravan_id = cv.caravan_id

), trade_balance_all AS (
    SELECT tt1.transaction_id,
    SUM (tt1.balance_direction) as all_time_trade_balance,
    SUM (tt1.value) as all_time_trade_value,
    COUNT(trader_id) AS total_trading_partners
    
    From TRADE_TRANSACTIONS tt1 
    Left join TRADES tr
    group by tt1.transaction_id
  ),
  
  
SELECT JSON_OBJECT(
'total_trading_partners':co.,
'Lastname':'Targaryen',
'Children':
JSON_ARRAY
(JSON_OBJECT('name':'Jacaerys','lastname':'Velaryon', 'age':20),
(JSON_OBJECT('name':'Lucerys','lastname':'Velaryon', 'age':18)))
) json 


    
   SUM (cg1.value) AS total_sell_aravan_value
   SUM (cg2.value) AS total_buy_caravan_value 

  
  "total_trading_partners": 5,
  "all_time_trade_value": 15850000,
  "all_time_trade_balance": 1250000,
  "civilization_data": 
