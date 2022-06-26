# vim: set ts=4 sw=4 et:

install -m0664 -o root -g utmp /dev/null /run/utmp
halt -B  # for wtmp

if [ -z "$VIRTUALIZATION" ]; then
    msg "Seeding random number generator..."
    seedrng || true
fi

msg "Setting up loopback interface..."
ip link set up dev lo

if [ -r "/etc/hostname" ]; then
    read -r HOSTNAME < /etc/hostname

    msg "Setting up hostname to '${HOSTNAME}'..."
    printf "%s" "$HOSTNAME" > /proc/sys/kernel/hostname
else
    msg_warn "Didn't setup a hostname!"
fi
