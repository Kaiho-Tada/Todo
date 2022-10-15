class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end
    
    def new
        @task = Task.new
    end
 
   def create
       @task =Task.new(params.require(:task).permit(:title, :start, :finish, :allday))
       if @task.save
            
           flash[:notice] = "タスクを新規登録しました"
           redirect_to :tasks
       else
           render "new"
       end
   end
 
   def show
       @task = Task.find(params[:id])
   end
 
   def edit
       @task = Task.find(params[:id])
   end
 
   def update
        @task = Task.find(params[:id])
        if  @task.update(params.require(:task).permit(:title, :start, :finish, :allday))
            flash[:notice] = "タスクIDが#{@task.id}の情報を編集しました"
            redirect_to :tasks
        else
            render "edit"
        end
   end
 
   def destroy
       @task = Task.find(params[:id])
       @task.destroy
       flash[:notice] = "タスク情報を削除しました。"
       redirect_to :tasks
   end
end
