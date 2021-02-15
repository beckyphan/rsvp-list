class GuestSerializer
  include JSONAPI::Serializer
  attributes :fname, :lname, :attending, :shuttle, :hotel, :notes, :plusones, :party_id, :updated_at
end
