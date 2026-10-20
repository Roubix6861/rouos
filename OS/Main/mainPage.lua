local krnl = dofile("OS/system/krnl.lua")

local choices = {"Files", "Shutdown"}
local applications = {"OS/system/krnltest.lua", "OS/system/shutdown.lua"}

while true do
    local x, y = term.getSize()
    local middle = x/2
    for i=1, #choices do
        local choice = choices[i]
        local midWord = #choice/2
        local mid = middle - midWord
        if i == 1 then
            krnl.makeButton(mid, i+1, choice, "main", i, true)
        else
            krnl.makeButton(mid, i+1, choice, "main", i)
        end
    end
    krnl.makeWindow("-", "|")
    krnl.makeText(x - #"RouOS 2.0", y-1, "RouOS 2.0")
    local key = krnl.getKey()
    if key == keys.w and krnl.selector > 1 then
        krnl.selector = krnl.selector - 1
    elseif key == keys.s and krnl.selector < #choices then
        krnl.selector = krnl.selector + 1
    elseif key == keys.enter then
        local id = multishell.launch({}, applications[krnl.selector])
        multishell.setTitle(id, krnl.getFileInfo(applications[krnl.selector]))
        multishell.setFocus(id)
    end
end