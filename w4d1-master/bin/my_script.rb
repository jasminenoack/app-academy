require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: 'users/1/groups/1'
).to_s

puts RestClient.get(url)

# def delete_user
#   url = Addressable::URI.new(
#     scheme: 'http',
#     host: 'localhost',
#     port: 3000,
#     path: '/users/4'
#   ).to_s
#
#   puts RestClient.delete(
#     url,
#     { user: { name: "Fred", email: "gizmo@gizmo.gizmo" } }
#   )
# end
#
# delete_user
