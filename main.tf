resource "pagerduty_event_orchestration_router" "event_orchestration_routers" {
  for_each = var.event_orchestration_routers

  event_orchestration = each.value.event_orchestration

  catch_all {
    actions {
      route_to = each.value.catch_all.actions.route_to
    }
  }

  set {
    id = each.value.set.id
    dynamic "rule" {
      for_each = each.value.set.rule != null ? each.value.set.rule : []
      content {
        actions {
          dynamic "dynamic_route_to" {
            for_each = rule.value.actions.dynamic_route_to != null ? rule.value.actions.dynamic_route_to : []
            content {
              lookup_by = dynamic_route_to.value.lookup_by
              regex     = dynamic_route_to.value.regex
              source    = dynamic_route_to.value.source
            }
          }
          route_to = rule.value.actions.route_to
        }
        dynamic "condition" {
          for_each = rule.value.condition != null ? rule.value.condition : []
          content {
            expression = condition.value.expression
          }
        }
        disabled = rule.value.disabled
        label    = rule.value.label
      }
    }
  }
}

