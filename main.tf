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
  dn         = "${aci_rest_managed.spanFilterGrp.dn}/proto-${each.value.ip_protocol}-src-[${each.value.source_ip}]-dst-[${each.value.destination_ip}]-srcPortFrom-${each.value.source_from_port}-srcPortTo-${each.value.source_to_port != null ? each.value.source_to_port : each.value.source_from_port}-dstPortFrom-${each.value.destination_from_port}-dstPortTo-${each.value.destination_to_port != null ? each.value.destination_to_port : each.value.destination_from_port}"
  class_name = "spanFilterEntry"
  content = {
    name        = each.value.name
    descr       = each.value.description
    dstAddr     = each.value.destination_ip
    dstPortFrom = each.value.destination_from_port
    dstPortTo   = each.value.destination_to_port != null ? each.value.destination_to_port : each.value.destination_from_port
    ipProto     = each.value.ip_protocol
    srcAddr     = each.value.source_ip
    srcPortFrom = each.value.source_from_port
    srcPortTo   = each.value.source_to_port != null ? each.value.source_to_port : each.value.source_from_port
  }
}
