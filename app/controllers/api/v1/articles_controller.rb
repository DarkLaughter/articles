module Api
    module V1
        class ArticlesController < ApplicationController
            before_action :find_article, only: [:update, :show, :destroy]


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
            
            def update
                
                @article.update(article_params)
                if @article.valid?
                    render json: {status: 'article updated', data: @article}, status: :ok
                else
                    render json: {status: 'error', message: 'article not updated', data: @article.errors}, status: :unprocessable_entity
                end
                
            end
            
            def show
                render json: {message: 'article requested', data: @article}, status: :ok
            end
            
            def destroy
                @article.destroy
                render json: {status: 'article deleted', data: article}, status: :ok 
            end

            private

            def article_params
                params.permit(:title, :body)
            end

            def find_article
                @article = Article.find(params[:id]) 
            end
            
        end
    end
end