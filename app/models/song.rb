class Song < ApplicationRecord

    require 'csv'

    CSV.read("song_data.csv", headers: true).each do |row|
        song = Song.create!(
            song_title: row['Title'],
            composer: row['Composer'],
            singer: row['Singer'],
            song_url: row['URL'],
            created_at: row['Date']
        )
    end

end
