class PagesController < ApplicationController
    def index
        @stories = Story.published_stories.order(created_at: :desc).includes(:user)
    end
    def show

    end
    def user

    end
end
