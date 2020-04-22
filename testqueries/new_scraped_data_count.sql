select to_char(scraped_at, 'YYYY-MM-DD') as scraped_at, count(*) from files
group by to_char(scraped_at, 'YYYY-MM-DD')
order by scraped_at
