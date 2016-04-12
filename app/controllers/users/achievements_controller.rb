module Users

    class AchievementsController < ApplicationController

        def index
          @user = current_user
          @chapters = @user.validated_chapters.compact
        end

    end

end
