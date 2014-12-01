class AdminsController < ApplicationController

	def index
		@admins = Admin.all
    if session[:user_id]
      @logged_in_user = session[:user_id]
      #render plain: @logged_in_user.inspect
    end
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
        session[:user_id] = @admin.id
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
        redirect_to root_url, :notice => "password updated! New password is testpass"
      else
        flash.now.alert = "could not update password"
        render "lostpassword"
      end
    end

    def changepassword
        @admin = Admin.find(params[:id])
    end

    def updatepassword
        if session[:user_id]
          @admin = Admin.find(session[:user_id])
          if @admin.update(admin_params)
            redirect_to root_url, :notice => "password updated successfully!"
            else
            render 'changepassword'
          end
          else
            redirect_to root_url, :notice => "Invalid User!"
        end
    end

    def edit
      @admin = Admin.find(params[:id])
    end

    def destroy
      @admin = Admin.find(params[:id])
      @admin.destroy
      session[:user_id] = nil
      redirect_to root_url, :notice => "Your account is deleted" 
    end

  	private
  	def admin_params
  		params.require(:admin).permit(:username, :email,:password,:password_confirmation)
  	end
end
