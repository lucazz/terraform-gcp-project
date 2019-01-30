output "project_ids" {
  value = "${google_project.project.*.id}"
}
