class CategoryContract < Dry::Validation::Contract
  option :id, default: -> { nil }

  params do
    required(:name).filled(:string)
    optional(:description).maybe(:string)
    optional(:is_active).maybe(:bool)
  end

  rule(:description) do
    if value && value.strip.length < 10
      key.failure('must be at least 10 character if provided')
    end
  end

end