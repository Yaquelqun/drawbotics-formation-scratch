require 'spec_helper'
require 'support/controller_macros'
require 'rails_helper'
describe UsersController do
  render_views
  login_user

  it "should have a current_user" do
    # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
    expect(subject.current_user).to_not eq(nil)
  end

describe ".index" do
  it "gets the view" do
    get 'index'
    expect(response).to(be_success)
  end
end

describe ".show" do
  it "gets the view" do
    get "show", id: subject.current_user.id
      expect(response).to(be_success)

  end

  it "has the right elements" do
    get "show", id: subject.current_user.id
    expect(response).to(contain("Home"))
  end
end

end
