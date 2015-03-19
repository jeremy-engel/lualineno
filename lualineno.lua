local HLIST = node.id("hlist")
local VLIST = node.id("vlist")
local RULE = node.id("rule")
local GLUE = node.id("glue")
local GLUESPEC = node.id("glue_spec")
local KERN = node.id("kern")
local WHAT = node.id("whatsit")
local USER = node.subtype("user_defined")

function string.starts(String,Start)
  return string.sub(String,1,string.len(Start)) == Start
end

local check_whatsit_user_string = function(item)
  if item.id == WHAT and item.subtype == USER and item.type == 115 then
    return true
  end
  return false
end
