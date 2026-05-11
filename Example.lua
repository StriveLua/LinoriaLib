local repo = "https://raw.githubusercontent.com/StriveLua/LinoriaLib/main/"

local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ShowToggleFrameInKeybinds = true
Library.ShowCustomCursor = true
Library.NotifySide = "Left"

local Window = Library:CreateWindow({
    Title = "Example Script", -- Put ur script name here
    Center = true,
    AutoShow = true,
    Resizable = true,
    ShowCustomCursor = true, -- keep this on unless u are on Yub-X
    UnlockMouseWhileOpen = true, -- idk
    NotifySide = "Left", -- Left or right
    TabPadding = 0, -- change this for more distance between tabs
    MenuFadeTime = 0.2
})

local Tabs = {
    MainTab = Window:AddTab("Main"),
    ExtraTab = Window:AddTab("Extra"),
    ["UI Settings"] = Window:AddTab("UI Settings"),
}

local LeftGroupBox1 = Tabs.MainTab:AddLeftGroupbox("Groupbox 1") -- Adds a groupbox on main tab
local LeftGroupBox2 = Tabs.MainTab:AddLeftGroupbox("Groupbox 2") -- Adds a groupbox on main tab
local RightGroupBox1 = Tabs.MainTab:AddRightGroupbox("Groupbox 3") -- Adds a groupbox on main tab


local DropdownGroupBox = Tabs.MainTab:AddRightGroupbox("Dropdowns")



local TabBox = Tabs.ExtraTab:AddLeftTabbox()

local Tab1 = TabBox:AddTab("Tab 1")
Tab1:AddToggle("Tab1Toggle", { Text = "Tab1 Toggle" })

local Tab2 = TabBox:AddTab("Tab 2")
Tab2:AddToggle("Tab2Toggle", { Text = "Tab2 Toggle" })



local TabBox2 = Tabs.ExtraTab:AddRightTabbox()

local Taab1 = TabBox2:AddTab("Tab 1")
Taab1:AddToggle("Tab1Togglee", { Text = "Tab1 Toggle" })

local Taab2 = TabBox2:AddTab("Tab 2")
Taab2:AddToggle("Tab2Togglee", { Text = "Tab2 Toggle" })

local Taab3 = TabBox2:AddTab("Tab 3")
Taab3:AddToggle("Tab2Togglee", { Text = "Tab3 Toggle" })





RightGroupBox1:AddToggle("MyToggleIdkHowMany", {
	Text = "Enable Me",
	DisabledTooltip = "I am disabled!",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,
	Callback = function(Value)
		print("[cb] MyToggle changed to:", Value)
	end
})

local Depbox1 = RightGroupBox1:AddDependencyBox()

Depbox1:AddToggle("MyToggleIdkHowMany2", {
	Text = "Hello Im Secret Toggle",
	DisabledTooltip = "I am disabled!",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,
	Callback = function(Value)
		print("[cb] MyToggle changed to:", Value)
	end
})

Depbox1:SetupDependencies({
	{ Toggles.MyToggleIdkHowMany, true }
})





RightGroupBox1:AddDivider()





RightGroupBox1:AddToggle("MyToggleIdkHowMany3", {
	Text = "Hey There",
    Tooltip = "Wassup",
	DisabledTooltip = "I am disabled!",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,
	Callback = function(Value)
		print("[cb] MyToggle changed to:", Value)
	end
})

local Depbox2 = RightGroupBox1:AddDependencyBox()



Depbox2:AddToggle("MyToggleIdkHowMany4", {
	Text = "Hello Enable Me Pls",
	Tooltip = "Enable Me",
	DisabledTooltip = "I am disabled!",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,
	Callback = function(Value)
		print("[cb] MyToggle changed to:", Value)
	end
})

local Depbox3 = RightGroupBox1:AddDependencyBox()

Depbox3:AddLabel("Peekabo")

Depbox3:SetupDependencies({
	{ Toggles.MyToggleIdkHowMany4, true }
})

Depbox2:SetupDependencies({
	{ Toggles.MyToggleIdkHowMany3, true }
})



LeftGroupBox2:AddSlider("MySlider", {
	Text = "This is my slider!",
	Default = 0,
	Min = 0,
	Max = 5,
	Rounding = 1,
	Compact = false,
	Callback = function(Value)
		print("[cb] MySlider was changed! New value:", Value)
	end,
	Tooltip = "I am a slider!",
	DisabledTooltip = "I am disabled!",
	Disabled = false,
	Visible = true,
})

local Number = Options.MySlider.Value
Options.MySlider:OnChanged(function()
	print("MySlider was changed! New value:", Options.MySlider.Value)
end)

Options.MySlider:SetValue(3)

LeftGroupBox2:AddSlider("MySlider2", {
	Text = "This is my custom display slider!",
	Default = 0,
	Min = 0,
	Max = 5,
	Rounding = 1,
	Compact = false,
	FormatDisplayValue = function(slider, value)
		if value == slider.Max then return "Everything" end
		if value == slider.Min then return "Nothing" end
	end,
	Tooltip = "I am a slider!",
	DisabledTooltip = "I am disabled!",
	Disabled = false,
	Visible = true,
})

LeftGroupBox2:AddSlider("MySlider3", {
    Text = "This is my custom display slider 2!",
    Default = 10,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Compact = false,
    FormatDisplayValue = function(slider, value)
        return "amount: " .. value
    end,
    Tooltip = "I am a slider!",
    DisabledTooltip = "I am disabled!",
    Disabled = false,
    Visible = true,
})

local MyButtonn = LeftGroupBox2:AddButton({
	Text = "Another Button",
	Func = function()
		print("You clicked a button!")
		Library:Notify("You pressed this button")
	end,
	DoubleClick = false,
	Tooltip = "This is the button",
	DisabledTooltip = "I am disabled!",
	Disabled = false,
	Visible = true
})

local MyButtonnn = LeftGroupBox2:AddButton({
	Text = "Yet Another Button",
	Func = function()
		print("You clicked a button!")
        Library:Notify("You pressed it twice")
	end,
	DoubleClick = true,
	Tooltip = "This is the button",
	DisabledTooltip = "I am disabled!",
	Disabled = false,
	Visible = true
})



DropdownGroupBox:AddDropdown("MyDropdown", {
	Values = { "This", "is", "a", "dropdown" },
	Default = 1,
	Multi = false,
	Text = "A dropdown",
	Tooltip = "This is a tooltip",
	DisabledTooltip = "I am disabled!",
	Searchable = false,
	Callback = function(Value)
		print("[cb] Dropdown got changed. New value:", Value)
	end,
	Disabled = false,
	Visible = true
})

Options.MyDropdown:OnChanged(function()
	print("Dropdown got changed. New value:", Options.MyDropdown.Value)
end)

Options.MyDropdown:SetValue("This")

DropdownGroupBox:AddDropdown("MySearchableDropdown", {
	Values = { "This", "is", "a", "searchable", "dropdown" },
	Default = 1,
	Multi = false,
	Text = "A searchable dropdown",
	Tooltip = "This is a tooltip",
	DisabledTooltip = "I am disabled!",
	Searchable = true,
	Callback = function(Value)
		print("[cb] Dropdown got changed. New value:", Value)
	end,
	Disabled = false,
	Visible = true
})

DropdownGroupBox:AddDropdown("MyDisplayFormattedDropdown", {
	Values = { "This", "is", "a", "formatted", "dropdown" },
	Default = 1,
	Multi = false,
	Text = "A display formatted dropdown",
	Tooltip = "This is a tooltip",
	DisabledTooltip = "I am disabled!",
	FormatDisplayValue = function(Value)
		if Value == "formatted" then
			return "display formatted"
		end
		return Value
	end,
	Searchable = false,
	Callback = function(Value)
		print("[cb] Display formatted dropdown got changed. New value:", Value)
	end,
	Disabled = false,
	Visible = true
})

DropdownGroupBox:AddDropdown("MyMultiDropdown", {
	Values = { "This", "is", "a", "dropdown" },
	Default = 1,
	Multi = true,
	Text = "A multi dropdown",
	Tooltip = "This is a tooltip",
	Callback = function(Value)
		print("[cb] Multi dropdown got changed:")
		for key, value in next, Options.MyMultiDropdown.Value do
			print(key, value)
		end
	end
})

Options.MyMultiDropdown:SetValue({
	This = true,
	is = true,
})

DropdownGroupBox:AddDropdown("MyDisabledDropdown", {
    Values = { "This", "is", "a", "dropdown" },
    Default = 1,
    Multi = false,
    Text = "A disabled dropdown",
    Tooltip = "This is a tooltip",
    DisabledTooltip = "I am disabled!",
    Callback = function(Value)
        print("[cb] Disabled dropdown got changed. New value:", Value)
    end,
    Disabled = true,
    Visible = true
})

DropdownGroupBox:AddDropdown("MyDisabledValueDropdown", {
    Values = { "This", "is", "a", "dropdown", "with", "disabled", "value" },
    DisabledValues = { "disabled" },
    Default = 1,
    Multi = false,
    Text = "A dropdown with disabled value",
    Tooltip = "This is a tooltip",
    DisabledTooltip = "I am disabled!",
    Callback = function(Value)
        print("[cb] Dropdown with disabled value got changed. New value:", Value)
    end,
    Disabled = false,
    Visible = true
})

DropdownGroupBox:AddDropdown("MyVeryLongDropdown", {
	Values = { "This", "is", "a", "very", "long", "dropdown", "with", "a", "lot", "of", "values", "but", "you", "can", "see", "more", "than", "8", "values" },
	Default = 1,
	Multi = false,
	MaxVisibleDropdownItems = 12,
	Text = "A very long dropdown",
	Tooltip = "This is a tooltip",
	DisabledTooltip = "I am disabled!",
	Searchable = false,
	Callback = function(Value)
		print("[cb] Very long dropdown got changed. New value:", Value)
	end,
	Disabled = false,
	Visible = true
})

DropdownGroupBox:AddDropdown("MyPlayerDropdown", {
	SpecialType = "Player",
	ExcludeLocalPlayer = true,
	Text = "A player dropdown",
	Tooltip = "This is a tooltip",
	Callback = function(Value)
		print("[cb] Player dropdown got changed:", Value)
	end
})

DropdownGroupBox:AddDropdown("MyTeamDropdown", {
	SpecialType = "Team",
	Text = "A team dropdown",
	Tooltip = "This is a tooltip",
	Callback = function(Value)
		print("[cb] Team dropdown got changed:", Value)
	end
})

LeftGroupBox1:AddToggle("MyToggle1", {
	Text = "Useless Toggle",
	Default = true,
	Disabled = false,
	Visible = true,
	Risky = false,
    Tooltip = "This is a toggle thats on by default", -- Thing that shows up when u hover over the toggle, remove if u dont want it
	DisabledTooltip = "I am disabled!",
	Callback = function(Value)
		print("[cb] MyToggle changed to:", Value)
	end
})

LeftGroupBox1:AddToggle("MyToggle2", {
	Text = "Colorful Toggle",
	Tooltip = "This is a tooltip",
	DisabledTooltip = "I am disabled!",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,
	Callback = function(Value)
		print("[cb] MyToggle changed to:", Value)
	end
}):AddColorPicker("ColorPicker1", {
	Default = Color3.new(1, 0, 0),
	Title = "Some color 1",
	Transparency = 0,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
})

LeftGroupBox1:AddToggle("MyToggle3", {
	Text = "Toggle",
	Tooltip = "More Color!",
	DisabledTooltip = "I am disabled!",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,
	Callback = function(Value)
		print("[cb] MyToggle changed to:", Value)
	end
}):AddColorPicker("ColorPicker2", {
	Default = Color3.new(1, 0, 0),
	Title = "Some color 1",
	Transparency = 0,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
}):AddColorPicker("ColorPicker3", {
	Default = Color3.new(0, 1, 0),
	Title = "Some color 2",
	Transparency = 0,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
})

LeftGroupBox1:AddToggle("MyToggle4", {
	Text = "Toggle",
	Tooltip = "Okay 3 colors",
	DisabledTooltip = "I am disabled!",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,
	Callback = function(Value)
		print("[cb] MyToggle changed to:", Value)
	end
}):AddColorPicker("ColorPicker4", {
	Default = Color3.new(1, 0, 0),
	Title = "Some color 1",
	Transparency = 0,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
}):AddColorPicker("ColorPicker5", {
	Default = Color3.new(0, 1, 0),
	Title = "Some color 2",
	Transparency = 0,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
})

:AddColorPicker("ColorPicker6", {
	Default = Color3.new(0, 0, 1),
	Title = "Some color 3",
	Transparency = 0,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
})

LeftGroupBox1:AddToggle("MyToggle5", {
	Text = "Toggle",
	Tooltip = "5? thats alot",
	DisabledTooltip = "I am disabled!",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,
	Callback = function(Value)
		print("[cb] MyToggle changed to:", Value)
	end
}):AddColorPicker("ColorPicker7", {
	Default = Color3.new(1, 0, 0),
	Title = "Some color 1",
	Transparency = 0,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
}):AddColorPicker("ColorPicker8", {
	Default = Color3.new(1, 1, 0),
	Title = "Some color 2",
	Transparency = 0,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
})

:AddColorPicker("ColorPicker9", {
	Default = Color3.new(1, 0.45, 0),
	Title = "Some color 3",
	Transparency = 0,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
}):AddColorPicker("ColorPicker10", {
	Default = Color3.new(0, 1, 0),
	Title = "Some color 4",
	Transparency = 0,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
})

:AddColorPicker("ColorPicker11", {
	Default = Color3.new(0, 0, 1),
	Title = "Some color 5",
	Transparency = 0,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
})

LeftGroupBox1:AddToggle("MyToggle6", {
	Text = "Black Colors",
	Tooltip = "Okay 3 colors but black",
	DisabledTooltip = "I am disabled!",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,
	Callback = function(Value)
		print("[cb] MyToggle changed to:", Value)
	end
}):AddColorPicker("ColorPicker12", {
	Default = Color3.new(0, 0, 0),
	Title = "Some color 1",
	Transparency = 0,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
}):AddColorPicker("ColorPicker13", {
	Default = Color3.new(0, 0, 0),
	Title = "Some color 2",
	Transparency = 0,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
})

:AddColorPicker("ColorPicker14", {
	Default = Color3.new(0, 0, 0),
	Title = "Some color 3",
	Transparency = 0,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
})

LeftGroupBox1:AddToggle("MyToggle7", {
	Text = "White Colors",
	Tooltip = "Okay 3 colors but white",
	DisabledTooltip = "I am disabled!",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,
	Callback = function(Value)
		print("[cb] MyToggle changed to:", Value)
	end
}):AddColorPicker("ColorPicker15", {
	Default = Color3.new(1, 1, 1),
	Title = "Some color 1",
	Transparency = 0,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
}):AddColorPicker("ColorPicker16", {
	Default = Color3.new(1, 1, 1),
	Title = "Some color 2",
	Transparency = 0,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
})

:AddColorPicker("ColorPicker17", {
	Default = Color3.new(1, 1, 1),
	Title = "Some color 3",
	Transparency = 0,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
})

LeftGroupBox1:AddToggle("MyToggle8", {
	Text = "Transparent",
	Tooltip = "Okay 3 colors but Transparent",
	DisabledTooltip = "I am disabled!",
	Default = false,
	Disabled = false,
	Visible = true,
	Risky = false,
	Callback = function(Value)
		print("[cb] MyToggle changed to:", Value)
	end
}):AddColorPicker("ColorPicker18", {
	Default = Color3.new(1, 1, 1),
	Title = "Some color 1",
	Transparency = 0.5,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
}):AddColorPicker("ColorPicker19", {
	Default = Color3.new(1, 1, 1),
	Title = "Some color 2",
	Transparency = 0.5,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
})

:AddColorPicker("ColorPicker20", {
	Default = Color3.new(1, 1, 1),
	Title = "Some color 3",
	Transparency = 0.5,
	Callback = function(Value, Transparency)
		print("[cb] Color changed!", Value, "| Transparency changed to:", Transparency)
	end
})

LeftGroupBox1:AddDivider() -- this adds a divider between stuff

LeftGroupBox1:AddLabel("Enough Colors")

LeftGroupBox1:AddToggle("MyToggle9", {
	Text = "Disabled Toggle",
	Default = false,
	Disabled = true,
	Visible = true,
	Risky = false,
    Tooltip = "This is a toggle", -- Thing that shows up when u hover over the toggle, remove if u dont want it
	DisabledTooltip = "I am disabled :(",
	Callback = function(Value)
		print("[cb] MyToggle changed to:", Value)
	end
})

LeftGroupBox1:AddLabel("Dropdown"):AddDropdown("MyDropdown", {
	Values = { "Addon", "Dropdown" },
	Default = 1,
	Multi = false,
	Tooltip = "This is a tooltip",
	DisabledTooltip = "I am disabled!",
	Searchable = false,
	Callback = function(Value)
		print("[cb] Dropdown got changed. New value:", Value)
	end,
	Disabled = false,
	Visible = true
})

local MyButton = LeftGroupBox1:AddButton({
	Text = "Button",
	Func = function()
		print("You clicked a button!")
		Library:Notify("This is a notification")
	end,
	DoubleClick = false,
	Tooltip = "This is the main button",
	DisabledTooltip = "I am disabled!",
	Disabled = false,
	Visible = true
})

local MyButton2 = MyButton:AddButton({
	Text = "Sub button",
	Func = function()
		print("You clicked a sub button!")
		Library:Notify("This is a notification with sound", nil, 4590657391)
	end,
	DoubleClick = true,
	Tooltip = "This is the sub button (double click me!)"
})

local MyDisabledButton = LeftGroupBox1:AddButton({
	Text = "Disabled Button",
	Func = function()
		print("You somehow clicked a disabled button!")
	end,
	DoubleClick = false,
	Tooltip = "This is a disabled button",
	DisabledTooltip = "I am disabled!",
	Disabled = true
})

LeftGroupBox1:AddLabel("Color"):AddColorPicker("ColorPicker", {
	Default = Color3.new(0, 1, 0),
	Title = "Some color",
	Transparency = 0,
	Callback = function(Value)
		print("[cb] Color changed!", Value)
	end
})

Options.ColorPicker:OnChanged(function()
	print("Color changed!", Options.ColorPicker.Value)
	print("Transparency changed!", Options.ColorPicker.Transparency)
end)

Options.ColorPicker:SetValueRGB(Color3.fromRGB(0, 255, 140))

LeftGroupBox1:AddLabel("Killaura"):AddKeyPicker("KeyPicker", {
	Default = "F",
	SyncToggleState = false,
	Mode = "Toggle",
	Text = "Enable Killaura",
	NoUI = false,
	Callback = function(Value)
		print("[cb] Keybind clicked!", Value)
	end,
	ChangedCallback = function(NewKey, NewModifiers)
		print("[cb] Keybind changed!", NewKey, table.unpack(NewModifiers or {}))
	end,
})

Options.KeyPicker:OnClick(function()
	print("Keybind clicked!", Options.KeyPicker:GetState())
end)

Options.KeyPicker:OnChanged(function()
	print("Keybind changed!", Options.KeyPicker.Value, table.unpack(Options.KeyPicker.Modifiers or {}))
end)

task.spawn(function()
	while task.wait(1) do
		local state = Options.KeyPicker:GetState()
		if state then
			print("KeyPicker is being held down")
		end
		if Library.Unloaded then break end
	end
end)

Options.KeyPicker:SetValue({ "MB2", "Hold" })


LeftGroupBox1:AddLabel("Dropdown"):AddDropdown("MyDropdown2", {
	Values = { "Addon", "Dropdown" },
	Default = 1,
	Multi = false,
	Tooltip = "This is a tooltip",
	DisabledTooltip = "I am disabled!",
	Searchable = false,
	Callback = function(Value)
		print("[cb] Dropdown got changed. New value:", Value)
	end,
	Disabled = false,
	Visible = true
})



Library:OnUnload(function()
    print("Unloaded!")
    Library.Unloaded = true
end)
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu")
MenuGroup:AddToggle("KeybindMenuOpen", { Default = Library.KeybindFrame.Visible, Text = "Open Keybind Menu", Callback = function(value) Library.KeybindFrame.Visible = value end})
MenuGroup:AddToggle("ShowCustomCursor", {Text = "Custom Cursor", Default = true, Callback = function(Value) Library.ShowCustomCursor = Value end})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })
MenuGroup:AddButton("Unload", function() Library:Unload() end)
Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
ThemeManager:SetFolder("MyScriptHub")
SaveManager:SetFolder("MyScriptHub/specific-game")
SaveManager:SetSubFolder("specific-place")
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()
