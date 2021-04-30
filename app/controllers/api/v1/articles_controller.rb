module Api
    module V1
        class ArticlesController < ApplicationController
            def index
                articles = Article.order('created_at DESC')
                render json: {message: 'articles loaded', data: articles}, status: :ok
            end
            
            def create
                article = Article.new(article_params)
                if article.valid?
                    article.save
                    render json: {status: 'article posted successfully', data: article}, status: :ok
                else
                    render json: {status: 'Error', data: article.errors}, status: :unprocessable_entity
                end

            end
            
            # def edit
            
            # end
            
            # def update
            
            # end
            
            def show
                article = Article.find(params[:id])
                render json: {message: 'article requested', data: article}, status: :ok
            end
            
            # def destroy
            
            # end

            private

            def article_params
                params.permit(:title, :body)
            end
            
        end
    end
end