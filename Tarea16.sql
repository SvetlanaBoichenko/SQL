
Создание индекса для поля RegionID для таблицы Region:
  
CREATE UNIQUE INDEX IX_RegionTerritory ON Region (RegionDescription)


Создание индекса для поля TerritoryDescription для таблицы Territory:

CREATE UNIQUE INDEX Terr_Description ON Territory (TerritoryDescription)

