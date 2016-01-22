json.array!(@approval_docs) do |approval_doc|
  json.extract! approval_doc, :id
  json.url approval_doc_url(approval_doc, format: :json)
end
