require 'rubygems'
require 'httparty'
require 'json'
#creation de class Monstrelarves pour faciliter notre travail
class MonstreLarves
    include HTTParty
    #afficher le lien de l'url 
    base_uri 'https://fr.dofus.dofapi.fr/monsters?filter[where][type]=Larves&fbclid=IwAR0XxLiPZAyeNTm5TCKSsb7llWznUDa5Q0KI_58RGzbothPv9tiCd6Ox-SY'

    #creer un methode larves
    def larves
        self.class.get('/monstre_larve.json')
    end
     
end
#creation et affichage d'un objet monstre_larve
monstre_larve = MonstreLarves.new
monstre_larve.larves.each do |post|
     puts post
        #creation de fichier monstre_larve.json 
     File.open("../db/monstre_larve.json","w") do |file|
        file.write(post.to_json)
      end
 end
 


