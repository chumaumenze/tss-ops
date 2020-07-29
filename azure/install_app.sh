#!/bin/bash -xe

export DEBIAN_FRONTEND=noninteractive
apt-get -y update

# Install Apache and PHP
apt install -y apache2 php libapache2-mod-php
mv /var/www/html/index.html /var/www/html/index.orig.html

echo "<h1>AWS CloudFormation Deployment confirmed.</h1>
<p>I am responding from <?php echo $_SERVER['SERVER_NAME']; ?></p>
<?php phpinfo(); ?>" >> /var/www/html/index.php

#restart apache
service apache2 reload
