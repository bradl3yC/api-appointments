class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :date_time, :patient
end
