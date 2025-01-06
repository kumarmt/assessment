variable "region" {
  description = "Value of the region"
  type        = string
  default     = "asia-south1"
}

variable "project" {
  description = "Value of the project"
  type        = string
  default     = "data"
}

variable "vpcproject" {
  description = "Value of the project"
  type        = string
  default     = "shared_vpc"
}

variable "zone" {
  description = "Value of the zone"
  type        = string
  default     = "asia-south1-a"
}

variable "image" {
  description = "Value of the image"
  type        = string
  default     = "ubuntu-pro-2204-noble-amd64-v20240904"
}

variable "disk_size" {
  description = "Value of the data disk"
  type        = number
  default     = 512
}