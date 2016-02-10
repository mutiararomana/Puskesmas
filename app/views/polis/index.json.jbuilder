json.array!(@polis) do |poli|
  json.extract! poli, :id, :nama
  json.url poli_url(poli, format: :json)
end
