class NotesController < ApplicationController
  before_action :set_note, only: [:destroy, :update]

  def new
    @note = Note.new

    respond_to do |format|
      format.js
    end
  end

  def create
    if params[:note][:has_pricetag] == '1'
      @note = Note.with_pricetag(note_params)
    else
      @note = Note.new(note_params)
    end

    if @note.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json
        format.js { flash[:success] = "new note made" }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json
        format.js
      end
    end
  end

  def update
    if (!note.user or @note&.user == current_user) and @note.update(note_params)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json
        format.js { flash[:success] = "note updated" }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      byebug
      if (current_user.admin? or @note&.user == current_user) and !!@note.destroy
        format.html { redirect_to root_path }
        format.js
      else
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  private

  def set_note
      @note = Note.find(params[:id])
    end

  def note_params
    if  params[:note][:has_pricetag] == '1'
      # params.fetch(:note, {}).permit!
      params.require(:note).permit(:id, :name, :contents, :has_pricetag, pricetag: [:operation, :price, :type])
    else
      params.require(:note).permit(:id, :name, :contents, :has_pricetag)
    end
  end
end
