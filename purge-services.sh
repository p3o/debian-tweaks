#! /bin/bash
#
# Remove unnecessary services, including:
#   bluetooth, sane (scanner), cups (printer), avahi (some network services)
#   samba (file server)
#
# MUST BE RUN AS ROOT
#

# Remove kerneloops -- it sends crash stats to kerneloops
service kerneloops stop
update-rc.d -f kerneloops remove

# Stop unnecessary services
for srv in saned cups smbd nmbd bluetooth; do
	service $src stop
done

# Purge the corresponding packages
apt-get purge -y \
	sane-utils \
	avahi-daemon avahi-utils \
	cups cups-browsed \
	samba \
	bluetooth bluez bluez-alsa bluez-cups bluez-gstreamer modem-manager


