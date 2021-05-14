puts ' Cleaning the DB...'

BusinessHour.destroy_all if Rails.env.development?
Shop.destroy_all if Rails.env.development?



puts 'Creating shops ...'
5.times do
  shop = Shop.new(name: Faker::Book.title )
  shop.save!
end
puts 'Done shops...'

now = Time.now
morning = Time.new(now.year, now.month, now.day, 10, 30, 0, 0)
noon = Time.new(now.year, now.month, now.day, 15, 00, 0, 0)
afternoon = Time.new(now.year, now.month, now.day, 17, 00, 0, 0)
evening = Time.new(now.year, now.month, now.day, 20, 00, 0, 0)

t1 = Time.new(now.year, now.month, now.day, 11, 30, 0, 0)
t2 = Time.new(now.year, now.month, now.day, 14, 00, 0, 0)

puts 'Business hours...'
puts 'Mercredi...'
BusinessHour.create(day:3,open:morning, close:noon, shop: Shop.first)
BusinessHour.create(day:3,open:afternoon, close:evening, shop: Shop.first)

puts 'Jeudi...'
c = BusinessHour.create(day:4,open:morning, close:noon, shop: Shop.first)
d = BusinessHour.create(day:4,open:afternoon, close:evening, shop: Shop.first)

puts 'Vendredi...'
BusinessHour.create(day:5,open:morning, close:noon, shop: Shop.first)
BusinessHour.create(day:5,open:afternoon, close:evening, shop: Shop.first)

puts 'Samedi...'
BusinessHour.create(day:6,open:morning, close:evening, shop: Shop.first)

puts 'Samedi test...'
# z = BusinessHour.new( shop:shop, day:6,open:t1, close:t2).valid?
# puts "is valid? #{z}"

puts 'Dimanche...'
BusinessHour.create(day:0,opened:false, shop: Shop.first)

puts 'Lundi...'
BusinessHour.create(day:1,open:morning, close:noon, shop: Shop.first)
BusinessHour.create(day:1,open:afternoon, close:evening, shop: Shop.first)

puts 'Mardi...'
BusinessHour.create(day:2,open:morning, close:noon, shop: Shop.first)
BusinessHour.create(day:2,open:afternoon, close:evening, shop: Shop.first)
