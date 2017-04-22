class DocumentsController < ApplicationController

  def create
    @user = User.find_by_id(params[:user_id])
    @document = @user.documents.create(:params[:document_params])
    if @document.save
      flash[:success] = "Document Saved!"
      redirect_to @current_user
    end
  end

  def new
    @document = Document.new
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
    params.require(:document).permit(:file_file_name, :file_content_type, :file_file_size)
  end
end
