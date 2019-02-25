class NotesController < ApplicationController
  include Trader
  before_action :load_and_authorize_note, only: [:show, :destroy, :update]

  def new
    @note = Note.new

    respond_to do |format|
      format.js
    end
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  def create
    if params[:note][:has_pricetag] == '1'
      @note = Note.with_pricetag(note_params.merge(pricetag_params))
    else
      @note = Note.new(note_params)
    end

    respond_to do |format|
      if @note.save
        format.html { redirect_to root_path }
        format.json
        format.js { flash[:success] = "new note made" }
      else
        format.html { redirect_to root_path }
        format.json
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to root_path }
        format.json
        format.js { flash[:success] = "note updated" }
      else
        format.html { redirect_to root_path }
        format.json
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

  def note_params
    params.require(:note).permit(:id, :name, :contents, :has_pricetag)
  end
end
