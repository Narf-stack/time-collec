puts ' Cleaning the DB...'

BusinessHour.destroy_all if Rails.env.development?
Shop.destroy_all if Rails.env.development?



puts 'Creating shops ...'
# 1.times do
  shop = Shop.new(name: Faker::Book.title )
  shop.save!
# end
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
a = BusinessHour.new(day:3,open:morning, close:noon)
a.shop = shop
a.save
b = BusinessHour.new(day:3,open:afternoon, close:evening)
b.shop = shop
b.save

puts 'Jeudi...'
c = BusinessHour.new(day:4,open:morning, close:noon)
c.shop = shop
c.save

d = BusinessHour.new(day:4,open:afternoon, close:evening)
d.shop = shop
d.save

puts 'Vendredi...'
e = BusinessHour.new(day:5,open:morning, close:noon)
e.shop = shop
e.save

f = BusinessHour.new(day:5,open:afternoon, close:evening)
f.shop = shop
f.save


puts 'Samedi...'
g = BusinessHour.new(day:6,open:morning, close:evening)
g.shop = shop
g.save
puts 'Samedi test...'

# z = BusinessHour.new( shop:shop, day:6,open:t1, close:t2).valid?
# puts "is valid? #{z}"

puts 'Dimanche...'
h = BusinessHour.new(day:0,opened:false)
h.shop = shop
h.save

puts 'Lundi...'
i = BusinessHour.new(day:1,open:morning, close:noon)
i.shop = shop
i.save

j = BusinessHour.new(day:1,open:afternoon, close:evening)
j.shop = shop
j.save


puts 'Mardi...'
k = BusinessHour.new(day:2,open:morning, close:noon)
k.shop = shop
k.save

l = BusinessHour.new(day:2,open:afternoon, close:evening)
l.shop = shop
l.save
