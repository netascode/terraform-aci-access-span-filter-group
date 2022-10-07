resource "aci_rest_managed" "spanFilterGrp" {
  dn         = "uni/infra/filtergrp-${var.name}"
  class_name = "spanFilterGrp"
  content = {
    name  = var.name
    descr = var.description
  }
}

resource "aci_rest_managed" "spanFilterEntry" {
  for_each   = { for entry in var.entries : entry.name => entry }
  dn         = "${aci_rest_managed.spanFilterGrp.dn}/proto-${each.value.ip_protocol}-src-[${each.value.source_ip}]-dst-[${each.value.destination_ip}]-srcPortFrom-${each.value.source_port_from}-srcPortTo-${each.value.source_port_to}-dstPortFrom-${each.value.destination_port_from}-dstPortTo-${each.value.destination_port_from}"
  class_name = "spanFilterEntry"
  content = {
    name        = each.value.name
    descr       = each.value.description
    dstAddr     = each.value.destination_ip
    dstPortFrom = each.value.destination_port_from
    dstPortTo   = each.value.destination_port_to
    ipProto     = each.value.ip_protocol
    srcAddr     = each.value.source_ip
    srcPortFrom = each.value.source_port_from
    srcPortTo   = each.value.source_port_to
  }
}
