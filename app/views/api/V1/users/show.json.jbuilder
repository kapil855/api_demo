if user.present?
  json.id                       user.id
  json.first_name               user.first_name
  json.last_name                user.last_name
  json.email                    user.email
  json.address                  user.address
  json.date_of_birth            user.date_of_birth
  json.date_of_joining          user.date_of_joining
  json.image                    rails_blob_url(user.photo)
  
  json.post do
    json.partial!     'api/V1/posts/post', collection: user.posts
  end
end