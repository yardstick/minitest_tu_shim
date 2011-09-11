require 'minitest/unit'
require 'test/unit/deprecate'

module Test; end
module Test::Unit
  Assertions = ::MiniTest::Assertions

  module Assertions # deprecations
    tu_deprecate :assert_nothing_thrown, :assert_nothing_raised # 2009-06-01
    tu_deprecate :assert_raise,          :assert_raises         # 2010-06-01
    tu_deprecate :assert_not_equal,      :refute_equal          # 2009-06-01
    tu_deprecate :assert_no_match,       :refute_match          # 2009-06-01
    tu_deprecate :assert_not_nil,        :refute_nil            # 2009-06-01
    tu_deprecate :assert_not_same,       :refute_same           # 2009-06-01

    def assert_nothing_raised _ = :ignored                      # 2009-06-01
      self.class.tu_deprecation_warning :assert_nothing_raised
      self._assertions += 1
      yield
    rescue => e
      raise MiniTest::Assertion, exception_details(e, "Exception raised:")
    end

    def build_message(user_message, template_message, *args)    # 2009-06-01
      #self.class.tu_deprecation_warning :build_message
      user_message ||= ''
      user_message += ' ' unless user_message.empty?
      msg = template_message.split(/<\?>/).zip(args.map { |o| o.inspect })
      user_message + msg.join
    end

  end
end

