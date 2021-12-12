resource "google_compute_instance_template" "default" {
  name        = "wordpress-template-1"
  description = "Template para instancia wordpress."

 

  instance_description = "description assigned to instances"
  machine_type         = "e2-small"
  can_ip_forward       = false

  disk {
    source_image = "image-1"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = "default"
  }

   labels = {
    so  = "ubuntu"
    app = "wp-projeto2"
  }
}
