# frozen_string_literal: true

mydir = __dir__
Dir.glob(File.join(mydir, '*.rb')).sort.each { |file| require file }
