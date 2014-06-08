class StoriesController < ApplicationController

  before_action :find_dog

  def new
    @story = @dog.stories.new
  end

  def edit
    @story = @dog.stories.find(params[:id])
  end

  def create
    @story = @dog.stories.new(story_params)

    if @story.save
      redirect_to dog_path(@dog)
    else
      render :new
    end

  end

  def update
    @story = @dog.stories.find(params[:id])

    if @story.update(story_params)
      redirect_to dog_path(@dog)
    else
      render :edit
    end
  end

  def destroy
    @story = @dog.stories.find(params[:id])

    @story.destroy
    redirect_to dog_path(@dog)
  end

private

  def story_params
    params.require(:story).permit(:title, :content)
  end

  def find_dog
    @dog = Dog.find(params[:dog_id])
  end

end
