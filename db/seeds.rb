PointCategory.create!([
  {name: "Test Category 1", value: 1},
  {name: "Test Category 2", value: 2}
])
Member.create!([
  {first_name: "Liberato", last_name: "Aguilar", email: "liberatoaguilar@tamu.edu", phone: "123456789", role: "Test"},
  {first_name: "Jack", last_name: "Warham", email: "jtw906@tamu.edu", phone: "123456789", role: "Test"},
  {first_name: "Brennan", last_name: "Rouhana", email: "brennan@tamu.edu", phone: "123456789", role: "Test"},
  {first_name: "Ardian", last_name: "Kuswanto", email: "ardian.kuswanto@tamu.edu", phone: "123456789", role: "Test"}
])
Point.create!([
  {member_id: 1, point_category_id: 1, is_approved: true},
  {member_id: 1, point_category_id: 2, is_approved: false},
  {member_id: 4, point_category_id: 1, is_approved: true},
  {member_id: 3, point_category_id: 1, is_approved: true},
  {member_id: 2, point_category_id: 1, is_approved: true}
])
