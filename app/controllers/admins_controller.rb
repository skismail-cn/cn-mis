class AdminsController < ApplicationController

	def index
		@admins = Admin.all
	end

  	def new
  		@admin = Admin.new
  	end

  	def create
		@admin = Admin.new(admin_params)
		#@admin = Admin.new(params[:admin])
		#render plain: @admin.inspect


		if @admin.save
				flash[:notice] = "You signed up successfully"
      	flash[:color]= "valid"
				redirect_to @admin
			else
				flash[:notice] = "Form is invalid"
      	flash[:color]= "invalid"
				render 'new'
		end
  	end

  	def show
  		@admin = Admin.find(params[:id]) 
  		#render plain: @admin.inspect 		
  	end

  	def signin
  		@admin = Admin.new
  	end

  	def login
  		@admin = Admin.new(admin_params)
		  #@admin = Admin.new(params[:admin])
		  render plain: @admin.inspect
  	end

    def lostpassword
    end

    def forgotpassword
      #user = Admin.authenticate(params[:email], params[:password])
      user = Admin.find_by_email(params[:email])
      if user
        user.password = "testpass"
        user.save
        redirect_to root_url, :notice => "password updated!"
      else
        flash.now.alert = "could not update password"
        render "lostpassword"
      end
    end

    def edit
      @admin = Admin.find(params[:id])
    end

  	private
  	def admin_params
  		params.require(:admin).permit(:username, :email,:password,:password_confirmation)
  	end
end
