select * from files
where
file_path is  null and
coalesce(download_attempts,0) < 5
order by scraped_at
