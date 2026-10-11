resource "oci_core_compute_gpu_memory_cluster" "core_compute_gpu_memory_clusters" {
  for_each = var.core_compute_gpu_memory_clusters

  availability_domain       = each.value.availability_domain
  compartment_id            = each.value.compartment_id
  compute_cluster_id        = each.value.compute_cluster_id
  instance_configuration_id = each.value.instance_configuration_id
  defined_tags              = each.value.defined_tags
  display_name              = each.value.display_name
  freeform_tags             = each.value.freeform_tags
  gpu_memory_fabric_id      = each.value.gpu_memory_fabric_id
  private_ip_ids            = each.value.private_ip_ids
  size                      = each.value.size

  dynamic "gpu_memory_cluster_scale_config" {
    for_each = each.value.gpu_memory_cluster_scale_config != null ? [each.value.gpu_memory_cluster_scale_config] : []
    content {
      is_downsize_enabled = gpu_memory_cluster_scale_config.value.is_downsize_enabled
      is_upsize_enabled   = gpu_memory_cluster_scale_config.value.is_upsize_enabled
      target_size         = gpu_memory_cluster_scale_config.value.target_size
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

