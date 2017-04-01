class DocumentsController < ApplicationController

  def create
    @document = current_user.documents.build(document_params)
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

  def micropost_params
    params.require(:document)
  end
end
