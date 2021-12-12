resource "google_compute_target_pool" "target-wordpress" {
  name = "target-wp"

  instances = [
    "us-central1-a/myinstance1",
    "us-central1-b/myinstance2",
  ]
}

resource "google_compute_instance_group_manager" "manager" {
  name = "manager-wp"

  base_instance_name = "app"
  zone               = "us-central1-a"

  version {
    instance_template  = google_compute_instance_template.default.id
  }


  target_pools = [google_compute_target_pool.target-wordpress.id]
  target_size  = 2

  named_port {
    name = "custumhttp"
    port = 8888
  }

}

