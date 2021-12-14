require File.expand_path(File.dirname(__FILE__) + '/neo')

# nil is an object 
# assert_equal(exp, act, msg = nil) public
# Tests if expected is equal to actual.
# An optional failure message may be provided as the final argument.

class AboutNil < Neo::Koan
  def test_nil_is_an_object
    assert_equal true, nil.is_a?(Object), "Unlike NULL in other languages"
    # nil.is_a?(Object) .... =>true
  end
# ==
  def test_you_dont_get_null_pointer_errors_when_calling_methods_on_nil
    # What happens when you call a method that doesn't exist.  The
    # following begin/rescue/end code block captures the exception and
    # makes some assertions about it.
    begin
      # it mean that nil does'nt have that method.
      nil.some_method_nil_doesnt_know_about
    rescue Exception => ex
      # What exception has been caught?
      #  Exception.class =>Class
      #  NoMethodError   =>Class
      assert_equal NoMethodError, ex.class

      # What message was attached to the exception?
      # (HINT: replace __ with part of the error message.)
      #  NoMethodError.message  =>NoMethodError
      assert_match(/undefined method/, ex.message)
    end
  end

  def test_nil_has_a_few_methods_defined_on_it
    #  nil.nil?   =>true
    #  nil.to_s   =>""
    #  nil.inspect   =>"nil"
    assert_equal true, nil.nil?
    assert_equal "", nil.to_s
    assert_equal "nil", nil.inspect

    # THINK ABOUT IT:
    #
    # Is it better to use
    #    obj.nil?
    # or
    #    obj == nil
    # Why?
    # In my opinion, it has the exact same observable effects from the outside, it's the same.
    # But obj.nil? is more amenable to modification. U could override it without fooling with the more general == method.
  end

end
