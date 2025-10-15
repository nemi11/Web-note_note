# app/controllers/notes_controller.rb
class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to @note, notice: "ノートを作成しました"
    else
      render :new
    end
  end

  def show
    @note = Note.find(params[:id])
  end


  private

  def note_params
  params.require(:note).permit(
    :title, :content,
    tags: [],  # ← これがないと配列として受け取れない
    extra_english: [],
    extra_translation: [],
    explanations: [],
    divider: []
  )
 end

end
