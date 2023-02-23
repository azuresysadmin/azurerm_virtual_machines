variable "length" {
  type        = number
  description = "The length of the password string"
}

variable "special" {
  type        = bool
  description = "Should the password contain special characters or not"
}

variable "override_special" {
  type        = string
  description = "Define what/if special characters should be ignored, such as @_=!"
}

variable "min_upper" {
  type        = number
  description = "The minimum number of upper characters"
}

variable "min_lower" {
  type        = number
  description = "The minimum number of lower characters"
}

variable "min_numeric" {
  type        = number
  description = "The minimum number of numeric characters"
}

variable "min_special" {
  type        = number
  description = "The minimum number of special characters"
}
