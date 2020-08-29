# pihole
code for setting up pihole docker host on raspberry pi ubuntu
-
- hostprep folder has baseline scripts to automate host setup and make it ready to accept docker containers.
- docker folder has docker-compose yaml config, bash script docker container deployment and email notifcation script.
- sdcard-files has files and example files that need to be written to the sd card before first boot.

# Host Image prep using ubuntu
1. Download ubuntu image from https://ubuntu.com/download/raspberry-pi
2. Write Image to SD card
  - Format SD card into single FAT partition (Disks utility)
  - restore image to sd card (Disks Utility)
3. Prep SD card image with first boot actions
  - touch ssh file to sd card system-boot partition to enable ssh (mount partition and change directory)
    ````yaml
    touch ssh
    ````
  - edit user-data file in system-boot partition for cloudint / cloud config first boot actions
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
        - [rm, -rf, /usr/bin/repoclone.sh]
        - sudo chmod u+x /home/ubuntu/pihole/hostprep/dockerhostprep.sh
        - sudo chmod u+x /home/ubuntu/pihole/docker/pihole-docker-install.sh
        - sudo chmod u+x /home/ubuntu/pihole/docker/notify.sh
        - /home/ubuntu/pihole/hostprep/dockerhostprep.sh
        - /home/ubuntu/pihole/docker/pihole-docker-install.sh
        - /home/ubuntu/pihole/docker/notify.sh
      ````
  - copy repoclone.sh script to /usr/bin folder of writable partition of sd card (found in repo sdcard-files folder)
    ````yaml
    ex: cp ~/repoclone.sh /media/devcodyops/writable/usr/bin/repoclone.sh
    ````
  - make sd card repoclone script executable
    ````yaml
    ex: sudo chmod u+x /media/devcodyops/writable/usr/bin/repoclone.sh
    ````
  - edit ssmtp.conf file and copy to sd card /usr/bin folder if you want email noitification when provisioning is complete (found in repo sd-card-files folder)
    ````yaml
    ex: cp ~/ssmtp.conf /media/devcodyops/writable/usr/bin/ssmtp.conf
    ````
    udpate the following lines to whatever gmail creds you want the email to be sent to
    ````yaml
    AuthUser="Insert Desired gmail account"
    AuthPass="Insert gmail account password"
    ````
  