class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def song_artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def song_artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      if content != ""
        note = Note.find_or_create_by(content: content)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end

  def genre_name=(name)
    genre = Genre.find_by(name: name)
    self.genre_id = genre.id
  end

  def genre_name
    id = self.genre_id
    genre = Genre.find(id)
    genre.name
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist_id = artist.id
  end

  def artist_name
    id = self.artist_id
    artist = Artist.find(id)
    artist.name
  end

end
