# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Doctor.destroy_all
Patient.destroy_all
Med.destroy_all
Conversation.destroy_all

require 'faker'
require 'net/http'
require 'open-uri'
require 'json'


    doc1 = Doctor.create(name: Faker::Name.unique.name, email: "tracey@kris.biz", password_digest: BCrypt::Password.create('abc123'))
    doc2 = Doctor.create(name: Faker::Name.unique.name, email: Faker::Internet.unique.email, password_digest: BCrypt::Password.create('abc123'))
    doc3 = Doctor.create(name: Faker::Name.unique.name, email: Faker::Internet.unique.email, password_digest: BCrypt::Password.create('abc123'))


    p1 = Patient.create(name: Faker::Name.unique.name, email: "leontine.harvey@braun-hammes.io", image: Faker::Avatar.image, password_digest: BCrypt::Password.create('abc123'), doctor_id: doc1.id, gender: ["M", "F"].sample, age: rand(50..93), height: rand(57..77), weight: rand(95..220))
    p1 = Conversation.create(patient_id: p1.id, doctor_id: p1.doctor.id)

    30.times do 
        pt = Patient.create(name: Faker::Name.unique.name, email: Faker::Internet.unique.email, image: Faker::Avatar.image, password_digest: BCrypt::Password.create('abc123'), doctor_id: doc1.id, gender: ["M", "F"].sample, age: rand(50..93), height: rand(57..77), weight: rand(95..220))
        Conversation.create(patient_id: pt.id, doctor_id: pt.doctor.id)
    end
    

def seed_meds
    colors = ["black", "blue", "brown", "gray", "green", "orange", "pink", "purple", "red", "turquoise", "white", "yellow"]
    
    100.times do 
        endpoint = "https://rximage.nlm.nih.gov/api/rximage/1/rxnav?color=#{colors.sample}&includeMpc=true"
        data = Net::HTTP.get(URI(endpoint))
        data = JSON.parse(data)
        if data
            data= data["nlmRxImages"]
            index = rand(1..25)
            med = data[index]
            if med && med["name"] && med['mpc']['shape'] && med['mpc']['color'] && med['imageUrl'] && med['rxcui']
                Med.create(name: med["name"], pill_shape: med['mpc']['shape'], pill_color: med['mpc']['color'], image_url: med['imageUrl'], rxcui: med['rxcui'])
            end
        end
    end
end




seed_meds