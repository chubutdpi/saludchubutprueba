json.set! :data do
  json.array! @localities do |locality|
    json.id locality.id
    json.name locality.name
    json.area locality.area.name
  end
end