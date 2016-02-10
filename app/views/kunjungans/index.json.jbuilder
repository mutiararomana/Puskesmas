json.array!(@kunjungans) do |kunjungan|
  json.extract! kunjungan, :id, :kartu_rm_id, :nama, :umur, :jenis_kelamin, :kunjungan, :keluhan, :poli_id, :kategori_id, :jenis_kartu_id, :no_kartu
  json.url kunjungan_url(kunjungan, format: :json)
end
