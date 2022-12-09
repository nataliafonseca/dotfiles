if (is_macbook); then 
  alias speedtest="networkQuality"
else
  alias speedtest="python3 ${0:A:h}/functions/speedtest-cli"
fi
