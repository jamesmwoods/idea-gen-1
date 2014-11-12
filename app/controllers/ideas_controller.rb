class IdeasController < ApplicationController
  def show 
  end
  def new
    @idea = Idea.new
  end
   def create
     @idea = Idea.new(idea_params)
     @idea.user = current_user
      respond_to do |format|
       if @idea.save
         format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
         format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
         format.json { render json: @idea.errors, status: :unprocessable_entity }
       end
      end
  end
  private
   def idea_params
     params.require(:idea).permit(:title,:description)
   end
end
