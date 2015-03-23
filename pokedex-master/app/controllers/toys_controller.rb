class ToysController < ApplicationController

  def show
    @toy = Toy.find(params[:id])

    render "show"
  end

  def update
    @toy = Toy.find(params[:id])

    if @toy.update(toy_params)
      render "show"
    else
      render json: @toy.errors, status: 422
    end
  end

  private

    def toy_params
      params.require(:toy).permit(:name, :happiness, :price, :pokemon_id, :image_url)
    end

end
