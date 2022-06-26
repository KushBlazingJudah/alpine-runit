## Runit init scripts for Alpine

This repository contains the runit init scripts I use to start my Alpine Linux
machines that run runit as PID 1.

This is based off of [Void's scripts](https://github.com/void-linux/void-runit)
as they were rather easy to port over and I was most familiar with them.
Some small changes were made to further suit my opinions and needs.

I plan to make a complete set for runit-based Alpine systems someday, however
for now you can checkout
[my personal package repository](https://github.com/KushBlazingJudah/alpine-repo)
for a couple scripts that may prove useful in setting up your system to
completely use runit as PID 1.

## Dependencies

- A POSIX shell
- A POSIX awk
- procps-ng (needs pkill -s0,1)
  - Packaged as simply `procps` in Alpine.
- runit

### How to use it

To see enabled services for "current" runlevel:

    $ ls -l /var/service/

To see available runlevels (default and single, which just runs sulogin):

    $ ls -l /etc/runit/runsvdir

To enable and start a service into the "current" runlevel:

    # ln -s /etc/sv/<service> /var/service

To disable and remove a service:

    # rm -f /var/service/<service>

To view status of all services for "current" runlevel:

    # sv status /var/service/*
    
Feel free to send patches and contribute with improvements!

## Copyright

alpine-runit is in the public domain.

To the extent possible under law, the creator of this work has waived
all copyright and related or neighboring rights to this work.

http://creativecommons.org/publicdomain/zero/1.0/
