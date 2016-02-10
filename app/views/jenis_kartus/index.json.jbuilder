json.array!(@jenis_kartus) do |jenis_kartu|
  json.extract! jenis_kartu, :id, :nama
  json.url jenis_kartu_url(jenis_kartu, format: :json)
end
