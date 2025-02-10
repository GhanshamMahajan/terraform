output "resource_group_id" {
  value = module.resource_group.resource_group_id
}

output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "resource_group_location" {
  value = module.resource_group.resource_group_location
}

output "servicebus_namespace_id" {
  value = azurerm_servicebus_namespace.servbus.id
}

output "servicebus_topic" {
  value = azurerm_servicebus_topic.servbustopic.name
}