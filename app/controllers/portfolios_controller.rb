class PortfoliosController < ApplicationController
	before_action :authenticate_user!
	before_action :find_portfolio, only: [:edit, :update, :destroy]

	def index
		@portfolio = Portfolio.new
		if params[:language_id]
			@language = Language.find(params[:language_id])
			@portfolios = @language.portfolios.order('updated_at desc, created_at desc').paginate(page: params[:page], per_page: 5)
		else
			@portfolios = Portfolio.order('updated_at desc, created_at desc').paginate(page: params[:page], per_page: 5)
		end
	end

	def show
	end
	
	def new
		@portfolio = Portfolio.new
	end 
	
	def create
		@portfolio = Portfolio.new(portfolio_params)
		respond_to do |format|
			if @portfolio.save
				format.js	
				format.json { render :show, status: :created, location: @portfolio }
				format.html { redirect_to @portfolio, notice: "Trabalho cadastrado com sucesso!" }
			else 
				format.js
				format.json { render json: @portfolio, status: :unprocessable_entity }				
				format.html { render :new }
			end
		end	 	
	end
	
	def edit
	end
	
	def update
		respond_to do |format|
			if @portfolio.update(portfolio_params)
				format.html { redirect_to portfolios_path, success: "Trabalho atualizado com sucesso!" }
			else 
				format.html { redirect_to portfolios_path, danger: "Erro"}
			end
		end		
	end
	
	def destroy		
		@portfolio.destroy
		respond_to do |format|
			format.html { redirect_to portfolios_url, notice: "Trabalho removido com sucesso." }
			format.json { head :no_content }
			format.js
		end
	end

	private
		def find_portfolio
			@portfolio = Portfolio.find(params[:id])
		end

		def portfolio_params
			params.require(:portfolio).permit(:name, :description, :language_id, :avatar, :url_access, :birth_date)	
		end
end
