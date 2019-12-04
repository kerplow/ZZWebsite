class NotesController < ApplicationController
  before_action :load_and_authorize_note, only: [:edit, :destroy, :update]

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params.merge({user: current_user, has_pricetag: false}))

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

  def edit
    respond_to do |format|
      format.js
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
    params.require(:note).permit(:name, :contents)
  end
end
