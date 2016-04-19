require 'spec_helper'
require 'support/controller_macros'
require 'rails_helper'
describe UsersController do
  login_user

  it "should have a current_user" do
    # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
    expect(subject.current_user).to_not eq(nil)
  end

  it "should get index" do
    get 'index'
    response.should be_success
  end
end
