class PostsController < ApplicationController
  before_action :authenticate_user

  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      group: params[:group],
      request: params[:request],
      give: params[:give],
      content: params[:content],
      user_id: @current_user.id,
      img: params[:image],
      movie: params[:movie]
    )

    
    if params[:movie]
      hex = SecureRandom.hex(10)
      @post.movie = "#{hex}.mp4"
      movie = params[:movie]
      File.binwrite("public/post_movies/#{@post.movie}", movie.read)
    end

    if params[:image]
      hex = SecureRandom.hex(10)
      @post.img = "#{hex}.jpg"
      img = params[:image]
      File.binwrite("public/post_images/#{@post.img}", img.read)
    end

    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    
    @post.content = params[:content]
    @post.group = params[:group]
    @post.request = params[:request]
    @post.give = params[:give]

    if params[:image]
      @post.img = "#{@post.id}.jpg"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.img}", image.read)
    end

    if params[:movie]
      hex = SecureRandom.hex(10)
      @post.movie = "#{hex}.mp4"
      movie = params[:movie]
      File.binwrite("public/post_movies/#{@post.movie}", movie.read)
    end


    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
end
