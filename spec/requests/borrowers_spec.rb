require 'rails_helper'

RSpec.describe "Borrowers", type: :request do
  describe "GET /borrowers" do
    it "works! (now write some real specs)" do
      get borrowers_path
      expect(response).to have_http_status(200)
    end
  end
end
