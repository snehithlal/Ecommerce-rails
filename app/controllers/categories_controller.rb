class CategoriesController < ApplicationController
    respond_to :html, :js
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(category_params)
        if @category.save
          flash[:success] = "Category successfully created"
        else
          flash[:error] = @category.errors.full_messages
        end
        redirect_to action: :index

    end

    def update

    end

    def destroy
        @category = Category.find_by_id(params[:id])
        if @category.destroy
            flash[:success] = "Category successfully deleted"
        else
            flash[:error] = "Something went wrong"
        end
        redirect_to action: :index
    end

    def edit
        @category = Category.find(params[:id])
    end
    
    private

    def category_params
        params.permit(:name)
    end
    
end
