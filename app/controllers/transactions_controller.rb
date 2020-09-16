class TransactionsController < ApplicationController
  def new
    @artwork = Artwork.find(params[:artwork_id])
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @artwork = Artwork.find(params[:artwork_id])
    @transaction.artwork = @artwork
    @transaction.buyer = current_user
    @transaction.save
  end

  private

  def transaction_params
    params.require(:transaction).permit(:start_date, :end_date)
  end
end
