class PaymentsController < ApplicationController

	def create
		@project = Project.find(params[:project_id])
		@payment = @project.payments.create(payment_params)

		#if @payment.save
			redirect_to project_path @project
		#end
	end

	def destroy
		@project = Project.find(params[:project_id])
		@payment = @project.payments.find(params[:id])
		@payment.destroy

		redirect_to project_path(@project)
	end

	private
		def payment_params
			params.require(:payment).permit(:payment_date,:payment_amount,:payment_desc)
		end
end
