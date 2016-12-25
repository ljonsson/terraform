# Configure the VMware vSphere Provider

variable "vsphere_user" {}
variable "vsphere_password" {}
variable "vsphere_server" {}

provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"
  allow_unverified_ssl = true
}

# Create a folder
resource "vsphere_folder" "frontend" {
  datacenter = "Kennett"
  path = "frontend"
}

## Create a file
#resource "vsphere_file" "ubuntu_disk" {
#  datastore = "local"
#  source_file = "/home/ubuntu/my_disks/custom_ubuntu.vmdk"
#  destination_file = "/my_path/disks/custom_ubuntu.vmdk"
#}

## Create a disk image
#resource "vsphere_virtual_disk" "extraStorage" {
#    size = 2
#    vmdk_path = "myDisk.vmdk"
#    datacenter = "Datacenter"
#    datastore = "local"
#}

## Create a virtual machine within the folder
#resource "vsphere_virtual_machine" "web" {
#  name   = "terraform-web"
#  folder = "${vsphere_folder.frontend.path}"
#  vcpu   = 2
#  memory = 4096
#
#  network_interface {
#    label = "VM Network"
#  }
#
#  disk {
#    template = "centos-7"
#  }
#}
