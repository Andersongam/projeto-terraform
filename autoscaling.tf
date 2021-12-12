resource "google_compute_autoscaler" "foobar" {
  name   = "wp-autoscaling"
  zone   = "us-central1-a"
  target = google_compute_instance_group_manager.manager.id

  autoscaling_policy {
    max_replicas    = 6
    min_replicas    = 2
    cooldown_period = 120

    cpu_utilization {
      target = 0.8
    }
  }
}