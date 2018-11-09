variable cluster_prefix {
  description = "Name prefix for the cluster resources"
  default     = "kubenow"
}

variable fedora_atomic_image_name {
  description = "Name of a CoreOS Container-Linux image in your project (to boot the nodes from)"
}

variable external_network_id {
  description = "External network ID"
}

variable overlay_network_driver {
  description = "Overlay network driver"
  default = "flannel"
}

variable dns_nameserver {
  description = "DNS nameserver that is used in the cluster nodes"
  default = "8.8.8.8"
}

variable masters_flavor {
  description = "Masters flavor"
}

variable nodes_flavor {
  description = "Nodes flavor"
}

variable volume_driver {
  description = "Container volume driver"
  default = "cinder"
}

variable public_key_path {
  description = "Path to public SSH key"
}

variable masters_count {
  description = "Masters count"
  default = 1
}

variable nodes_count {
  description = "Nodes count"
  default = 2
}
