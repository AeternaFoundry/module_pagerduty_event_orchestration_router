variable "event_orchestration_routers" {
  description = <<EOT
Map of event_orchestration_routers, attributes below
Required:
    - event_orchestration
    - catch_all (block):
        - actions (required, block):
            - route_to (required)
    - set (block):
        - id (required)
        - rule (optional, block):
            - actions (required, block):
                - dynamic_route_to (optional, block):
                    - lookup_by (required)
                    - regex (required)
                    - source (required)
                - route_to (optional)
            - condition (optional, block):
                - expression (required)
            - disabled (optional)
            - label (optional)
EOT

  type = map(object({
    event_orchestration = string
    catch_all = object({
      actions = object({
        route_to = string
      })
    })
    set = object({
      id = string
      rule = optional(list(object({
        actions = object({
          dynamic_route_to = optional(list(object({
            lookup_by = string
            regex     = string
            source    = string
          })))
          route_to = optional(string)
        })
        condition = optional(list(object({
          expression = string
        })))
        disabled = optional(bool)
        label    = optional(string)
      })))
    })
  }))
}

