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
  default = "40G"
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
  default = "oamg/oraclelinux-uefi"
}

variable "version" {
  type    = string
  default = "8.6"
}

variable "version_description" {
  type    = string
  default = ""
}

source "qemu" "oraclelinux-610-uefi" {
  accelerator      = "kvm"
  boot_command     = ["<wait><wait>e<down><down><end><bs><bs><bs><bs><bs>inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ol610-ks.cfg<leftCtrlOn>x<leftCtrlOff>"]
  boot_wait        = "5s"
  disk_compression = true
  disk_size        = "${var.disk_size}"
  format           = "qcow2"
  http_directory   = "http"
  iso_checksum     = "sha256:001c05d5ea90341de768ba8bde4bbb0209f2b5e06996dc8637b9d3e86df206fe"
  iso_url          = "https://yum.oracle.com/ISOS/OracleLinux/OL6/u10/x86_64/x86_64-boot-uek.iso"
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
  ssh_timeout      = "30m"
  headless         = var.headless
}

source "qemu" "oraclelinux-79-uefi" {
  accelerator      = "kvm"
  boot_command     = ["<wait><wait>e<down><down><end><bs><bs><bs><bs><bs>inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ol79-ks.cfg<leftCtrlOn>x<leftCtrlOff>"]
  boot_wait        = "5s"
  disk_compression = true
  disk_size        = "${var.disk_size}"
  format           = "qcow2"
  http_directory   = "http"
  iso_checksum     = "sha256:6da0323423f3a52d20d1021c2651885052319ca4ace7532859d8d20640829004"
  iso_url          = "https://yum.oracle.com/ISOS/OracleLinux/OL7/u9/x86_64/x86_64-boot.iso"
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
  ssh_timeout      = "30m"
  headless         = var.headless
}

source "qemu" "oraclelinux-84-uefi" {
  accelerator      = "kvm"
  boot_command     = ["<wait><wait>e<down><down><end><bs><bs><bs><bs><bs>inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ol84-ks.cfg<leftCtrlOn>x<leftCtrlOff>"]
  boot_wait        = "5s"
  disk_compression = true
  disk_size        = "${var.disk_size}"
  format           = "qcow2"
  http_directory   = "http"
  iso_checksum     = "sha256:2127c0e4f271601ddb03f12c10c5b1ee3a711cd91e352658b290b12f9f8adca3"
  iso_url          = "https://yum.oracle.com/ISOS/OracleLinux/OL8/u4/x86_64/x86_64-boot-uek.iso"
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
  ssh_timeout      = "30m"
  headless         = var.headless
}

source "qemu" "oraclelinux-86-uefi" {
  accelerator      = "kvm"
  boot_command     = ["<wait><wait>e<down><down><end><bs><bs><bs><bs><bs>inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ol86-ks.cfg<leftCtrlOn>x<leftCtrlOff>"]
  boot_wait        = "5s"
  disk_compression = true
  disk_size        = "${var.disk_size}"
  format           = "qcow2"
  http_directory   = "http"
  iso_checksum     = "sha256:856d4ddfffabb2bed1ffee1e21a82ba81f30156936c908d19b73706f08bfa731"
  iso_url          = "https://yum.oracle.com/ISOS/OracleLinux/OL8/u6/x86_64/x86_64-boot-uek.iso"
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
  ssh_timeout      = "30m"
  headless         = var.headless
}

source "qemu" "oraclelinux-90-uefi" {
  accelerator      = "kvm"
  boot_command     = ["<wait><wait>e<down><down><end><bs><bs><bs><bs><bs>inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ol90-ks.cfg<leftCtrlOn>x<leftCtrlOff>"]
  boot_wait        = "5s"
  disk_compression = true
  disk_size        = "${var.disk_size}"
  format           = "qcow2"
  http_directory   = "http"
  iso_checksum     = "sha256:a782e8c78a629ab1c19fcb32e76d3b81c7ef1b04060a0465253c103686339f3a"
  iso_url          = "https://yum.oracle.com/ISOS/OracleLinux/OL9/u0/x86_64/OracleLinux-R9-U0-x86_64-boot-uek.iso"
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
  ssh_timeout      = "30m"
  headless         = var.headless
}

# a build block invokes sources and runs provisioning steps on them. The
# documentation for build blocks can be found here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/build
build {
  sources = [
    "source.qemu.oraclelinux-610-uefi",
    "source.qemu.oraclelinux-79-uefi",
    "source.qemu.oraclelinux-84-uefi",
    "source.qemu.oraclelinux-86-uefi",
    "source.qemu.oraclelinux-90-uefi"
  ]

  # This will be run for every source, if a specific script needs to be ran for
  # a specific source, please, create a new provisioner with the `only`
  # property and specify that source.
  provisioner "shell" {
    execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
    scripts = [
      "./scripts/ol/patch-kernel.sh"
    ]
  }

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
