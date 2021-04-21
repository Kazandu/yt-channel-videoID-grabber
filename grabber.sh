printf "*************************************\n***Youtube Channel videoID grabber***\n*************by  Kazandu*************\n*************************************\n\n"
APIKEYFILE=apikey.txt
if [ ! -f $APIKEYFILE ]; then
    printf "No API-key set! Please replace the Placeholder in apikey.txt with your API-key from the Youtube Data API v3"
    exit 1
fi
APIKEY=$(cat "apikey.txt")
mkdir "$1"
curl "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=UU${1}&key=${APIKEY}" > "$1/full1.txt"
NEXTTOKEN=$(jq -r '.nextPageToken' $1/full1.txt)
COUNTER="2"
while [[ "$NEXTTOKEN" != "null" ]]; do
curl "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=UU${1}&pageToken=${NEXTTOKEN}&key=${APIKEY}" > "${1}/full$COUNTER.txt"
NEXTTOKEN=$(jq -r '.nextPageToken' $1/full$COUNTER.txt)
COUNTER=$((COUNTER+1))
done
FULLFILES=$1/*
for f in $FULLFILES
do
sed -n '/videoId/p' $f | sed 's/.$//' | tr -d " \t" | sed 's/"videoId":"/https:\/\/www.youtube.com\/watch?v=/g' >> $1_IDs.txt
done