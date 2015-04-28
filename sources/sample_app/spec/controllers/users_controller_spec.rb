require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'signup'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
  end

end
