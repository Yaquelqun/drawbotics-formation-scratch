require 'spec_helper'
require 'support/controller_macros'
require 'rails_helper'

describe ChaptersController do

before(:each) do
  @chapter = Chapter.last
end

  describe ".show" do

    context "user logged in" do
        login_user
        context "only type the URL" do
          it "can't get the view" do
            get "show", id: @chapter.id
            expect(response).to(be_success)
          end
        end
    end

    context "no user logged in" do

      it "doesn't get to continue" do
        get "show", id: @chapter.id
        expect(response).not_to(be_success)
      end
    end
  end

  describe ".create" do

    context "student logged in" do
        login_user

      it "can't create the chapter" do
        post "create", :chapter => {"name" => Faker::Beer.name , "course_id" => Course.order("RANDOM()").first.id}
        expect(flash[:notice])
      end
    end

    context " lambda teacher logged in" do
        login_user

      it "can't create the chapter" do
        subject.current_user.type = "Teacher"
        post "create", :chapter => {"name" => Faker::Beer.name, "course_id" => Course.order("RANDOM()").first.id}
        expect(flash[:notice])
      end
    end

    context "teacher create a course and then a chapter" do
        course = Course.last
        user = User.find(course.author_id)

      it "can create the chapter" do
        sign_in user
        subject.current_user.type = "Teacher"
        post "create", :chapter => {"name" => Faker::Beer.name, "course_id" => course.id}
        expect(response).should redirect_to chapter_path(Chapter.last)
      end
    end
  end

  describe ".new" do
    context "user logged in" do
      login_user
      context "simply type the URL" do
        it "gets the view" do
          get "new"
          expect(response).not_to(be_success)
        end
    end
    end
  end


end
