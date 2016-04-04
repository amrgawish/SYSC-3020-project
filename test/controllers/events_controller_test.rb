require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  
  def setup 
    @event = Event.new(name: "assign", description: " hi " ,course: "sysc 3303" , start_time: "2016-04-03 20:19:02", end_time: "2016-04-03 22:19:02" )
  end

  test "create" do
    #assert_no_difference 'Event.count' do
      post :create, event: {name: "assign", description: " hi " ,course: "sysc 3303" , start_time: "2016-04-03 20:19:02", end_time: "2016-04-03 22:19:02"}
      #end
    assert Event.count + 1
  end


end
