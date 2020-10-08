## Description
Assign IP address, at home, usually is a job made from broadband router or WiFi accesspoint, but I unlike there are some limitation like hateful interfaces, no way to orchestrate it and so on, but Linux has always an answer to my questions, so I use from a long time ago, ISC dhcp server.

It's stable, it's versatile, but it is really outdated, without a gui (yes, today gui are a usefull thing also for command line feticist like me). Browsing github i have found a fantastic frontend for ISC dhcp (thanks to Cris Miles, you can find it [here](https://github.com/Akkadius/glass-isc-dhcp)) and i decide do include it in my docker container.

## Container usage
It's really simple, deploy your container and add two volumes:
* /var/lib/dhcp where you can find lease database
* /etc/dhcp where there are configuration files
Just for initial setup you can use standard dhcpd.conf and dhcpd6.conf files, I use directory binding so i have them in a host filesystem for initial setup.

Please, fell free to give me your feedback

Enjoy yourself!
