# app/controllers/notes_controller.rb
class NotesController < ApplicationController

 def new
  if params[:note].present?
    # 修正ボタンから値が渡ってきた場合
    @note = Note.new(note_params)
  else
    # 初回フォーム表示
    @note = Note.new
  end
 end
  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to notes_path, notice: "ノートを保存しました。"
    else
      render :new
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def confirm
    @note = Note.new(note_params)
    @note.user = current_user
    render :confirm
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
