class ActivitySerializer
  include JSONAPI::Serializer
  attributes :forecast, :activities
end