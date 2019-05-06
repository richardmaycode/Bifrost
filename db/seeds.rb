# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
index = 1
60.times do 
    Client.create(name: "Company #{index}", street: '123 Main St', city: 'Mega City', state: 'KS', zipcode: '66215', status: 0, service_type: 0, payment_method: 0)
    index += 1
end
4.times do 
    Ticket.create(request_summary: "Big Request", request_detail: "I already told you this is a big request", severity: 3, status: 0, client: Client.first)
end

1500.times do
    client_id = rand(1..60)    
    Ticket.create(request_summary: "Big Request", request_detail: "I already told you this is a big request", severity: 3, status: 0, client: Client.find(client_id))
end