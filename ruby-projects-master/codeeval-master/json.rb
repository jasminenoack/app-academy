input = '{"menu": {"header": "menu", "items": [{"id": 27}, {"id": 0, "label": "Label 0"}, null, {"id": 93}, {"id": 85}, {"id": 54}, null, {"id": 46, "label": "Label 46"}]}}
{"menu": {"header": "menu", "items": [{"id": 81}]}}
{"menu": {"header": "menu", "items": [{"id": 70, "label": "Label 70"}, {"id": 85, "label": "Label 85"}, {"id": 93, "label": "Label 93"}, {"id": 2}]}}'








input.each_line do |line|
  line=line.split("{")
  line=line.select{|x| x.include?("label") && x.include?("id")}
  sum=0
  line.each do |item|
    id_index = item.index("id")
    value = (item[id_index, 7]).scan(/\d+/)[0].to_i
    sum = sum + value
  end
  puts sum
end