require_relative 'app'
require_relative 'format'
require_relative 'middleware/send'
require_relative 'middleware/logger'

use Send
run App.new
