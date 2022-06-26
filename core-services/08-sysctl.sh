# vim: set ts=4 sw=4 et:

if [ -x /sbin/sysctl -o -x /bin/sysctl ]; then
    msg "Loading sysctl(8) settings..."
    for i in /run/sysctl.d/*.conf \
        /etc/sysctl.d/*.conf \
        /usr/local/lib/sysctl.d/*.conf \
        /usr/lib/sysctl.d/*.conf; do

        if [ -e "$i" ] && [ ! -e "/run/vsysctl.d/${i##*/}" ]; then
            [ ! -e "/run/vsysctl.d" ] && mkdir -p /run/vsysctl.d
            ln -s "$i" "/run/vsysctl.d/${i##*/}"
        fi
    done

    if [ -e "/run/vsysctl.d" ]; then
        for i in /run/vsysctl.d/*.conf; do
            sysctl -p "$i"
        done
        rm -rf -- /run/vsysctl.d
    fi
    sysctl -p /etc/sysctl.conf
fi
