json.array!(@rekam_mediks) do |rekam_medik|
  json.extract! rekam_medik, :id, :kartu_rm_id, :nama, :keluhan, :penyakit_id, :terapi, :tindakan
  json.url rekam_medik_url(rekam_medik, format: :json)
end
