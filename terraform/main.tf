terraform {
  required_providers {
    zitadel = {
      source  = "zitadel/zitadel"
      version = "2.7.0"
    }
  }
}

locals {
  jwt_profile_json = file(var.jwt_profile_json_file)
}

provider "zitadel" {
  domain           = var.domain
  port             = var.port
  jwt_profile_json = local.jwt_profile_json
  insecure         = "true"
}

data "zitadel_organizations" "default" {
  is_default = true
}

locals {
  default_organisation_id = data.zitadel_organizations.default.ids[0]
}

resource "zitadel_human_user" "default" {
  org_id             = local.default_organisation_id
  user_name          = "test@example.com"
  first_name         = "First"
  last_name          = "Last"
  nick_name          = "nickname"
  display_name       = "Display Name"
  preferred_language = "de"
  email                        = "test@example.com"
  is_email_verified            = true
  initial_password             = "Password1!"
  initial_skip_password_change = true
}

resource "zitadel_default_login_policy" "default" {
  user_login                    = true
  allow_register                = false
  allow_external_idp            = false
  force_mfa                     = false
  force_mfa_local_only          = false
  passwordless_type             = "PASSWORDLESS_TYPE_ALLOWED"
  hide_password_reset           = false
  password_check_lifetime       = "240h0m0s"
  external_login_check_lifetime = "240h0m0s"
  multi_factor_check_lifetime   = "24h0m0s"
  mfa_init_skip_lifetime        = "0s"
  second_factor_check_lifetime  = "24h0m0s"
  ignore_unknown_usernames      = true
  default_redirect_uri          = "https://example.com"
  allow_domain_discovery        = true
  # Enabling `disable_login_with_phone` breaks case-insensitive email logins.
  disable_login_with_phone      = true
}
