WITH trade_stats AS (
    SELECT cv.caravan_id,
    COUNT (tr.trader_id) AS total_trading_partners,
    COUNT (cv.caravan_id) AS total_caravans,
    SUM (cg.value) AS total_caravan_value,
 
  From CARAVANS cv
  Left join TRADERS tr where cv.caravan_id = tr.caravan_id
  Left join CARAVANS_GOODS cg where cg.caravan_id = tr.caravan_id

), trade_balance AS (

  SELECT de.caravan_id,
   SUM (cg1.value) AS total_sell_aravan_value
   SUM (cg2.value) AS total_buy_caravan_value 

  From DIPLOMATIC_EVENTS de1 
  Left join CARAVANS_GOOD cg1 where cg1.caravan_id = de.caravan_id AND de.outcome = "sell"
  Left join CARAVANS_GOOD cg2 where cg2.caravan_id = de.caravan_id AND de.outcome = "buy"
  ),
  
  
SELECT JSON_OBJECT(
'total_trading_partners':co.,
'Lastname':'Targaryen',
'Children':
JSON_ARRAY
(JSON_OBJECT('name':'Jacaerys','lastname':'Velaryon', 'age':20),
(JSON_OBJECT('name':'Lucerys','lastname':'Velaryon', 'age':18)))
) json 



  
  "total_trading_partners": 5,
  "all_time_trade_value": 15850000,
  "all_time_trade_balance": 1250000,
  "civilization_data": 
