resource "google_compute_firewall" "mongodb_firewall" {
  name    = "mongodbfirewall"
  network = "default"  # Remplacez par le nom de votre réseau

  allow {
    protocol = "tcp"
    ports    = ["27017"]  # Port MongoDB, ajustez selon vos besoins
  }

  source_ranges = ["0.0.0.0/0"]  # Adresses IP source autorisées, ajustez selon vos besoins
  direction     = "INGRESS"
  disabled      = false
  priority      = 60000
}