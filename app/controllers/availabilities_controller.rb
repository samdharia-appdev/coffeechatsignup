class AvailabilitiesController < ApplicationController
  before_action :current_user_must_be_availability_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_availability_user
    availability = Availability.find(params[:id])

    unless current_user == availability.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Availability.ransack(params[:q])
    @availabilities = @q.result(:distinct => true).includes(:user, :slot).page(params[:page]).per(10)

    render("availabilities/index.html.erb")
  end

  def show
    @availability = Availability.find(params[:id])

    render("availabilities/show.html.erb")
  end

  def new
    @availability = Availability.new

    render("availabilities/new.html.erb")
  end

  def create
    @availability = Availability.new

    @availability.user_id = params[:user_id]
    @availability.slot_id = params[:slot_id]

    save_status = @availability.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/availabilities/new", "/create_availability"
        redirect_to("/availabilities")
      else
        redirect_back(:fallback_location => "/", :notice => "Availability created successfully.")
      end
    else
      render("availabilities/new.html.erb")
    end
  end

  def edit
    @availability = Availability.find(params[:id])

    render("availabilities/edit.html.erb")
  end

  def update
    @availability = Availability.find(params[:id])
    @availability.slot_id = params[:slot_id]

    save_status = @availability.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/availabilities/#{@availability.id}/edit", "/update_availability"
        redirect_to("/availabilities/#{@availability.id}", :notice => "Availability updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Availability updated successfully.")
      end
    else
      render("availabilities/edit.html.erb")
    end
  end

  def destroy
    @availability = Availability.find(params[:id])

    @availability.destroy

    if URI(request.referer).path == "/availabilities/#{@availability.id}"
      redirect_to("/", :notice => "Availability deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Availability deleted.")
    end
  end
end
