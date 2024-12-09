   1  apt-get update; apt-get upgrade; apt-get dist-upgrade; apt-get -y install needrestart
    2  apt-get clean
    3  apt-get update; apt-get -y upgrade; apt-get -y dist-upgrade; apt-get -y install needrestart nano; shutdown -r now; apt-get clean; apt-get update; apt-get -y dist-upgrade; needrestart
    4  apt-get update; apt-get upgrade; apt-get dist-upgrade
    5  needrestart
    6  apt-get install needrestart
    7  cat /etc/os-release 
    8  apt-cache search restart
    9  apt-get install restartd
   10  wget -nv https://download.owncloud.org/download/repositories/stable/Debian_7.0/Release.key -O Release.key
   11  apt-key add - < Release.key
   12  sh -c "echo 'deb http://download.owncloud.org/download/repositories/stable/Debian_7.0/ /' >> /etc/apt/sources.list.d/owncloud.list"
   13  apt-get update
   14  apt-get install owncloud-files
   15  apt-get install mysql-server apache2 php5
   16  mysql -u root -p
   17  a2enmod rewrite
   18  service apache2 restart
   19  service mysql restart
   20  apt-cache search owncloud
   21  apt-get install owncloud-deps
   22  reboot
   23  service apache2 status
   24  service mysql status
   25  a2enmod rewrite
   26  CREATE USER owncloud@localhost IDENTIFIED BY '';
   27  mysql -u root -p
   28  mysql -u root -p
   29  mysql -u root -p
   30  service mysql restart
   31  mkdir /var/owncloud
   32  chown www-data:www-data /var/owncloud
   33  chmod 750 /var/owncloud
   34  service owncloud restart
   35  mysql --defaults-file=/etc/mysql/debian.cnf
   36  service mysql restart
   37  service apache2 restart
   38  owncloud
   39  apropos owncloud
   40  sudo a2enmod ssl
   41  sudo a2ensite default-ssl
   42  sudo service apache2 reload
   43  apt-cache search php | grep gd
   44  apt-get install php5-gd
   45  apt-get install curl
   46  apt-cache search php | grep curl
   47  apt-get install php5-curl
   48  service apache2 reload
   49  apt-cache search odbc | grep mysql
   50  apt-cache search odbc 
   51  apt-get install mysql-server
   52  apt-get install mysql-client
   53  apt-get install php5-mysql
   54  service apache2 reload
   55  history
   56  history | grep chmod
   57  chmod /data
   58  ls /
   59  ls -l /
   60  nano /etc/hosts
   61  apt-get install nano
   62  nano /etc/hosts
   63  reboot
   64  apt-cache search upgrade
   65  apt-get install upgrade-system
   66  upgrade-system
   67  aptitude
   68  apt-get install aptitude
   69  nano /etc/hosts
   70  nano /etc/ssh/sshd_config 
   71  reboot
   72  apt-get install owncloud
   73  history
