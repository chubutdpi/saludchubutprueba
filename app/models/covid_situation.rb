class CovidSituation < ApplicationRecord
  	belongs_to :locality
  
	validates :locality, presence: true
	validates :part_date, presence: true
	validates :ambulatory, presence: true
	validates :general_room, presence: true
	validates :uti_with_arm, presence: true
	validates :uti_without_arm, presence: true
	validates :new_recovered, presence: true
	validates :new_cases, presence: true
	validates :new_deceased, presence: true

	validates_uniqueness_of :locality, scope: :part_date

	#validate :check_totales

	def acumulated_new(fecha=part_date)
		return CovidSituation.where(locality: locality).where('part_date <=?', fecha).sum(:new_cases)
	end

	def acumulated_recovered(fecha=part_date)
		return CovidSituation.where(locality: locality).where('part_date <=?', fecha).sum(:new_recovered)
	end

	def acumulated_deceased(fecha=part_date)
		return CovidSituation.where(locality: locality).where('part_date <=?', fecha).sum(:new_deceased)
	end

	def acumulated_actives (fecha=part_date)
		return acumulated_new(fecha) - acumulated_recovered(fecha) - acumulated_deceased(fecha)
	end

	private
		def check_totales
			unless ( new_cases.nil? || new_recovered.nil? || new_deceased.nil? || locality_id.nil? || part_date.nil? )
				cs = CovidSituation.where(locality:locality_id).first
				casos_nuevos = new_cases + cs.acumulated_new(part_date)
				casos_recuperados = new_recovered + cs.acumulated_recovered(part_date)
				casos_fallecidos = new_deceased + cs.acumulated_deceased(part_date)
				if casos_nuevos < ( casos_recuperados + casos_fallecidos )
					errors.add(:new_recovered, "Error de carga, verifique el valor ingresado.")
					errors.add(:new_deceased, "Error de carga, verifique el valor ingresado.")
				end
			end
		end
	
	# def acumulated_ambulatory (fecha=part_date)
	# 	return CovidSituation.where(locality: locality).where('part_date <=?', fecha).sum(:ambulatory)
	# end

	# def acumulated_general_room (fecha=part_date)
	# 	return CovidSituation.where(locality: locality).where('part_date <=?', fecha).sum(:general_room)
	# end
	
	# def acumulated_uti_with_arm (fecha=part_date)
	# 	return CovidSituation.where(locality: locality).where('part_date <=?', fecha).sum(:uti_with_arm)
	# end

	# def acumulated_uti_without_arm (fecha=part_date)
	# 	return CovidSituation.where(locality: locality).where('part_date <=?', fecha).sum(:uti_without_arm)
	# end

end
