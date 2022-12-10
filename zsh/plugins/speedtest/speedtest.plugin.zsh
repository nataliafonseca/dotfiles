if (is_mac); then 
  alias speedtest="networkQuality"
else
  alias speedtest="python3 ${0:A:h}/functions/speedtest-cli"
fi
