```
# VSCode forwards the VM's port 80 to a higher number like localhost:61049
# On MacOS / BSD, use Packet Filter (pf) to make it available at port 80...

# First, backup original pf config
sudo cp /etc/pf.conf /etc/pf.conf.backup

# Add new rule above the first line that begins with `anchor`
sudo sed -i '' '/^anchor/ i\ rdr pass on lo0 inet proto tcp from any to any port 80 -> 127.0.0.1 port 61049 ' /etc/pf.conf

# load the updated configuration
sudo pfctl -f /etc/pf.conf
```
