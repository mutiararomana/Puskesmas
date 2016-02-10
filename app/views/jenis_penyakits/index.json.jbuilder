json.array!(@jenis_penyakits) do |jenis_penyakit|
  json.extract! jenis_penyakit, :id, :nama
  json.url jenis_penyakit_url(jenis_penyakit, format: :json)
end
