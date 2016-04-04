require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = Event.new(name: "assign", description: " hi " ,course: "sysc 3303" , start_time: "2016-04-03 20:19:02", end_time: "2016-04-03 22:19:02" )
  end

  test  "should be valid " do 
    assert @event.valid?
  end 
 
  test "name should be present " do
    @event.name = "  "
    assert_not @event.valid?
  end

  test "course should be present " do
    @event.course = "  "
    assert_not @event.valid?
  end

  test "start time should be present " do
    @event.start_time = "  "
    assert_not @event.valid?
  end

  test "end_time should be present " do
    @event.end_time = ""
    assert_not @event.valid?
  end

end
