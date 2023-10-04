count=1
while IFS="" read -r p || [ -n "$p" ]; do # https://stackoverflow.com/a/1521498
	export SYNC_USER$count=$p
	count=$(expr $count + 1)
done </app/users.txt

exec /app/anki-sync-server