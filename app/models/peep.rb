# This class corresponds to a table in the database
# We can use it to manipulate the data
class Peep

  # this makes the instances of this class Datamapper resources
  include DataMapper::Resource

  # This block describes what resources our model will have
  property :id,       Serial # Serial means that it will be auto-incremented for every record
  property :message,  String, :length => 1..140

  belongs_to :user


  # validates_length_of :message, :within => 1..160

end