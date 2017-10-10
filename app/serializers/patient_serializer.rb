class PatientSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone_number, :assistant, :home_health_company,
  :visit_frequency, :created_at, :appointments, :notes
end
