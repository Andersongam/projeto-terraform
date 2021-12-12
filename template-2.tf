# instance template
/*resource "google_compute_instance_template" "instance_template1" {
    project = "rich-gift-331117"
  name         = "l7-ilb-mig-template"
  provider     = google-beta
  machine_type = "e2-small"
  tags         = ["http-server"]

 
  disk {
    source_image = "debian-cloud/debian-10"
    auto_delete  = true
    boot         = true
  }

  # install nginx and serve a simple web page
  metadata = {
    startup-script = <<-EOF1
      #! /bin/bash
apt update
apt -y install apache2
apt -y install php
systemctl restart apache2
cd /var/www/html
rm index.html
cd ..
apt -y install wget
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
apt -y install rsync
rsync -avP wordpress/ /var/www/html
cd /var/www/html
apt install php-mysql php-cgi php-cli php-gd -y
systemctl restart apache2
chown -R www-data:www-data /var/www/html
    EOF1
  }
  lifecycle {
    create_before_destroy = true
  }
}*/