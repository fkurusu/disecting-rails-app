class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end
  
  def show
    @portfolio_item = Portfolio.find(params[:id])
  end
  
  def new
    @portfolio_item = Portfolio.new
  end
  
  def create
    @portfolio_item = Portfolio.new(portfolio_item_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html{
          redirect_to @portfolio_item,
          notice: 'Portfolio created.'
        }
      else
        format.html{
          render_template :new
        }
      end
    end
  end
  
  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end
  
  def update
    @portfolio_item = Portfolio.find(params[:id])
    
    respond_to do |format|
      if @portfolio_item.update(portfolio_item_params)
        format.html{
          redirect_to @portfolio_item,
          notice: 'Portfolio updated successfully.'
        }
      else
        format.html{
          render :edit
        }
      end
    end
  end
  
  def destroy
    @portfolio_item = Portfolio.find(params[:id])
    @portfolio_item.destroy
    respond_to do |format|
      format.html{
        redirect_to portfolios_path,
        notice: 'Portfolio item removed.'
      }
    end
  end
  
  private
    def portfolio_item_params
      params.require(:portfolio).permit(:title, :subttile, :body)
    end
end
