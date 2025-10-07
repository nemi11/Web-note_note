# app/controllers/notes_controller.rb
class NotesController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :create]

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to root_path, notice: "ノートを作成しました"
    else
      render :new
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :tags, sections_attributes: [:text, :translation, :description])
  end
end