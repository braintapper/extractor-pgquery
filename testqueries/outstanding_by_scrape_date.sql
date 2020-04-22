select to_char(scraped_at, 'YYYY-MM-DD') as scraped_at, count(*) from files
where
file_path is  null and
coalesce(download_attempts,0) < 5
group by to_char(scraped_at, 'YYYY-MM-DD')
order by scraped_at
