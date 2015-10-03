json.array!(@reports) do |report|
  json.extract! report, :id, :comment, :project_id, :user_id
  json.url report_url(report, format: :json)
end
