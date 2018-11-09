# Import SSH public key
resource "openstack_compute_keypair_v2" "keypair" {
  name       = "${var.cluster_prefix}-keypair"
  public_key = "${file(var.public_key_path)}"
}

# Create Kubernetes template
resource "openstack_containerinfra_clustertemplate_v1" "clustertemplate" {
  name                  = "${var.cluster_prefix}-clustertemplate"
  image                 = "${var.fedora_atomic_image_name}"
  external_network_id   = "${var.external_network_id}"
  dns_nameserver = "${var.dns_nameserver}"
  network_driver        = "${var.overlay_network_driver}"
  flavor = "${var.nodes_flavor}"
  master_flavor = "${var.masters_flavor}"
  coe                   = "kubernetes"
  volume_driver         = "${var.volume_driver}"
  keypair_id              = "${openstack_compute_keypair_v2.keypair.name}"
}

# Create cluster
resource "openstack_containerinfra_cluster_v1" "cluster" {
  name                 = "${var.cluster_prefix}-cluster"
  cluster_template_id  = "${openstack_containerinfra_clustertemplate_v1.clustertemplate.id}"
  master_count         = "${var.masters_count}"
  node_count           = "${var.nodes_count}"
}
