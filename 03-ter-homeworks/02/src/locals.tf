locals {
vm_web_name  = "${ var.root }-${ var.env }-${ var.project }-${ var.role[0]}"
vm_db_name = "${ var.root }-${ var.env }-${ var.project }-${ var.role[1]}"
}