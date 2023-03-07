class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render ({ :template => "photo_templates/index.html.erb" })
  end

  def show
    url_id = params.fetch("path_id")
    @the_photo = Photo.where({ :id => url_id}).first
    render ({ :template => "photo_templates/show.html.erb" })
  end

  def bye

    the_id = params.fetch("deleted_id")

    the_photo = Photo.where({ :id => the_id }).first

    the_photo.destroy

    # render ({ :template => "photo_templates/bye.html.erb" })

    redirect_to("/photos")
  end

  def create

    # Parameters: {"query_image"=>"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExIWFhUWGR0aGBYYGBoYGBgbGhcYGB0XGBoYHSggGB0lHhgVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGxAQGy0lICUtLS8tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAKgBLAMBIgACEQEDEQH/xAAcAAACAwEBAQEAAAAAAAAAAAAFBgMEBwIAAQj/xABGEAACAQIEBAMFBQUHAgQHAAABAhEAAwQSITEFBkFREyJhBzJxgZFCUqGx0RQjcsHwFTNigpLh8RbCQ1OishckRFRzg9L/xAAaAQACAwEBAAAAAAAAAAAAAAACAwABBAUG/8QANhEAAQMCBAMHAwMDBQEAAAAAAQACEQMhBBIxQSJRYRNxgZGhwfAFsdEj4fEUMkIzUlNighX/2gAMAwEAAhEDEQA/AMmscKJstdjRd6FhZNMOItYlbZtqsodwCKEtgri6lG+lWSEQaV9w+H1PwrvFWMqg96lweKyEkrMiuVuBzBqspVSh4qQWidhRPB4NSjd6tcJW2xbOYyr9aguYU0CApXLNrUlzeu8Thiqhu9UpCgY6V5G9a6S3I3rhRBq1S7F5u5+tSftdwbMa+nXYbVGLZmelDZG3NNifNWLXE7g1zGmLCe0PFoAsqQKW7+CYLm3HpVVBrVhoGipzibEyn0e0u/8AaRT8/wDarKe0okeaz+VZ64I3qbwWCyQQKpCCQn8e0S2d7RFX8Lz3hiQMhk+h3rMLWGza/hX28htspI2IOvWNakBHmdC0DmTmthmFqEUdftevelkc53wRDT6nr8RTvZ5Wwo4WuOceJeuCYZoVZ+zAjWIOves6Ni27QECzsAaFsFES7mmtOP2r+Hk+W6DqOhnYiqYxK9xStjcI1mROjRHrrNVczd6W+gCZFluofUn0m5SJ71oeBxKx7wq4t", "query_caption"=>"bbbb", "query_owner_id"=>"111"}

    
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")
    
    a_new_photo = Photo.new

    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    # render ({ :template => "photo_templates/add_photo.html.erb"})
    next_url = "/photos/" + a_new_photo.id.to_s
    redirect_to(next_url)
  end

  def update

    # Parameters: {"query_image"=>"asad", "query_caption"=>"asadian updated", "modify_id"=>"961"}

    the_id = params.fetch("modify_id")

    matching_photos = Photo.where({ :id => the_id})

    the_photo = matching_photos.at(0)

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    # input_owner_id = params.fetch("query_owner_id", false)    // fetch fallback
    # input_owner_id = params.fetch("query_owner_id", "howdy")  // fetch 
    
    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save
    
    # render({ :template => "photo_templates/update.html.erb"})
    next_url = "/photos/" + the_photo.id.to_s
    redirect_to(next_url)
  end
end
