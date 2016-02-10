require "google/api_client"
require "google_drive"

class GoogleWorker
	include Sidekiq::Worker
	
	def perform(convidado_id)
		
		convidado = Convidado.find(convidado_id)
		session = GoogleDrive.saved_session("config.json")
		planilha_id = "12LOyv3-jvKZyMdZLlc9gP-wAAnOf29Ms6Mzex4saDwg"
		ws = session.spreadsheet_by_key(planilha_id).worksheets[0]
		size = ws.rows.size + 1

		ws[size, 1] = convidado.nome
		ws[size, 2] = convidado.email
		ws[size, 3] = convidado.qtd_pessoas
		ws[size, 4] = convidado.eventos
		ws[size, 5] = convidado.menssagem
		ws.save
	end
end