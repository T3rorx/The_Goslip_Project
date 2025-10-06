# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# db/seeds.rb
# frozen_string_literal: true
require "faker"

puts "== Seeding… =="

ActiveRecord::Base.transaction do
  Faker::Config.locale = :fr

  # -------------------------
  # Paramètres de volume
  # -------------------------
  N_CITIES   = 5
  N_USERS    = 20
  N_TAGS     = 6
  N_GOSSIPS  = 30
  N_COMMENTS = 60
  N_PMS      = 20
  N_LIKES    = 120

  # -------------------------
  # 1) Cities
  # -------------------------
  puts "→ Cities"
  cities = Array.new(N_CITIES) do
    City.find_or_create_by!(
      name: Faker::Address.city,
      zip_code: Faker::Address.zip_code
    )
  end

  # -------------------------
  # 2) Users (belongs_to :city)
  # -------------------------
  puts "→ Users"
  users = []
  users << User.find_or_create_by!(email: "admin@example.com") do |u|
    u.first_name  = "Admin"
    u.last_name   = "User"
    u.description = "Super admin"
    u.age         = 30
    u.city        = cities.sample
  end



  (N_USERS - users.size).times do
    users << User.create!(
      first_name:  Faker::Name.first_name,
      last_name:   Faker::Name.last_name,
      description: Faker::Quote.famous_last_words,
      email:       Faker::Internet.unique.email,
      age:         rand(16..70),
      city:        cities.sample
    )
  end

  # -------------------------
  # 3) Tags
  # -------------------------
  puts "→ Tags"
  tags = Array.new(N_TAGS) do
    Tag.find_or_create_by!(title: Faker::Hacker.noun.capitalize)
  end

  # -------------------------
  # 4) Gossips (belongs_to :user, optional :tag)
  # -------------------------
# 4) Gossips (belongs_to :user, belongs_to :tag REQUIRED)
puts "→ Gossips"
gossips = Array.new(N_GOSSIPS) do
  Gossip.create!(
    title:   Faker::Book.title.truncate(80),
    content: Faker::Lorem.paragraph(sentence_count: 3),
    user:    users.sample,
    tag:     tags.sample   # <- plus de nil ici
  )
end


  # -------------------------
  # 5) Comments (belongs_to :user, :gossip, parent_comment optional)
  # -------------------------
  puts "→ Comments (plats, sans parent)"
  comments = Array.new(N_COMMENTS) do
    Comment.create!(
      content: Faker::Lorem.sentence(word_count: 12),
      user:    users.sample,
      gossip:  gossips.sample
      # AUCUN parent_comment ici
    )
  end

  # -------------------------
  # 6) PrivateMessages (sender/recipient => Users)
  #    (assume models: belongs_to :sender, class_name: 'User'
  #                    belongs_to :recipient, class_name: 'User')
  # -------------------------
  puts "→ Private messages"
  N_PMS.times do
    sender, recipient = users.sample(2)
    PrivateMessage.create!(
      content:   Faker::Lorem.paragraph(sentence_count: 2),
      sender:    sender,
      recipient: recipient
    )
  end

  # -------------------------
  # 7) Likes (belongs_to :user; cible Gossip OU Comment)
  #    (table a deux colonnes : gossip_id et comment_id ; on en remplit une seule)
  # -------------------------
  puts "→ Likes"
  N_LIKES.times do
    if rand < 0.6
      Like.create!(user: users.sample, gossip: gossips.sample, comment: nil)
    else
      Like.create!(user: users.sample, comment: comments.sample, gossip: nil)
    end
  end
end

puts "== Done =="
puts "Cities:   #{City.count}"
puts "Users:    #{User.count}"
puts "Tags:     #{Tag.count}"
puts "Gossips:  #{Gossip.count}"
puts "Comments: #{Comment.count}"
puts "PMs:      #{PrivateMessage.count}"
puts "Likes:    #{Like.count}"
