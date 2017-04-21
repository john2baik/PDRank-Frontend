class DocumentsController < ApplicationController

  def create
    @document = Document.new(document_params)
    @document.save
  end

  def new
    @docuemnt = Document.new(document_params)
  end

  def destroy

  end

  def index
    @documents = Document.all
    if params[:search]
      @documents = Document.search(params[:search]).order("created_at DESC")
    else
      @documents = Document.all.order("created_at DESC")
    end
  end

  private

  def document_params
    params.require(:document).permit(:file)
  end
end
