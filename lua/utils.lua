function _G.dump(...)
  print(unpack(vim.tbl_map(vim.inspect, {...})))
end
function _G.trim(s)
  return s:match( "^%s*(.*%S)%s*$" ) or ""
end
function _G.contains(tb, element)
  for _, item in ipairs(tb) do
    if item == element then
      return true
    end
  end
  return false
end

local function openLink(link)
  os.execute("start " .. link)
end

local function sample_timer()

end

local utils = {}
function utils.install_lazy()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    os.execute("git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable " .. lazypath)
  end
  vim.opt.rtp:prepend(lazypath)
end

function utils.check_lsp(name)
  local clients = vim.lsp.get_active_clients()
  for _, client in pairs(clients) do
    if client.name == name then
      return true
    end
  end
  return false
end

function utils.init_powershell()
  local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }
  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
end

local originalBG = "None"
function utils.toggle_bg()
  local non_bg = {'Normal', 'LineNrAbove', 'LineNr', 'LineNrBelow','CursorLineNr', "StatusLine"}
  for _, bgItem in ipairs(non_bg) do
    vim.api.nvim_set_hl(0, bgItem, {bg=originalBG})
  end
  if originalBG == "None" then
    originalBG = '#ffffff'--"#262626"
  else
    originalBG = "None"
  end
end

function utils.set_options(custom_options)
  for k, v in pairs(custom_options) do
    vim.opt[k] = v
  end
end

function utils.add_keymap(custom_keymaps)
  for mode, keymaps in pairs(custom_keymaps) do
    for _, keymap in ipairs(keymaps) do
      vim.api.nvim_set_keymap(mode, keymap[1], keymap[2], keymap[3])
    end
  end
end

function utils.define_augroups(definitions)
  -- Create autocommand groups based on the passed definitions
  --
  -- The key will be the name of the group, and each definition
  -- within the group should have:
  --    1. Trigger
  --    2. Pattern
  --    3. Text
  -- just like how they would normally be defined from Vim itself
  for group_name, definition in pairs(definitions) do
    vim.cmd("augroup " .. group_name)
    vim.cmd "autocmd!"

    for _, def in pairs(definition) do
      local command = table.concat(vim.tbl_flatten { "autocmd", def }, " ")
      vim.cmd(command)
    end

    vim.cmd "augroup END"
  end
end

function utils.copy_path()
  local file_path = vim.fn.expand("%:p")
  print(file_path)
  vim.fn.setreg("+", file_path)
end

function utils.edit_hosts_path()
  local hosts_path = "C:/Windows/System32/drivers/etc/hosts"
  print(hosts_path)
  vim.fn.setreg("+", hosts_path)
  vim.api.nvim_command("vs " .. hosts_path)
end
local project_info = nil
function utils.toggle_qf()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd("cclose")
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd("copen")
  end
end

function utils.popen(shellCMD)
  local function trim(s)
    return s:match( "^%s*(.*%S)%s*$" ) or ""
  end
  local handle = io.popen(shellCMD)
  local output = handle:read("*a")
  handle:close()
  return trim(output)
end

function utils.blame()
  local file_path = vim.fn.expand("%:p")
  local cursor_r, cursor_c = unpack(vim.api.nvim_win_get_cursor(0))
  local output = utils.popen("git blame --porcelain " .. file_path .. " -L " .. tostring(cursor_r) ..",+1")
  local contents = {}
  local line_amount = 0
  for line in output:gmatch("([^\n]*)\n?") do
    table.insert(contents, line)
    line_amount = line_amount + 1
  end
  local commit_id = string.sub(contents[1], 1, 8)
  if commit_id == "00000000" then
    print("Not Commit Yet.")
  elseif line_amount < 10 then
    print(contents[1])
  else
    local author = string.sub(contents[2], 8, -1)
    local time = string.sub(contents[4], 13, -1)
    local commit_message = string.sub(contents[10], 9, -1)
    local dateTime, ok = pcall(os.date, _, time)
    if ok then
      print(string.format("%s %s (%s): %s", commit_id, author, dateTime, commit_message))
    end
  end
end

function utils.startTimers()
  local timer = vim.uv.new_timer()
  timer:start(3 * 1000, 10 * 60 * 1000, function()
    vim.uv.new_thread(sample_timer)
  end)
end
function utils.startLink(link)
    vim.uv.new_thread(openLink, link)
end

return utils
