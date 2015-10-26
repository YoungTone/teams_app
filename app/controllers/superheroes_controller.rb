class SuperheroesController < ApplicationController
  before_action :set_superhero, only: [:show, :edit, :update, :destroy]

  def index
    @superheroes = Superhero.all
  end

  private

  def superhero_params
    params.require(:superhero).permit(
      :name,
      :height,
      :bio,
      :image_url

      )
  end


end
