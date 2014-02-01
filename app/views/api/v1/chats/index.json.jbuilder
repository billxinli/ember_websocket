json.set! :chats do
  json.array!(@chats) do |chat|
    json.partial! 'chat', chat: chat
  end
end