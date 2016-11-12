# Service for animal
class Service
  # attr_accessor :rehabilitation_days
  attr_reader :animal_id, :status, :service_name, :rehabilitation_days
  def initialize(animal_id, service_name)
    @animal_id = animal_id
    @service_name = service_name
    @rehabilitation_days = 0
    @status = :ServiceInProgress
  end

  def operation
    @status = :healing
    @rehabilitation_days = 3
  end

  def sterilization
    @status = :healing
    @rehabilitation_days = 4
  end

  def euthanasia
    @status = :died
    @rehabilitation_days = 0
  end

  def health_check
    @status = :healthy
    @rehabilitation_days = 0
  end

  def check_rehabilitation
    if service_name == 'operation' || service_name == 'sterilization'
      return true
    end
    false
  end
end
