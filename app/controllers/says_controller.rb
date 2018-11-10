class SaysController < ApplicationController
   before_action :set_say, only: [:edit, :update, :destroy]
   
   def home
   end
   
  def index
    # 全てを取得し、更新日の新しいものから降順に並べかえる
    @says = Say.all.order(updated_at: "DESC")
  end
  
  def new
    if params[:back]
      @say = Say.new(say_params)
    else 
      @say = Say.new
    end
  end
  
  def create
    @say = Say.new(say_params)
    # @say.saveがバリデーションに許されたら（成功したら）
    if @say.save 
      # 一覧画面に遷移して"Hitokoto投稿しました!"とメッセージを表示する
      redirect_to says_path, notice: "Hitokoto投稿しました！"
    else 
      # @say.saveがバリデーションに許されなかったら　（失敗した時）
      # 入力フォームを再描画します。
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @say.update(say_params)
      redirect_to says_path, notice: "Hitokotoを編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
     @say.destroy
     redirect_to says_path, notice: "Hitokotoを削除しました！"
  end
  
  def confirm
    @say = Say.new(say_params)
    render :new if @say.invalid?
  end
  
  private
  
  def say_params
  params.require(:say).permit(:content)
  end
  
  def set_say
    @say = Say.find(params[:id])
  end
end
