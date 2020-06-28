class ProductsController < ApplicationController
    def index
        @categories = Category.all
        @products = Product.all
        @product = Product.first
    end

    def new
        @categories = Category.all
        @product = Product.new
    end

    def create
     @product= Product.new(product_params)
     if @product.save
        flash[:notice] ="Created Succesfully"
     else
        flash[:alert] = @product.errors.full_messages
     end
     redirect_to action: "new"
    end

    def update
        @product = Product.find_by_id(params[:id])
        if @product.update_attributes(product_params)
            redirect_to manage_products_path
        else
            render :edit
        end
    end

    def destroy
        @product = Product.find_by_id(params[:id])
        if @product.destroy
            flash[:success] = "Product successfully Deleted"
        else
            flash[:error] = "Something went wrong"
        end
        redirect_to action: :manage_products
    end

    def edit
        @product = Product.find_by_id(params[:id])
        @categories = Category.all
    end

    def manage_products
        @products = Product.all
    end

    def search
        @products = Product.where("lower(name) like ?", "#{params[:search].downcase}%")
        @from = params[:from] 
        if @from.present?
            respond_to do |format|
                format.js { render :file => "products/sort.js.erb" }
            end
        end
    end

    def sort
        category = Category.find_by_id(params[:id])
        @products = category.products
    end

    private

    def product_params
        params.require(:product).permit(:id, :name,:price,:image,stock_attributes: [:count,:category_id])
    end
    
end
