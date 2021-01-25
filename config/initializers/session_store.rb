if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: '_archival_streaming_base', domain: "https://archival-streaming-base.herokuapp.com"
else
    Rails.application.config.session_store :cookie_store, key: '_archival_streaming_base'
end

