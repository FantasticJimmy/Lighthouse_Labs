class MoviesController < ApplicationController

  before_filter :restrict_access
  def index
    if params[:title]
      @movies = Movie.where("title LIKE ?","%#{params[:title]}%")
    else 
      @movies = Movie.all
    end
    if params[:director]
      @movies = @movies.where("director LIKE ?","%#{params[:director]}%")
    end

    case params[:duration]
      when "s"
        @movies = @movies.where("runtime_in_minutes < 90")
      when "m"
        @movies = @movies.where("runtime_in_minutes >= 90 AND runtime_in_minutes <= 120")
      when "l" 
        @movies = @movies.where("runtime_in_minutes > 120")
      else
        @movies
    end
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path,notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movies_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected
  def movie_params
    params.require(:movie).permit(
      :title,:release_date,:director,:runtime_in_minutes,:poster_image_url,:description, :image)
  end



end
