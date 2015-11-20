class FamiliesController < ApplicationController
  def index
    @families = Family.all
    @family_count = @families.size

    @control_count = Control.where(is_enhancement: false).group(:family_name).count
  end

  def show
    @family = Family.where(acronym: params[:acronym]).first
#    @controls = Control.where(family: @family.name, is_enhancement: false)
#    @controls = Control.where("family = '#{@family.name}' and is_enhancement = false")
	 @controls = @family.controls.where(is_enhancement: false)
  end
end
