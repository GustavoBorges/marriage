class HomeController < ApplicationController
	
	def index
  	end

  	def confirm

    params[:convidado] = params.slice(:nome, :email, :qtd_pessoas, :eventos, :menssagem)
    @convidado = Convidado.find_by(params.slice(:email))
    
    if @convidado.nil?
      @convidado ||= Convidado.create(convidado_params)
    else
      @convidado.update_attributes(convidado_params)
    end
    #@feedback = params.slice(:text, :is_mobile, :plataforma)

    #begin
    #  FeedbackMailer.feedback_mail(@feedback, @user).deliver
    #  FeedbackMailer.feedback_user_mail(@feedback, @user).deliver
    #  flash[:notice] = "Obrigado por participar, seu feedback foi enviado com sucesso!."
    #rescue
    #  flash[:error] = "Aconteceu algum problema no envio de seu feedback, tente novamente."
    #end
    redirect_to controller: :home
  end

private

  def convidado_params
    params.permit(:nome, :email, :qtd_pessoas, :eventos, :menssagem)
  end
end
