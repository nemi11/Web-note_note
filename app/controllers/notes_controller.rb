# app/controllers/notes_controller.rb
class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note, notice: "ノートを作成しました"
    else
      render :new
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :content) # カラム名に合わせる
  end
end
