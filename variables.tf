variable "core_compute_gpu_memory_clusters" {
  description = <<EOT
Map of core_compute_gpu_memory_clusters, attributes below
Required:
    - availability_domain
    - compartment_id
    - compute_cluster_id
    - instance_configuration_id
Optional:
    - defined_tags
    - display_name
    - freeform_tags
    - gpu_memory_fabric_id
    - private_ip_ids
    - size
    - gpu_memory_cluster_scale_config (block):
        - is_downsize_enabled (optional)
        - is_upsize_enabled (required)
        - target_size (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    availability_domain       = string
    compartment_id            = string
    compute_cluster_id        = string
    instance_configuration_id = string
    defined_tags              = optional(map(string))
    display_name              = optional(string)
    freeform_tags             = optional(map(string))
    gpu_memory_fabric_id      = optional(string)
    private_ip_ids            = optional(set(string))
    size                      = optional(string)
    gpu_memory_cluster_scale_config = optional(object({
      is_downsize_enabled = optional(bool)
      is_upsize_enabled   = bool
      target_size         = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

