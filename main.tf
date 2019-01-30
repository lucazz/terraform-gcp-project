resource "random_id" "this" {
  count       = "${length(var.projects)}"
  byte_length = 2
}

/*******************************************
 Create project folder structure
 *******************************************/
resource "google_folder" "top_level" {
  display_name = "${var.top_level_folder_name}"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "production" {
  display_name = "production"
  parent       = "${google_folder.top_level.id}"
}

resource "google_folder" "non_production" {
  display_name = "non_production"
  parent       = "${google_folder.top_level.id}"
}

/*******************************************
 Create Projetcs
 *******************************************/
resource "google_project" "project" {
  depends_on          = ["google_folder.production", "google_folder.non_production"]
  count               = "${length(var.projects)}"
  name                = "${lookup(var.projects[count.index], "name")}"
  project_id          = "${format("%s-%s", lookup(var.projects[count.index],"name"), element(random_id.this.*.hex, count.index))}"
  folder_id           = "${lookup(var.projects[count.index], "parent_folder") == "production" ? google_folder.production.name : google_folder.non_production.name}"
  billing_account     = "${var.billing_account}"
  auto_create_network = "${lookup(var.projects[count.index], "auto_create_network")}"
  labels              = "${var.labels}"
}

/******************************************
 Enable google API's on recently created projects
 *****************************************/
resource "google_project_services" "project_services" {
  depends_on = ["google_project.project"]
  count      = "${length(var.projects)}"
  project    = "${google_project.project.*.number[count.index]}"
  services   = "${var.apis}"
}
