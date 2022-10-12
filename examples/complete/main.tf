module "aci_access_span_filter_group" {
  source  = "netascode/access-span-filter-group/aci"
  version = ">= 0.1.0"

  name        = "ABC"
  description = "My Filter Group"
  entries = [
    {
      name                  = "HTTP"
      description           = "My Entry"
      source_ip             = "1.1.1.1"
      destination_ip        = "2.2.2.2"
      source_port_from      = 2001
      source_port_to        = 2002
      destination_port_to   = "http"
      destination_port_from = "http"
    }
  ]
}
