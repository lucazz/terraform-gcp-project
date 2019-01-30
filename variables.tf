variable "projects" {
  type = "list"

  default = [
    {
      parent_folder       = "production"
      name                = "main"
      auto_create_network = "false"
    },
    {
      parent_folder       = "production"
      name                = "operations"
      auto_create_network = "false"
    },
    {
      parent_folder       = "non-production"
      name                = "main"
      auto_create_network = "false"
    },
    {
      parent_folder       = "non-production"
      name                = "operations"
      auto_create_network = "false"
    },
  ]
}

variable "random_project_id" {
  description = "Enables project random id generation"
  default     = "true"
}

variable "org_id" {
  description = "The organization id (optional if `domain` is passed)"
  default     = ""
}

variable "domain" {
  description = "The domain name (optional if `org_id` is passed)"
  default     = ""
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
}

variable "apis" {
  description = "The list of apis to activate within the project"
  type        = "list"
  default     = ["compute.googleapis.com"]
}

variable "labels" {
  description = "Map of labels for project"
  type        = "map"
  default     = {}
}

variable "top_level_folder_name" {
  description = "Top level folder to create under the GCP org"
  type        = "string"
}
