variable "cloudsearch_domain_name" {
  type        = string
  description = "The name of the CloudSearch domain"
}

variable "multi_az_enabled" {
  type        = bool
  description = "Whether or not to maintain extra instances for the domain in a second Availability Zone to ensure high availability"
  default     = false
}

variable "create" {
  type        = bool
  description = "Whether or not to create a cloudsearch domain"
  default     = true
}

variable "create_access_policy" {
  type        = bool
  description = "Whether or not to create a cloudsearch domain service access policy"
  default     = false
}

variable "endpoint_options" {
  type        = list(any)
  description = "Domain endpoint options"
  default     = []
}

variable "index_field" {
  type        = list(any)
  description = "The index fields for documents added to the domain"
  default     = []
}

variable "scaling_parameters" {
  type        = list(any)
  description = "Domain scaling parameters"
  default     = []
}

variable "access_policy" {
  type        = string
  description = "The access rules you want to configure. These rules replace any existing rules"
  default     = ""
}
