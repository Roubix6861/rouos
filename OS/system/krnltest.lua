table = {"gun", "food", "drink"}
local krnl = dofile("OS/system/krnl.lua")

while true do
    krnl.makeButton(5, 5, "Files", "main", 1, true)
    krnl.makeButton(5, 6, "shutdown", "main", 2)
    krnl.makeText(5, 7, "hello world!")
    krnl.makeWindow("-", "|")
    space, capacity = krnl.getStorageInfo("/")
    krnl.makeText(5, 8, space.." Bytes / "..capacity.." Bytes")
    space, name, ending = krnl.getFileInfo("OS/system/krnl.lua")
    krnl.makeText(5, 9, space.." Bytes - "..name.. " - "..ending)
    button = krnl.getKey()
    if button == keys.w then
        krnl.selector = krnl.selector - 1
    elseif button == keys.s then
        krnl.selector = krnl.selector + 1
    end

end