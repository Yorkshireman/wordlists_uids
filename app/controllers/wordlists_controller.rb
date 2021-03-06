class WordlistsController < ApplicationController
  def create
    @wordlist = Wordlist.create!(wordlist_params)
    head :ok
  end

  def show
    @wordlist = Wordlist.find(params[:id])
    render json: @wordlist
  end

  private

  def wordlist_params
    params.require(:wordlist).permit(:uuid, :title)
  end
end
