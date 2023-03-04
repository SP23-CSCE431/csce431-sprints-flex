require "rails_helper"

RSpec.describe BudgetRequestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/budget_requests").to route_to("budget_requests#index")
    end

    it "routes to #new" do
      expect(get: "/budget_requests/new").to route_to("budget_requests#new")
    end

    it "routes to #show" do
      expect(get: "/budget_requests/1").to route_to("budget_requests#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/budget_requests/1/edit").to route_to("budget_requests#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/budget_requests").to route_to("budget_requests#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/budget_requests/1").to route_to("budget_requests#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/budget_requests/1").to route_to("budget_requests#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/budget_requests/1").to route_to("budget_requests#destroy", id: "1")
    end
  end
end
