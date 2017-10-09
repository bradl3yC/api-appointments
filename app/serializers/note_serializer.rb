class NoteSerializer < ActiveModel::Serializer
  attributes :id, :entry, :patient
end
