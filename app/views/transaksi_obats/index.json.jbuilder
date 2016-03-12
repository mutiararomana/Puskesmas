json.array!(@transaksi_obats) do |transaksi_obat|
  json.extract! transaksi_obat, :id, :obat_id, :jumlah_masuk, :jumlah_ambil, :penerimaan, :pemakaian
  json.url transaksi_obat_url(transaksi_obat, format: :json)
end
