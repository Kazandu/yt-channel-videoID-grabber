# yt-channel-videoId-grabber
Grabs every single videoId of a YT-channel

To use it just replace the REPLACEMEPLEASE in apikey.txt with your Youtube DATA API v3 key and then run the bash script with the Channel-ID as Parameter.
Example:

`bash grabber.sh AWSyEs_Io8MtpY3m-zqILA`

To get your Youtube data api v3 key go to https://console.cloud.google.com/apis/api/youtube.googleapis.com/ -> Credentials -> Create Credentials -> Api key.

To get the Channel ID of a channel just go to the channel on Youtube and cut off everything until "UC".
Example: 
https://www.youtube.com/channel/UCAWSyEs_Io8MtpY3m-zqILA
Channel ID = AWSyEs_Io8MtpY3m-zqILA



Dependencies: jq (https://packages.debian.org/buster/jq)
