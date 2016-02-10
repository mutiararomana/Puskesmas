json.array!(@obat_masuks) do |obat_masuk|
  json.extract! obat_masuk, :id, :obat_id, :jumlah_masuk, :penerimaan
  json.url obat_masuk_url(obat_masuk, format: :json)
end
