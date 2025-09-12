local M = {}

function M.get_method_color(method, config)
  local colors = config.ui.method_colors
  return colors[method] or "TelescopeResultsIdentifier"
end

function M.get_method_icon(method, config)
  if not config.ui.show_icons then
    return ""
  end
  local icons = config.ui.method_icons
  return icons[method] or "⚪"
end

function M.get_method_text(method, config)
  if not config.ui.show_method then
    return ""
  end
  return method
end

M.DEFAULT_METHOD_COLORS = {
  GET = "TelescopeResultsNumber",
  POST = "TelescopeResultsConstant",
  PUT = "TelescopeResultsKeyword",
  DELETE = "TelescopeResultsSpecialChar",
  PATCH = "TelescopeResultsFunction",
}
M.DEFAULT_METHOD_ICONS = {
  GET = "📥",
  POST = "📤",
  PUT = "✏️",
  DELETE = "🗑️",
  PATCH = "🔧",
}

return M
