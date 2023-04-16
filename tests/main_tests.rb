require_relative 'test_entity'
require_relative 'test_smart_entity'
require 'test/unit/ui/console/testrunner'

classes_to_test = [TestEntityInitialize, TestTakeDamage, TestHeal, TestWeaponInitialize, TestAttack]
total_runs = 0
total_passes = 0
output_level = ARGV[0] == '-v' ? 5 : 0

classes_to_test.each_with_index do |class_name, i|
    test_num = i + 1
    test_suite = Test::Unit::TestSuite.new("Task #{test_num} Test Suite")
    class_name.instance_methods(false).each do |method|
        test_suite << class_name.new(method)
    end
    puts "Running Test #{test_num}..."
    score = Test::Unit::UI::Console::TestRunner.run(test_suite, { output_level: output_level })
    puts "There are #{score.pass_count} out of #{score.run_count} tests passed in Test #{test_num}"
    total_passes += score.pass_count
    total_runs += score.run_count
end

if total_runs == total_passes
    puts 'ALL TESTS COMPLETED!'
end