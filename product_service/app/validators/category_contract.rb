class CategoryContract < Dry::Validation::Contract
  option :id, default: -> { nil }

  params do
    required(:name).filled(:string)
    required(:parent_id).filled(:integer)
    optional(:description).maybe(:string)
  end

  rule(:description) do
    if value && value.strip.length < 10
      key.failure('must be at least 10 character if provided')
    end
  end

  rule(:parent_id) do
    if Categories::GetCategoryById.call(value) == nil
      key.failure('must persist')
    end
  end

end