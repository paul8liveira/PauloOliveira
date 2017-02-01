class AboutsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_about, only: [:edit, :update, :destroy]

	def index
		@about = About.new
		@abouts = About.paginate(page: params[:page], per_page: 5)
	end

	def show
	end
	
	def new
		@about = About.new
	end 
	
	def create
		@about = About.new(about_params)
		respond_to do |format|
			if @about.save
				format.html { redirect_to @about, notice: "Sobre cadastrado com sucesso!" }
				format.json { render :show, status: :created, location: @about }
				format.js	
			else 
				format.html { render :new }
				format.json { render json: @about, status: :unprocessable_entity }				
				format.js
			end
		end	 	
	end
	
	def edit
	end
	
	def update
		respond_to do |format|
			if @about.update(about_params)
				format.html { redirect_to @about, notice: "Sobre atualizado com sucesso!" }
				format.json { render :show, status: :ok, location: @about }
				format.js	
			else 
				format.html { render :edit }
				format.json { render json: @about.errors, status: :unprocessable_entity }				
				format.js
			end
		end		
	end
	
	def destroy
		@about.destroy
		respond_to do |format|
			format.html { redirect_to portfolios_url, notice: "Sobre removido com sucesso." }
			format.json { head :no_content }
			format.js
		end
	end

	private
		def find_about
			@about = About.find(params[:id])
		end

		def about_params
			params.require(:about).permit(:about)	
		end
end
