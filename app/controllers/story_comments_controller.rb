class StoryCommentsController < ApplicationController


	def create
		story = Story.find(params[:story_id])
        comment = current_user.story_comments.new(story_comment_params)
        comment.story_id = story.id
        comment.save
        redirect_to story_path(story)

	end

	def destroy
		comment = StoryComment.find(params[:story_id])
		story = Story.find(comment.story_id)
		comment.destroy
		redirect_to story_path(story)

	end

	private
	def story_comment_params
      params.require(:story_comment).permit(:user_id, :story_id, :comment)

    end

end
