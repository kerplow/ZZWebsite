class NotesController < ApplicationController
  def create
    @note = Note.new(note_params)
    if @note.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { flash[:success] = "new note made" }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  private

  def note_params
    params.require(:note).permit(:name, :contents)
  end
end