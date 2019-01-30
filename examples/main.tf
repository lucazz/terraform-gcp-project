module "project" {
  source                = "github.com/lucazz/terraform-gcp-project.git"
  org_id                = "1234567890"
  billing_account       = "000000-AAAAAA-BBBBBB"
  top_level_folder_name = "test"
}
