# frozen_string_literal: true

# Responsible for the labels categories
class LabelsController < ApplicationController
  before_action :find_label, only: %i[show edit update destroy]

  def index
    @labels = Label.all
  end

  def show; end

  def edit; end

  def update
    if @label.update(label_params)
      redirect_to @label
    else
      render :edit
    end
  end

  def destroy
    @label.destroy
    flash.alert = 'Label term successfully deleted.'
    redirect_to labels_path
  end

  private

  def find_label
    @label = Label.find(params[:id])
  end

  def label_params
    params.require(:label).permit(:name)
  end
end
