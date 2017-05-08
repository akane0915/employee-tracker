require "spec_helper"

describe Employee do

  describe '#division' do
    it 'returns the division an employee belongs to' do
      division = Division.create({:title => 'HR'})
      employee = Employee.create({:name => 'Joe Bob', :division_id => division.id})
      expect(employee.division).to eq division
    end
  end
end
