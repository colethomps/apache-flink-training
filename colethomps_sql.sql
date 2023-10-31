with avg_ip as (
SELECT COUNT(1)
FROM processed_events_sessions
GROUP BY ip)
    Select avg(count) from avg_ip


with avg_site as (
select DISTINCT count(1) OVER (PARTITION BY ip,host),
       ip,
       host
from processed_events_sessions)
SELECT avg(count), host from avg_site
group by host

/*1.3333333333333333,zachwilson.techcreator.io
1,sitemap.techcreator.io
1.0160771704180064,admin.zachwilson.tech
1.2253521126760563,dataengineer.io
1.2924528301886792,www.techcreator.io
1,merinova.techcreator.io
1.3234323432343234,www.zachwilson.tech
1.4919871794871795,www.eczachly.com
1.2269503546099291,www.dataengineer.io
1.4,dutchengineer.techcreator.io
1,sitemaps.techcreator.io
1.2727272727272727,lulu.techcreator.io
1,kmallik0609.techcreator.io
1,ujjwalcarsales.techcreator.io*/
