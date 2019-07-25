class ActivitiesController < ApplicationController

  http_basic_authenticate_with name: "miros", password: "1221", except: [:index, :show]

  def index
    @activities = Activity.all
  end
  def show
    @activities = Activity.find(params[:id])
   end
  def new
  @activities = Activity.new
end
  def edit
  @activities = Activity.find(params[:id])
  end
def create
  @activities = Activity.new(article_params)
  if @activities.save
    redirect_to @activities
  else
    render 'new'
  end
end
def update
  @activities = Activity.find(params[:id])
  if @activities.update(article_params)
    redirect_to @activities
  else
    render 'edit'
  end
end
def destroy
@activities = Activity.find(params[:id])
@activities.destroy
redirect_to activity_path
end
private
  def article_params
    params.require(:activity).permit(:title, :text)
  end
end