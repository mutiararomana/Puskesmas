json.array!(@kategoris) do |kategori|
  json.extract! kategori, :id, :nama
  json.url kategori_url(kategori, format: :json)
end
