local M = {}

function M.get_method_color(method, config)
  -- Support both new and old config structure for backward compatibility
  local colors = config.ui.methods and vim.tbl_map(function(m)
    return m.color
  end, config.ui.methods) or config.ui.method_colors -- fallback to old structure

  if colors and colors[method] then
    return colors[method]
  end

  return M.DEFAULT_METHOD_COLORS[method] or "TelescopeResultsIdentifier"
end

function M.get_method_icon(method, config)
  if not config.ui.show_icons then
    return ""
  end

  -- Support both new and old config structure for backward compatibility
  local icons = config.ui.methods and vim.tbl_map(function(m)
    return m.icon
  end, config.ui.methods) or config.ui.method_icons -- fallback to old structure

  if icons and icons[method] then
    return icons[method]
  end

  return M.DEFAULT_METHOD_ICONS[method] or "⚪"
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
  -- React Router method types
  ROUTE = "TelescopeResultsIdentifier",
  -- Django/DRF action types (use corresponding HTTP method colors)
  LIST = "TelescopeResultsNumber", -- Same as GET
  CREATE = "TelescopeResultsConstant", -- Same as POST
  RETRIEVE = "TelescopeResultsNumber", -- Same as GET
  UPDATE = "TelescopeResultsKeyword", -- Same as PUT
  PARTIAL_UPDATE = "TelescopeResultsFunction", -- Same as PATCH
  DESTROY = "TelescopeResultsSpecialChar", -- Same as DELETE
}
M.DEFAULT_METHOD_ICONS = {
  GET = "📥",
  POST = "📤",
  PUT = "✏️",
  DELETE = "🗑️",
  PATCH = "🔧",
  -- React Router method types
  ROUTE = "🔗",
  -- Django/DRF action types (use corresponding HTTP method icons)
  LIST = "📋", -- List icon for collections
  CREATE = "➕", -- Plus icon for creation
  RETRIEVE = "📥", -- Same as GET
  UPDATE = "✏️", -- Same as PUT
  PARTIAL_UPDATE = "🔧", -- Same as PATCH
  DESTROY = "🗑️", -- Same as DELETE
}

return M
