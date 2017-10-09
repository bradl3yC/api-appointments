class PatientSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone_number, :created_at, :appointments, :notes
end
