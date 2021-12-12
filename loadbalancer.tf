# backend service
resource "google_compute_region_backend_service" "default" {
  name                  = "l7-ilb-backend-subnet"
  provider              = google-beta
  region                = "europe-west1"
  protocol              = "HTTP"
  load_balancing_scheme = "INTERNAL_MANAGED"
  timeout_sec           = 10
  health_checks         = [google_compute_region_health_check.default.id]
  backend {
    group           = google_compute_instance_group_manager.manager.id
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
  }
}
# health check
resource "google_compute_region_health_check" "default" {
  name     = "l7-ilb-hc"
  provider = google-beta
  region   = "us-central1"
  http_health_check {
    port_specification = "USE_SERVING_PORT"
  }
}
