require "spec_helper"

describe Division do

  describe '#employees' do
    it 'returns the employees for a division' do
      division = Division.create({:title => 'HR'})
      employee1 = Employee.create({:name => 'Joe Bob', :division_id => division.id})
      employee2 = Employee.create({:name => 'Betty Sue', :division_id => division.id})
      expect(division.employees).to eq [employee1, employee2]
    end
  end
end
