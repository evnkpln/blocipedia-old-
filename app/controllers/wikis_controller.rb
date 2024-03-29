class WikisController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end
  
  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end
  
  def edit
    @wiki = Wiki.find(params[:id])
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)
    
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :show
    end
  end
  
  def destroy
    @wiki = Wiki.find(params[:id])
    
    if @wiki.destroy
      flash[:notice] = "Wiki was successfuly deleted"
      redirect_to action: :index
    else
      flash.now[:alert] = "Theere was an error deleting the wiki. Please try again or check your permissions."
      render :show
    end
  end
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
