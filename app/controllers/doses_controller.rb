class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @cocktail = cocktail.find(prarms[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:name)
  end
end
