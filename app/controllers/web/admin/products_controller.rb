class Web::Admin::ProductsController < Web::Admin::ApplicationController
  def index
    @products = Product.all
  end

  def new; end

  def create; end

  def show; end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_attrs)
      redirect_to action: :show
    else
      render action: :show
    end
  end

  def destroy; end

  private

  def product_attrs
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
