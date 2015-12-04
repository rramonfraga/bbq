class BarbecuesController < ApplicationController
  def index
    if current_user
      @barbecues = Barbecue.order(:date)
    else
      redirect_to 'users/sign_in' 
    end
  end

  def show
    # Don't add any code to this show action.
    # Implement your barbecue API in another action.
  end

  def new
    @bbq = Barbecue.new
  end

  def create
    bbq_params = params.require(:barbecue).permit(:title, :venue, :date)
    @bbq = Barbecue.new(bbq_params)

    unless @bbq.save
      render(:new)
    else
      redirect_to(barbecues_path)
    end
  end

  def bbq_json
    bbq = Barbecue.find params[:id]
    if bbq
      render json: bbq
    else
      redirect_to '/'
    end
  end
end
