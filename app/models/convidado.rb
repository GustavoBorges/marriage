require "google/api_client"
require "google_drive"

class Convidado < ActiveRecord::Base
	before_save do
  		self.eventos.to_s.gsub!(/[\[\]\"]/, "") if attribute_present?("eventos")
	end
end
