class FototestsController < ApplicationControllerSigned

  def new
    @fototest = Fototest.new
  end

  def create
    @fototest = Fototest.new params['fototest']
    if @fototest.valid?
      render 'show'
    else
      render 'new'
    end
  end


end
