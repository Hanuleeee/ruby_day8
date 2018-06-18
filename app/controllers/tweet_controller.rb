class TweetController < ApplicationController
    # index, show,new, create, edit, update, destroy
    
    def index
        @board= Board.all
        cookies[:user_name] = "한울"
    end
    
    def new
    end
    
    def show
        @board= Board.find(params[:id])
    end
    
    def create
        board = Board.new
        board.post =params[:post]
        board.ip_address = request.ip
        board.save
        # success 자체가 toastr의 메소드가 됨 app/views/layout/application.html.erb
        flash[:success] = "새 글이 등록되었습니다."
        redirect_to '/tweet'
    end

    def edit
        @board = Board.find(params[:id])
    end
    
    def update
        board= Board.find(params[:id])
        board.post = params[:post]
        board.ip_address = request.ip
        board.save
        flash[:success]= "수정이 완료되었습니다."
        redirect_to '/tweet'
    end
    
    def destroy
        board = Board.find(params[:id])
        board.destroy
        flash[:error]= "글이 삭제되었습니다."
        redirect_to '/tweet'
    end
    
end
