resource "google_compute_instance" "mongodb" {
  name                      = "mongodb"
  hostname                  = var.hostnamemongodb
  machine_type              = "e2-standard-4"
  project                   = var.gcp_project
  zone                      = var.gcp_zone

  scheduling {
    preemptible       = true
    automatic_restart = false
  }
 allow_stopping_for_update = true
  boot_disk {
    initialize_params {
      image = var.image
      size  = 500
      type  = "pd-standard"
    }
  }
  labels = {
    environment = "mongodb"
  }
  metadata = {
    enable-oslogin = "TRUE"
  }
  
  tags = ["http-server", "https-server", "lb-health-check"]

  network_interface {
    network = "default" 
    access_config {
      // Include this section to give the VM an external ip address
    }
  }

}


