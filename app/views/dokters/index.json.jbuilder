json.array!(@dokters) do |dokter|
  json.extract! dokter, :id, :nama
  json.url dokter_url(dokter, format: :json)
end
