# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require 'browser_logger'
require 'log_tail'

use BrowserLogger
run Forum::Application
