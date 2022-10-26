class Api::StoriesController < Api::BaseController
    # skip_before_action :verify_authenticity_token, only: [:clap,:bookmark]
    before_action :find_story
    def clap
        if user_signed_in?
            # story = Story.friendly.find params[:id]
            @story.increment!(:clap)
            render json: {status: story.clap }
        else
            render json: {status: 'sign_in_first'}
        end
    end
    def bookmark
        # story = Story.friendly.find params[:id]
        # current_user.bookmark!(@story)
        render json: {status: current_user.bookmark!(@story)}
    end
    private
    def find_story
        @story = Story.friendly.find params[:id]
    end
end
