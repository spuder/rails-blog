class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	#Block users from seting created time or updated time
	def articles_params
		params.require(:article).permit(:title, :body)
	end

	def create
		@article = Article.new(articles_params)
		
		if @article.save
			redirect_to articles_path, :notice => "Your article has been created"
		else
			rendir "new"
		end
	end
	
	def edit
		@article = Article.find(params[:id])
	end
	
	def update
		@article = Article.find(params[:id])
		
		if @article.update_attributes(articles_params)
			redirect_to articles_path, :notice => "Your article has been updated"
		else
			rendir "edit"
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path, :notice => "your article was deleted"
	end
end
