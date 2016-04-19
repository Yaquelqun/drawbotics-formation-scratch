require 'spec_helper'
require 'support/controller_macros'
require 'rails_helper'
describe UsersController do
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

  it "recognises if it's my profile" do
    get "show", id: subject.current_user.id
    expect(subject.instance_variable_get(:@user_is_me)).to eql(true)
  end

  it "recognises if it isn't my profile" do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    stranger = FactoryGirl.create(:user)
    get "show", id: stranger.id
    expect(subject.instance_variable_get(:@user_is_me)).to eql(false)
  end
end

end
