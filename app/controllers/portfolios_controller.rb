class PortfoliosController < ApplicationController
    def create
        Portfolio.create(portfolio_params)
        render json: { user: UserSerializer.new(current_user)}
    end

    def update
        @portfolio = Portfolio.find_by(id: params[:id])
        @portfolio.update(portfolio_params)
        render json: { user: UserSerializer.new(current_user)
    end

    def delete
        @portfolio = Portfolio.find_by(id: params[:id])
        @portfolio.delete 
        render json: { user: UserSerializer.new(current_user)
    end

    private

    def portfolio_params
        params.require(:portfolio).permit(:name, :description, :user_id)
    end
end
