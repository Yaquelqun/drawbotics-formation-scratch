module Users

    class AchievementsController < ApplicationController

        def index
          @user = User.find(params[:user_id])
          @chapters = @user.validated_chapters.compact
        end

    end

end
