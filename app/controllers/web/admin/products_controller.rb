class Web::Admin::ProductsController < Web::Admin::ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_attrs)
    if @product.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_attrs)
      redirect_to  admin_products_path
    else
      redirect_to  edit_admin_product_path
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to action: :index
  end

  private

  def product_attrs
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
