.separator "\n" "\n"
with 
  newest(max_published) as (
    select max(published) max_published from news
  ),
  latest(max_id) as (
     select max(id) as max_id
     from news,newest 
     where news.published=newest.max_published
  )
select published,url,title 
from news,newest,latest 
where 
  news.published=newest.max_published and 
  news.id=latest.max_id
;

