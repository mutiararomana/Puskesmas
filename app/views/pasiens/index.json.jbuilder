json.array!(@pasiens) do |pasien|
  json.extract! pasien, :id, :kartu_rm_id, :nama, :alamat, :kelurahan_id, :umur, :jenis_kelamin, :kategori_id, :jenis_kartu_id, :no_kartu
  json.url pasien_url(pasien, format: :json)
end
