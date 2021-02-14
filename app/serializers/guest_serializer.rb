class GuestSerializer
  include JSONAPI::Serializer
  attributes :fname, :lname, :attending, :shuttle, :hotel, :notes, :party_id
end
