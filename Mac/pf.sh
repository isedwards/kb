## NOTE: the `sed` substitution is currently not working, but this is the outline of a helper script

#!/bin/bash

# Script for (optionally) updating and reloading the Packet Filter (PF)
# config on macOS and other systems like FreeBSD.
#
# Usage: ./pf [port_number]

# Check if a port number argument is provided
if [ -n "$1" ]; then
  cat /etc/pf.conf | grep port | awk -F 'port' '{print "Original port to forward:" $3}'
  new_port="$1"

  # Define the line to replace
  line_to_replace="rdr pass on lo0 inet proto tcp from any to any port 80 -> 127.0.0.1 port"

  # Search and replace the port number in /etc/pf.conf
  if sudo sed -i.bak "s~${line_to_replace} [0-9]\+~${line_to_replace} ${new_port}~" /etc/pf.conf; then
    echo "Port number replaced successfully."
  else
    echo "Failed to replace port number."
    exit 1
  fi
fi

# Reload the (updated) configuration
cat /etc/pf.conf | grep port | awk -F 'port' '{print "Reloading and forwarding:" $3}'
sudo pfctl -f /etc/pf.conf 2> /dev/null
