variable "domain" {
  type    = string
  default = "localhost"
}

variable "port" {
  type    = number
  default = 8080
}

variable "jwt_profile_json_file" {
  type    = string
  default = "../keys/terraform-jwt-profile.json"
}
