class TransactionsController < ApplicationController
  def new
    @artwork = Artwork.find(params[:artwork_id])
    @transaction = Transaction.new
  end

  def create
    if current_user
      @transaction = Transaction.new(transaction_params)
      @artwork = Artwork.find(params[:artwork_id])
      @transaction.artwork = @artwork
      @transaction.buyer = current_user
      @transaction.save
    else
      redirect_to :new_user_session
    end
  end

  def index
    @buy_transactions = current_user.transactions
    @pending_transactions = current_user.sell_transactions.where(confirmation: "pending")
    @sold_transactions = current_user.sell_transactions.where(confirmation: "accepted")
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
