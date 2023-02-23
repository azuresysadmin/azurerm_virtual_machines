resource "random_password" "password" {
  length           = var.length
  special          = var.special
  override_special = var.override_special
  min_upper        = var.min_upper
  min_lower        = var.min_lower
  min_numeric      = var.min_numeric
  min_special      = var.min_special
}
