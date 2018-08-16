class ApplicationController < ActionController::Base
=begin
  AmplitudeAPI.config.api_key = "b2de3cae70d5147efb55586ef6c72dc9"


  event = AmplitudeAPI::Event.new({
    user_id: "123",
    event_type: "clicked on home",
    time: Time.now,
    insert_id: 'f47ac10b-58cc-4372-a567-0e02b2c3d479',
    event_properties: {
      cause: "button",
      arbitrary: "properties"
    }
  })
  AmplitudeAPI.track(event)
=end
end
