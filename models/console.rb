require('pry-byebug')
require_relative('Album')
require_relative('Artist')

artist1 = Artist.new({'name' => 'Kip Moore'})
artist2 = Artist.new({'name' => 'Heartland'})

artist1.save
artist2.save

album1 = Album.new({'title' => 'Up All Night', 'genre' => 'Country', 'artist_id' => artist1.id})
album2 = Album.new({'title' => 'I Loved Her First', 'genre' => 'Country', 'artist_id' => artist2.id})
album3 = Album.new({'title' => 'Wild Ones', 'genre' => 'Country', 'artist_id' => artist1.id})


album1.save
album2.save
album3.save

binding.pry

nil