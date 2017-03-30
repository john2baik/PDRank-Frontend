class DocumentsController < ApplicationController

  def create

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
end
