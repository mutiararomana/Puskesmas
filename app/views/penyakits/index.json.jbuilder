json.array!(@penyakits) do |penyakit|
  json.extract! penyakit, :id, :nama, :jenis_penyakit_id
  json.url penyakit_url(penyakit, format: :json)
end
