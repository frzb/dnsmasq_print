# `dnsmasq-print`
This simple dnsmasq setup just launches a DHCP server (no DNS) and prints new added DHCP leases on all TTYs and on a selected printer by calling a custom DHCP script whenever a new lease is provided.
Allocation of IP-Addresses is configured to be strict sequential.

## Launch `dnsmasq`

```
sudo dnsmasq --interface vboxnet1 --dhcp-sequential-ip --no-daemon --port 0 --dhcp-range=192.168.57.10,192.168.57.100,255.255.255.0,infinite --dhcp-leasefile=./leasefile --dhcp-script=./lease_print.sh
```

## Try it
A `Vagrantfile` for a DHCP test client is include which can be started by `vagrant up`.

After entering the VM with `vagrant ssh` DHCP addresses can be requested to see the magic happen:

```
sudo dhclient -i enp0s08 -v
```

### Next one

```
sudo dhclient -i enp0s09 -v
```

## Printing

By default a CUPS-PDF Printer is used, which needs to be installed separately.

Package name under Debian/Ubuntu: `cups-pdf`.

The CUPS-PDF printer puts the PDFs under `/root/PDF`.

If you want to use a different printer specify the constant in `lease_print.sh`.
