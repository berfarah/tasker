require 'rails_helper'

RSpec.describe "Instances", type: :request do
  describe "GET /instances" do
    it "works! (now write some real specs)" do
      get instances_path
      expect(response).to have_http_status(200)
    end
  end
end
