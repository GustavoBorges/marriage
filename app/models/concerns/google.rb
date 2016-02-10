require "google/api_client"
require "google_drive"

class GoogleApi
	# Creates a session. This will prompt the credential via command line for the
	# first time and save it to config.json file for later usages.
	@session = GoogleDrive.saved_session("config.json")
	PLANILHA_ID = "12LOyv3-jvKZyMdZLlc9gP-wAAnOf29Ms6Mzex4saDwg"

	def self.write_convidado convidado
		ws = @session.spreadsheet_by_key(PLANILHA_ID).worksheets[0]
		size = ws.rows.size + 1
		ws[size, 1] = convidado.nome
		ws[size, 2] = convidado.email
		ws[size, 3] = convidado.qtd_pessoas
		ws[size, 4] = convidado.eventos
		ws[size, 5] = convidado.menssagem
		ws.save
	end
end