##? speedtest - Network speed testing utility
##?
##? Provides a cross-platform speedtest command:
##?   speedtest     - Run network speed test
##?
##? Uses:
##?   - macOS: networkQuality (built-in)
##?   - Other: speedtest-cli (bundled Python script)

# Cross-platform speedtest alias
if is_mac; then
    alias speedtest="networkQuality"
else
    alias speedtest="python3 ${0:A:h}/functions/speedtest-cli"
fi

