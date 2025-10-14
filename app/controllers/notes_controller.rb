# app/controllers/notes_controller.rb
class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    logger.debug params.inspect  # ここで送信されたパラメータを確認
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note, notice: "ノートを作成しました"
    else
      render :new
    end
  end

  private

  def note_params
  params.require(:note).permit(
    :title, :content,               # もともとのカラム
    extra_english: [],              # 配列として許可
    extra_translation: [],
    explanations: []
  )
  end

end
