resource "google_compute_disk" "disk1" {
  name = "disk-data1"
  type = "pd-standard"
  zone = var.zone
  size = "512"
}

resource "google_compute_disk" "data_disk" {
  count = 6
  name  = "data-disk-${count.index + 1}"
  size  = 512
  type  = "pd-standard"
  zone  = var.zone
}

resource "google_compute_instance" "muthu" {
  name         = "muthu-vm"
  machine_type = "n1-standard-1"
  zone         = var.zone
  allow_stopping_for_update = true
  boot_disk {
    initialize_params {
      image = var.image
      labels = {
        tier = "tier-0"
        purpose = "prod"
      }
    }
  }

  attached_disk {
    count = 2
    auto_delete = true
    boot = false
    device_name = "data-disk-${count.index + 1}-${element([0, 1], count.index % 2)}"
    interface = "SCSI"
    mode = "READ_WRITE"
    source = google_compute_disk.data_disk[count.index * 2 + element([0, 1], count.index % 2)].self_link
  }

  network_interface {
    subnetwork_project = "sharedvpc-01"
    subnetwork         = "projects/${var.vpcproject}/regions/${var.region}/subnetworks/data"
    access_config {
    }
  }

  metadata_startup_script = file("./bootstrap.sh")
}

output "instance_ips" {
  value = google_compute_instance.vm_instance[*].network_interface[0].access_config[0].nat_ip
}