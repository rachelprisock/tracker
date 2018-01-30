class HabitTypesController < ApplicationController
  def index
    @habit_types = HabitType.all
  end

  def new
    @habit_type = HabitType.new
  end

  def create
    habit_type = HabitType.new(habit_type_params)

    if habit_type.save
      redirect_to habit_types_path, success: "Added new habit type."
    else
      render :new
    end
  end

  def edit
    @habit_type = HabitType.find(params[:id])
  end

  def update
    @habit_type = HabitType.find(params[:id])

    if @habit_type.update_attributes(habit_type_params)
      redirect_to habit_types_path, success: "Updated habit type."
    else
      render :edit
    end
  end

  def destroy
    @habit_type = HabitType.find(params[:id])

    if @habit_type.destroy
      redirect_to habit_types_path, success: "Removed habit type"
    else
      redirect_to habit_type_path(@habit_type), danger: "Unable to delete that habit type"
    end
  end

  private

  def habit_type_params
    params.require(:habit_type).permit(:name)
  end
end
