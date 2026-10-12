output "event_orchestration_routers_id" {
  description = "Map of id values across all event_orchestration_routers, keyed the same as var.event_orchestration_routers except keys with no id are omitted"
  value       = { for k, v in pagerduty_event_orchestration_router.event_orchestration_routers : k => v.id if v.id != null && length(v.id) > 0 }
}
output "event_orchestration_routers_catch_all" {
  description = "Map of catch_all values across all event_orchestration_routers, keyed the same as var.event_orchestration_routers except keys with no catch_all are omitted"
  value       = { for k, v in pagerduty_event_orchestration_router.event_orchestration_routers : k => one(v.catch_all) if v.catch_all != null && length(v.catch_all) > 0 }
}
output "event_orchestration_routers_event_orchestration" {
  description = "Map of event_orchestration values across all event_orchestration_routers, keyed the same as var.event_orchestration_routers except keys with no event_orchestration are omitted"
  value       = { for k, v in pagerduty_event_orchestration_router.event_orchestration_routers : k => v.event_orchestration if v.event_orchestration != null && length(v.event_orchestration) > 0 }
}
output "event_orchestration_routers_set" {
  description = "Map of set values across all event_orchestration_routers, keyed the same as var.event_orchestration_routers except keys with no set are omitted"
  value       = { for k, v in pagerduty_event_orchestration_router.event_orchestration_routers : k => one(v.set) if v.set != null && length(v.set) > 0 }
}

