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

  def index
    @transactions = Transaction.all
  end

  def accept
    @transaction = Transaction.find(params[:transaction_id])
    @transaction.accept!
    redirect_to :transactions
  end

  def reject
    @transaction = Transaction.find(params[:transaction_id])
    @transaction.reject!
    redirect_to :transactions
  end

  private

  def transaction_params
    params.require(:transaction).permit(:start_date, :end_date)
  end
end
