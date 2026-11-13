output "event_orchestration_routers_id" {
  description = "Map of id values across all event_orchestration_routers, keyed the same as var.event_orchestration_routers"
  value       = { for k, v in pagerduty_event_orchestration_router.event_orchestration_routers : k => v.id }
}
output "event_orchestration_routers_catch_all" {
  description = "Map of catch_all values across all event_orchestration_routers, keyed the same as var.event_orchestration_routers"
  value       = { for k, v in pagerduty_event_orchestration_router.event_orchestration_routers : k => one(v.catch_all) }
}
output "event_orchestration_routers_event_orchestration" {
  description = "Map of event_orchestration values across all event_orchestration_routers, keyed the same as var.event_orchestration_routers"
  value       = { for k, v in pagerduty_event_orchestration_router.event_orchestration_routers : k => v.event_orchestration }
}
output "event_orchestration_routers_set" {
  description = "Map of set values across all event_orchestration_routers, keyed the same as var.event_orchestration_routers"
  value       = { for k, v in pagerduty_event_orchestration_router.event_orchestration_routers : k => one(v.set) }
}

