json.array!(@obats) do |obat|
  json.extract! obat, :id, :nama, :stok_awal, :stok, :harga
  json.url obat_url(obat, format: :json)
end
