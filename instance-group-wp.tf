/*resource "google_compute_instance_group" "wordpress" {
  name = "group-wp"
  zone = "us-central1-a"

  named_port {
    name = "http"
    port = "80"
  }

  named_port {
    name = "https"
    port = "443"
  }

  lifecycle {
    create_before_destroy = true
  }
}*/

resource "google_compute_instance" "wordpress_template" {
  name         = "wordpress-template-1"
  machine_type = "e2-small"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "image-1"
    }
  }

  network_interface {
    network = "default"
  }
}

/*resource "google_compute_backend_service" "staging_service" {
  name      = "wp-backend"
  port_name = "https"
  protocol  = "HTTPS"

  backend {
    group = google_compute_instance_group.wordpress.id
  }

  health_checks = [
    google_compute_https_health_check.staging_health.id,
  ]
}

resource "google_compute_https_health_check" "staging_health" {
  name         = "staging-health"
  request_path = "/health_check"
}*/
