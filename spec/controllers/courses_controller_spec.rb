require 'spec_helper'
require 'support/controller_macros'
require 'rails_helper'

describe CoursesController do

before(:each) do
  @course = Course.last
end

  describe ".index" do
    it "gets the view" do
      get 'index'
      expect(response).not_to(be_success)
    end
  end

  describe ".show" do
    context "user logged in" do
        login_user
      it "gets the view" do
        get "show", id: @course.id
        expect(response).to(be_success)
      end
    end

    context "no user logged in" do
      it "doesn't get to continue" do
        get "show", id: @course.id
        expect(response).not_to(be_success)
      end
    end
  end

  describe ".create" do
    context "student logged in" do
        login_user
      it "can't create the course" do
        post "create", :course => {"name" => "YOLO", "author_id" => subject.current_user.id}
        expect(flash[:notice])
      end
    end
    context "teacher logged in" do
        login_user
      it "can create the course" do
        subject.current_user.type = "Teacher"
        post "create", :course => {"name" => "YOLO", "author_id" => subject.current_user.id}
        expect(response).should redirect_to courses_path
      end
    end
  end

  describe ".new" do
    context "user logged in" do
        login_user
      it "gets the view" do
        get "new"
        expect(response).to(be_success)
      end
    end
  end
end
