require "rails_helper"

RSpec.describe Staff::RecordStudentsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/staff/record_students").to route_to("staff/record_students#index")
    end

    it "routes to #new" do
      expect(:get => "/staff/record_students/new").to route_to("staff/record_students#new")
    end

    it "routes to #show" do
      expect(:get => "/staff/record_students/1").to route_to("staff/record_students#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/staff/record_students/1/edit").to route_to("staff/record_students#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/staff/record_students").to route_to("staff/record_students#create")
    end

    it "routes to #update" do
      expect(:put => "/staff/record_students/1").to route_to("staff/record_students#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/staff/record_students/1").to route_to("staff/record_students#destroy", :id => "1")
    end

  end
end
