class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    genre = Genre.find_by(name: name)
    self.genre = genre
  end

  def genre_name
    genre ? genre.name : nil
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
    # conditional ? true : false.
    artist ? artist.name : nil
  end

  def note_contents
    array = []
    self.notes.each do |note|
      if note.content != ""
        array << note.content
      end
    end
    array
  end

  def note_contents=(content)
    content.each do |c|
      self.notes.build(content: c)
    end
    self.save
  end
end
