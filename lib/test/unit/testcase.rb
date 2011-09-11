require 'minitest/unit'
require 'minitest/spec'
require 'test/unit/deprecate'

module Test; end
module Test::Unit
  AssertionFailedError = ::MiniTest::Assertion

  class TestCase < ::MiniTest::Unit::TestCase # ::MiniTest::Spec
    VERSION = '1.3.2'

    tu_deprecate :method_name, :name # 2009-06-01

    def self.test_order              # 2009-06-01
      :sorted
    end

  end
end

require 'test/unit/assertions' # brings in deprecated methods
