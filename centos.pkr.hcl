# This file was autogenerated by the 'packer hcl2_upgrade' command. We
# recommend double checking that everything is correct before going forward. We
# also recommend treating this file as disposable. The HCL2 blocks in this
# file can be moved to other files. For example, the variable blocks could be
# moved to their own 'variables.pkr.hcl' file, etc. Those files need to be
# suffixed with '.pkr.hcl' to be visible to Packer. To use multiple files at
# once they also need to be in the same folder. 'packer inspect folder/'
# will describe to you what is in that folder.

# Avoid mixing go templating calls ( for example ```{{ upper(`string`) }}``` )
# and HCL2 calls (for example '${ var.string_value_example }' ). They won't be
# executed together and the outcome will be unknown.

# All generated input variables will be of 'string' type as this is how Packer JSON
# views them; you can change their type later on. Read the variables type
# constraints documentation
# https://www.packer.io/docs/templates/hcl_templates/variables#type-constraints for more info.

# source blocks are generated from your builders; a source can be referenced in
# build blocks. A build block runs provisioner and post-processors on a
# source. Read the documentation for source blocks here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/source
variable "disk_size" {
  type    = string
  default = "25G"
}

variable "password" {
  type    = string
  default = "vagrant"
}

variable "user" {
  type    = string
  default = "vagrant"
}

variable "firmware" {
  type    = string
  default = "/usr/share/edk2/ovmf/OVMF_CODE.fd"
}

variable "headless" {
  type    = bool
  default = true
}

variable "cloud_token" {
  type      = string
  default   = ""
  sensitive = true
}

variable "box_tag" {
  type    = string
  default = "rhel-conversions/centos-uefi"
}

variable "version" {
  type    = string
  default = "8.5.2111"
}

variable "version_description" {
  type    = string
  default = ""
}

source "qemu" "centos-79-uefi" {
  accelerator      = "kvm"
  boot_command     = ["<wait><wait>e<down><down><end><bs><bs><bs><bs><bs>inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/centos79-ks.cfg<leftCtrlOn>x<leftCtrlOff>"]
  boot_wait        = "5s"
  disk_compression = true
  disk_size        = "${var.disk_size}"
  format           = "qcow2"
  http_directory   = "http"
  iso_checksum     = "sha256:b79079ad71cc3c5ceb3561fff348a1b67ee37f71f4cddfec09480d4589c191d6"
  iso_url          = "https://vault.centos.org/7.9.2009/isos/x86_64/CentOS-7-x86_64-NetInstall-2009.iso"
  machine_type     = "q35"
  firmware         = "${var.firmware}"
  use_pflash       = false
  qemuargs = [
    ["-cpu", "host"],
    ["-m", "1024"],
  ]
  shutdown_command = "echo '${var.password}'|sudo -S shutdown -P now"
  ssh_password     = "${var.password}"
  ssh_username     = "${var.user}"
  ssh_timeout      = "10m"
  headless         = var.headless
}

source "qemu" "centos-84-uefi" {
  accelerator      = "kvm"
  boot_command     = ["<wait><wait>e<down><down><end><bs><bs><bs><bs><bs>inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/centos84-ks.cfg<leftCtrlOn>x<leftCtrlOff>"]
  boot_wait        = "5s"
  disk_compression = true
  disk_size        = "${var.disk_size}"
  format           = "qcow2"
  http_directory   = "http"
  iso_checksum     = "sha256:c79921e24d472144d8f36a0d5f409b12bd016d9d7d022fd703563973ca9c375c"
  iso_url          = "https://vault.centos.org/8.4.2105/isos/x86_64/CentOS-8.4.2105-x86_64-boot.iso"
  machine_type     = "q35"
  firmware         = "${var.firmware}"
  use_pflash       = false
  qemuargs = [
    ["-cpu", "host"],
    ["-m", "1024"],
  ]
  shutdown_command = "echo '${var.password}'|sudo -S shutdown -P now"
  ssh_password     = "${var.password}"
  ssh_username     = "${var.user}"
  ssh_timeout      = "10m"
  headless         = var.headless
}

source "qemu" "centos-85-uefi" {
  accelerator      = "kvm"
  boot_command     = ["<wait><wait>e<down><down><end><bs><bs><bs><bs><bs>inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/centos85-ks.cfg<leftCtrlOn>x<leftCtrlOff>"]
  boot_wait        = "5s"
  disk_compression = true
  disk_size        = "${var.disk_size}"
  format           = "qcow2"
  http_directory   = "http"
  iso_checksum     = "sha256:9602c69c52d93f51295c0199af395ca0edbe35e36506e32b8e749ce6c8f5b60a"
  iso_url          = "https://vault.centos.org/8.5.2111/isos/x86_64/CentOS-8.5.2111-x86_64-boot.iso"
  machine_type     = "q35"
  firmware         = "${var.firmware}"
  use_pflash       = false
  qemuargs = [
    ["-cpu", "host"],
    ["-m", "1024"],
  ]
  shutdown_command = "echo '${var.password}'|sudo -S shutdown -P now"
  ssh_password     = "${var.password}"
  ssh_username     = "${var.user}"
  ssh_timeout      = "10m"
  headless         = var.headless
}

# a build block invokes sources and runs provisioning steps on them. The
# documentation for build blocks can be found here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/build
build {
  sources = ["source.qemu.centos-79-uefi", "source.qemu.centos-84-uefi", "source.qemu.centos-85-uefi"]

  post-processors {
    post-processor "vagrant" {
      provider_override    = "libvirt"
      vagrantfile_template = "./Vagrantfile-uefi.template"
    }

    post-processor "vagrant-cloud" {
      access_token        = "${var.cloud_token}"
      box_tag             = "${var.box_tag}"
      version             = "${var.version}"
      version_description = "${var.version_description}"
    }
  }
}
