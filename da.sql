use supply_chain_sustain;
with cte1 as (select `Warehouse Code`,`Customer Code`,`Order Number`,`Order Line Number`,o1.`Item Code`,units,euros,asli_date, round(units*`Conversion Ratio`,2) as totkg from order_lines1 as o1 inner join uom_conversions1 as conv1 on o1.`Item Code` = conv1.`Item Code`),

finalt as (select  asli_date,c1.`Warehouse Code`,`Warehouse Country`, `Warehouse City`,
		c1.`Customer Code`, `Customer Country`, `Customer City`,`Item Code`,`Order Number`,road,rail,air,sea,units, euros,totkg,
		round(road/1000 * totkg/2,2) as Ecarb_road, round(rail/1000 * totkg/2,2) as Ecarb_rail, 
        round(air/1000 * totkg/2,2) as Ecarb_air, 
        round(sea/1000 * totkg/2,2) as Ecarb_sea,
        round(road/1000 * totkg/2  + rail/1000 * totkg/2 + air/1000 * totkg/2 + sea/1000 * totkg/2,2) as Etotal
from distances1 as d1 join cte1 as c1  on d1.`Warehouse Code` = c1.`Warehouse Code` and d1.`Customer Code` = c1.`Customer Code`)


-- Query to calculate total emissions by order number
-- select `Order Number`, sum(units), round(sum(etotal),2) from finalt
-- group by `Order Number`
-- order by sum(etotal) desc;

-- Query to calculate  emissions by month
select date_format(asli_date,"%Y %m") as yearmonth,
       date_format(asli_date,"%Y %M") as yearm_char,
       round(sum(Ecarb_road),2) as Co2_road, 
       round(sum(Ecarb_rail),2) as Co2_rail, 
       round(sum(Ecarb_air),2) as Co2_air, 
       round(sum(Ecarb_sea),2) as Co2_sea
from finalt
group by yearmonth, yearm_char
order by yearmonth;

