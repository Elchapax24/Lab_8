class VetsController < ApplicationController
  def index
    @vets = Vet.includes(:appointments)
  end

  def show
    @vet = Vet.find(params[:id])
  end
end