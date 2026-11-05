local GPU = {}
GPU.selector = 1
GPU.selectedName = "main"

-- Graphical

-- Makes a button on the screen

function GPU.makeButton(x, y, title, selectorName, selectorNumber, first)
    if first == true then
        term.clear()
    end

    if selectorName == GPU.selectedName and selectorNumber == GPU.selector then
        term.setCursorPos(x - 2, y)
        write("> "..title.." <")
    else
        term.setCursorPos(x, y)
        write(title)
    end
end

-- Writes a text on the screen
function GPU.makeText(x, y, text, first)
    if first == true then
        term.clear()
    end
    term.setCursorPos(x, y)
    write(text)
end

-- Makes a window around the terminal

function GPU.makeWindow(symbol, symbolSide)
    local x, y = term.getSize()
    for i=1, x do
        term.setCursorPos(i,1)
        write(symbol)
    end
        for i=2, y do
        term.setCursorPos(1, i)
        write(symbolSide)
        term.setCursorPos(x, i)
        write(symbolSide)
    end
    for i=1, x do
        term.setCursorPos(i,y)
        write(symbol)
    end
    
end

-- filesystem functions

-- splits filenames

local function splitFilename(filename)
    local name, extension = filename:match("^(.*)%.([^%.]+)$")

    if not name then
        return filename, ""
    end

    return name, extension
end

-- writes disk information

function GPU.getStorageInfo(disk)
    local space, cap = float
    space = fs.getFreeSpace(disk)
    cap = fs.getCapacity(disk)
    return space, cap
end

-- writes file information

function GPU.getFileInfo(file)
    local space = float
    space = fs.getSize(file)
    local name = string
    name = fs.getName(file)
    local names, extension = splitFilename(name)
    return names, space, extension
end

-- input

function GPU.getKey()
    local event, button = os.pullEvent()
if event == key then
    return button
end

return GPU
