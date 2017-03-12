class TransactionsController < ApplicationController

  def index
    render 'index'
  end

  # debugger
  # @comic = Comics.find(params[:id])
  # @comic_seller = Comics.find(params[:user_id])

  def create
    @my_transaction = Transaction.new(
        buyer_id: params[:buyer_id],
        seller_id: params[:seller_id],
        comic_id: params[:comic_id]
    )
    @my_transaction.save
        redirect_to "/transactions/"
  end

end
