PointCategory.create!([
  {name: "Test Category 1", value: 1},
  {name: "Test Category 2", value: 2}
])
Admin.create!([
  {full_name: "Liberato Aguilar", email: "liberatoaguilar@tamu.edu", phone: "123456789", role: "Test"},
  {full_name: "Jack Warham", email: "jtw906@tamu.edu", phone: "123456789", role: "Test"},
  {full_name: "Brennan Rouhana", email: "brennan@tamu.edu", phone: "123456789", role: "Test"},
  {full_name: "Ardian Kuswanto", email: "ardian.kuswanto@tamu.edu", phone: "123456789", role: "Test"},
  {full_name: "Test User", email: "test@example.com", phone: "123456789", role: "Test"}
])
Point.create!([
  {admin_id: 1, point_category_id: 1, is_approved: true},
  {admin_id: 4, point_category_id: 2, is_approved: true},
  {admin_id: 4, point_category_id: 1, is_approved: true},
  {admin_id: 3, point_category_id: 1, is_approved: true},
  {admin_id: 2, point_category_id: 1, is_approved: true},
  {admin_id: 5, point_category_id: 1, is_approved: true}
])
BudgetCategory.create!([
  {name: "Test Category 1"},
  {name: "Test Category 2"},
  {name: "Test Category 3"},
  {name: "Test Category 4"},
])
BudgetRequest.create!([
  {admin_id: 1, budget_category_id: 1, is_approved: nil, value: 5.99, description: "Pending Test"},
  {admin_id: 2, budget_category_id: 2, is_approved: nil, value: 5.99, description: "Pending Test"},
  {admin_id: 3, budget_category_id: 3, is_approved: nil, value: 5.99, description: "Pending Test"},
  {admin_id: 4, budget_category_id: 4, is_approved: nil, value: 5.99, description: "Pending Test"},
  {admin_id: 1, budget_category_id: 1, is_approved: true, value: 5.99, description: "Approved Test"},
  {admin_id: 2, budget_category_id: 2, is_approved: true, value: 5.99, description: "Approved Test"},
  {admin_id: 3, budget_category_id: 3, is_approved: true, value: 5.99, description: "Approved Test"},
  {admin_id: 4, budget_category_id: 4, is_approved: true, value: 5.99, description: "Approved Test"},
  {admin_id: 1, budget_category_id: 1, is_approved: false, value: 5.99, description: "Denied Test"},
  {admin_id: 2, budget_category_id: 2, is_approved: false, value: 5.99, description: "Denied Test"},
  {admin_id: 3, budget_category_id: 3, is_approved: false, value: 5.99, description: "Denied Test"},
  {admin_id: 4, budget_category_id: 4, is_approved: false, value: 5.99, description: "Denied Test"}
])
