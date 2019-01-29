class ProductsController < ApplicationController
    def index
        @products = Product.all
        @product = Product.new
    end

    def create 
        product = Product.new(product_params)
        if product.save
            redirect_to root_path, notice: 'el producto fué guardado con éxito'
        else
            redirect_to root_path, alert: 'error al crear el producto'
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
    end
    private
     def product_params
        params.require(:product).permit(:name, :price, :description)
    end
end
