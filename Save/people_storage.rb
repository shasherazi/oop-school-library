require './storage'

class PeopleStorage < Storage
  def fetch; end

  def save(item); end

  def serialize(item); end

  def deserialize(item); end
end
