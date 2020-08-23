# pihole
code for setting up pihole docker host on raspberry pi ubuntu
-
hostprep folder has baseline scripts to automate host setup and make it ready to
accept docker containers.

# Host Image prep using ubuntu
1. Download ubuntu image from https://ubuntu.com/download/raspberry-pi
2. Write Image to SD card
  - Format SD card into single FAT partition (Disks utility)
  - restore image to sd card
3. Prep SD card image with first boot actions
  - touch ssh file to sd card system-boot partition to enable ssh
  - edit user-data for cloudint / cloud config first boot actions
    - "# On first boot, set the (default) ubuntu user's password to "ubuntu" and"
      "# expire user passwords"
      ````yaml
      chpasswd:
        expire: false
        list:
        - ubuntu:"desired-password"
      ````
    - "#Add runcmd line to clone git repo automatically"
      ````yaml
      runcmd:
        - /usr/bin/repoclone.sh
      ````