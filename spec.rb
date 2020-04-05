# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

class Person
    attr_reader :first_name, :middle_name, :last_name
    def initialize(first_name:, middle_name: nil, last_name:)
      @first_name = first_name
      @middle_name = middle_name
      @last_name = last_name
    end
  
    def full_name
        if self.middle_name == nil
            self.first_name + " " + self.last_name
        else
            self.first_name + " " + self.middle_name + " " + self.last_name
        end
    end

    def full_name_with_middle_initial
        self.first_name + " " + self.middle_name + " " + self.last_name
    end

    def initials 
        if self.middle_name == nil 
            self.first_name[0] + "." + self.last_name[0] + "."
        else
            self.first_name[0] + "." + self.middle_name[0] + "." + self.last_name[0] + "."
        end
    end
end
  
  RSpec.describe Person do
    describe "#full_name" do
      it "concatenates first name, middle name, and last name with spaces" do
        person = Person.new(first_name: 'Ian', middle_name: 'Caleb', last_name: 'Anderson')

        expect(person.full_name).to eq("Ian Caleb Anderson")
      end

      it "does not add extra spaces if middle name is missing" do
        person = Person.new(first_name: 'Ian', last_name: 'Anderson')

        expect(person.full_name).to eq("Ian Anderson")
      end
    end
  
    describe "#full_name_with_middle_initial" do
        it "returns a full name with a middle initial" do 
            person = Person.new(first_name: 'Ian', middle_name: 'C.', last_name: 'Anderson')

            expect(person.full_name_with_middle_initial).to eq("Ian C. Anderson")
        end

        it "If the middle name is missing, there shouldn't be extra spaces or a period" do
            person = Person.new(first_name: 'Ian', last_name: 'Anderson')

            expect(person.full_name).to eq("Ian Anderson")
        end
    end
  
    describe "#initials" do 

        it "returns all initials" do 
            person = Person.new(first_name: 'Ian', middle_name: 'Caleb', last_name: 'Anderson')

            expect(person.initials).to eq("I.C.A.")
        end

        it "If the middle name is missing, the initials should only have two characters" do
            person = Person.new(first_name: 'Ian', last_name: 'Anderson')

            expect(person.initials).to eq("I.A.")
        end
    end

  end