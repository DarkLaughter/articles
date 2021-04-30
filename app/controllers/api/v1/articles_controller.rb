module Api
    module V1
        class ArticlesController < ApplicationController
            def index
                articles = Article.order('created_at DESC')
                render json: {message: 'articles loaded', data: articles}, status: :ok
            end
            
            # def new
            
            # end
            
            # def create
            
            # end
            
            # def edit
            
            # end
            
            # def update
            
            # end
            
            # def show
            
            # end
            
            # def destroy
            
            # end
            
        end
    end
end