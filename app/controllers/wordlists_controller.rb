class WordlistsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def create
    @wordlist = Wordlist.create!(wordlist_params)
    render nothing: true
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
