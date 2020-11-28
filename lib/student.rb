class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash) #create new student out of hash
    student_hash.each do |attribute, value| #for each hash pair, send key value pairs to attribute= methods to initialize with those values
      self.send("#{attribute}=", value)
    end
    @@all << self 
  end

  def self.create_from_collection(students_array) #uses the Scraper class to create new students with the correct name and location.
    students_array.each do |student_hash|
      Student.new(student_hash)
    end
  end

  #uses the Scraper class to get a hash of a given students attributes and uses that hash to set additional attributes for that student.
  def add_student_attributes(attributes_hash) 
    attributes_hash.each do |attr, value|
      self.send("#{attr}=", value)
    end
    self    
  end

  def self.all #return class variable @@all
    @@all    
  end

end

