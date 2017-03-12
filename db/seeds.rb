
if Rails.env.development? || Rails.env.testing?
  [Comic, User, Transaction].each { |resource| resource.destroy_all   }
end
Comic.create(title: 'V for Vendetta', author: 'Michael Moore', year:'2006', publisher:'Vertigo Comics', price: 5, user_id: 1);
Comic.create(title: 'Maus', author: 'Art Spiegelman', year:'1977', publisher:'Pantheon Books');

clark, tony, rick = User.create!([
  {username:'Clark Kent', email:'clark@ironhack.com', password:"ironhack", password_confirmation:"ironhack"},
  {username:'Tony Stark', email:'tony@ironhack.com', password:"ironhack", password_confirmation:"ironhack"},
  {username:'Rick Grimes', email:'rick@ironhack.com', password:"ironhack", password_confirmation:"ironhack"}
  ])

clark.comics.create!([{title: 'V for Vendetta', author: 'Michael Moore', year:'2006', publisher:'Vertigo Comics'},{title: 'Maus', author: 'Art Spiegelman', year:'1977', publisher:'Pantheon Books'}])
rick.comics.create!([{title:'Watchmen', publisher:'Vertigo'}, {title:'300', publisher:'Norma'}])

clark.transactions.create!([{comic_id: 1, seller_id: 2, buyer_id: 1}])
