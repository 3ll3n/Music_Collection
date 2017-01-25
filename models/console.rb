require('pry-byebug')
require_relative('Album')
require_relative('Artist')

artist1 = Artist.new({'name' => 'Kip Moore'})
artist2 = Artist.new({'name' => 'Heartland'})

album1 = Album.new({'title' => 'Up All Night', 'genre' => 'Country', 'artist_id' => artist1.id})
album2 = Album.new({'title' => 'I Loved Her First', 'genre' => 'Country', 'artist_id' => artist2.id})

binding.pry

nil