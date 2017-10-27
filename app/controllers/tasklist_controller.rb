class TasklistController < ApplicationController
def index
    @tasklists=tasklists.all
end

def show
    @tasklist = Tasklist.find(params[:id])
end

def new 
    @tasklist = Tasklist.new
end

def create
    @tasklist = Tasklist.new(tasklist_params)
    if @message.save
        flash[:success] = 'Tasklist が正常に投稿されました。'
        redirect_to -@tasklist
    else
        flash.now[:danger] = 'Tasklistが投稿されませんでした。'
        render :new
    end
end

def edit
end

def update
    @tasklist = Tasklist.find(params[:id])
    
    if @tasklist.update(tasklist_params)
        flash[:success] = 'Tasklist は正常に更新されました。'
        redirect_to @tasklist
    else
        flash.now[:danger] = 'Tasklistは更新されませんでした。'
        render :edit
    end
end

def destory
    @tasklist = Tasklist.find(params[:id])
    @message.destroy
    
    flash[:success] = 'Tasklist は正常に削除されました。'
    redirect_to tasklist_url
end

end

private

def message_params
    params.require(:tasklist).permit(:content)
end