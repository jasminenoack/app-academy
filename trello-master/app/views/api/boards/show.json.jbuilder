json.extract! @board, :title

json.lists do
  json.array!(@board.lists) do |list|
    json.extract! list, :title, :ord, :id

    json.cards do
      json.array!(list.cards) do |card|
        json.extract! card, :title, :description, :id, :ord, :list_id

        json.items do
          json.array!(card.items) do |item|
            json.extract! item, :title, :card_id, :done, :id
          end
        end

      end
    end

  end
end

json.members do
  json.array!(@board.members) do |member|
    json.extract! member, :email, :id
  end
end
