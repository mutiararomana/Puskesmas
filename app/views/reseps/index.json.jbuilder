json.array!(@reseps) do |resep|
  json.extract! resep, :id, :obat_id, :jumlah_ambil
  json.url resep_url(resep, format: :json)
end
