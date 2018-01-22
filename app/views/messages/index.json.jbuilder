json.messages @messages.each do |message|
  json.name     message.user.name
  json.created_at  Message.times_set(message)
  json.body     message.body
  json.image    message.image
  json.id       message.id
end
