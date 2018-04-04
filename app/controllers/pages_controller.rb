class PagesController < ApplicationController
  
  def home
    @quote = Jalapeno.movie
  end
end
