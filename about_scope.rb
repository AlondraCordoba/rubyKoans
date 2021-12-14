require File.expand_path(File.dirname(__FILE__) + '/neo')
# Scopes are custom queries that you define inside your Rails models 
# with the scope method. Every scope takes two arguments: 
# A name, which you use to call this scope in your code. 
# A lambda, which implements the query.

class AboutScope < Neo::Koan
  module Jims
    class Dog
      def identify
        :jims_dog
      end
    end
  end

  module Joes
    class Dog
      def identify
        :joes_dog
      end
    end
  end

  def test_dog_is_not_available_in_the_current_scope
    assert_raise(NameError) do
      Dog.new
    end
  end

  def test_you_can_reference_nested_classes_using_the_scope_operator
    fido = Jims::Dog.new
    rover = Joes::Dog.new
    assert_equal :jims_dog, fido.identify
    assert_equal :joes_dog, rover.identify

    assert_equal true, fido.class != rover.class
    assert_equal true, Jims::Dog != Joes::Dog
  end

  # ------------------------------------------------------------------

  class String
  end

  def test_bare_bones_class_names_assume_the_current_scope
    assert_equal true, AboutScope::String == String
  end

  def test_nested_string_is_not_the_same_as_the_system_string
    assert_equal false, String == "HI".class
  end

  def test_use_the_prefix_scope_operator_to_force_the_global_scope
    assert_equal true, ::String == "HI".class
  end

  # ------------------------------------------------------------------

  PI = 3.1416

  def test_constants_are_defined_with_an_initial_uppercase_letter
    assert_equal 3.1416, PI
  end

  # ------------------------------------------------------------------

  MyString = ::String

  def test_class_names_are_just_constants
    assert_equal true, MyString == ::String
    assert_equal true, MyString == "HI".class
  end

  def test_constants_can_be_looked_up_explicitly
    assert_equal true, PI == AboutScope.const_get("PI")
    assert_equal true, MyString == AboutScope.const_get("MyString")
  end

  def test_you_can_get_a_list_of_constants_for_any_class_or_module
    assert_equal [:Dog], Jims.constants
    assert Object.constants.size > 1
  end
end

    # Constants that Object has:
=begin
      => [:Object, :Module, :Class, :BasicObject, :Kernel, :NilClass, :NIL, :Data, :TrueClass, :TRUE, :FalseClass, :FALSE, :Encoding, :Comparable, :Enumerable, :String, :Symbol, :Exception, :SystemExit, :SignalException, :Interrupt, :StandardError, :TypeError, :ArgumentError, :IndexError, :KeyError, :RangeError, :ScriptError, :SyntaxError, :LoadError, :NotImplementedError, :NameError, :NoMethodError, :RuntimeError, :SecurityError, :NoMemoryError, :EncodingError, :SystemCallError, :Errno, :UncaughtThrowError, :ZeroDivisionError, :FloatDomainError, :Numeric, :Integer, :Fixnum, :Float, :Bignum, :Array, :Hash, :ENV, :Struct, :RegexpError, :Regexp, :MatchData, :Marshal, :Range, :IOError, :EOFError, :IO, :STDIN, :STDERR, :ARGF, :FileTest, :File, :Dir, :Time, :Random, :Signal, :Proc, :LocalJumpError, :SystemStackError, :Method, :UnboundMethod, :Binding, :Math, :GC, :ObjectSpace, :Enumerator, :StopIteration, :RubyVM, :Thread, :TOPLEVEL_BINDING, :ThreadGroup, :ThreadError, :ClosedQueueError, :Mutex, :Queue, :SizedQueue, :ConditionVariable, :Process, :Fiber, :FiberError, :Rational, :Complex, :RUBY_VERSION, :RUBY_RELEASE_DATE, :RUBY_PLATFORM, :RUBY_PATCHLEVEL, :RUBY_REVISION, :RUBY_DESCRIPTION, :RUBY_COPYRIGHT, :RUBY_ENGINE, :RUBY_ENGINE_VERSION, :TracePoint, :ARGV, :Gem, :DidYouMean, :RbConfig, :CROSS_COMPILING, :StringIO, :MonitorMixin, :Monitor, :Delegator, :SimpleDelegator, :JSON, :OpenStruct, :RSpec, :Shellwords, :OptionParser, :OptParse, :CGI, :ERB, :StringScanner, :ScanError, :REPL, :STDOUT, :RUBYGEMS_ACTIVATION_MONITOR]
=end