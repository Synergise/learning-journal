# frozen_string_literal: true

# Responsible for the glossary entries
class GlossariesController < ApplicationController
  before_action :find_glossary, only: %i[show edit update destroy]

  def new
    @glossary = Glossary.new
  end

  def index
    @glossaries = Glossary.all
  end

  def show; end

  def create
    @glossary = Glossary.new(glossary_params)

    if @glossary.save
      redirect_to glossary_path(@glossary)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @glossary.update(glossary_params)
      redirect_to @glossary
    else
      render :edit
    end
  end

  def destroy
    @glossary.destroy
    flash.alert = 'Glossary term successfully deleted.'
    redirect_to glossaries_path
  end

  private

  def find_glossary
    @glossary = Glossary.find(params[:id])
  end

  def glossary_params
    params.require(:glossary).permit(:term, :definition, :label_list)
  end
end
