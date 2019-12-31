class IdeaController < ApplicationController
    def create
        @user = User.find(session[:user_id])
        @idea = Idea.create(idea:params[:idea],user:User.find(session[:user_id]))
        redirect_to "/bright_ideas"
      end
      def like
        @user = User.find(session[:user_id])
        @idea = Idea.find(params[:id])
        Like.create(user:@user, idea:@idea)
        redirect_to "/bright_ideas"
      end
    
      def show
        @idea = Idea.find(params[:id])
        @user = @idea.user
        @likes = @idea.liking_users.uniq
        # @user = Like.where.not(id:session[:user_id])
        render 'show'
      end
end
