class NotesController < ApplicationController
  before_action :load_and_authorize_note, only: [:edit, :destroy, :update]
  before_action :check_pricetag, only: [:create, :update]

  def new
    @note = Note.new
  end

  def create
    byebug
    if with_pricetag?
      @note = Note.with_pricetag(note_params)
    else
      @note = Note.new(note_params)
    end

    respond_to do |format|
      if @note.save
        format.html { redirect_to root_path }
        format.js { flash[:success] = "new note made" }
      else
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to root_path }
        format.js { flash[:success] = "note updated" }
      else
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @note.destroy
        format.html { redirect_to root_path }
        format.js
      else
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  private

  def load_and_authorize_note
    @note = Note.find(params[:id])
    authorize @note
  end

  def with_pricetag?
    params[:note][:has_pricetag] == "1"
  end

  def note_params
    if with_pricetag?
      params.require(:note).permit(:name, :contents, :has_pricetag, pricetag_attributes: [:price, :operation, :transaction_type]).merge( { user: current_user})
    else
      params.require(:note).permit(:name, :contents).merge( { user: current_user})
    end
  end
end
