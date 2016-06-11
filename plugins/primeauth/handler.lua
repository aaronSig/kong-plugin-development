-- Extending the Base Plugin handler is optional, as there is no real
-- concept of interface in Lua, but the Base Plugin handler's methods
-- can be called from your child implementation and will print logs
-- in your `error.log` file (where all logs are printed).
local BasePlugin = require "kong.plugins.base_plugin"
local PrimeAuthHandler = BasePlugin:extend()

-- Your plugin handler's constructor. If you are extending the
-- Base Plugin handler, it's only role is to instanciate itself
-- with a name. The name is your plugin name as it will be printed in the logs.
function PrimeAuthHandler:new()
  PrimeAuthHandler.super.new(self, "primeauth")


end

-- Executed upon every Nginx worker process's startup.
function PrimeAuthHandler:init_worker(config)
  -- Eventually, execute the parent implementation
  -- (will log that your plugin is entering this context)
  PrimeAuthHandler.super.init_worker(self)

  -- Implement any custom logic here

end

-- Executed during the SSL certificate serving phase of the SSL handshake.
function PrimeAuthHandler:certificate(config)
  PrimeAuthHandler.super.certificate(self)

  -- Implement any custom logic here
end

-- Executed for every request upon it's reception from a client and before it is being proxied to the upstream service.
function PrimeAuthHandler:access(config)
  PrimeAuthHandler.super.access(self)

  -- Implement any custom logic here
  ngx.header["X-Prime-Auth"] = 'Prime auth here again!';

end

-- Executed when all response headers bytes have been received from the upstream service.
function PrimeAuthHandler:header_filter(config)
  PrimeAuthHandler.super.header_filter(self)

  -- Implement any custom logic here
end

-- Executed for each chunk of the response body received from the upstream service. Since the response is streamed back to the client, it can exceed the buffer size and be streamed chunk by chunk. hence this method can be called multiple times if the response is large. See the lua-nginx-module documentation for more details.
function PrimeAuthHandler:body_filter(config)
  PrimeAuthHandler.super.body_filter(self)

  -- Implement any custom logic here

end

-- Executed when the last response byte has been sent to the client.
function PrimeAuthHandler:log(config)
  PrimeAuthHandler.super.log(self)

  -- Implement any custom logic here

end

-- This module needs to return the created table, so that Kong
-- can execute those functions.
return PrimeAuthHandler
