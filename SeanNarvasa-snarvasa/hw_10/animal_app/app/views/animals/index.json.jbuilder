json.array!(@animals) do |animal|
  json.extract! animal, :id, :animal_type, :neuter_status, :name, :age
  json.url animal_url(animal, format: :json)
end
