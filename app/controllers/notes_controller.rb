class NotesController < ApplicationController

  def index
    @notes = Notes.all

    render json: @notes, status: :ok
  end

  def show
    @note = Note.find(params[:id])

    render json: @note, status: :ok
  end

  def create
    @note = Note.create(note_params)

    @note.save

    render json: @note, status: :created
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      head(:ok)
    else
      head(:unprocessable_entity)
    end

  end

  def destroy
    @note = Note.find(params[:id])
    if @note.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def note_params
    params.require(:note).permit(:entry, :patient_id)
  end

end
