class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
    @stories = @dog.stories
  end

  def new
    @dog = Dog.new
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to dogs_path
    else
      render :new
    end
  end

  def update
    if @dog = Dog.update(dog_params)
      redirect_to dog_path(@dog)
    else
      render :edit
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to dogs_path
  end

private

  def dog_params
    params.require(:dog).permit(:name, :description)
  end


end
