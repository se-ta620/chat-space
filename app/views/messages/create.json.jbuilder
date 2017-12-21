json.id @message.id
json.name @message.user.name
json.created_at Message.times_set(@message)
json.body @message.body
json.image @message.image.url
