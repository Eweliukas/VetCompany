# Health card for animal
class HealthCard
  attr_reader :id, :service_name, :status, :rehabilitation
  def initialize(id, service_name)
    @id = id
    @service_name = service_name
    @status = :healthy
    @rehabilitation = false
  end

  def death
    @status = :died
  end

  def check_for_rehabilitation
    service = Service.new(2, 'operation')
    @rehabilitation = true if service.check_rehabilitation == true
  end
end
