json.array!(@kelurahans) do |kelurahan|
  json.extract! kelurahan, :id, :nama
  json.url kelurahan_url(kelurahan, format: :json)
end
