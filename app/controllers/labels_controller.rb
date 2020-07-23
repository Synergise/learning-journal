# frozen_string_literal: true

# Responsible for the labels categories
class LabelsController < ApplicationController
  def index
    @labels = Label.all
  end

  def show
    @label = Label.find(params[:id])
  end
  
  def destroy
    @label = Label.find(params[:id])
    @label.destroy
    flash.alert = "Label term successfully deleted."
    redirect_to labels_path
  end

  private

  def label_params
    params.require(:label).permit(:name)
  end
end
