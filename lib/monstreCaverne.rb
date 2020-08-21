require 'rubygems'
require 'httparty'
require 'json'

#creation des class pour mettre de travail rapide
class MonstreCavernes
    include HTTParty

    #Ajout d'une url pour les monstres de cavernes
    base_uri 'https://fr.dofus.dofapi.fr/monsters?filter[where][type]=Monstres%20des%20cavernes&fbclid=IwAR0XxLiPZAyeNTm5TCKSsb7llWznUDa5Q0KI_58RGzbothPv9tiCd6Ox-SY'

    #creation de methode caverne
    def caverne
        self.class.get('/monstre_caverne.json')
    end
     
end
#creer d'objet monstre caverne 
monstre_cavernes = MonstreCavernes.new
monstre_cavernes.caverne.each do |cav|
    puts cav
    #creation de fichier json dans le dossier db 
    File.open("../db/monstre_caverne.json","w") do |file|
       file.write(cav.to_json)
     end
end


