class GlossariesController < ApplicationController
  def new
    @glossary = Glossary.new
  end

  def index
    @glossaries = Glossary.all
  end

  def show
    @glossary = Glossary.find(params[:id])
  end
  
  def create
    @glossary = Glossary.new(glossary_params)

    if @glossary.save
      redirect_to '/glossaries'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_params
  end
  
  def glossary_params
    params.require(:glossary).permit(:term, :definition)
  end
end
