class PagesController < ApplicationController
  def home
  end
  
  def about
  end
  
  def analog
    @products = AnalogBridge::Product.list
    print @products
  end
end
