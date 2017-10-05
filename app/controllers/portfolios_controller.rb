class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end
  
  def new
    @portfolio_item = Portfolio.new
  end
  
  def create
    @portfolio_item = Portfolio.new(portfolio_item_params)
    
    respond_to do |format|
      if @portfolio_item.save
        format.html{
          redirect_to portfolios_path,
          notice: 'Portfolio created.'
        }
      else
        format.html{
          render_template :new
        }
      end
    end
  end
  
  private
    def portfolio_item_params
      params.require(:portfolio).permit(:title, :subttile, :body)
    end
end