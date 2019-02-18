class NotesController < ApplicationController

  def create
    if params[:note][:has_pricetag] == '1'
      puts 'success'
      @note = Note.tradeable(note_params)
    else
      @note = Note.new(note_params)
    end

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

  def new
    @note = Note.new

    respond_to do |format|
      format.js
    end
  end

  private

  def note_params
    if  params[:note][:has_pricetag] == '1'
      params.fetch(:note, {}).permit!
      # params.require(:note).permit(:name, :contents, :has_pricetag, pricetag: [:operation, :price, :type])
    else
      params.require(:note).permit(:name, :contents, :has_pricetag)
    end
  end
end
