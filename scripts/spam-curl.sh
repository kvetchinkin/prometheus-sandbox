for i in $(eval echo {1..$1})
do
  echo -ne "count: $i"\\r
  curl -sf localhost:5000/api/test/respond-with/$2

  [ ! -z "$3" ] && sleep $3 || sleep 1
done
