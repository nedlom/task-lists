class ListsController < ApplicationController

  def index
    @lists = List.all 
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks
  end
  
  def new
    if params[:list_id]
      @list = List.find(params[:list_id])
      @task = Task.new
    else 
      @list = List.new
    end
 
  end

  def create
    @list = List.new(list_params)
    
    if @list.save
      redirect_to list_path(@list)
    else
      # flash.alert = list.errors.full_messages[0]
      
      redirect_to new_list_path, alert: @list.errors.full_messages[0]
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    List.find(params[:id]).update(list_params)
    redirect_to list_path(params[:id])
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end
