class HomeController < ApplicationController
	
	def index
  	end

  	def confirm

    params[:convidado] = params.slice(:nome, :email, :qtd_pessoas, :menssagem)
    @convidado = Convidado.find_by(params.slice(:email))
    
    if @convidado.nil?
      @convidado ||= Convidado.create(convidado_params)
    else
      @convidado.update_attributes(convidado_params)
    end

    begin
      GoogleWorker.perform_async(@convidado.id)
      flash[:notice] = "Obrigado por confirmar sua presença!"
    rescue
      flash[:error] = "Aconteceu algum problema na confirmação, tente novamente."
    end
    redirect_to controller: :home
  end

private

  def convidado_params
    params.permit(:nome, :email, :qtd_pessoas, {eventos: []}, :menssagem)
  end
end
