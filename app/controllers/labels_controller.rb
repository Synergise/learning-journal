# frozen_string_literal: true

# Responsible for the labels categories
class LabelsController < ApplicationController
  def index
    @labels = Label.all
  end

  def show
    @label = Label.find(params[:id])
  end
end
