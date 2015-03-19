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

local number_lines = function (head)
  local line_number = 0
  for line in node.traverse_id(HLIST, head) do
    line_number = line_number + 1
    local item = line.head
    while item.next do
      item = item.next
    end
    local temp = node.new("glyph")
    temp.font = font.current()
    temp.lang = tex.language
    temp.char = 97
    node.insert_after(line.head, item, temp)
  end
  return head
end


luatexbase.add_to_callback("post_linebreak_filter", number_lines, "line_numbering")
