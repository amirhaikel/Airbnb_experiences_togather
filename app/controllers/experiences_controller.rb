class ExperiencesController < ApplicationController
  before_action :set_experience, only: %i[ show edit update destroy ]

  def index
    @experiences = policy_scope(Experience)
  end

  def show
    @experience = Experience.find(params[:id])
    @booking = Booking.new
  end

  def new
    @experience = Experience.new
    authorize(@experience)
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user

    authorize(@experience)

    if @experience.save!
      redirect_to experience_path(@experience), notice: "Experience was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @experience.update(experience_params)
      redirect_to experience_path(@experience), notice: "Experience was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @experience.destroy
    redirect_to experiences_path, notice: "Experience was successfully destroyed."
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
    authorize(@experience)
  end

  def experience_params
    params.require(:experience).permit(:name, :description, :price, photos: [])
  end
end
