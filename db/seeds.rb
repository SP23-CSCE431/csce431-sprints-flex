
PointCategory.create!([
  {name: "Test Category 1", value: 1},
  {name: "Test Category 2", value: 2}
])

Admin.create!([
  {full_name: "Liberato Aguilar", email: "liberatoaguilar@tamu.edu", phone: "215-488-9990", role: "Executive"},
  {full_name: "Jack Warham", email: "jtw906@tamu.edu", phone: "631-692-2879", role: "Executive"},
  {full_name: "Brennan Rouhana", email: "brouhana@tamu.edu", phone: "630-617-4481", role: "Executive"},
  {full_name: "Ardian Kuswanto", email: "ardian.kuswanto@tamu.edu", phone: "310-634-3428", role: "Executive"}
])
test = Admin.new(full_name: "Test User", email: "test@example.com", phone: "410-653-3229", role: "Executive")
test.save!(validate: false)

Point.create!([
  {admin_id: 1, point_category_id: 1, is_approved: true, description: "Big Event", photo: "https://via.placeholder.com/350x150", date_attended: "2023-03-09 20:14:17 UTC"},
  {admin_id: 4, point_category_id: 2, is_approved: false, description: "Boys/Girls Night", photo: "https://via.placeholder.com/350x150", date_attended: "2023-03-09 20:14:17 UTC"},
  {admin_id: 4, point_category_id: 1, is_approved: true, description: "Philanthropy Night", photo: "https://via.placeholder.com/350x150", date_attended: "2023-03-09 20:14:17 UTC"},
  {admin_id: 3, point_category_id: 1, is_approved: true, description: "Event A", photo: "https://via.placeholder.com/350x150", date_attended: "2023-03-09 20:14:17 UTC"},
  {admin_id: 2, point_category_id: 1, is_approved: true, description: "Event B", photo: "https://via.placeholder.com/350x150", date_attended: "2023-03-09 20:14:17 UTC"},
  {admin_id: 5, point_category_id: 1, is_approved: true, description: "Event C", photo: "https://via.placeholder.com/350x150", date_attended: "2023-03-09 20:14:17 UTC"}
])
BudgetCategory.create!([
  {name: "Test Category"},
  {name: "Test Category 2"},
  {name: "Test Category 3"},
  {name: "Test Category 4"}
])
