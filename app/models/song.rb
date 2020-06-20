class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by(name: genre_name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      if content.length > 0
        note = Note.find_or_create_by(content: content)
        self.notes << note
      end
    end
  end

  def note_contents
    ca= self.notes.map do |note|
      note.content
    end
    ca
  end

end
