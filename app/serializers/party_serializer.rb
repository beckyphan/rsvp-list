class PartySerializer
  include JSONAPI::Serializer
  attributes :name, :hoh
  has_many :guests
end
