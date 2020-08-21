#selection et exiger  tous les gems
require 'rubygems'
require 'httparty'
require 'json'

#creation de class MonstrePlainesHerbeuse
class MonstrePlainesHerbeuse
  include HTTParty
  # ajout d'url 
  base_uri 'https://fr.dofus.dofapi.fr/monsters?filter[where][type]=Monstres%20des%20Plaines%20herbeuses&fbclid=IwAR0XxLiPZAyeNTm5TCKSsb7llWznUDa5Q0KI_58RGzbothPv9tiCd6Ox-SY'

  def monsters
    self.class.get("/monstre_plaine_herbeuse.json")
  end
end

monstre_plaine_herbeuse = MonstrePlainesHerbeuse.new
#affichage et creation de fichier json
monstre_plaine_herbeuse.monsters.each do |posts|
   puts posts

   File.open("../db/monstre_plaine_herbeuse.json","w") do |file|
    file.write(posts.to_json)
  end
end


