class Web::ProductsController < Web::ApplicationController
  def index
    @products = Product.all
  end
end
