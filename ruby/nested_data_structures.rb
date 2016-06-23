# DBC Challenge 5.5 Release 2

# Music hash
  # Genres hash
    # Artists hash
      # Artist_name hash
        # Album hash
          # Album Titles key
          # Song values(array)

music = {
  genres: {
    blues: {
       artists: {
        Steve_Ray_Vaughn: {
          albums: {
            album_name: "The Real Deal: Greatest Hits Volume 1", 
            songs: [
              "Pride and Joy", 
              "Mary Had a Little Lamb",
              "Rude Mood"
            ]
           },
          },  
        },
      },
      
    metal: {
      artists: {
        Alice_Cooper: {
          albums: {
            album_name: "Alice Cooper's Greatest Hits", 
            songs: [
              "School's Out", 
              "No More Mr. Nice Guy",
              "Muscle of Love"
            ]
          },
        },  
      },
    },      

    country: {
      artists: {
        George_Strait: {
          albums: {
            album_name: "Best Of (Deluxe Edition)", 
            songs: [
              "All My Ex's Live In Texas", 
              "Love Without End, Amen",
              "River of Love"
            ] 
          }
        } 
      }
    }
  }
}        


p "Print out of the entire nested data structure called 'music'"
p music
p "............................................................."

p "Print out of the blues genre:"
p music[:genres][:blues]
p "............................................................."

p "Print out of the artists within the metal genre and their album info:"
p music[:genres][:metal][:artists]
p "............................................................."

p "Print out the songs in the first two index positions of George Strait's albums within the country genre:"
p music[:genres][:country][:artists][:George_Strait][:albums][:songs][0..1]
