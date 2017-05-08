require "spec_helper"

describe Project do

  describe '#employees' do
    it ('returns the employees assigned to a project') do
      project = Project.create({:description => 'do things'})
      employee1 = Employee.create({:name => 'Joe Bob', :project_id => project.id})
      employee2 = Employee.create({:name => 'Betty Sue', :project_id => project.id})
      expect(project.employees).to eq [employee1, employee2]
    end
  end
end
