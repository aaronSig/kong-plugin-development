package = "pluginbundle"
version = "1.0-0"
source = {
  url = "SuperPixel.com"
}
description = {
  summary = "SuperPixel kong plugin development env.",
  license = "None"
}
dependencies = {
  "lua ~> 5.1", "inspect ~> 3.1.0"
  -- If you depend on other rocks, add them here


}
build = {
  type = "builtin",
  modules = {
    ["kong.plugins.helloworld.handler"] = "helloworld/handler.lua",
    ["kong.plugins.helloworld.schema"] = "helloworld/schema.lua",
    ["kong.plugins.primeauth.handler"] = "primeauth/handler.lua",
    ["kong.plugins.primeauth.schema"] = "primeauth/schema.lua",
    ["kong.plugins.advokit-jwt.handler"] = "advokit-jwt/handler.lua",
    ["kong.plugins.advokit-jwt.schema"] = "advokit-jwt/schema.lua",
    ["kong.plugins.advokit-jwt.jwt_parser"] = "advokit-jwt/jwt_parser.lua"
  }

}
