class Employee
    attr_reader :earnings

    def initialize(base_salary = 20000.0)
        @earnings = 0.0
        @baseSalary = base_salary
        @baseSalaryPaid = false
    end

    def payEmployee
        unless @baseSalaryPaid
            @earnings += @baseSalary
            @baseSalaryPaid = true
        end
    end

    def newMonth
        @baseSalaryPaid = false
    end
end

class Manager < Employee
    def initialize(bonus)
        super()
        @bonus = bonus
    end

    def payEmployee
        super
        @earnings += @bonus
    end
end

class Programmer < Employee
    def initialize(percentage)
        super(20000.0 * percentage)
    end
end

class Team
    def initialize
        @employees = []
    end

    def addMember(employee)
        raise "Maximum of two employees exceeded" if @employees.size >= 2
        @employees << employee
    end

    def payTeam
        @employees.each(&:payEmployee)
    end

    def newMonth
        @employees.each(&:newMonth)
    end

    def printEarnings
        @employees.each { |employee| puts employee.earnings }
    end
end
team1 = Team.new
team2 = Team.new

puts "Enter bonus for the manager:"
bonus = gets.chomp.to_f
manager = Manager.new(bonus)

team1.addMember(manager)
team2.addMember(manager)

[team1, team2].each do |team|
    puts "Enter salary percentage for a programmer in team:"
    percentage = gets.chomp.to_f
    programmer = Programmer.new(percentage)
    team.addMember(programmer)
end

loop do
    puts "Enter 'y' to pay the teams for another month of work, 'n' to end the payments:"
    answer = gets.chomp
    break if answer.downcase == 'n'

    [team1, team2].each do |team|
        team.payTeam
        team.newMonth
    end
end

puts "Earnings for team 1:"
team1.printEarnings
puts "Earnings for team 2:"
team2.printEarnings