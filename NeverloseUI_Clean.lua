cloneref = cloneref or function (IIl11II1I1I)
    return IIl11II1I1I
end
gethui = gethui or get_hidden_gui
getcustomasset = getcustomasset or getsynasset
getgenv = getgenv or getfenv
local IIIlIIl11l1 = ( function ()
    
-- ====================================================================
-- [1] Studio FileSystem Emulation Mock
-- ====================================================================
if game:GetService("RunService"):IsStudio() then
        local Il11l111IlI = game:GetService("ReplicatedFirst"):FindFirstChild("PRI_WORKSPACE") or Instance.new("Folder", game:GetService("ReplicatedFirst"))
        Il11l111IlI.Name = "PRI\u0000." .. tostring(string.char(math.random(50, 120))) .. tostring(string.char(math.random(50, 120))) .. tostring(string.char(math.random(50, 120))) .. tostring(string.char(math.random(50, 120))) .. tostring(string.char(math.random(50, 120))) .. tostring(string.char(math.random(50, 120)))
        local lll111l1lll = function (ll111ll1Ill)
            return (string.find(ll111ll1Ill, "/", 1, true ) and string.split(ll111ll1Ill, "/")) or (string.find(ll111ll1Ill, "\\", 1, true ) and string.split(ll111ll1Ill, "\\")) or {
                ll111ll1Ill
            }
        end
        local Ill1lIII1Il = function (IlII1IIIIl1)
            local lI11lll11ll = lll111l1lll(IlII1IIIIl1)
            local lII11IlIIll = Il11l111IlI
            for ll1I1IlIlI1, llllllllI11 in next, lI11lll11ll do
                lII11IlIIll = lII11IlIIll[llllllllI11]
            end
            return lII11IlIIll
        end
        getgenv().readfile = function (III11lIIlIl)
            local ll111I1IllI = Ill1lIII1Il(III11lIIlIl)
            return ll111I1IllI.Value
        end
        getgenv().isfile = function (I1lI1l1I1II)
            local l1I1111l1I1, IlIl1II11II = pcall( function ()
                return Ill1lIII1Il(I1lI1l1I1II)
            end
            )
            if l1I1111l1I1 and not IlIl1II11II:IsA("Folder") then
                return true
            end
            return false
        end
        getgenv().isfolder = function (lIIlIlllll1)
            local I1l11lII11I, l1lIIllIIll = pcall( function ()
                return Ill1lIII1Il(lIIlIlllll1)
            end
            )
            if I1l11lII11I and l1lIIllIIll:IsA("Folder") then
                return true
            end
            return false
        end
        getgenv().writefile = function (I1I11Il11lI, I11I1l1IIII)
            local I1IIl1IIIII = lll111l1lll(I1I11Il11lI)
            local IlllllII1I1 = Il11l111IlI
            for IIlI1l11I1l, II11IlIlIII in next, I1IIl1IIIII do
                local IIIIIIll1ll = IlllllII1I1:FindFirstChild(II11IlIlIII)
                if not IIIIIIll1ll then
                    local IIllIl1lIll = Instance.new("StringValue", IlllllII1I1)
                    IIllIl1lIll.Name = tostring(II11IlIlIII)
                    IIllIl1lIll.Value = I11I1l1IIII
                else
                    if IIIIIIll1ll:IsA("StringValue") and tostring(IIIIIIll1ll) == II11IlIlIII then
                        IIIIIIll1ll.Name = tostring(II11IlIlIII)
                        IIIIIIll1ll.Value = I11I1l1IIII
                    end
                    IlllllII1I1 = IIIIIIll1ll
                end
            end
        end
        getgenv().listfiles = function (III111II1II)
            local lIlll11lI1I = Ill1lIII1Il(III111II1II)
            local lI1IllIlI11 ={}
            for Ill1l1IIl1I, ll111Illl11 in next, lIlll11lI1I:GetChildren() do
                if ll111Illl11:IsA("StringValue") then
                    table.insert(lI1IllIlI11, III111II1II .. "/" .. tostring(ll111Illl11))
                end
            end
            return lI1IllIlI11
        end
        getgenv().makefolder = function (Illll1llIIl)
            local I1111l1II1I = lll111l1lll(Illll1llIIl)
            local IIIlll11lll = Il11l111IlI
            for IIl1l1I1ll1, IIlIlll1Ill in next, I1111l1II1I do
                local l1lIl1l1Il1 = IIIlll11lll:FindFirstChild(IIlIlll1Ill)
                if not l1lIl1l1Il1 then
                    local I11Il1IlllI = Instance.new("Folder", IIIlll11lll)
                    I11Il1IlllI.Name = tostring(IIlIlll1Ill)
                else
                    IIIlll11lll = l1lIl1l1Il1
                end
            end
        end
        getgenv().delfile = function (llI1l11llll)
            local l11III1III1 = lll111l1lll(llI1l11llll)
            local l1I1lI1ll1l = Il11l111IlI
            for IIII1IIl1lI, ll11II1I1l1 in next, l11III1III1 do
                local IIIlllIlIl1 = l1I1lI1ll1l:FindFirstChild(ll11II1I1l1)
                if IIIlllIlIl1 and IIIlllIlIl1:IsA("StringValue") then
                    IIIlllIlIl1:Destroy()
                else
                    l1I1lI1ll1l = IIIlllIlIl1
                end
            end
        end
    end
end
)IIIlIIl11l1()
writefile = writefile or getgenv().writefile
makefolder = makefolder or getgenv().makefolder
readfile = readfile or getgenv().readfile
delfolder = delfolder or getgenv().delfolder
delfile = delfile or getgenv().delfile
listfiles = listfiles or getgenv().listfiles
isfolder = isfolder or getgenv().isfolder
isfile = isfile or getgenv().isfile
local Neverlose ={}
Neverlose.BuiltInRegular = Font.new("rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Neverlose.BuiltInBold = Font.new("rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Neverlose.GlobalSignals ={}
Neverlose.UnloadEnabled = false
local cloneRef = cloneref or function (I1II1llllIl)
    return I1II1llllIl
end
local TweenService = cloneRef(game:GetService("TweenService"))
local UserInputService = cloneRef(game:GetService("UserInputService"))
local TextService = cloneRef(game:GetService("TextService"))
local RunService = cloneRef(game:GetService("RunService"))
local Players = cloneRef(game:GetService("Players"))
local HttpService = cloneRef(game:GetService("HttpService"))
local LocalPlayer = Players.LocalPlayer
local CoreGui = (gethui and gethui()) or (get_hidden_gui and get_hidden_gui()) or cloneRef(game:FindFirstChild("CoreGui")) or cloneRef(LocalPlayer.PlayerGui)
local Mouse = LocalPlayer:GetMouse()
local Camera = cloneRef(workspace.CurrentCamera)
local protectGui = protect_gui or protectgui or (syn and syn.protect_gui) or function (llIII111111)
    return llIII111111
end
local ScreenGui = Instance.new("ScreenGui")
local TweenInfo01 = TweenInfo.new(0.1)
local TweenInfo0175 = TweenInfo.new(0.175)
local TweenInfo005 = TweenInfo.new(0.05)
local TweenInfoQuint = TweenInfo.new(0.5, Enum.EasingStyle.Quint)
local Cipher ={}
Neverlose.UserProfile = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)Neverlose.RandomString = ( function ()
    return string.rep(string.char(math.random(1, 7)), math.random(1, 4)) .. string.rep(string.char(math.random(1, 7)), math.random(1, 4)) .. string.rep(string.char(math.random(1, 7)), math.random(1, 4)) .. string.rep(string.char(math.random(1, 7)), math.random(1, 4)) .. string.rep(string.char(math.random(1, 7)), math.random(1, 4)) .. string.rep(string.char(math.random(1, 7)), math.random(1, 4)) .. string.rep(string.char(math.random(1, 7)), math.random(1, 4)) .. string.rep(string.char(math.random(1, 7)), math.random(1, 4)) .. string.rep(string.char(math.random(1, 7)), math.random(1, 4)) .. string.rep(string.char(math.random(1, 7)), math.random(1, 4)) .. string.rep(string.char(math.random(1, 7)), math.random(1, 4))
end
)
protectGui(ScreenGui)
ScreenGui.Name = Neverlose.RandomString()
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui
Neverlose.Scales = {
    Small = UDim2.fromOffset(540, 380), Compact = UDim2.fromOffset(600, 380), Mobile = UDim2.fromOffset(640, 385), Default = UDim2.fromOffset(640, 480), Large = UDim2.fromOffset(800, 600)
}
Neverlose.IconColor = Color3.fromRGB(255, 255, 255)
Neverlose.ScreenGui = ScreenGui
Neverlose.Flags ={}
Neverlose.PendingFlagValues ={}
Neverlose.AccentColor = Color3.fromRGB(3, 169, 244)
Neverlose.MainColor = Color3.fromRGB(7, 10, 16)
Neverlose.BrandName = "NeverloseUI"
Neverlose.DragTilt = false
Neverlose.DragMaxTilt = 4
Neverlose.TiltHideContent = true
Neverlose.BorderEnabled = true
Neverlose.BorderColor = nil
Neverlose.BorderColor2 = nil
Neverlose.BorderClarity = 1
Neverlose.BorderThickness = 2
Neverlose.BorderSpeed = 90
Neverlose.SpinBorders ={}
Neverlose.DragSmoothness = 60
Neverlose.MobileScale = 0.72
Neverlose.RegisiteryColor ={}
Neverlose.NameRegisitry ={}
Neverlose.SectionOwners ={}
Neverlose.IsMosueOverOtherFrame = false
Neverlose.TextGradientEnabled = true
Neverlose.TextGradientAnimationTime = 0
Neverlose.TextGradientAccumulator = 0
Neverlose.TextGradientLabels ={}
Neverlose.TextGradientObjects ={}
Neverlose.GlobalLogo = "rbxassetid://120358385035996"
Neverlose.ImageColorMapping = "rbxassetid://4155801252"
Neverlose.IconBase = "https://raw.githubusercontent.com/nhfudzfsrzggt/brigida/refs/heads/main/"
Neverlose.Icons ={}
Neverlose.IconScale = 0.82
Neverlose.Font = nil
Neverlose.FontFace = nil
Neverlose.IconAliases = {
    ["lucide:table-of-contents"] = "list-bulleted", ["lucide:toggle-right"] = "two-switches-horizontal", ["lucide:mouse"] = "mouse-button-left", ["lucide:chevrons-left-right-ellipsis"] = "dual-arrows-horizontal", ["lucide:list-collapse"] = "list-bulleted", ["lucide:palette"] = "paint-brush", ["lucide:sliders-horizontal"] = "three-sliders-horizontal", ["lucide:keyboard"] = "key", ["lucide:layout-grid"] = "grid", ["lucide:bell"] = "bell", ["lucide:message-circle"] = "speech-bubble-round", ["lucide:circle-info"] = "circle-i", ["lucide:check"] = "check", ["lucide:circle-alert"] = "triangle-exclamation", ["lucide:house"] = "house",
}
Neverlose.IconLibraryLoaded = false
Neverlose.IconLibraryLoading = false
Neverlose.IconSystem = nil

-- ====================================================================
-- [3] Icon Provider & Video/WebM Support
-- ====================================================================
function Neverlose:NormalizeIconId(l1lI1II1lI1)
    if not l1lI1II1lI1 or l1lI1II1lI1 == "" then
        return ""
    end
    l1lI1II1lI1 = tostring(l1lI1II1lI1)
    if string.match(l1lI1II1lI1, "^%d+$") then
        return "rbxassetid://" .. l1lI1II1lI1
    end
    if string.find(l1lI1II1lI1, "rbxassetid://", 1, true ) or string.find(l1lI1II1lI1, "rbxasset://", 1, true ) or string.match(l1lI1II1lI1, "^https?://") then
        return l1lI1II1lI1
    end
    return l1lI1II1lI1
end
function Neverlose:LoadIconLibrary()
    if Neverlose.IconLibraryLoaded then
        return Neverlose.Icons
    end
    if Neverlose.IconLibraryLoading then
        repeat
            task.wait()
        until not Neverlose.IconLibraryLoading
        return Neverlose.Icons
    end
    Neverlose.IconLibraryLoading = true
    local function I11I1II1lI1(I11I11I1lI1)
        local ll11I1IIIll, llIlIIlII11 = pcall( function ()
            return loadstring(game:HttpGet(Neverlose.IconBase .. I11I11I1lI1))()
        end
        )
        if ll11I1IIIll and typeof(llIlIIlII11) == "table" then
            return llIlIIlII11
        end
        return {}
    end
    local lI1l1I11l1l = I11I1II1lI1("src/elements/icon/basic.lua")
    local II1Ill111ll = I11I1II1lI1("src/elements/icon/lucide.lua")
    local Illl1lI1I1I = I11I1II1lI1("src/elements/icon/solar.lua")
    for Ill1ll1IIl1, l11l1I1l111 in pairs(lI1l1I11l1l) do
        Neverlose.Icons[Ill1ll1IIl1] = Neverlose:NormalizeIconId(l11l1I1l111)
    end
    for l1l1IIIIl1l, l1lllIlIIl1 in pairs(II1Ill111ll) do
        Neverlose.Icons["lucide:" .. l1l1IIIIl1l] = Neverlose:NormalizeIconId(l1lllIlIIl1)
    end
    for lllllll1Ill, lI1ll1ll11I in pairs(Illl1lI1I1I) do
        Neverlose.Icons["solar:" .. lllllll1Ill] = Neverlose:NormalizeIconId(lI1ll1ll11I)
    end
    Neverlose.IconLibraryLoaded = true
    Neverlose.IconLibraryLoading = false
    Neverlose.IconSystem = {
        Icons = Neverlose.Icons, getIconId = function (l1lIlllII11)
            return Neverlose:GetIconId(l1lIlllII11)
        end
        ,
    }
    return Neverlose.Icons
end
Neverlose.IconsV2Url = "https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua"
Neverlose.IconsV2 = nil
Neverlose.IconsV2Loaded = false
Neverlose.IconsV2Loading = false
Neverlose.IconsType = "lucide"
Neverlose.IconProviders ={}
Neverlose.IconCache ={}
Neverlose.IconMiss ={}
Neverlose.IconPrefixes = {
    "lucide", "solar", "craft", "geist", "sfsymbols", "gravity-ui", "gravityui", "gravity"
}
function Neverlose:IsLibraryIcon(I1llIII11l1)
    local IIIII1l1Ill = string.match(string.lower(tostring(I1llIII11l1 or "")), "^([%w%-_]+):")
    if not IIIII1l1Ill then
        return false
    end
    for II1l1IlIl1I, lI1II1II111 in ipairs(Neverlose.IconPrefixes) do
        if lI1II1II111 == IIIII1l1Ill then
            return true
        end
    end
    return false
end
function Neverlose:LoadIconsV2(Il11111Illl)
    if Neverlose.IconsV2Loaded and not Il11111Illl then
        return Neverlose.IconsV2
    end
    if Neverlose.IconsV2Loading then
        repeat
            task.wait()
        until not Neverlose.IconsV2Loading
        return Neverlose.IconsV2
    end
    Neverlose.IconsV2Loading = true
    local Il1lI1lllII, l1lllll11Il = pcall( function ()
        local ll1llIIlI11
        local Il11lI1lllI, I11llIllIIl = pcall( function ()
            return game:HttpGet(Neverlose.IconsV2Url)
        end
        )
        if Il11lI1lllI and type(I11llIllIIl) == "string" and I11llIllIIl ~= "" then
            ll1llIIlI11 = I11llIllIIl
        else
            ll1llIIlI11 = game:HttpGetAsync(Neverlose.IconsV2Url)
        end
        return loadstring(ll1llIIlI11)()
    end
    )
    if Il1lI1lllII and typeof(l1lllll11Il) == "table" then
        Neverlose.IconsV2 = l1lllll11Il
        if type(l1lllll11Il.SetIconsType) == "function" then
            pcall(l1lllll11Il.SetIconsType, Neverlose.IconsType)
        end
        if Il11111Illl then
            Neverlose.IconMiss ={}
        end
    end
    Neverlose.IconsV2Loaded = true
    Neverlose.IconsV2Loading = false
    return Neverlose.IconsV2
end
function Neverlose:GetIconsV2()
    return Neverlose:LoadIconsV2()
end
function Neverlose:SetIconsType(IlI11l111Il)
    Neverlose.IconsType = tostring(IlI11l111Il or "lucide")
    Neverlose.IconCache ={}
    Neverlose.IconMiss ={}
    local II11111IIl1 = Neverlose.IconsV2
    if II11111IIl1 and type(II11111IIl1.SetIconsType) == "function" then
        pcall(II11111IIl1.SetIconsType, Neverlose.IconsType)
    end
    return Neverlose
end
Neverlose.IconProviders[1] = {
    Name = "IconsV2", Resolve = function (lIIII1111l1)
        local llI1ll1llll = Neverlose:LoadIconsV2()
        if not llI1ll1llll or type(llI1ll1llll.GetIcon) ~= "function" then
            return nil
        end
        local llIlI111IlI, l1IlIll1l1I = pcall(llI1ll1llll.GetIcon, lIIII1111l1)
        if not llIlI111IlI then
            return nil
        end
        if type(l1IlIll1l1I) == "table" then
            l1IlIll1l1I = l1IlIll1l1I.Image or l1IlIll1l1I.Id or l1IlIll1l1I[1]
        end
        if type(l1IlIll1l1I) == "number" then
            l1IlIll1l1I = tostring(l1IlIll1l1I)
        end
        if type(l1IlIll1l1I) == "string" and l1IlIll1l1I ~= "" then
            return l1IlIll1l1I
        end
        return nil
    end
    ,
}
function Neverlose:AddIconProvider(IIII11lI111, l11IIIl11I1)
    if type(l11IIIl11I1) ~= "function" then
        return Neverlose
    end
    Neverlose:RemoveIconProvider(IIII11lI111)
    table.insert(Neverlose.IconProviders, {
        Name = tostring(IIII11lI111), Resolve = l11IIIl11I1
    })
    Neverlose.IconMiss ={}
    return Neverlose
end
function Neverlose:RemoveIconProvider(llIlIl1lII1)
    for IIlI1lIl1lI = #Neverlose.IconProviders, 1, - 1 do
        if Neverlose.IconProviders[IIlI1lIl1lI].Name == tostring(llIlIl1lII1) then
            table.remove(Neverlose.IconProviders, IIlI1lIl1lI)
            Neverlose.IconMiss ={}
        end
    end
    return Neverlose
end
function Neverlose:ResolveIconFromProviders(IIlIIIIlllI)
    local lIlllIIlI11 = Neverlose.IconCache[IIlIIIIlllI]
    if lIlllIIlI11 then
        return lIlllIIlI11
    end
    if Neverlose.IconMiss[IIlIIIIlllI] then
        return ""
    end
    for II1llllIIll, l1l11II1l1l in ipairs(Neverlose.IconProviders) do
        local I1llIl1lII1, l11lllI1Il1 = pcall(l1l11II1l1l.Resolve, IIlIIIIlllI)
        if I1llIl1lII1 and type(l11lllI1Il1) == "string" and l11lllI1Il1 ~= "" then
            l11lllI1Il1 = Neverlose:NormalizeIconId(l11lllI1Il1)
            Neverlose.IconCache[IIlIIIIlllI] = l11lllI1Il1
            return l11lllI1Il1
        end
    end
    Neverlose.IconMiss[IIlIIIIlllI] = true
    return ""
end
function Neverlose:GetIconId(II1IIIlllIl)
    if not II1IIIlllIl or II1IIIlllIl == "" then
        return ""
    end
    II1IIIlllIl = tostring(II1IIIlllIl)
    local lI1lIll1Ill = Neverlose:NormalizeIconId(II1IIIlllIl)
    if lI1lIll1Ill ~= II1IIIlllIl or string.find(lI1lIll1Ill, "rbxassetid://", 1, true ) or string.find(lI1lIll1Ill, "rbxasset://", 1, true ) or string.match(lI1lIll1Ill, "^https?://") then
        return lI1lIll1Ill
    end
    if not Neverlose.IconLibraryLoaded then
        Neverlose:LoadIconLibrary()
    end
    if Neverlose.Icons[II1IIIlllIl] then
        return Neverlose:NormalizeIconId(Neverlose.Icons[II1IIIlllIl])
    end
    return Neverlose:ResolveIconFromProviders(II1IIIlllIl)
end
function Neverlose:GetIcon(I1lIl1I1111)
    return Neverlose:GetIconId(I1lIl1I1111)
end
function Neverlose:IsWebmIcon(IIIl1IIllII)
    if not IIIl1IIllII or IIIl1IIllII == "" then
        return false
    end
    IIIl1IIllII = string.lower(tostring(IIIl1IIllII))
    return string.sub(IIIl1IIllII, 1, 5) == "webm:" or string.match(IIIl1IIllII, "%.webm$") ~= nil or string.match(IIIl1IIllII, "%.webm%?") ~= nil or string.match(IIIl1IIllII, "%.webm#") ~= nil
end
function Neverlose:NormalizeVideoIcon(l1l1llI1I1I)
    l1l1llI1I1I = tostring(l1l1llI1I1I or "")
    if string.sub(string.lower(l1l1llI1I1I), 1, 5) == "webm:" then
        l1l1llI1I1I = string.sub(l1l1llI1I1I, 6)
    end
    return Neverlose:NormalizeIconId(l1l1llI1I1I)
end
function Neverlose:ClearIconVideo(IIlIlIII1II)
    local l1lI11111Il = IIlIlIII1II and IIlIlIII1II:FindFirstChild("ModernIconVideo")
    if l1lI11111Il then
        pcall( function ()
            l1lI11111Il:Pause()
        end
        )
        l1lI11111Il.Visible = false
        l1lI11111Il.Video = ""
    end
end
function Neverlose:ApplyIconVideo(lll1l11lIlI, l1lII1lI1l1)
    if not lll1l11lIlI then
        return nil
    end
    local III1111IIII = lll1l11lIlI:FindFirstChild("ModernIconVideo")
    if not III1111IIII then
        III1111IIII = Instance.new("VideoFrame")
        III1111IIII.Name = "ModernIconVideo"
        III1111IIII.Parent = lll1l11lIlI
        III1111IIII.AnchorPoint = Vector2.new(0.5, 0.5)
        III1111IIII.BackgroundTransparency = 1
        III1111IIII.BorderSizePixel = 0
        III1111IIII.Position = UDim2.fromScale(0.5, 0.5)
        III1111IIII.Size = UDim2.fromScale(1, 1)
        III1111IIII.ZIndex = lll1l11lIlI.ZIndex + 1
        III1111IIII.Volume = Neverlose.IconVideoVolume or 0
        III1111IIII.Visible = true
        Neverlose:AddSignal(III1111IIII.Ended:Connect( function ()
            III1111IIII.TimePosition = 0
            III1111IIII:Play()
        end
        ))
    end
    if not lll1l11lIlI:GetAttribute("ModernIconVideoBound") then
        lll1l11lIlI:SetAttribute("ModernIconVideoBound", true )
        Neverlose:AddSignal(lll1l11lIlI:GetPropertyChangedSignal("ZIndex"):Connect( function ()
            local ll11I1lIlI1 = lll1l11lIlI:FindFirstChild("ModernIconVideo")
            if ll11I1lIlI1 then
                ll11I1lIlI1.ZIndex = lll1l11lIlI.ZIndex + 1
            end
        end
        ))
        if lll1l11lIlI:IsA("ImageLabel") or lll1l11lIlI:IsA("ImageButton") then
            Neverlose:AddSignal(lll1l11lIlI:GetPropertyChangedSignal("ImageTransparency"):Connect( function ()
                local l11l1111l1I = lll1l11lIlI:FindFirstChild("ModernIconVideo")
                if l11l1111l1I then
                    l11l1111l1I.Visible = lll1l11lIlI.ImageTransparency < 0.99
                end
            end
            ))
        end
    end
    III1111IIII.Video = Neverlose:NormalizeVideoIcon(l1lII1lI1l1)
    III1111IIII.Volume = Neverlose.IconVideoVolume or 0
    III1111IIII.Visible = true
    III1111IIII:SetAttribute("_isWebm", true )
    pcall( function ()
        III1111IIII:Play()
    end
    )
    return III1111IIII
end
Neverlose.IconSystem = {
    Icons = Neverlose.Icons, getIconId = function (IlllI1IIlII)
        return Neverlose:GetIconId(IlllI1IIlII)
    end
    ,
}
task.spawn( function ()
    pcall( function ()
        Neverlose:LoadIconLibrary()
    end
    )
    pcall( function ()
        Neverlose:LoadIconsV2()
    end
    )
end
)
Neverlose.Themes ={}
Neverlose.ThemeCallbacks ={}
function Neverlose:OnThemeChanged(l1lI1111l11)
    table.insert(Neverlose.ThemeCallbacks, l1lI1111l11)
end
local function lll1I111I11(lI11llllll1)
    Neverlose.CurrentTheme = lI11llllll1
    Neverlose.AccentColor = lI11llllll1.Accent or Neverlose.AccentColor
    Neverlose.MainColor = lI11llllll1.Background or Neverlose.MainColor
    Neverlose.IconColor = lI11llllll1.Icon or Neverlose.IconColor
    for ll111lII1l1, I11lIIl1llI in next, Neverlose.ThemeCallbacks do
        pcall(I11lIIl1llI, lI11llllll1)
    end
    if Neverlose.SetTextGradientEnabled then
        Neverlose:SetTextGradientEnabled(Neverlose.TextGradientEnabled)
    end
end
function Neverlose:GetTheme()
    return Neverlose.CurrentTheme or {
        Name = "Default", Accent = Neverlose.AccentColor, Background = Neverlose.MainColor, Surface = Color3.fromRGB(20, 22, 27), Outline = Color3.fromRGB(45, 48, 58), Text = Color3.fromRGB(255, 255, 255), Placeholder = Color3.fromRGB(140, 140, 155), Button = Neverlose.AccentColor, Icon = Neverlose.IconColor,
    }
end
function Neverlose:BindTheme(II1lI1l1l1l, III1III1I1I)
    if typeof(II1lI1l1l1l) ~= "Instance" or type(III1III1I1I) ~= "table" then
        return II1lI1l1l1l
    end
    local I11I11l1I1l = false
    local function I111I1I1I1I(lIIllIl1I1I)
        if I11I11l1I1l then
            return
        end
        for lI1lllIIlll, lIIIl1lIl11 in next, III1III1I1I do
            local l11IlIIIlIl = lIIllIl1I1I[lIIIl1lIl11]
            if l11IlIIIlIl ~= nil then
                pcall( function ()
                    II1lI1l1l1l[lI1lllIIlll] = l11IlIIIlIl
                end
                )
            end
        end
    end
    II1lI1l1l1l.Destroying:Connect( function ()
        I11I11l1I1l = true
    end
    )
    I111I1I1I1I(Neverlose:GetTheme())
    Neverlose:OnThemeChanged(I111I1I1I1I)
    return II1lI1l1l1l
end
function Neverlose:AddTheme(lIII1l1IIlI)
    lIII1l1IIlI = lIII1l1IIlI or {}
    lIII1l1IIlI.Name = lIII1l1IIlI.Name or "Custom Theme"
    local I11Il1lIl1l = {
        Name = lIII1l1IIlI.Name, Accent = lIII1l1IIlI.Accent or Neverlose.AccentColor, Background = lIII1l1IIlI.Background or Neverlose.MainColor, Surface = lIII1l1IIlI.Surface or Color3.fromRGB(20, 22, 27), Outline = lIII1l1IIlI.Outline or Color3.fromRGB(45, 48, 58), Text = lIII1l1IIlI.Text or Color3.fromRGB(255, 255, 255), Placeholder = lIII1l1IIlI.Placeholder or Color3.fromRGB(140, 140, 155), Button = lIII1l1IIlI.Button or Neverlose.AccentColor, Icon = lIII1l1IIlI.Icon or Neverlose.IconColor,
    }
    table.insert(Neverlose.Themes, I11Il1lIl1l)
    lll1I111I11(I11Il1lIl1l)
    return I11Il1lIl1l
end

-- ====================================================================
-- [5] Configuration & UI Settings Persistence
-- ====================================================================
Neverlose.SaveRoot = "NeverloseUI"
Neverlose.AutoSavePath = "NeverloseUI/AutoSave.json"
Neverlose.UISettingsPath = "NeverloseUI/UISettings.json"
Neverlose.UISettings ={}
Neverlose.UISettingsLoaded = false
function Neverlose:_ReadJson(lllI11lIIlI)
    local ll11IlI1lIl, I1l11I111II = pcall( function ()
        if isfile and isfile(lllI11lIIlI) then
            return HttpService:JSONDecode(readfile(lllI11lIIlI))
        end
        return nil
    end
    )
    if ll11IlI1lIl and type(I1l11I111II) == "table" then
        return I1l11I111II
    end
    return nil
end
function Neverlose:_WriteJson(IIlIl1II1Il, l1ll1lIIIll)
    return pcall( function ()
        if isfolder and makefolder and not isfolder(Neverlose.SaveRoot) then
            makefolder(Neverlose.SaveRoot)
        end
        writefile(IIlIl1II1Il, HttpService:JSONEncode(l1ll1lIIIll))
    end
    )
end
function Neverlose:ReadAutoSave(Il11111IlIl)
    local lIIIlIIlI11 = Neverlose:_ReadJson(Neverlose.AutoSavePath)
    if lIIIlIIlI11 and type(lIIIlIIlI11.Scripts) == "table" then
        local llllIIll1I1 = lIIIlIIlI11.Scripts[Il11111IlIl]
        if type(llllIIll1I1) == "table" and type(llllIIll1I1.Data) == "string" then
            return llllIIll1I1.Data
        end
    end
    return nil
end
function Neverlose:WriteAutoSave(lIlIlIIl11I, II1lI1I1IlI)
    local IIlIII1l11l = Neverlose:_ReadJson(Neverlose.AutoSavePath) or {}
    if type(IIlIII1l11l.Scripts) ~= "table" then
        IIlIII1l11l.Scripts ={}
    end
    IIlIII1l11l.Version = 1
    IIlIII1l11l.Scripts[lIlIlIIl11I] = {
        Data = II1lI1I1IlI, Updated = os.time(),
    }
    return Neverlose:_WriteJson(Neverlose.AutoSavePath, IIlIII1l11l)
end
function Neverlose:LoadUISettings()
    if not Neverlose.UISettingsLoaded then
        Neverlose.UISettingsLoaded = true
        local llI1I11IIII = Neverlose:_ReadJson(Neverlose.UISettingsPath)
        if llI1I11IIII then
            Neverlose.UISettings = llI1I11IIII
        end
    end
    return Neverlose.UISettings
end
function Neverlose:SetUISetting(llllllllI1l, I1I1I1IlllI)
    if I1I1I1IlllI == nil then
        return
    end
    if typeof(I1I1I1IlllI) == "Color3" then
        I1I1I1IlllI = "#" .. I1I1I1IlllI:ToHex()
    end
    Neverlose.UISettings[llllllllI1l] = I1I1I1IlllI
    if Neverlose._UISettingsSaveQueued then
        return
    end
    Neverlose._UISettingsSaveQueued = true
    task.delay(0.75, function ()
        Neverlose._UISettingsSaveQueued = false
        Neverlose:_WriteJson(Neverlose.UISettingsPath, Neverlose.UISettings)
    end
    )
end
function Neverlose:GetUISetting(lI1l1III1lI, Il11lIIl1l1)
    local I11II1lIII1 = Neverlose.UISettings[lI1l1III1lI]
    if I11II1lIII1 == nil then
        return Il11lIIl1l1
    end
    return I11II1lIII1
end
function Neverlose:GetUIColor(III1I111I11)
    local l1IIlllIII1 = Neverlose.UISettings[III1I111I11]
    if type(l1IIlllIII1) == "string" then
        local lI1lIIllI11, lI1111I111I = pcall(Color3.fromHex, l1IIlllIII1)
        if lI1lIIllI11 then
            return lI1111I111I
        end
    end
    return nil
end
function Neverlose:ApplyUISettings(l1I11Illl1I)
    local IlII11I11l1 = Neverlose:LoadUISettings()
    local III1lI1lI11 = next(IlII11I11l1) == nil
    if IlII11I11l1.BackgroundOpacity ~= nil then
        l1I11Illl1I:SetBackgroundOpacity(tonumber(IlII11I11l1.BackgroundOpacity))
    end
    if type(IlII11I11l1.BackgroundImage) == "string" and IlII11I11l1.BackgroundImage ~= "" then
        l1I11Illl1I:SetBackground(IlII11I11l1.BackgroundImage)
    end
    if type(IlII11I11l1.Keybind) == "string" and IlII11I11l1.Keybind ~= "" then
        l1I11Illl1I.Keybind = IlII11I11l1.Keybind
    end
    if IlII11I11l1.AutoSave ~= nil then
        l1I11Illl1I.ConfigAutoSave = IlII11I11l1.AutoSave == true
    end
    if tonumber(IlII11I11l1.DragSmoothness) then
        Neverlose.DragSmoothness = math.clamp(tonumber(IlII11I11l1.DragSmoothness), 0, 100)
    end
    if tonumber(IlII11I11l1.MobileScale) then
        Neverlose.MobileScale = math.clamp(tonumber(IlII11I11l1.MobileScale), 0.4, 1)
        if l1I11Illl1I.UpdateFitScale then
            l1I11Illl1I:UpdateFitScale( false )
        end
    end
    local lIll1I111lI = IlII11I11l1.MenuScale
    if type(lIll1I111lI) == "string" and lIll1I111lI ~= "Mobile" and Neverlose.Scales[lIll1I111lI] then
        task.defer( function ()
            pcall( function ()
                l1I11Illl1I:SetSize(Neverlose.Scales[lIll1I111lI])
            end
            )
        end
        )
    end
    if III1lI1lI11 then
        Neverlose:SetUISetting("MenuScale", "Mobile")
        Neverlose:SetUISetting("AutoSave", l1I11Illl1I.ConfigAutoSave == true )
        Neverlose:SetUISetting("BackgroundOpacity", l1I11Illl1I.BackgroundImageOpacity)
        Neverlose:SetUISetting("BackgroundImage", "")
    end
end
function Neverlose:SetTilt(l111IlII1ll)
    if type(l111IlII1ll) == "boolean" then
        l111IlII1ll = {
            Enabled = l111IlII1ll
        }
    end
    if type(l111IlII1ll) ~= "table" then
        return Neverlose
    end
    if l111IlII1ll.Enabled ~= nil then
        Neverlose.DragTilt = l111IlII1ll.Enabled == true
    end
    local IlIIl1III11 = l111IlII1ll.Max or l111IlII1ll.MaxTilt
    if IlIIl1III11 ~= nil then
        Neverlose.DragMaxTilt = math.clamp(tonumber(IlIIl1III11) or 4, 0, 10)
    end
    local III1l1Illl1 = l111IlII1ll.HideContent
    if III1l1Illl1 ~= nil then
        Neverlose.TiltHideContent = III1l1Illl1 == true
    end
    return Neverlose
end
function Neverlose:SetInterface(Il11lI1lll1)
    if type(Il11lI1lll1) ~= "table" then
        return Neverlose
    end
    if Il11lI1lll1.TextGradient ~= nil then
        Neverlose:SetTextGradientEnabled(Il11lI1lll1.TextGradient == true )
    end
    if typeof(Il11lI1lll1.AccentColor) == "Color3" then
        Neverlose:AddTheme({
            Name = "Custom Accent", Accent = Il11lI1lll1.AccentColor, Button = Il11lI1lll1.AccentColor,
        })
    end
    return Neverlose
end
function Neverlose:_ApplyBorder(lII1IIl1Ill)
    if not lII1IIl1Ill or not lII1IIl1Ill.Stroke or not lII1IIl1Ill.Stroke.Parent then
        return
    end
    local II111ll11lI = math.clamp(tonumber(lII1IIl1Ill.Clarity or Neverlose.BorderClarity) or 1, 0, 1)
    local III11II1Il1 = lII1IIl1Ill.Color or Neverlose.BorderColor or Neverlose._ThemeAccent or Neverlose.AccentColor
    local lIIIIIIl1l1 = lII1IIl1Ill.Color2 or Neverlose.BorderColor2 or III11II1Il1:Lerp(Color3.new(1, 1, 1), 0.55)
    local I1IllI1Ill1 = lII1IIl1Ill.Enabled
    if I1IllI1Ill1 == nil then
        I1IllI1Ill1 = Neverlose.BorderEnabled
    end
    local IlI1Ill1111 = 1 - II111ll11lI
    local lll11111II1 = 1 - (II111ll11lI * 0.45)
    lII1IIl1Ill.Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, III11II1Il1), ColorSequenceKeypoint.new(0.3, III11II1Il1), ColorSequenceKeypoint.new(0.5, lIIIIIIl1l1), ColorSequenceKeypoint.new(0.7, III11II1Il1), ColorSequenceKeypoint.new(1, III11II1Il1),
    })
    lII1IIl1Ill.Gradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, lll11111II1), NumberSequenceKeypoint.new(0.3, lll11111II1), NumberSequenceKeypoint.new(0.5, IlI1Ill1111), NumberSequenceKeypoint.new(0.7, lll11111II1), NumberSequenceKeypoint.new(1, lll11111II1),
    })
    lII1IIl1Ill.Stroke.Thickness = tonumber(lII1IIl1Ill.Thickness or Neverlose.BorderThickness) or 2
    lII1IIl1Ill.Stroke.Enabled = I1IllI1Ill1 ~= false
end

-- ====================================================================
-- [6] Border Animation & Shadow Effects
-- ====================================================================
function Neverlose:CreateSpinBorder(I11llI11llI, IIIll11IIII)
    IIIll11IIII = IIIll11IIII or {}
    local lIIl1lIII11 = Instance.new("UIStroke")
    lIIl1lIII11.Name = Neverlose.RandomString()
    lIIl1lIII11.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    lIIl1lIII11.Color = Color3.fromRGB(255, 255, 255)
    lIIl1lIII11.Transparency = IIIll11IIII.Transparency or 0
    lIIl1lIII11.Parent = I11llI11llI
    local ll1I1I11lIl = Instance.new("UIGradient")
    ll1I1I11lIl.Rotation = 0
    ll1I1I11lIl.Parent = lIIl1lIII11
    local lIIl11Il11I = {
        Stroke = lIIl1lIII11, Gradient = ll1I1I11lIl, Color = IIIll11IIII.Color, Color2 = IIIll11IIII.Color2, Clarity = IIIll11IIII.Clarity, Thickness = IIIll11IIII.Thickness, Speed = IIIll11IIII.Speed, Enabled = IIIll11IIII.Enabled,
    }
    function lIIl11Il11I:Refresh()
        Neverlose:_ApplyBorder(lIIl11Il11I)
        return lIIl11Il11I
    end
    function lIIl11Il11I:SetColor(lII1l11lll1)
        lIIl11Il11I.Color = lII1l11lll1
        return lIIl11Il11I:Refresh()
    end
    function lIIl11Il11I:SetColor2(l1I1I1II11l)
        lIIl11Il11I.Color2 = l1I1I1II11l
        return lIIl11Il11I:Refresh()
    end
    function lIIl11Il11I:SetClarity(II1I111llII)
        lIIl11Il11I.Clarity = II1I111llII
        return lIIl11Il11I:Refresh()
    end
    function lIIl11Il11I:SetThickness(Il11l11llIl)
        lIIl11Il11I.Thickness = Il11l11llIl
        return lIIl11Il11I:Refresh()
    end
    function lIIl11Il11I:SetSpeed(llII1111llI)
        lIIl11Il11I.Speed = llII1111llI
        return lIIl11Il11I
    end
    function lIIl11Il11I:SetEnabled(l1II1l1l1II)
        lIIl11Il11I.Enabled = l1II1l1l1II
        return lIIl11Il11I:Refresh()
    end
    function lIIl11Il11I:Destroy()
        lIIl1lIII11:Destroy()
    end
    table.insert(Neverlose.SpinBorders, lIIl11Il11I)
    Neverlose:_ApplyBorder(lIIl11Il11I)
    if not Neverlose._SpinBorderLoop then
        Neverlose._SpinBorderLoop = RunService.RenderStepped:Connect( function (II11I11Il11)
            II11I11Il11 = math.min(II11I11Il11, 0.1)
            local lIll11lIlIl = Neverlose.SpinBorders
            for IIIl11lIl1I = #lIll11lIlIl, 1, - 1 do
                local l1l111lIIII = lIll11lIlIl[IIIl11lIl1I]
                if not l1l111lIIII.Stroke.Parent then
                    table.remove(lIll11lIlIl, IIIl11lIl1I)
                elseif l1l111lIIII.Stroke.Enabled and l1l111lIIII.Stroke.Transparency < 0.99 then
                    l1l111lIIII.Gradient.Rotation = (l1l111lIIII.Gradient.Rotation + (tonumber(l1l111lIIII.Speed or Neverlose.BorderSpeed) or 90) * II11I11Il11) % 360
                end
            end
        end
        )
        pcall( function ()
            Neverlose:AddSignal(Neverlose._SpinBorderLoop)
        end
        )
        Neverlose:OnThemeChanged( function (IIl1II1ll11)
            if IIl1II1ll11.Accent then
                Neverlose._ThemeAccent = IIl1II1ll11.Accent
            end
            for llI1I1l1111, II1III1Il11 in ipairs(Neverlose.SpinBorders) do
                Neverlose:_ApplyBorder(II1III1Il11)
            end
        end
        )
    end
    return lIIl11Il11I
end
function Neverlose:SetBorder(IlIIlllIlIl)
    if type(IlIIlllIlIl) ~= "table" then
        return Neverlose
    end
    local lI1IIIllIl1 = {
        Enabled = {
            "BorderEnabled", "Enabled"
        }, Color = {
            "BorderColor", "Color"
        }, Color2 = {
            "BorderColor2", "Color2"
        }, Clarity = {
            "BorderClarity", "Clarity"
        }, Thickness = {
            "BorderThickness", "Thickness"
        }, Speed = {
            "BorderSpeed", "Speed"
        },
    }
    IlIIlllIlIl = {
        Enabled = IlIIlllIlIl.Enabled, Color = IlIIlllIlIl.Color, Color2 = IlIIlllIlIl.Color2, Clarity = IlIIlllIlIl.Clarity or IlIIlllIlIl.Opacity or IlIIlllIlIl.Visibility, Thickness = IlIIlllIlIl.Thickness, Speed = IlIIlllIlIl.Speed,
    }
    for II1l11l1l1l, IllI1IIIII1 in next, lI1IIIllIl1 do
        if IlIIlllIlIl[II1l11l1l1l] ~= nil then
            Neverlose[IllI1IIIII1[1]] = IlIIlllIlIl[II1l11l1l1l]
            for II11IlIIlIl, lIl111I11Il in ipairs(Neverlose.SpinBorders) do
                lIl111I11Il[IllI1IIIII1[2]] = nil
            end
        end
    end
    for IIl1ll11111, l1ll1I1IIll in ipairs(Neverlose.SpinBorders) do
        Neverlose:_ApplyBorder(l1ll1I1IIll)
    end
    return Neverlose
end

-- ====================================================================
-- [7] Floating Menu Toggle Icon
-- ====================================================================
function Neverlose:CreateMenuIcon(I1lI1111lIl)
    I1lI1111lIl = I1lI1111lIl or {}
    do
        local lI1l11l1llI = Neverlose.ActiveWindow
        if not I1lI1111lIl.Auto and lI1l11l1llI and lI1l11l1llI._AutoMenuIcon then
            local I11lIII1IIl = lI1l11l1llI._AutoMenuIcon
            lI1l11l1llI._AutoMenuIcon = nil
            if lI1l11l1llI._MenuIcon == I11lIII1IIl then
                lI1l11l1llI._MenuIcon = nil
            end
            pcall( function ()
                I11lIII1IIl:Destroy()
            end
            )
        end
    end
    local llIIlIllIIl = I1lI1111lIl.Size or 48
    local lIIll1lllll = I1lI1111lIl.Image or ""
    local lIIl11I1I11 = tonumber(I1lI1111lIl.IconScale or I1lI1111lIl.Scale) or 1
    local l1IIllIlIl1 = I1lI1111lIl.IconColor or Color3.fromRGB(255, 255, 255)
    local l1I1I1ll111 = I1lI1111lIl.BGColor or Color3.fromRGB(20, 22, 27)
    local l1I1I1l1III = (I1lI1111lIl.Draggable ~= false )
    local l11I1lI11I1 = UDim.new(0, math.floor(llIIlIllIIl * 0.28))
    local I11l11I111I = Instance.new("Frame")
    I11l11I111I.Name = Neverlose.RandomString()
    I11l11I111I.Parent = Neverlose.ScreenGui
    I11l11I111I.AnchorPoint = Vector2.new(0, 0.5)
    I11l11I111I.BackgroundColor3 = l1I1I1ll111
    I11l11I111I.BackgroundTransparency = 1
    I11l11I111I.BorderSizePixel = 0
    I11l11I111I.Size = UDim2.fromOffset(llIIlIllIIl, llIIlIllIIl)
    I11l11I111I.Position = I1lI1111lIl.Position or UDim2.new(0, 15, 0.5, 0)
    I11l11I111I.ZIndex = 900
    I11l11I111I.ClipsDescendants = false
    I11l11I111I.Active = true
    I11l11I111I.Visible = false
    local lIIl1I11III = Instance.new("UIScale")
    lIIl1I11III.Scale = 0.5
    lIIl1I11III.Parent = I11l11I111I
    local I1llI1l1I1I = Instance.new("UICorner")
    I1llI1l1I1I.CornerRadius = l11I1lI11I1
    I1llI1l1I1I.Parent = I11l11I111I
    local llI11II111I = Neverlose:CreateSpinBorder(I11l11I111I, {
        Color = I1lI1111lIl.BorderColor or I1lI1111lIl.StrokeColor, Color2 = I1lI1111lIl.BorderColor2, Clarity = I1lI1111lIl.BorderClarity, Thickness = I1lI1111lIl.BorderThickness or I1lI1111lIl.StrokeThick, Speed = I1lI1111lIl.BorderSpeed, Enabled = I1lI1111lIl.BorderEnabled, Transparency = 1,
    })
    local IlIllII1l1l = llI11II111I.Stroke
    local Il11I1lIlI1 = Instance.new("TextLabel")
    Il11I1lIlI1.Name = Neverlose.RandomString()
    Il11I1lIlI1.Parent = I11l11I111I
    Il11I1lIlI1.AnchorPoint = Vector2.new(0.5, 0.5)
    Il11I1lIlI1.BackgroundTransparency = 1
    Il11I1lIlI1.BorderSizePixel = 0
    Il11I1lIlI1.Position = UDim2.fromScale(0.5, 0.5)
    Il11I1lIlI1.Size = UDim2.fromScale(0.65, 0.65)
    Il11I1lIlI1.ZIndex = 901
    Il11I1lIlI1.FontFace = Neverlose.BuiltInBold
    Il11I1lIlI1.Text = ""
    Il11I1lIlI1.TextColor3 = l1IIllIlIl1
    Il11I1lIlI1.TextScaled = true
    Il11I1lIlI1.TextTransparency = 1
    Il11I1lIlI1.TextWrapped = true
    local II1IllllI11 = Instance.new("ImageLabel")
    II1IllllI11.Name = Neverlose.RandomString()
    II1IllllI11.Parent = I11l11I111I
    II1IllllI11.AnchorPoint = Vector2.new(0.5, 0.5)
    II1IllllI11.BackgroundTransparency = 1
    II1IllllI11.BorderSizePixel = 0
    II1IllllI11.Position = UDim2.fromScale(0.5, 0.5)
    II1IllllI11.Size = UDim2.fromScale(0.65, 0.65)
    II1IllllI11.ZIndex = 901
    II1IllllI11.ImageColor3 = l1IIllIlIl1
    II1IllllI11.ImageTransparency = 1
    II1IllllI11.ScaleType = Enum.ScaleType.Fit
    II1IllllI11:SetAttribute("ModernIconScaleValue", lIIl11I1I11)
    local II1l1llII1I = Instance.new("UICorner")
    II1l1llII1I.CornerRadius = UDim.new(0.15, 0)
    II1l1llII1I.Parent = II1IllllI11
    local lIlI1lI11II = Neverlose:CreateShadow(I11l11I111I, true )
    local Il11I1I1I11 = {
        Root = I11l11I111I, Border = llI11II111I, Visible = false , _size = llIIlIllIIl, _draggable = l1I1I1l1III, AutoHide = I1lI1111lIl.AutoHide ~= false ,
    }
    local function l1IllIII1lI(l1I111Il1l1)
        if not l1I111Il1l1 or l1I111Il1l1 == "" then
            Il11I1lIlI1.Text = ""
            II1IllllI11.Image = ""
            Il11I1lIlI1.Visible = false
            II1IllllI11.Visible = true
            return
        end
        Neverlose:SetIconMode(II1IllllI11, l1I111Il1l1)
        II1IllllI11.Visible = true
        Il11I1lIlI1.Visible = false
    end
    l1IllIII1lI(lIIll1lllll)
    local ll11IIl11l1 = 0
    local function I1l1ll11lIl(Il1I11I1Ill)
        if Il11I1I1I11.Visible == Il1I11I1Ill then
            return
        end
        Il11I1I1I11.Visible = Il1I11I1Ill
        ll11IIl11l1 += 1
        local llll1l1ll11 = ll11IIl11l1
        local II1I11I111I = II1IllllI11:FindFirstChild("ModernIconFallbackText")
        local II1l1II11I1 = TweenInfo.new(0.55, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        local l1III1lllIl = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        if Il1I11I1Ill then
            if not I11l11I111I.Visible then
                lIIl1I11III.Scale = 0.15
                I11l11I111I.Rotation = - 40
            end
            I11l11I111I.Visible = true
            Neverlose.PlayAnimate(lIIl1I11III, II1l1II11I1, {
                Scale = 1,
            })
            Neverlose.PlayAnimate(I11l11I111I, II1l1II11I1, {
                Rotation = 0,
            })
            Neverlose.PlayAnimate(I11l11I111I, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundTransparency = 0,
            })
            Neverlose.PlayAnimate(IlIllII1l1l, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Transparency = 0,
            })
            Neverlose.PlayAnimate(Il11I1lIlI1, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                TextTransparency = 0,
            })
            Neverlose.PlayAnimate(II1IllllI11, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ImageTransparency = 0,
            })
            if II1I11I111I then
                Neverlose.PlayAnimate(II1I11I111I, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    TextTransparency = 0,
                })
            end
            lIlI1lI11II:Render( true )
        else
            Neverlose.PlayAnimate(lIIl1I11III, l1III1lllIl, {
                Scale = 0,
            })
            Neverlose.PlayAnimate(I11l11I111I, l1III1lllIl, {
                Rotation = 40,
            })
            Neverlose.PlayAnimate(I11l11I111I, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                BackgroundTransparency = 1,
            })
            Neverlose.PlayAnimate(IlIllII1l1l, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Transparency = 1,
            })
            Neverlose.PlayAnimate(Il11I1lIlI1, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                TextTransparency = 1,
            })
            Neverlose.PlayAnimate(II1IllllI11, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                ImageTransparency = 1,
            })
            if II1I11I111I then
                Neverlose.PlayAnimate(II1I11I111I, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    TextTransparency = 1,
                })
            end
            lIlI1lI11II:Render( false )
            task.delay(0.34, function ()
                if llll1l1ll11 == ll11IIl11l1 and not Il11I1I1I11.Visible and I11l11I111I.Parent then
                    I11l11I111I.Visible = false
                    I11l11I111I.Rotation = 0
                end
            end
            )
        end
    end
    function Il11I1I1I11:SetVisible(l11Illl1I1I)
        I1l1ll11lIl(l11Illl1I1I == true )
    end
    function Il11I1I1I11:SetIcon(ll111IIl1Il)
        lIIll1lllll = ll111IIl1Il
        l1IllIII1lI(ll111IIl1Il)
    end
    function Il11I1I1I11:SetIconScale(ll1lllIllIl)
        lIIl11I1I11 = tonumber(ll1lllIllIl) or lIIl11I1I11
        II1IllllI11:SetAttribute("ModernIconScaleValue", lIIl11I1I11)
        local I11l1IIII11 = II1IllllI11:FindFirstChild("ModernIconScale")
        if I11l1IIII11 then
            I11l1IIII11.Scale = lIIl11I1I11
        end
        return Il11I1I1I11
    end
    function Il11I1I1I11:SetIconColor(III1lIII1II)
        l1IIllIlIl1 = III1lIII1II
        Il11I1lIlI1.TextColor3 = III1lIII1II
        II1IllllI11.ImageColor3 = III1lIII1II
    end
    function Il11I1I1I11:SetBGColor(lllIllll1I1)
        l1I1I1ll111 = lllIllll1I1
        I11l11I111I.BackgroundColor3 = lllIllll1I1
    end
    function Il11I1I1I11:SetStrokeColor(lI11111ll11)
        llI11II111I:SetColor(lI11111ll11)
    end
    function Il11I1I1I11:SetStrokeThick(IIlIIlIIlll)
        llI11II111I:SetThickness(IIlIIlIIlll)
    end
    function Il11I1I1I11:SetBorder(lIlI1III1Il)
        lIlI1III1Il = lIlI1III1Il or {}
        if lIlI1III1Il.Color ~= nil then
            llI11II111I.Color = lIlI1III1Il.Color
        end
        if lIlI1III1Il.Color2 ~= nil then
            llI11II111I.Color2 = lIlI1III1Il.Color2
        end
        local l1l1lI111Il = lIlI1III1Il.Clarity or lIlI1III1Il.Opacity or lIlI1III1Il.Visibility
        if l1l1lI111Il ~= nil then
            llI11II111I.Clarity = l1l1lI111Il
        end
        if lIlI1III1Il.Thickness ~= nil then
            llI11II111I.Thickness = lIlI1III1Il.Thickness
        end
        if lIlI1III1Il.Speed ~= nil then
            llI11II111I.Speed = lIlI1III1Il.Speed
        end
        if lIlI1III1Il.Enabled ~= nil then
            llI11II111I.Enabled = lIlI1III1Il.Enabled
        end
        llI11II111I:Refresh()
        return Il11I1I1I11
    end
    function Il11I1I1I11:SetSize(I1IlIlIll1l)
        Il11I1I1I11._size = I1IlIlIll1l
        I11l11I111I.Size = UDim2.fromOffset(I1IlIlIll1l, I1IlIlIll1l)
        I1llI1l1I1I.CornerRadius = UDim.new(0, math.floor(I1IlIlIll1l * 0.28))
    end
    function Il11I1I1I11:SetDraggable(lllllII1l1l)
        Il11I1I1I11._draggable = lllllII1l1l
    end
    function Il11I1I1I11:GetCenter()
        local I1lI1IIll1I = Neverlose.ScreenGui.AbsoluteSize
        local l11l1II111l = I11l11I111I.Position
        return Vector2.new(l11l1II111l.X.Scale * I1lI1IIll1I.X + l11l1II111l.X.Offset + (Il11I1I1I11._size / 2), l11l1II111l.Y.Scale * I1lI1IIll1I.Y + l11l1II111l.Y.Offset)
    end
    function Il11I1I1I11:SetAutoHide(Il11lIIlllI)
        Il11I1I1I11.AutoHide = Il11lIIlllI == true
        return Il11I1I1I11
    end
    function Il11I1I1I11:OnWindowToggle(ll1IIllIlI1)
        if Il11I1I1I11.AutoHide then
            I1l1ll11lIl( not ll1IIllIlI1)
        end
    end
    function Il11I1I1I11:Destroy()
        Il11I1I1I11.Visible = false
        if I11l11I111I.Parent then
            I11l11I111I:Destroy()
        end
    end
    do
        local function lllI1I1I11l(lIl1Ill11Il)
            local I1IlIlllIIl = Neverlose.ScreenGui.AbsoluteSize
            local llI1ll1IlII = Il11I1I1I11._size
            local l1l1lII11ll = math.clamp(lIl1Ill11Il.X.Scale * I1IlIlllIIl.X + lIl1Ill11Il.X.Offset, 0, I1IlIlllIIl.X - llI1ll1IlII)
            local Il1IlIIllll = math.clamp(lIl1Ill11Il.Y.Scale * I1IlIlllIIl.Y + lIl1Ill11Il.Y.Offset, llI1ll1IlII / 2, I1IlIlllIIl.Y - llI1ll1IlII / 2)
            return UDim2.new(0, l1l1lII11ll, 0, Il1IlIIllll)
        end
        local IIIllllIl1I = 6
        Neverlose:AddSignal(I11l11I111I.InputBegan:Connect( function (ll1l1l11lll)
            if ll1l1l11lll.UserInputType ~= Enum.UserInputType.MouseButton1 and ll1l1l11lll.UserInputType ~= Enum.UserInputType.Touch then
                return
            end
            local lll1IIl1lII = ll1l1l11lll.Position
            local l1lIl11lIlI = I11l11I111I.Position
            local IlI1III1I1I = false
            local ll11lIIl11I, l11111Il1Il
            local I11l1Illlll = lllI1I1I11l(l1lIl11lIlI)
            local I11llIIIlll, I11I1lI1lII = I11l1Illlll.X.Offset, I11l1Illlll.Y.Offset
            local lIlllII1111, IlIllI1l11I = I11llIIIlll, I11I1lI1lII
            local IIl1lII11Il
            local lI1Il1l111I = Neverlose.NewSinkName()
            local lIIlII11Ill = false
            local llll111llII = false
            local lI111I11Ill = 0
            local function l11IIlI1IlI()
                if IIl1lII11Il then
                    IIl1lII11Il:Disconnect()
                    IIl1lII11Il = nil
                end
            end
            local function III11l1IllI()
                if IIl1lII11Il then
                    return
                end
                IIl1lII11Il = RunService.RenderStepped:Connect( function (l1lll11Illl)
                    if not I11l11I111I.Parent then
                        l11IIlI1IlI()
                        return
                    end
                    l1lll11Illl = math.min(l1lll11Illl, 0.05)
                    local l11lllIl111 = Neverlose.GetDragRate()
                    if llll111llII then
                        lI111I11Ill += l1lll11Illl
                    end
                    if not l11lllIl111 or lI111I11Ill > 0.7 then
                        I11llIIIlll, I11I1lI1lII = lIlllII1111, IlIllI1l11I
                        I11l11I111I.Position = UDim2.new(0, I11llIIIlll, 0, I11I1lI1lII)
                        l11IIlI1IlI()
                        return
                    end
                    local l1Il11I1ll1 = 1 - math.exp(- l11lllIl111 * l1lll11Illl)
                    I11llIIIlll += (lIlllII1111 - I11llIIIlll) * l1Il11I1ll1
                    I11I1lI1lII += (IlIllI1l11I - I11I1lI1lII) * l1Il11I1ll1
                    if math.abs(lIlllII1111 - I11llIIIlll) < 0.3 and math.abs(IlIllI1l11I - I11I1lI1lII) < 0.3 then
                        I11llIIIlll, I11I1lI1lII = lIlllII1111, IlIllI1l11I
                        I11l11I111I.Position = UDim2.new(0, I11llIIIlll, 0, I11I1lI1lII)
                        if llll111llII then
                            l11IIlI1IlI()
                        end
                        return
                    end
                    I11l11I111I.Position = UDim2.new(0, I11llIIIlll, 0, I11I1lI1lII)
                end
                )
            end
            ll11lIIl11I = UserInputService.InputChanged:Connect( function (lI11l1I1I1I)
                if lI11l1I1I1I.UserInputType ~= Enum.UserInputType.MouseMovement and lI11l1I1I1I.UserInputType ~= Enum.UserInputType.Touch then
                    return
                end
                local I1lIlI1ll1I = lI11l1I1I1I.Position - lll1IIl1lII
                if (IlI1III1I1I or I1lIlI1ll1I.Magnitude > IIIllllIl1I) and Il11I1I1I11._draggable then
                    IlI1III1I1I = true
                    if not lIIlII11Ill then
                        lIIlII11Ill = true
                        Neverlose.SetInputSink(lI1Il1l111I, true )
                    end
                    local ll11l1I1ll1 = UDim2.new(l1lIl11lIlI.X.Scale, l1lIl11lIlI.X.Offset + I1lIlI1ll1I.X, l1lIl11lIlI.Y.Scale, l1lIl11lIlI.Y.Offset + I1lIlI1ll1I.Y)
                    local llIlI1IlI11 = lllI1I1I11l(ll11l1I1ll1)
                    lIlllII1111, IlIllI1l11I = llIlI1IlI11.X.Offset, llIlI1IlI11.Y.Offset
                    if Neverlose.GetDragRate() then
                        III11l1IllI()
                    else
                        l11IIlI1IlI()
                        I11llIIIlll, I11I1lI1lII = lIlllII1111, IlIllI1l11I
                        I11l11I111I.Position = llIlI1IlI11
                    end
                end
            end
            )
            l11111Il1Il = ll1l1l11lll.Changed:Connect( function ()
                if ll1l1l11lll.UserInputState ~= Enum.UserInputState.End then
                    return
                end
                ll11lIIl11I:Disconnect()
                l11111Il1Il:Disconnect()
                llll111llII = true
                if lIIlII11Ill then
                    lIIlII11Ill = false
                    Neverlose.SetInputSink(lI1Il1l111I, false )
                end
                if not IIl1lII11Il then
                    l11IIlI1IlI()
                end
                if not IlI1III1I1I then
                    local IlIIIIII11l = Il11I1I1I11._Owner
                    if IlIIIIII11l and not IlIIIIII11l.Destroyed and IlIIIIII11l.ToggleInterface then
                        IlIIIIII11l:ToggleInterface()
                    else
                        Neverlose:FireKeybind()
                    end
                end
            end
            )
        end
        ))
    end
    Neverlose:OnThemeChanged( function (II11llIIll1)
        if II11llIIll1.Icon then
            Il11I1I1I11:SetIconColor(II11llIIll1.Icon)
        end
    end
    )
    local ll1l1Il1IlI = Neverlose.ActiveWindow
    I1l1ll11lIl( not (Il11I1I1I11.AutoHide and ll1l1Il1IlI and ll1l1Il1IlI.Signal and ll1l1Il1IlI.Signal:GetValue()))
    return Il11I1I1I11
end
if getcustomasset then
    local IlI1I1lI1ll = "https://github.com/4lpaca-pin/NeverloseUI/blob/main/assets/%s?raw=true"
    local lllI1IlllI1 = "NLAssets"
    if not isfolder(lllI1IlllI1) then
        makefolder(lllI1IlllI1)
    end
    pcall( function ()
        if not isfile(lllI1IlllI1 .. "/" .. "logo.png") then
            local IIlI1lI11Il = game:HttpGet(string.format(IlI1I1lI1ll, "logo.png"))
            writefile(lllI1IlllI1 .. "/" .. "logo.png", IIlI1lI11Il)
            task.wait()
        end
        if isfile(lllI1IlllI1 .. "/" .. "logo.png") then
            Neverlose.GlobalLogo = getcustomasset(lllI1IlllI1 .. "/" .. "logo.png")
        end
    end
    )
    pcall( function ()
        if not isfile(lllI1IlllI1 .. "/" .. "saturation_value_gradient.png") then
            local l1lI11111l1 = game:HttpGet(string.format(IlI1I1lI1ll, "saturation_value_gradient.png"))
            writefile(lllI1IlllI1 .. "/" .. "saturation_value_gradient.png", l1lI11111l1)
            task.wait()
        end
        if isfile(lllI1IlllI1 .. "/" .. "saturation_value_gradient.png") then
            Neverlose.ImageColorMapping = getcustomasset(lllI1IlllI1 .. "/" .. "saturation_value_gradient.png")
        end
    end
    )
end
function Neverlose:AddSignal(l1Il11I1llI)
    if Neverlose.UnloadEnabled then
        table.insert(Neverlose.GlobalSignals, l1Il11I1llI)
    end
    return l1Il11I1llI
end
Neverlose:AddSignal(ScreenGui.DescendantAdded:Connect( function (I1I111llIll)
    task.defer( function ()
        Neverlose:ApplyFont(I1I111llIll)
    end
    )
end
))
function Neverlose:AddQuery(IIIlIlIllIl, lllIll1II1l)
    local lIlI1111111 = nil
    local II1I1lI111I = IIIlIlIllIl
    while II1I1lI111I do
        if Neverlose.SectionOwners[II1I1lI111I] then
            lIlI1111111 = Neverlose.SectionOwners[II1I1lI111I]
            break
        end
        II1I1lI111I = II1I1lI111I.Parent
    end
    table.insert(Neverlose.NameRegisitry, {
        Root = IIIlIlIllIl, Idx = lllIll1II1l, Section = lIlI1111111,
    })
end
function Neverlose:RevealQueryItem(l11l1IlIlIl)
    if not l11l1IlIlIl or not l11l1IlIlIl.Root then
        return
    end
    if l11l1IlIlIl.Section and l11l1IlIlIl.Section.GetCollapsed and l11l1IlIlIl.Section:GetCollapsed() then
        l11l1IlIlIl.Section:SetCollapsed( false )
    end
    task.defer( function ()
        local I11lIl11ll1 = l11l1IlIlIl.Root
        if not I11lIl11ll1 or not I11lIl11ll1.Parent then
            return
        end
        local ll11ll1l1l1 = I11lIl11ll1.Parent
        while ll11ll1l1l1 and not ll11ll1l1l1:IsA("ScrollingFrame") do
            ll11ll1l1l1 = ll11ll1l1l1.Parent
        end
        if not ll11ll1l1l1 then
            return
        end
        local IlII1lII111 = math.max(0, ll11ll1l1l1.AbsoluteCanvasSize.Y - ll11ll1l1l1.AbsoluteSize.Y)
        local IllI1Il1ll1 = I11lIl11ll1.AbsolutePosition.Y - ll11ll1l1l1.AbsolutePosition.Y + ll11ll1l1l1.CanvasPosition.Y - 8
        ll11ll1l1l1.CanvasPosition = Vector2.new(ll11ll1l1l1.CanvasPosition.X, math.clamp(IllI1Il1ll1, 0, IlII1lII111))
    end
    )
end
function Neverlose:RegisterFlag(l1lIlI1l1ll, lllIllIIlI1)
    if not l1lIlI1l1ll or not lllIllIIlI1 then
        return lllIllIIlI1
    end
    l1lIlI1l1ll = tostring(l1lIlI1l1ll)
    Neverlose.Flags[l1lIlI1l1ll] = lllIllIIlI1
    if Neverlose.PendingFlagValues[l1lIlI1l1ll] ~= nil and lllIllIIlI1.SetValue then
        local IIIIIl1lllI = Neverlose.PendingFlagValues[l1lIlI1l1ll]
        Neverlose.PendingFlagValues[l1lIlI1l1ll] = nil
        task.spawn( function ()
            pcall( function ()
                lllIllIIlI1:SetValue(IIIIIl1lllI)
            end
            )
        end
        )
    end
    return lllIllIIlI1
end
function Neverlose:ResolveConfigFlag(Il1I11I1Il1)
    if typeof(Il1I11I1Il1) ~= "table" then
        return nil
    end
    local IIlI11I11lI = Il1I11I1Il1.Flag or Il1I11I1Il1.Key or Il1I11I1Il1.ConfigKey
    if IIlI11I11lI ~= nil then
        IIlI11I11lI = tostring(IIlI11I11lI)
        Il1I11I1Il1.Flag = IIlI11I11lI
    end
    return IIlI11I11lI
end
function Neverlose:AttachLockMethods(I1llIIlll1I, IIll1IIIIll, Il11IIIllIl)
    if not I1llIIlll1I or not IIll1IIIIll then
        return I1llIIlll1I
    end
    Il11IIIllIl = Il11IIIllIl or {}
    local I1II1lll11l = Neverlose:ApplyLock(IIll1IIIIll, Il11IIIllIl.Locked == true , Il11IIIllIl.TextLocked or Il11IIIllIl.LockMessage or "Locked")
    I1llIIlll1I.Lock = I1II1lll11l
    function I1llIIlll1I:SetLocked(lIIllll111l)
        I1II1lll11l:SetLocked(lIIllll111l)
        return I1llIIlll1I
    end
    function I1llIIlll1I:SetTextLocked(I1l1l11IIlI)
        I1II1lll11l:SetTextLocked(I1l1l11IIlI)
        return I1llIIlll1I
    end
    function I1llIIlll1I:GetLocked()
        return I1II1lll11l:GetLocked()
    end
    local lllI111lI1I = Il11IIIllIl.KeyLocked == true or Il11IIIllIl.RequireKey == true or Il11IIIllIl.KeyRequired == true
    local llI1ll11II1 = Neverlose:ApplyKeyLock(IIll1IIIIll, lllI111lI1I)
    I1llIIlll1I.KeyLock = llI1ll11II1
    function I1llIIlll1I:SetKeyLocked(lIllll1IIII)
        llI1ll11II1:SetRequired(lIllll1IIII)
        return I1llIIlll1I
    end
    function I1llIIlll1I:GetKeyLocked()
        return llI1ll11II1:IsActive()
    end
    return I1llIIlll1I
end

-- ====================================================================
-- [8] Data Encryption & Base64 Helpers
-- ====================================================================
function Cipher.new(IIlII11IIlI)
    local II1Ill1l1II ={}
    local llIlII1I111 = ((#IIlII11IIlI + 3782) % 111) + 1
    string.gsub(IIlII11IIlI, ".", ( function (lI1I1l1Ill1)
        table.insert(II1Ill1l1II, tostring(lI1I1l1Ill1:byte() + llIlII1I111))
    end
    ))
    local lI1IIIlIIIl = table.concat(II1Ill1l1II, "?")
    table.clear(II1Ill1l1II)
    return "{" .. tostring(llIlII1I111 + 72667) .. "}?" .. lI1IIIlIIIl
end
function Cipher.reverse(I1l11II111l)
    local I1111l1lI11 = string.split(I1l11II111l, "?")
    local l1Il11I1lI1 = I1111l1lI11[1]:gsub("{", ""):gsub("}", "")
    local I11l1I11I11 = tonumber(l1Il11I1lI1)
    local lI11IlII11I ={}
    local llII1l11l11 = I11l1I11I11 - 72667
    for lIllll11II1, l11l1111I11 in next, I1111l1lI11 do
        if lIllll11II1 > 1 then
            local I1llI1lIIl1 = tonumber(l11l1111I11)
            table.insert(lI11IlII11I, string.char(I1llI1lIIl1 - llII1l11l11))
        end
    end
    local lIllIlIIlIl = table.concat(lI11IlII11I)
    table.clear(lI11IlII11I)
    return lIllIlIIlIl
end
do
    local IIIl1ll1l1l = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    Neverlose.Base64Encode = ( function (I1Il1Il1Il1)
        return ((I1Il1Il1Il1:gsub(".", function (ll1I1l1l1II)
            local lIlllI1lIlI, l11l1llIII1 = "", ll1I1l1l1II:byte() for I1IIlI11I11 = 8, 1, - 1 do
                lIlllI1lIlI = lIlllI1lIlI .. (l11l1llIII1 % 2 ^ I1IIlI11I11 - l11l1llIII1 % 2 ^ (I1IIlI11I11 - 1) > 0 and "1" or "0")
            end
            return lIlllI1lIlI
        end
        ) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function (l11IlIlII1I)
            if (#l11IlIlII1I < 6) then
                return ""
            end
            local l11lI1l1IlI = 0 for I1l1Il1lII1 = 1, 6 do
                l11lI1l1IlI = l11lI1l1IlI + (l11IlIlII1I:sub(I1l1Il1lII1, I1l1Il1lII1) == "1" and 2 ^ (6 - I1l1Il1lII1) or 0)
            end
            return IIIl1ll1l1l:sub(l11lI1l1IlI + 1, l11lI1l1IlI + 1)
        end
        ) .. ({
            "", "==", "="
        })[#I1Il1Il1Il1 % 3 + 1])
    end
    )
    Neverlose.Base64Decode = ( function (IIl1ll1ll11)
        IIl1ll1ll11 = string.gsub(IIl1ll1ll11, "[^" .. IIIl1ll1l1l .. "=]", "") return (IIl1ll1ll11:gsub(".", function (l1llIIl11lI)
            if (l1llIIl11lI == "=") then
                return ""
            end
            local I1IlIIll1Il, l1lIlI1lllI = "", (IIIl1ll1l1l:find(l1llIIl11lI) - 1) for I1lIllII1lI = 6, 1, - 1 do
                I1IlIIll1Il = I1IlIIll1Il .. (l1lIlI1lllI % 2 ^ I1lIllII1lI - l1lIlI1lllI % 2 ^ (I1lIllII1lI - 1) > 0 and "1" or "0")
            end
            return I1IlIIll1Il
        end
        ):gsub("%d%d%d?%d?%d?%d?%d?%d?", function (lIl11llllll)
            if (#lIl11llllll ~= 8) then
                return ""
            end
            local lI1l11lIlIl = 0 for I1IlII1Il1I = 1, 8 do
                lI1l11lIlIl = lI1l11lIlIl + (lIl11llllll:sub(I1IlII1Il1I, I1IlII1Il1I) == "1" and 2 ^ (8 - I1IlII1Il1I) or 0)
            end
            return string.char(lI1l11lIlIl)
        end
        ))
    end
    )
end
function Neverlose:FireKeybind()
    if Neverlose.ActiveWindow then
        Neverlose.ActiveWindow:ToggleInterface()
    end
end
Neverlose.LoadIcon = ( function ()
    Neverlose.RobloxIcon = {
        ["3d-cube-arrow-left"] = "3d-cube-arrow-left", ["amazon"] = "amazon", ["arm-left"] = "arm-left", ["arm-right"] = "arm-right", ["arrow-curl-to-left"] = "arrow-curl-to-left", ["arrow-curl-to-right"] = "arrow-curl-to-right", ["arrow-down-to-line"] = "arrow-down-to-line", ["arrow-large-down"] = "arrow-large-down", ["arrow-large-left"] = "arrow-large-left", ["arrow-large-right"] = "arrow-large-right", ["arrow-large-up"] = "arrow-large-up", ["arrow-right-from-portrait-rectangle"] = "arrow-right-from-portrait-rectangle", ["arrow-right-to-portrait-rectangle"] = "arrow-right-to-portrait-rectangle", ["arrow-rotate-down-dashed"] = "arrow-rotate-down-dashed", ["arrow-rotate-right"] = "arrow-rotate-right", ["arrow-rotate-right-dashed"] = "arrow-rotate-right-dashed", ["arrow-small-down"] = "arrow-small-down", ["arrow-small-left"] = "arrow-small-left", ["arrow-small-right"] = "arrow-small-right", ["arrow-small-up"] = "arrow-small-up", ["arrow-spin-clockwise"] = "arrow-spin-clockwise", ["arrow-spin-clockwise-10"] = "arrow-spin-clockwise-10", ["arrow-spin-clockwise-15"] = "arrow-spin-clockwise-15", ["arrow-spin-clockwise-30"] = "arrow-spin-clockwise-30", ["arrow-spin-counter-clockwise-10"] = "arrow-spin-counter-clockwise-10", ["arrow-spin-counter-clockwise-15"] = "arrow-spin-counter-clockwise-15", ["arrow-spin-counter-clockwise-30"] = "arrow-spin-counter-clockwise-30", ["arrow-thick-to-left"] = "arrow-thick-to-left", ["arrow-thick-to-right"] = "arrow-thick-to-right", ["arrow-up-from-landscape-rectangle"] = "arrow-up-from-landscape-rectangle", ["arrow-up-right-from-square"] = "arrow-up-right-from-square", ["arrow-wide-short-down"] = "arrow-wide-short-down", ["arrow-wide-short-left"] = "arrow-wide-short-left", ["arrow-wide-short-right"] = "arrow-wide-short-right", ["arrow-wide-short-up"] = "arrow-wide-short-up", ["arrows-small-directional"] = "arrows-small-directional", ["audio-wave-dotted-line"] = "audio-wave-dotted-line", ["backpack"] = "backpack", ["beard"] = "beard", ["bell"] = "bell", ["bell-clock"] = "bell-clock", ["bell-plus"] = "bell-plus", ["bell-slash"] = "bell-slash", ["belt"] = "belt", ["binoculars"] = "binoculars", ["book-closed"] = "book-closed", ["bookmark"] = "bookmark", ["bow-tie"] = "bow-tie", ["building-store"] = "building-store", ["bullet-flying"] = "bullet-flying", ["butterfly-wings"] = "butterfly-wings", ["calendar"] = "calendar", ["calendar-plus"] = "calendar-plus", ["calendar-star"] = "calendar-star", ["camera-small"] = "camera-small", ["caret-small-down"] = "caret-small-down", ["caret-small-left"] = "caret-small-left", ["caret-small-right"] = "caret-small-right", ["caret-small-up"] = "caret-small-up", ["chain-link"] = "chain-link", ["chart-four-vertical-bars"] = "chart-four-vertical-bars", ["chart-line"] = "chart-line", ["chart-pie"] = "chart-pie", ["chart-scatter-plot"] = "chart-scatter-plot", ["chart-three-vertical-bars"] = "chart-three-vertical-bars", ["check"] = "check", ["check-large"] = "check-large", ["check-small"] = "check-small", ["chevron-large-down"] = "chevron-large-down", ["chevron-large-down-to-line"] = "chevron-large-down-to-line", ["chevron-large-left"] = "chevron-large-left", ["chevron-large-left-to-line"] = "chevron-large-left-to-line", ["chevron-large-right"] = "chevron-large-right", ["chevron-large-right-to-line"] = "chevron-large-right-to-line", ["chevron-large-up"] = "chevron-large-up", ["chevron-large-up-to-line"] = "chevron-large-up-to-line", ["chevron-small-down"] = "chevron-small-down", ["chevron-small-down-to-line"] = "chevron-small-down-to-line", ["chevron-small-left"] = "chevron-small-left", ["chevron-small-left-to-line"] = "chevron-small-left-to-line", ["chevron-small-right"] = "chevron-small-right", ["chevron-small-right-to-line"] = "chevron-small-right-to-line", ["chevron-small-up"] = "chevron-small-up", ["chevron-small-up-to-line"] = "chevron-small-up-to-line", ["circle-check"] = "circle-check", ["circle-i"] = "circle-i", ["circle-minus"] = "circle-minus", ["circle-person"] = "circle-person", ["circle-person-three-horizontal-bars-wrapping-right"] = "circle-person-three-horizontal-bars-wrapping-right", ["circle-play"] = "circle-play", ["circle-plus"] = "circle-plus", ["circle-question"] = "circle-question", ["circle-slash"] = "circle-slash", ["circle-star"] = "circle-star", ["circle-three-dots-horizontal"] = "circle-three-dots-horizontal", ["circle-three-dots-vertical"] = "circle-three-dots-vertical", ["circle-x"] = "circle-x", ["clock"] = "clock", ["clock-dashed"] = "clock-dashed", ["clock-spin-reverse"] = "clock-spin-reverse", ["clock-spin-reverse-dashed"] = "clock-spin-reverse-dashed", ["clothes-hanger"] = "clothes-hanger", ["cloud"] = "cloud", ["cloud-arrow-down"] = "cloud-arrow-down", ["code"] = "code", ["compact-makeup-brush"] = "compact-makeup-brush", ["compass"] = "compass", ["controller-with-cog"] = "controller-with-cog", ["crop"] = "crop", ["crosshairs"] = "crosshairs", ["crosshairs-slash"] = "crosshairs-slash", ["cube-vertexes"] = "cube-vertexes", ["curved-rectangle-megaphone"] = "curved-rectangle-megaphone", ["diagonal-line-pattern"] = "diagonal-line-pattern", ["diagonal-line-pattern-sticker"] = "diagonal-line-pattern-sticker", ["diamond-simplified"] = "diamond-simplified", ["discord"] = "discord", ["disguise-nose-glasses"] = "disguise-nose-glasses", ["document-circle-slash"] = "document-circle-slash", ["document-list-heart"] = "document-list-heart", ["door-open-arrow-to-bottom-right"] = "door-open-arrow-to-bottom-right", ["dress"] = "dress", ["dual-arrows-horizontal"] = "dual-arrows-horizontal", ["dual-arrows-to-corners"] = "dual-arrows-to-corners", ["dual-arrows-vertical"] = "dual-arrows-vertical", ["envelope"] = "envelope", ["eraser"] = "eraser", ["eye"] = "eye", ["eye-slash"] = "eye-slash", ["eye-with-eyeliner"] = "eye-with-eyeliner", ["eyebrows"] = "eyebrows", ["eyelashes"] = "eyelashes", ["face-winking"] = "face-winking", ["facebook"] = "facebook", ["file-box"] = "file-box", ["fingerprint"] = "fingerprint", ["flag"] = "flag", ["flame"] = "flame", ["folder"] = "folder", ["fountain-pen-nib"] = "fountain-pen-nib", ["four-bars-horizontal-center-aligned"] = "four-bars-horizontal-center-aligned", ["four-bars-horizontal-chevron-left"] = "four-bars-horizontal-chevron-left", ["four-bars-horizontal-chevron-right"] = "four-bars-horizontal-chevron-right", ["four-bars-horizontal-justified-aligned"] = "four-bars-horizontal-justified-aligned", ["four-bars-horizontal-left-aligned"] = "four-bars-horizontal-left-aligned", ["four-bars-horizontal-right-aligned"] = "four-bars-horizontal-right-aligned", ["frame-bubble-slash"] = "frame-bubble-slash", ["frame-bubble-soundwave"] = "frame-bubble-soundwave", ["frame-camera"] = "frame-camera", ["frame-camera-center"] = "frame-camera-center", ["frame-collapsed"] = "frame-collapsed", ["frame-corners"] = "frame-corners", ["frame-expanded"] = "frame-expanded", ["frame-face"] = "frame-face", ["frame-person-torso"] = "frame-person-torso", ["frame-record"] = "frame-record", ["frame-single-bar-horizontal"] = "frame-single-bar-horizontal", ["frame-soundwave"] = "frame-soundwave", ["frame-video-camera"] = "frame-video-camera", ["gear"] = "gear", ["generic-dpad"] = "generic-dpad", ["gift-box"] = "gift-box", ["gift-card"] = "gift-card", ["glasses"] = "glasses", ["globe-detailed"] = "globe-detailed", ["globe-simplified"] = "globe-simplified", ["globe-simplipfied-speech-bubble"] = "globe-simplipfied-speech-bubble", ["grid"] = "grid", ["guilded"] = "guilded", ["hack-week"] = "hack-week", ["hammer-code"] = "hammer-code", ["hand-curved-arrow-left"] = "hand-curved-arrow-left", ["hand-dual-arrows"] = "hand-dual-arrows", ["hand-ellipse"] = "hand-ellipse", ["hand-half-ellipse"] = "hand-half-ellipse", ["hand-two-arrows-horizontal"] = "hand-two-arrows-horizontal", ["hashtag"] = "hashtag", ["hat-fedora"] = "hat-fedora", ["hat-toque"] = "hat-toque", ["head-blank"] = "head-blank", ["head-blush"] = "head-blush", ["head-female"] = "head-female", ["head-freckles"] = "head-freckles", ["head-lips"] = "head-lips", ["head-male"] = "head-male", ["headphones"] = "headphones", ["headphones-arrow-up"] = "headphones-arrow-up", ["headphones-arrow-up-lock"] = "headphones-arrow-up-lock", ["headphones-slash"] = "headphones-slash", ["headphones-x"] = "headphones-x", ["headphones-x-lock"] = "headphones-x-lock", ["heart"] = "heart", ["house"] = "house", ["image"] = "image", ["image-stacked"] = "image-stacked", ["instagram"] = "instagram", ["jacket"] = "jacket", ["key"] = "key", ["key-alt"] = "key-alt", ["key-apostrophe"] = "key-apostrophe", ["key-arrow-down"] = "key-arrow-down", ["key-arrow-right"] = "key-arrow-right", ["key-arrow-up"] = "key-arrow-up", ["key-asterisk"] = "key-asterisk", ["key-backspace"] = "key-backspace", ["key-caps-lock"] = "key-caps-lock", ["key-caret"] = "key-caret", ["key-comma"] = "key-comma", ["key-command"] = "key-command", ["key-control"] = "key-control", ["key-grave-accent"] = "key-grave-accent", ["key-period"] = "key-period", ["key-return"] = "key-return", ["key-shift"] = "key-shift", ["key-space"] = "key-space", ["key-tab"] = "key-tab", ["language-characters"] = "language-characters", ["leg-left"] = "leg-left", ["leg-right"] = "leg-right", ["lightning-bolt"] = "lightning-bolt", ["linkedin"] = "linkedin", ["lips"] = "lips", ["lipstick"] = "lipstick", ["list-bulleted"] = "list-bulleted", ["location-pin"] = "location-pin", ["location-pin-map"] = "location-pin-map", ["lock-closed"] = "lock-closed", ["lollipop"] = "lollipop", ["magnifying-glass"] = "magnifying-glass", ["magnifying-glass-minus"] = "magnifying-glass-minus", ["magnifying-glass-plus"] = "magnifying-glass-plus", ["mascara"] = "mascara", ["megaphone"] = "megaphone", ["memory-card"] = "memory-card", ["messenger"] = "messenger", ["microphone"] = "microphone", ["microphone-slash"] = "microphone-slash", ["microphone-text-box"] = "microphone-text-box", ["microphone-triangle-exclamation"] = "microphone-triangle-exclamation", ["minus"] = "minus", ["minus-small"] = "minus-small", ["mirror-standing"] = "mirror-standing", ["moments"] = "moments", ["moon"] = "moon", ["mouse-button-left"] = "mouse-button-left", ["mouse-button-right"] = "mouse-button-right", ["mouse-scrollwheel"] = "mouse-scrollwheel", ["music-note"] = "music-note", ["nebula"] = "nebula", ["necklace"] = "necklace", ["nine-dots-grid"] = "nine-dots-grid", ["ninja"] = "ninja", ["nose"] = "nose", ["page"] = "page", ["paint-brush"] = "paint-brush", ["paint-bucket"] = "paint-bucket", ["pants"] = "pants", ["pants-2d-text"] = "pants-2d-text", ["paper-airplane"] = "paper-airplane", ["parrot"] = "parrot", ["pause-large"] = "pause-large", ["pause-small"] = "pause-small", ["pencil"] = "pencil", ["pencil-square"] = "pencil-square", ["person"] = "person", ["person-arrow-from-bottom-right"] = "person-arrow-from-bottom-right", ["person-check"] = "person-check", ["person-circle-slash"] = "person-circle-slash", ["person-climbing"] = "person-climbing", ["person-clock"] = "person-clock", ["person-falling"] = "person-falling", ["person-graduate"] = "person-graduate", ["person-jumping"] = "person-jumping", ["person-magnifying-glass"] = "person-magnifying-glass", ["person-photo-camera"] = "person-photo-camera", ["person-play"] = "person-play", ["person-play-clock"] = "person-play-clock", ["person-plus"] = "person-plus", ["person-racing"] = "person-racing", ["person-running"] = "person-running", ["person-standing"] = "person-standing", ["person-standing-arrow-reverse"] = "person-standing-arrow-reverse", ["person-standing-dual-arrows-vertical"] = "person-standing-dual-arrows-vertical", ["person-standing-gear"] = "person-standing-gear", ["person-swimming"] = "person-swimming", ["person-teleport"] = "person-teleport", ["person-trash-can"] = "person-trash-can", ["person-walking"] = "person-walking", ["person-with-smaller-person"] = "person-with-smaller-person", ["phone"] = "phone", ["phone-down"] = "phone-down", ["phone-plus"] = "phone-plus", ["phone-volume"] = "phone-volume", ["phone-x"] = "phone-x", ["photo-camera"] = "photo-camera", ["photo-camera-face"] = "photo-camera-face", ["photo-camera-slash"] = "photo-camera-slash", ["picture-in-picture"] = "picture-in-picture", ["pig"] = "pig", ["pin"] = "pin", ["pin-slash"] = "pin-slash", ["play-large"] = "play-large", ["play-small"] = "play-small", ["plus-large"] = "plus-large", ["plus-small"] = "plus-small", ["premium"] = "premium", ["ps-circle"] = "ps-circle", ["ps-dpad-down"] = "ps-dpad-down", ["ps-dpad-left"] = "ps-dpad-left", ["ps-dpad-right"] = "ps-dpad-right", ["ps-dpad-up"] = "ps-dpad-up", ["ps-l1"] = "ps-l1", ["ps-l2"] = "ps-l2", ["ps-l3"] = "ps-l3", ["ps-r1"] = "ps-r1", ["ps-r2"] = "ps-r2", ["ps-r3"] = "ps-r3", ["ps-square"] = "ps-square", ["ps-stick-left"] = "ps-stick-left", ["ps-stick-right"] = "ps-stick-right", ["ps-triagle"] = "ps-triagle", ["ps-x"] = "ps-x", ["ps4-options"] = "ps4-options", ["ps4-share"] = "ps4-share", ["ps4-touchpad"] = "ps4-touchpad", ["ps5-options"] = "ps5-options", ["ps5-share"] = "ps5-share", ["ps5-touchpad"] = "ps5-touchpad", ["pumpkin"] = "pumpkin", ["purse"] = "purse", ["rectangle-list"] = "rectangle-list", ["rectangle-numbers-counting"] = "rectangle-numbers-counting", ["rectangle-person-with-three-horizontal-lines"] = "rectangle-person-with-three-horizontal-lines", ["robux"] = "robux", ["rosette-seven-point"] = "rosette-seven-point", ["rosette-ten-point"] = "rosette-ten-point", ["seven-point-rosette"] = "seven-point-rosette", ["shield-check"] = "shield-check", ["shield-lock"] = "shield-lock", ["shirt"] = "shirt", ["shirt-2d-text"] = "shirt-2d-text", ["shirt-pants"] = "shirt-pants", ["shoe-left"] = "shoe-left", ["shoe-right"] = "shoe-right", ["shopping-basket"] = "shopping-basket", ["shopping-basket-check"] = "shopping-basket-check", ["shopping-cart"] = "shopping-cart", ["shorts"] = "shorts", ["sidebar"] = "sidebar", ["signal-exclamation"] = "signal-exclamation", ["six-dots-two-column-grid"] = "six-dots-two-column-grid", ["skip-end-large"] = "skip-end-large", ["skip-end-small"] = "skip-end-small", ["skip-next-large"] = "skip-next-large", ["skip-next-small"] = "skip-next-small", ["skip-previous-large"] = "skip-previous-large", ["skip-previous-small"] = "skip-previous-small", ["skip-start-large"] = "skip-start-large", ["skip-start-small"] = "skip-start-small", ["smartphone-portrait"] = "smartphone-portrait", ["speaker"] = "speaker", ["speaker-slash"] = "speaker-slash", ["speaker-triangle-exclamation"] = "speaker-triangle-exclamation", ["speaker-x"] = "speaker-x", ["speech-bubble-align-center"] = "speech-bubble-align-center", ["speech-bubble-align-left"] = "speech-bubble-align-left", ["speech-bubble-exclamation"] = "speech-bubble-exclamation", ["speech-bubble-round"] = "speech-bubble-round", ["square-bone"] = "square-bone", ["square-books"] = "square-books", ["square-check"] = "square-check", ["square-code"] = "square-code", ["square-dashed-person-standing"] = "square-dashed-person-standing", ["square-dual-arrows-horizontal"] = "square-dual-arrows-horizontal", ["square-dual-arrows-to-corner"] = "square-dual-arrows-to-corner", ["square-face-sound"] = "square-face-sound", ["square-face-waving-hand"] = "square-face-waving-hand", ["square-face-winking"] = "square-face-winking", ["square-minus"] = "square-minus", ["square-person"] = "square-person", ["squares-grid-plus"] = "squares-grid-plus", ["squares-grid-qr"] = "squares-grid-qr", ["stacked-squares-arrow-down-left"] = "stacked-squares-arrow-down-left", ["stacked-squares-arrow-up-right"] = "stacked-squares-arrow-up-right", ["stacked-squares-plus"] = "stacked-squares-plus", ["star"] = "star", ["stop-large"] = "stop-large", ["stop-small"] = "stop-small", ["studio"] = "studio", ["sun"] = "sun", ["sweater"] = "sweater", ["sword"] = "sword", ["tag-sparkle"] = "tag-sparkle", ["teletype"] = "teletype", ["tencent-qq"] = "tencent-qq", ["text-b-bold"] = "text-b-bold", ["text-box-microphone"] = "text-box-microphone", ["text-h-subscript-1"] = "text-h-subscript-1", ["text-h-subscript-2"] = "text-h-subscript-2", ["text-h-subscript-3"] = "text-h-subscript-3", ["text-i-italic"] = "text-i-italic", ["text-s-strikethrough"] = "text-s-strikethrough", ["text-u-underline"] = "text-u-underline", ["text-uppercase-a-lowercase-a"] = "text-uppercase-a-lowercase-a", ["text-x-subscript-2"] = "text-x-subscript-2", ["text-x-superscript-2"] = "text-x-superscript-2", ["three-bars-horizontal"] = "three-bars-horizontal", ["three-bars-horizontal-chevron-left"] = "three-bars-horizontal-chevron-left", ["three-bars-horizontal-narrowing"] = "three-bars-horizontal-narrowing", ["three-bars-horizontal-triangles-vertical"] = "three-bars-horizontal-triangles-vertical", ["three-bars-vertical-triangles-horizontal"] = "three-bars-vertical-triangles-horizontal", ["three-chevrons-enlarging-down"] = "three-chevrons-enlarging-down", ["three-chevrons-enlarging-up"] = "three-chevrons-enlarging-up", ["three-dots-horizontal"] = "three-dots-horizontal", ["three-dots-vertical"] = "three-dots-vertical", ["three-horizontal-bars-wrapping-right"] = "three-horizontal-bars-wrapping-right", ["three-people"] = "three-people", ["three-ring-note"] = "three-ring-note", ["three-sliders-horizontal"] = "three-sliders-horizontal", ["three-stacked-squares-tilted"] = "three-stacked-squares-tilted", ["thumb-down"] = "thumb-down", ["thumb-up"] = "thumb-up", ["tik-tok"] = "tik-tok", ["tilt"] = "tilt", ["torso"] = "torso", ["trash-can"] = "trash-can", ["triangle-exclamation"] = "triangle-exclamation", ["trophy"] = "trophy", ["tshirt"] = "tshirt", ["tshirt-2d-text"] = "tshirt-2d-text", ["tshirt-dual-arrows"] = "tshirt-dual-arrows", ["twitch"] = "twitch", ["twitter"] = "twitter", ["two-arrows-down-and-up"] = "two-arrows-down-and-up", ["two-arrows-from-center"] = "two-arrows-from-center", ["two-arrows-left-right"] = "two-arrows-left-right", ["two-arrows-loop-clockwise"] = "two-arrows-loop-clockwise", ["two-arrows-loop-clockwise-1"] = "two-arrows-loop-clockwise-1", ["two-arrows-loop-clockwise-infinity"] = "two-arrows-loop-clockwise-infinity", ["two-arrows-spin-clockwise"] = "two-arrows-spin-clockwise", ["two-arrows-spin-clockwise-plus"] = "two-arrows-spin-clockwise-plus", ["two-arrows-switch-right"] = "two-arrows-switch-right", ["two-arrows-to-center"] = "two-arrows-to-center", ["two-folders"] = "two-folders", ["two-location-pins-connecting-arrow"] = "two-location-pins-connecting-arrow", ["two-makeup-brushes"] = "two-makeup-brushes", ["two-people"] = "two-people", ["two-people-speech-bubble"] = "two-people-speech-bubble", ["two-stacked-squares"] = "two-stacked-squares", ["two-switches-horizontal"] = "two-switches-horizontal", ["verified-backplate"] = "verified-backplate", ["verified-check"] = "verified-check", ["verified-mono"] = "verified-mono", ["video-camera"] = "video-camera", ["video-camera-arrow-to-bottom-left"] = "video-camera-arrow-to-bottom-left", ["video-camera-arrow-to-top-right"] = "video-camera-arrow-to-top-right", ["video-camera-slash"] = "video-camera-slash", ["video-camera-triangle-exclamation"] = "video-camera-triangle-exclamation", ["video-camera-x"] = "video-camera-x", ["wallet"] = "wallet", ["we-chat"] = "we-chat", ["whatsapp"] = "whatsapp", ["x"] = "x", ["x-small"] = "x-small", ["xbox-a"] = "xbox-a", ["xbox-a-pressed"] = "xbox-a-pressed", ["xbox-a-unpressed"] = "xbox-a-unpressed", ["xbox-b"] = "xbox-b", ["xbox-dpad"] = "xbox-dpad", ["xbox-dpad-down"] = "xbox-dpad-down", ["xbox-dpad-left"] = "xbox-dpad-left", ["xbox-dpad-right"] = "xbox-dpad-right", ["xbox-dpad-up"] = "xbox-dpad-up", ["xbox-lb"] = "xbox-lb", ["xbox-lt"] = "xbox-lt", ["xbox-menu"] = "xbox-menu", ["xbox-rb"] = "xbox-rb", ["xbox-rt"] = "xbox-rt", ["xbox-stick-left"] = "xbox-stick-left", ["xbox-stick-left-directional"] = "xbox-stick-left-directional", ["xbox-stick-left-horizontal"] = "xbox-stick-left-horizontal", ["xbox-stick-left-vertical"] = "xbox-stick-left-vertical", ["xbox-stick-right"] = "xbox-stick-right", ["xbox-stick-right-directional"] = "xbox-stick-right-directional", ["xbox-stick-right-horizontal"] = "xbox-stick-right-horizontal", ["xbox-stick-right-vertical"] = "xbox-stick-right-vertical", ["xbox-view"] = "xbox-view", ["xbox-x"] = "xbox-x", ["xbox-y"] = "xbox-y", ["xr-headset"] = "xr-headset", ["youtube"] = "youtube"
    }
end
)
Neverlose.IsMouseOverFrame = ( function (ll1I1l1IIII, I1llllIl1Il)
    if not I1llllIl1Il then
        return
    end
    if Neverlose.Global3DRenderMode then
        if I1llllIl1Il.GuiState == Enum.GuiState.Hover or I1llllIl1Il.GuiState == Enum.GuiState.Press then
            return true
        end
        return false
    end
    local l1IlI1II11I, I1lllIl1llI = I1llllIl1Il.AbsolutePosition, I1llllIl1Il.AbsoluteSize
    if Mouse.X >= l1IlI1II11I.X and Mouse.X <= l1IlI1II11I.X + I1lllIl1llI.X and Mouse.Y >= l1IlI1II11I.Y and Mouse.Y <= l1IlI1II11I.Y + I1lllIl1llI.Y then
        return true
    end
end
)
Neverlose.CreateSignal = ( function (l1I1I11I11I, l1l1l1II1Il)
    local IIIIIIIII1l = Instance.new("BindableEvent")
    local IIl1l11I111 = {
        Value = l1l1l1II1Il, __event = IIIIIIIII1l
    }
    function IIl1l11I111:GetValue()
        return IIl1l11I111.Value
    end
    function IIl1l11I111:SetValue(Ill1lll1lII)
        IIl1l11I111.Value = Ill1lll1lII
        return IIIIIIIII1l:Fire(Ill1lll1lII)
    end
    function IIl1l11I111:Connect(l11l1I1IlII)
        local l1l1ll1IIlI = IIIIIIIII1l.Event:Connect(l11l1I1IlII)
        Neverlose:AddSignal(l1l1ll1IIlI)
        return l1l1ll1IIlI
    end
    return IIl1l11I111
end
)
function Neverlose:_ApplyTextGradient(lII1llIIIlI)
    if not lII1llIIIlI or not lII1llIIIlI.Parent then
        return
    end
    local l1lIl1II1I1 = lII1llIIIlI:FindFirstChild("ModernTextGradient")
    if not Neverlose.TextGradientEnabled then
        if l1lIl1II1I1 then
            l1lIl1II1I1:Destroy()
        end
        return
    end
    if not l1lIl1II1I1 then
        l1lIl1II1I1 = Instance.new("UIGradient")
        l1lIl1II1I1.Name = "ModernTextGradient"
        l1lIl1II1I1.Parent = lII1llIIIlI
    end
    local l1lIl1ll1lI = Neverlose.AccentColor or Color3.fromRGB(78, 127, 252)
    local lIIlIl1111l = (((Neverlose.TextGradientAnimationTime or 0) * 0.9) % 2) - 1
    l1lIl1II1I1.Rotation = 0
    l1lIl1II1I1.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, l1lIl1ll1lI:Lerp(Color3.new(1, 1, 1), 0.2)), ColorSequenceKeypoint.new(0.55, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, l1lIl1ll1lI:Lerp(Color3.new(1, 1, 1), 0.35)),
    })
    l1lIl1II1I1.Offset = Vector2.new(lIIlIl1111l, 0)
    for III1IIIlIIl, I1l1111Il11 in ipairs(Neverlose.TextGradientObjects) do
        if I1l1111Il11 == l1lIl1II1I1 then
            return l1lIl1II1I1
        end
    end
    table.insert(Neverlose.TextGradientObjects, l1lIl1II1I1)
    return l1lIl1II1I1
end
function Neverlose:AddTextGradient(IllIl11IllI)
    if not IllIl11IllI then
        return IllIl11IllI
    end
    for IlllIlIl1Il, IIlI11II11I in ipairs(Neverlose.TextGradientLabels) do
        if IIlI11II11I == IllIl11IllI then
            Neverlose:_ApplyTextGradient(IllIl11IllI)
            return IllIl11IllI
        end
    end
    table.insert(Neverlose.TextGradientLabels, IllIl11IllI)
    Neverlose:_ApplyTextGradient(IllIl11IllI)
    return IllIl11IllI
end
function Neverlose:SetTextGradientEnabled(lIllI11lIl1)
    Neverlose.TextGradientEnabled = lIllI11lIl1 == true
    if not Neverlose.TextGradientEnabled then
        Neverlose.TextGradientAccumulator = 0
    end
    table.clear(Neverlose.TextGradientObjects)
    for l11III11Ill = #Neverlose.TextGradientLabels, 1, - 1 do
        local Il1l1lI1Il1 = Neverlose.TextGradientLabels[l11III11Ill]
        if Il1l1lI1Il1 and Il1l1lI1Il1.Parent then
            Neverlose:_ApplyTextGradient(Il1l1lI1Il1)
        else
            table.remove(Neverlose.TextGradientLabels, l11III11Ill)
        end
    end
end
function Neverlose:AnimateTextGradients(Il1I1I1IIl1)
    if not Neverlose.TextGradientEnabled then
        return
    end
    Neverlose.TextGradientAccumulator = (Neverlose.TextGradientAccumulator or 0) + (Il1I1I1IIl1 or 0)
    if Neverlose.TextGradientAccumulator < (1 / 30) then
        return
    end
    local lIll11IlIll = Neverlose.TextGradientAccumulator
    Neverlose.TextGradientAccumulator = 0
    Neverlose.TextGradientAnimationTime = (Neverlose.TextGradientAnimationTime or 0) + lIll11IlIll
    local lIIIIIl1lII = ((Neverlose.TextGradientAnimationTime * 0.9) % 2) - 1
    local I1I11l1l1I1 = Vector2.new(lIIIIIl1lII, 0)
    for IlllIlI1IlI = #Neverlose.TextGradientObjects, 1, - 1 do
        local ll1Il11lIIl = Neverlose.TextGradientObjects[IlllIlI1IlI]
        if ll1Il11lIIl and ll1Il11lIIl.Parent then
            ll1Il11lIIl.Rotation = 0
            ll1Il11lIIl.Offset = I1I11l1l1I1
        else
            table.remove(Neverlose.TextGradientObjects, IlllIlI1IlI)
        end
    end
end
Neverlose:AddSignal(RunService.RenderStepped:Connect( function (Ill1lllll1I)
    Neverlose:AnimateTextGradients(Ill1lllll1I)
end
))
Neverlose.SetIconMode = ( function (lllIIllI1I1, lI11II1l1I1, Ill11ll1I11)
    Ill11ll1I11 = tostring(Ill11ll1I11 or "")
    local IlII11lIlIl = Ill11ll1I11
    local I11l1I1I11I = Neverlose.IconAliases[IlII11lIlIl] or IlII11lIlIl
    local II11IlIlII1 = Neverlose:IsWebmIcon(IlII11lIlIl) or Neverlose:IsWebmIcon(I11l1I1I11I)
    local lIlIlIlIIII = Neverlose:GetIconId(IlII11lIlIl)
    if lIlIlIlIIII == "" and I11l1I1I11I ~= IlII11lIlIl then
        lIlIlIlIIII = Neverlose:GetIconId(I11l1I1I11I)
    end
    if lI11II1l1I1:IsA("ImageLabel") then
        if II11IlIlII1 then
            lI11II1l1I1.Image = ""
            lI11II1l1I1.ImageTransparency = 1
            lI11II1l1I1.ScaleType = Enum.ScaleType.Fit
            Neverlose:ApplyIconVideo(lI11II1l1I1, IlII11lIlIl)
            local I1IIl11IIll = lI11II1l1I1:FindFirstChild("ModernIconFallbackText")
            if I1IIl11IIll then
                I1IIl11IIll.Visible = false
            end
            return
        end
        Neverlose:ClearIconVideo(lI11II1l1I1)
        lI11II1l1I1.Image = lIlIlIlIIII
        lI11II1l1I1.ScaleType = Enum.ScaleType.Fit
        local IIlII1lll1I = lI11II1l1I1:FindFirstChild("ModernIconScale")
        if not IIlII1lll1I then
            IIlII1lll1I = Instance.new("UIScale")
            IIlII1lll1I.Name = "ModernIconScale"
            IIlII1lll1I.Parent = lI11II1l1I1
        end
        IIlII1lll1I.Scale = tonumber(lI11II1l1I1:GetAttribute("ModernIconScaleValue")) or Neverlose.IconScale or 0.82
        local I1lll1IIlIl = lI11II1l1I1:FindFirstChild("ModernIconFallbackText")
        if lIlIlIlIIII ~= "" then
            if I1lll1IIlIl then
                I1lll1IIlIl.Visible = false
            end
        else
            lI11II1l1I1.ImageTransparency = 1
            if I11l1I1I11I ~= "" and not Neverlose:IsLibraryIcon(I11l1I1I11I) then
                if not I1lll1IIlIl then
                    I1lll1IIlIl = Instance.new("TextLabel")
                    I1lll1IIlIl.Name = "ModernIconFallbackText"
                    I1lll1IIlIl.Parent = lI11II1l1I1
                    I1lll1IIlIl.AnchorPoint = Vector2.new(0.5, 0.5)
                    I1lll1IIlIl.BackgroundTransparency = 1
                    I1lll1IIlIl.BorderSizePixel = 0
                    I1lll1IIlIl.Position = UDim2.fromScale(0.5, 0.5)
                    I1lll1IIlIl.Size = UDim2.fromScale(1, 1)
                    I1lll1IIlIl.ZIndex = lI11II1l1I1.ZIndex + 1
                    I1lll1IIlIl.TextScaled = true
                    I1lll1IIlIl.TextWrapped = true
                    I1lll1IIlIl:SetAttribute("NeverloseUIIconFont", true )
                    Neverlose:AddSignal(lI11II1l1I1:GetPropertyChangedSignal("ImageTransparency"):Connect( function ()
                        local Illl1lIlI11 = lI11II1l1I1:FindFirstChild("ModernIconFallbackText")
                        if Illl1lIlI11 then
                            Illl1lIlI11.TextTransparency = lI11II1l1I1.ImageTransparency
                        end
                    end
                    ))
                    Neverlose:AddSignal(lI11II1l1I1:GetPropertyChangedSignal("ImageColor3"):Connect( function ()
                        local llIl1I1l1lI = lI11II1l1I1:FindFirstChild("ModernIconFallbackText")
                        if llIl1I1l1lI then
                            llIl1I1l1lI.TextColor3 = lI11II1l1I1.ImageColor3
                        end
                    end
                    ))
                    Neverlose:AddSignal(lI11II1l1I1:GetPropertyChangedSignal("ZIndex"):Connect( function ()
                        local lllIIlIIIl1 = lI11II1l1I1:FindFirstChild("ModernIconFallbackText")
                        if lllIIlIIIl1 then
                            lllIIlIIIl1.ZIndex = lI11II1l1I1.ZIndex + 1
                        end
                    end
                    ))
                end
                local I1llllI1Ill = string.lower(string.sub(I11l1I1I11I, - 5)) == "-bold"
                I1lll1IIlIl.Text = I1llllI1Ill and I11l1I1I11I:sub(1, - 6) or I11l1I1I11I
                I1lll1IIlIl.FontFace = I1llllI1Ill and Neverlose.BuiltInBold or Neverlose.BuiltInRegular
                I1lll1IIlIl.TextColor3 = lI11II1l1I1.ImageColor3
                I1lll1IIlIl.TextTransparency = lI11II1l1I1.ImageTransparency
                I1lll1IIlIl.Visible = true
            elseif I1lll1IIlIl then
                I1lll1IIlIl.Visible = false
            end
        end
        return
    end
    local Il111I1lI1I = lI11II1l1I1:FindFirstChild("ModernResolvedIcon")
    if II11IlIlII1 then
        if not Il111I1lI1I then
            Il111I1lI1I = Instance.new("ImageLabel")
            Il111I1lI1I.Name = "ModernResolvedIcon"
            Il111I1lI1I.Parent = lI11II1l1I1
            Il111I1lI1I.AnchorPoint = Vector2.new(0.5, 0.5)
            Il111I1lI1I.BackgroundTransparency = 1
            Il111I1lI1I.BorderSizePixel = 0
            Il111I1lI1I.Position = UDim2.fromScale(0.5, 0.5)
            Il111I1lI1I.Size = UDim2.fromScale(1, 1)
            Il111I1lI1I.ScaleType = Enum.ScaleType.Fit
            Il111I1lI1I.ZIndex = lI11II1l1I1.ZIndex
        end
        Il111I1lI1I.Image = ""
        Il111I1lI1I.ImageTransparency = 1
        Il111I1lI1I.Visible = true
        Neverlose:ApplyIconVideo(Il111I1lI1I, IlII11lIlIl)
        lI11II1l1I1.Text = ""
        return
    elseif Il111I1lI1I then
        Neverlose:ClearIconVideo(Il111I1lI1I)
    end
    if lIlIlIlIIII ~= "" then
        if not Il111I1lI1I then
            Il111I1lI1I = Instance.new("ImageLabel")
            Il111I1lI1I.Name = "ModernResolvedIcon"
            Il111I1lI1I.Parent = lI11II1l1I1
            Il111I1lI1I.AnchorPoint = Vector2.new(0.5, 0.5)
            Il111I1lI1I.BackgroundTransparency = 1
            Il111I1lI1I.BorderSizePixel = 0
            Il111I1lI1I.Position = UDim2.fromScale(0.5, 0.5)
            Il111I1lI1I.Size = UDim2.fromScale(1, 1)
            Il111I1lI1I.ScaleType = Enum.ScaleType.Fit
            Il111I1lI1I.ZIndex = lI11II1l1I1.ZIndex
            Neverlose:AddSignal(lI11II1l1I1:GetPropertyChangedSignal("TextTransparency"):Connect( function ()
                local lIlIlI1IIlI = lI11II1l1I1:FindFirstChild("ModernResolvedIcon")
                if lIlIlI1IIlI then
                    lIlIlI1IIlI.ImageTransparency = lI11II1l1I1.TextTransparency
                end
            end
            ))
            Neverlose:AddSignal(lI11II1l1I1:GetPropertyChangedSignal("TextColor3"):Connect( function ()
                local I1Il111III1 = lI11II1l1I1:FindFirstChild("ModernResolvedIcon")
                if I1Il111III1 then
                    I1Il111III1.ImageColor3 = lI11II1l1I1.TextColor3
                end
            end
            ))
            Neverlose:AddSignal(lI11II1l1I1:GetPropertyChangedSignal("ZIndex"):Connect( function ()
                local l1IlllIlI1l = lI11II1l1I1:FindFirstChild("ModernResolvedIcon")
                if l1IlllIlI1l then
                    l1IlllIlI1l.ZIndex = lI11II1l1I1.ZIndex
                end
            end
            ))
        end
        Il111I1lI1I.Image = lIlIlIlIIII
        Il111I1lI1I.ImageColor3 = lI11II1l1I1.TextColor3
        Il111I1lI1I.ImageTransparency = lI11II1l1I1.TextTransparency
        Il111I1lI1I.Visible = true
        lI11II1l1I1.Text = ""
        return
    end
    if Il111I1lI1I then
        Il111I1lI1I.Visible = false
        Il111I1lI1I.Image = ""
    end
    Ill11ll1I11 = I11l1I1I11I
    if Neverlose:IsLibraryIcon(Ill11ll1I11) then
        lI11II1l1I1.Text = ""
        return
    end
    local I1I1II111l1 = string.lower(string.sub(Ill11ll1I11, - 5)) == "-bold"
    if I1I1II111l1 then
        lI11II1l1I1.Text = Ill11ll1I11:sub(1, - 6)
        lI11II1l1I1.FontFace = Neverlose.BuiltInBold
    else
        lI11II1l1I1.Text = Ill11ll1I11
        lI11II1l1I1.FontFace = Neverlose.BuiltInRegular
    end
    lI11II1l1I1:SetAttribute("NeverloseUIIconFont", true )
end
)
function Neverlose:GetIconFont(l1l1lllI1II)
    local l1IlII1111I = string.lower(string.sub(l1l1lllI1II, - 5)) == "-bold"
    if l1IlII1111I then
        return Neverlose.BuiltInBold
    end
    return Neverlose.BuiltInRegular
end
function Neverlose:ResolveFontFace(IIlllllllI1)
    if typeof(IIlllllllI1) == "Font" then
        return IIlllllllI1
    end
    if not IIlllllllI1 or IIlllllllI1 == "" then
        return nil
    end
    local lI1llIll11l = tostring(IIlllllllI1)
    if string.match(lI1llIll11l, "^%d+$") then
        lI1llIll11l = "rbxassetid://" .. lI1llIll11l
    elseif not string.find(lI1llIll11l, "rbxasset://", 1, true ) and not string.find(lI1llIll11l, "rbxassetid://", 1, true ) and not string.match(lI1llIll11l, "^https?://") then
        lI1llIll11l = "rbxasset://fonts/families/" .. lI1llIll11l .. ".json"
    end
    local I11llII1l1I, IIlll11IIIl = pcall( function ()
        return Font.new(lI1llIll11l, Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    end
    )
    if I11llII1l1I then
        return IIlll11IIIl
    end
end
function Neverlose:ApplyFont(IIlIIllIlII)
    if not Neverlose.FontFace then
        return IIlIIllIlII
    end
    if not IIlIIllIlII or ( not IIlIIllIlII:IsA("TextLabel") and not IIlIIllIlII:IsA("TextBox") and not IIlIIllIlII:IsA("TextButton")) then
        return IIlIIllIlII
    end
    if IIlIIllIlII:GetAttribute("NeverloseUIIconFont") then
        return IIlIIllIlII
    end
    IIlIIllIlII.FontFace = Neverlose.FontFace
    return IIlIIllIlII
end
function Neverlose:SetFont(ll11IIIIl1l)
    Neverlose.Font = ll11IIIIl1l
    Neverlose.FontFace = Neverlose:ResolveFontFace(ll11IIIIl1l)
    if Neverlose.FontFace then
        for I1lIIIIllll, Il1IIlI1IIl in next, Neverlose.ScreenGui:GetDescendants() do
            Neverlose:ApplyFont(Il1IIlI1IIl)
        end
    end
    return Neverlose.FontFace
end
function Neverlose:MoreThanHalfY(I1Il1ll1II1)
    return (Neverlose.ScreenGui.AbsoluteSize.Y / 2) < I1Il1ll1II1
end
Neverlose.IsStudio = RunService:IsStudio()
Neverlose.IsMobile = UserInputService.TouchEnabled
function Neverlose:IsSmallScreen()
    local lIl1IllII1l = Neverlose.ScreenGui.AbsoluteSize
    return Neverlose.IsMobile == true and math.min(lIl1IllII1l.X, lIl1IllII1l.Y) < 700
end
Neverlose.CreateInput = ( function (lII1IIll1I1, llIIIIll1ll, IIllllIlII1)
    local lIIllIlII1I = Instance.new("ImageButton", llIIIIll1ll)
    lIIllIlII1I.ZIndex = llIIIIll1ll.ZIndex + 10
    lIIllIlII1I.Size = UDim2.fromScale(1, 1)
    lIIllIlII1I.BackgroundTransparency = 1
    lIIllIlII1I.ImageTransparency = 1
    lIIllIlII1I.Image = "rbxasset://textuers/translateIcon.png"
    if IIllllIlII1 then
        local Il1IIllIl1l = lIIllIlII1I.MouseButton1Click:Connect(IIllllIlII1)
        return lIIllIlII1I, Il1IIllIl1l
    end
    return lIIllIlII1I
end
)
Neverlose.PlayAnimate = ( function (llIlIIIlI11, IIl1IlIl1l1, I1I1II11llI)
    if llIlIIIlI11 and llIlIIIlI11:IsA("ImageLabel") then
        local l111111I1II ={}
        for lIll1llI1l1, ll1lIIl11l1 in next, I1I1II11llI do
            if lIll1llI1l1 == "TextTransparency" then
                l111111I1II.ImageTransparency = ll1lIIl11l1
            elseif lIll1llI1l1 == "TextColor3" then
                l111111I1II.ImageColor3 = ll1lIIl11l1
            else
                l111111I1II[lIll1llI1l1] = ll1lIIl11l1
            end
        end
        I1I1II11llI = l111111I1II
    end
    local l11111lIl1I = TweenService:Create(llIlIIIlI11, IIl1IlIl1l1 or TweenInfo.new(0.25), I1I1II11llI)
    l11111lIl1I:Play()
    return l11111lIl1I
end
)
Neverlose._SinkId = 0
Neverlose.NewSinkName = function ()
    Neverlose._SinkId += 1
    return "NLInputSink_" .. tostring(Neverlose._SinkId)
end
Neverlose.SetInputSink = function (l1lII1III1l, lIl11I1Il1I)
    pcall( function ()
        local I11lIll11lI = game:GetService("ContextActionService")
        if lIl11I1Il1I then
            I11lIll11lI:BindActionAtPriority(l1lII1III1l, function ()
                return Enum.ContextActionResult.Sink
            end
            , false , 5000, Enum.UserInputType.Touch)
        else
            I11lIll11lI:UnbindAction(l1lII1III1l)
        end
    end
    )
end
Neverlose.GetDragRate = function ()
    local lIIll111IlI = math.clamp(tonumber(Neverlose.DragSmoothness) or 0, 0, 100)
    if lIIll111IlI <= 0 then
        return nil
    end
    return40 * (0.08 ^ (lIIll111IlI / 100))
end

-- ====================================================================
-- [9] Dragging & 3D Tilt Mechanics
-- ====================================================================
Neverlose.Drag = function (I1I1l1l111l, l11Ill1l1Il, llIl11I1Il1, ll1l1Illlll)
    local lIIIIll1lII, Il11I1I11I1, I1Il11Il1Il, IIIIl1l1ll1 = 0, 0, 0, 0
    local I1l1IllllIl = Neverlose.NewSinkName()
    pcall( function ()
        I1I1l1l111l.Active = true
    end
    )
    local lllIII11l11 = nil
    local l1Il1III111 = 0
    local I1IlIlll1l1 = nil
    local lII1II11II1 = false
    local ll1I11ll1l1 = nil
    local lllI1l11lI1 = nil
    local IlIII1lI1lI = 0
    local llIlIIIIl1l, I11IllI1lll = 0, 0
    local lllIl11111l = 0
    local ll11l1l1lII, IllIIlllIll = 0, 0
    local l11ll1II1Il = false
    local I1IIlI1lI1l = false
    local II1l11lIIIl = 4
    local I1ll1llI11l = nil
    local function l1lII1lIIll(IIII11I11Il)
        if I1IIlI1lI1l == IIII11I11Il then
            return
        end
        I1IIlI1lI1l = IIII11I11Il
        if ll1l1Illlll then
            pcall(ll1l1Illlll, IIII11I11Il)
        end
    end
    local function ll1II11lII1()
        if I1ll1llI11l then
            I1ll1llI11l:Disconnect()
            I1ll1llI11l = nil
        end
        ll11l1l1lII, IllIIlllIll, lllIl11111l = 0, 0, 0
        l11ll1II1Il = false
        if l11Ill1l1Il.Rotation ~= 0 then
            l11Ill1l1Il.Rotation = 0
        end
        l1lII1lIIll( false )
    end
    local function Ill1lIl111I(I1Illll1111, llIll11IllI)
        l11Ill1l1Il.Position = UDim2.new(lllI1l11lI1.X.Scale, math.round(I1Illll1111), lllI1l11lI1.Y.Scale, math.round(llIll11IllI))
    end
    local function I1lll11I1lI()
        if lllIII11l11 then
            lllIII11l11:Disconnect()
            lllIII11l11 = nil
        end
    end
    local function I1I1I1III1l()
        if lllIII11l11 then
            return
        end
        lllIII11l11 = RunService.RenderStepped:Connect( function (Ill1IlI1II1)
            local lllIll1I1ll = Neverlose.ActiveWindow
            if not l11Ill1l1Il.Parent or not lllI1l11lI1 or (lllIll1I1ll and lllIll1I1ll.Minimizing) then
                I1lll11I1lI()
                return
            end
            Ill1IlI1II1 = math.min(Ill1IlI1II1, 0.05)
            local lI1ll1ll11l = Neverlose.GetDragRate()
            if not I1IlIlll1l1 then
                l1Il1III111 += Ill1IlI1II1
            end
            if not lI1ll1ll11l or l1Il1III111 > 0.7 then
                lIIIIll1lII, Il11I1I11I1 = I1Il11Il1Il, IIIIl1l1ll1
                Ill1lIl111I(lIIIIll1lII, Il11I1I11I1)
                I1lll11I1lI()
                return
            end
            local l1IlllIIl11 = 1 - math.exp(- lI1ll1ll11l * Ill1IlI1II1)
            lIIIIll1lII += (I1Il11Il1Il - lIIIIll1lII) * l1IlllIIl11
            Il11I1I11I1 += (IIIIl1l1ll1 - Il11I1I11I1) * l1IlllIIl11
            if math.abs(I1Il11Il1Il - lIIIIll1lII) < 0.4 and math.abs(IIIIl1l1ll1 - Il11I1I11I1) < 0.4 then
                lIIIIll1lII, Il11I1I11I1 = I1Il11Il1Il, IIIIl1l1ll1
                Ill1lIl111I(lIIIIll1lII, Il11I1I11I1)
                if not I1IlIlll1l1 then
                    I1lll11I1lI()
                end
                return
            end
            Ill1lIl111I(lIIIIll1lII, Il11I1I11I1)
        end
        )
    end
    local function l1III1I1IlI()
        if I1ll1llI11l or not Neverlose.DragTilt then
            return
        end
        l11ll1II1Il = true
        I1ll1llI11l = RunService.RenderStepped:Connect( function (lll1lIlIlI1)
            if not l11Ill1l1Il.Parent or Neverlose.Global3DRenderMode or not Neverlose.DragTilt then
                ll1II11lII1()
                return
            end
            lll1lIlIlI1 = math.min(lll1lIlIlI1, 0.05)
            local lII1II1III1 = 0
            if lII1II11II1 then
                IlIII1lI1lI += lll1lIlIlI1
                lllIl11111l *= math.exp(- lll1lIlIlI1 * 7)
                local I1I1I111I11 = 120
                local lI1l1I1lIIl = 0
                if math.abs(lllIl11111l) > I1I1I111I11 then
                    lI1l1I1lIIl = lllIl11111l - (math.sign(lllIl11111l) * I1I1I111I11)
                end
                local IIII1I1II11 = math.clamp(tonumber(Neverlose.DragMaxTilt) or 4, 0, 10)
                local l1I1lI11IIl = math.clamp((IlIII1lI1lI - 0.08) / 0.3, 0, 1)
                lII1II1III1 = math.clamp(lI1l1I1lIIl * 0.003, - IIII1I1II11, IIII1I1II11) * l1I1lI11IIl
            end
            IllIIlllIll += ((lII1II1III1 - ll11l1l1lII) * 140 - IllIIlllIll * 24) * lll1lIlIlI1
            ll11l1l1lII += IllIIlllIll * lll1lIlIlI1
            if not lII1II11II1 and math.abs(ll11l1l1lII) < 0.05 and math.abs(IllIIlllIll) < 0.1 then
                ll1II11lII1()
                return
            end
            local ll111I1lll1 = math.abs(ll11l1l1lII) < 0.02 and 0 or ll11l1l1lII
            if l11Ill1l1Il.Rotation ~= ll111I1lll1 then
                l11Ill1l1Il.Rotation = ll111I1lll1
            end
            if Neverlose.TiltHideContent ~= false then
                if math.abs(ll11l1l1lII) > 0.25 then
                    l1lII1lIIll( true )
                elseif math.abs(ll11l1l1lII) < 0.08 then
                    l1lII1lIIll( false )
                end
            else
                l1lII1lIIll( false )
            end
        end
        )
    end
    Neverlose:AddSignal(I1I1l1l111l.InputBegan:Connect( function (l11I1lIIIl1)
        if (l11I1lIIIl1.UserInputType == Enum.UserInputType.MouseButton1 or l11I1lIIIl1.UserInputType == Enum.UserInputType.Touch) and not Neverlose.Global3DRenderMode then
            if I1IlIlll1l1 then
                return
            end
            I1IlIlll1l1 = l11I1lIIIl1
            lII1II11II1 = false
            ll1I11ll1l1 = l11I1lIIIl1.Position
            lllI1l11lI1 = l11Ill1l1Il.Position
            local llIlIl1Illl
            llIlIl1Illl = l11I1lIIIl1.Changed:Connect( function ()
                if l11I1lIIIl1.UserInputState == Enum.UserInputState.End then
                    I1IlIlll1l1 = nil
                    lII1II11II1 = false
                    Neverlose.SetInputSink(I1l1IllllIl, false )
                    l1Il1III111 = 0
                    llIlIl1Illl:Disconnect()
                end
            end
            )
        end
    end
    ))
    Neverlose:AddSignal(UserInputService.InputChanged:Connect( function (IIIll11IlII)
        if not I1IlIlll1l1 then
            return
        end
        local Ill1II11l11 = false
        if I1IlIlll1l1.UserInputType == Enum.UserInputType.Touch then
            Ill1II11l11 = (IIIll11IlII == I1IlIlll1l1)
        else
            Ill1II11l11 = (IIIll11IlII.UserInputType == Enum.UserInputType.MouseMovement)
        end
        if not Ill1II11l11 or not l11Ill1l1Il.Parent or Neverlose.Global3DRenderMode then
            return
        end
        local Il11ll1llll = IIIll11IlII.Position - ll1I11ll1l1
        if not lII1II11II1 then
            if Il11ll1llll.Magnitude < II1l11lIIIl then
                return
            end
            lII1II11II1 = true
            Neverlose.SetInputSink(I1l1IllllIl, true )
            ll1I11ll1l1 = IIIll11IlII.Position
            lllI1l11lI1 = l11Ill1l1Il.Position
            lIIIIll1lII, Il11I1I11I1 = lllI1l11lI1.X.Offset, lllI1l11lI1.Y.Offset
            I1Il11Il1Il, IIIIl1l1ll1 = lIIIIll1lII, Il11I1I11I1
            l1Il1III111 = 0
            IlIII1lI1lI = 0
            lllIl11111l = 0
            llIlIIIIl1l, I11IllI1lll = IIIll11IlII.Position.X, os.clock()
            if l11Ill1l1Il.Rotation ~= 0 then
                l11Ill1l1Il.Rotation = 0
            end
            l1III1I1IlI()
            return
        end
        local I1lIIl1I1l1 = os.clock()
        local l1l11II1111 = math.max(I1lIIl1I1l1 - I11IllI1lll, 1 / 240)
        local Il1I1lllI11 = (IIIll11IlII.Position.X - llIlIIIIl1l) / l1l11II1111
        lllIl11111l += (Il1I1lllI11 - lllIl11111l) * 0.35
        llIlIIIIl1l, I11IllI1lll = IIIll11IlII.Position.X, I1lIIl1I1l1
        local Il1III11lII = Neverlose.ScreenGui.AbsoluteSize
        local lIlII1Il1I1 = lllI1l11lI1.X.Offset + Il11ll1llll.X
        local llIl1l1l11l = lllI1l11lI1.Y.Offset + Il11ll1llll.Y
        local Il1ll1I1lI1 = lllI1l11lI1.X.Scale * Il1III11lII.X + lIlII1Il1I1
        local l1111II1l11 = lllI1l11lI1.Y.Scale * Il1III11lII.Y + llIl1l1l11l
        lIlII1Il1I1 += math.clamp(Il1ll1I1lI1, 20, math.max(20, Il1III11lII.X - 20)) - Il1ll1I1lI1
        llIl1l1l11l += math.clamp(l1111II1l11, 20, math.max(20, Il1III11lII.Y - 20)) - l1111II1l11
        I1Il11Il1Il, IIIIl1l1ll1 = lIlII1Il1I1, llIl1l1l11l
        if Neverlose.GetDragRate() then
            I1I1I1III1l()
        else
            I1lll11I1lI()
            lIIIIll1lII, Il11I1I11I1 = lIlII1Il1I1, llIl1l1l11l
            Ill1lIl111I(lIIIIll1lII, Il11I1I11I1)
        end
    end
    ))
end
Neverlose.Rounding = ( function (I1I111II1l1, l1II111IlII)
    local lIlIlIllIII = 10 ^ (l1II111IlII or 0)
    return math.floor(I1I111II1l1 * lIlIlIllIII + 0.5) / lIlIlIllIII
end
)
Neverlose.Http ={}
do
    local Il1IIIIll11 = Neverlose.Http
    local l1ll1lIlII1 = setmetatable({}, {
        __mode = "k"
    })
    local function Il1I1llllII(ll1I1l1I1l1)
        local lllI1l1IIII, llIlIll1lI1 = pcall( function ()
            return ll1I1l1I1l1:ToHex()
        end
        )
        if lllI1l1IIII and llIlIll1lI1 then
            return "#" .. llIlIll1lI1
        end
        return string.format("#%02X%02X%02X", math.floor(ll1I1l1I1l1.R * 255 + 0.5), math.floor(ll1I1l1I1l1.G * 255 + 0.5), math.floor(ll1I1l1I1l1.B * 255 + 0.5))
    end
    local function IllllllII11(II11ll111II, l1l111IlI1I)
        local IIlll1III1I = typeof(II11ll111II)
        if IIlll1III1I == "number" then
            if II11ll111II ~= II11ll111II or II11ll111II == math.huge or II11ll111II == - math.huge then
                return0
            end
            return II11ll111II
        end
        if IIlll1III1I == "string" or IIlll1III1I == "boolean" then
            return II11ll111II
        end
        if IIlll1III1I == "Color3" then
            return Il1I1llllII(II11ll111II)
        end
        if IIlll1III1I == "EnumItem" then
            return tostring(II11ll111II)
        end
        if IIlll1III1I == "Instance" then
            return II11ll111II.Name
        end
        if IIlll1III1I == "table" then
            if l1l111IlI1I > 8 then
                return nil
            end
            local IIllIl1II1I ={}
            for llll11IlI1l, l11IIIllllI in next, II11ll111II do
                local IlI1lI1Il1I = IllllllII11(l11IIIllllI, l1l111IlI1I + 1)
                if IlI1lI1Il1I ~= nil then
                    IIllIl1II1I[type(llll11IlI1l) == "number" and llll11IlI1l or tostring(llll11IlI1l)] = IlI1lI1Il1I
                end
            end
            return IIllIl1II1I
        end
        if IIlll1III1I == "nil" or IIlll1III1I == "function" or IIlll1III1I == "thread" then
            return nil
        end
        return tostring(II11ll111II)
    end
    function Il1IIIIll11.Encode(lI11IIll1Il)
        local I1II1llI111, III1lllIlII = pcall( function ()
            return HttpService:JSONEncode(IllllllII11(lI11IIll1Il, 0))
        end
        )
        if I1II1llI111 then
            return III1lllIlII
        end
        return "null"
    end
    function Il1IIIIll11.Decode(IlIIl1ll1ll)
        local III1l1IlIl1, IllllIl1l1l = pcall( function ()
            return HttpService:JSONDecode(IlIIl1ll1ll)
        end
        )
        if III1l1IlIl1 then
            return IllllIl1l1l
        end
        return nil
    end
    function Il1IIIIll11.ToText(IllI1IlI1I1)
        local I1l11ll1IIl = typeof(IllI1IlI1I1)
        if I1l11ll1IIl == "string" then
            return IllI1IlI1I1
        end
        if I1l11ll1IIl == "Color3" then
            return Il1I1llllII(IllI1IlI1I1)
        end
        if I1l11ll1IIl == "table" then
            return Il1IIIIll11.Encode(IllI1IlI1I1)
        end
        return tostring(IllI1IlI1I1)
    end
    function Il1IIIIll11.Format(l11I1IIIIll, I1II1lIl1Il)
        if type(l11I1IIIIll) ~= "string" or not string.find(l11I1IIIIll, "{", 1, true ) then
            return l11I1IIIIll
        end
        I1II1lIl1Il = I1II1lIl1Il or {}
        return (string.gsub(l11I1IIIIll, "{([%w_:%.%-]+)}", function (IIIIIIl1I1l)
            if string.lower(string.sub(IIIIIIl1I1l, 1, 5)) == "flag:" then
                local l1l1l1I111I = (Neverlose.Flags or {})[string.sub(IIIIIIl1I1l, 6)]
                if l1l1l1I111I and type(l1l1l1I111I.GetValue) == "function" then
                    local l111III1l1I, l1IlI1Il1ll = pcall(l1l1l1I111I.GetValue, l1l1l1I111I)
                    if l111III1l1I then
                        return Il1IIIIll11.ToText(l1IlI1Il1ll)
                    end
                end
                return ""
            end
            local lI11I11l1Il = I1II1lIl1Il[string.lower(IIIIIIl1I1l)]
            if lI11I11l1Il ~= nil then
                return Il1IIIIll11.ToText(lI11I11l1Il)
            end
            return nil
        end
        ))
    end
    local function l11lIII1ll1(IIlIll1I1lI, lII1I1I111l, l11IIIIlII1)
        l11IIIIlII1 = l11IIIIlII1 or 0
        if type(IIlIll1I1lI) == "string" then
            return Il1IIIIll11.Format(IIlIll1I1lI, lII1I1I111l)
        end
        if type(IIlIll1I1lI) == "table" and l11IIIIlII1 < 8 then
            local IIlI1l1l1ll ={}
            for llI1IlIlll1, Il1I1lIlII1 in next, IIlIll1I1lI do
                IIlI1l1l1ll[llI1IlIlll1] = l11lIII1ll1(Il1I1lIlII1, lII1I1I111l, l11IIIIlII1 + 1)
            end
            return IIlI1l1l1ll
        end
        return IIlIll1I1lI
    end
    Il1IIIIll11.FormatDeep = l11lIII1ll1
    function Il1IIIIll11.BuildContext(II1ll1Il1lI, llIIlIl11I1)
        local lll111ll1ll = Players.LocalPlayer
        local lll1II1l11l ={}
        local Il11l1IIllI = (llIIlIl11I1 and llIIlIl11I1.n) or 0
        for IIIl1IlIlI1 = 1, Il11l1IIllI do
            lll1II1l11l[IIIl1IlIlI1] = llIIlIl11I1[IIIl1IlIlI1]
        end
        local lIIllI1l111 = lll1II1l11l[1]
        local II11111l1Il = "null"
        if lIIllI1l111 ~= nil then
            II11111l1Il = string.sub(Il1IIIIll11.Encode({
                lIIllI1l111
            }), 2, - 2)
        end
        local III1IIl1Il1 = Il1IIIIll11.ToText(lIIllI1l111)
        return {
            value = lIIllI1l111, value_json = II11111l1Il, value_url = HttpService:UrlEncode(III1IIl1Il1), name = II1ll1Il1lI and II1ll1Il1lI.Name or "", flag = II1ll1Il1lI and (II1ll1Il1lI.Flag or II1ll1Il1lI.Key or II1ll1Il1lI.ConfigKey) or "", player = lll111ll1ll and lll111ll1ll.Name or "", displayname = lll111ll1ll and lll111ll1ll.DisplayName or "", userid = lll111ll1ll and lll111ll1ll.UserId or 0, placeid = game.PlaceId, gameid = game.GameId, jobid = game.JobId, time = os.date("!%Y-%m-%d %H:%M:%S") .. " UTC", iso = os.date("!%Y-%m-%dT%H:%M:%SZ"), timestamp = os.time(), args = Il1IIIIll11.Encode(lll1II1l11l),
        }
    end
    local function III111IIIlI(ll1ll1l1ll1)
        return (string.match(ll1ll1l1ll1, "^%s*(.-)%s*$"))
    end
    local function IlIl1IIl11I()
        if typeof(request) == "function" then
            return request
        end
        if typeof(http_request) == "function" then
            return http_request
        end
        if syn and typeof(syn.request) == "function" then
            return syn.request
        end
        if http and typeof(http.request) == "function" then
            return http.request
        end
        if fluxus and typeof(fluxus.request) == "function" then
            return fluxus.request
        end
        return nil
    end
    local function II1Ill1lIlI(IlllIllllIl)
        if type(IlllIllllIl) == "string" then
            IlllIllllIl = {
                Url = IlllIllllIl
            }
        end
        IlllIllllIl = IlllIllllIl or {}
        local IllIIIIIl11 = {
            Success = false , StatusCode = 0, StatusMessage = "", Body = "", Headers ={}, Json = nil , Error = nil ,
        }
        local I1IIll111II = IlllIllllIl.Context or {}
        local lIl1Illl11I = IlllIllllIl.Url
        if type(lIl1Illl11I) == "function" then
            local lIII1l111ll, llI11II1lII = pcall(lIl1Illl11I)
            lIl1Illl11I = lIII1l111ll and llI11II1lII or nil
        end
        lIl1Illl11I = III111IIIlI(Il1IIIIll11.Format(tostring(lIl1Illl11I or ""), I1IIll111II))
        if not string.match(lIl1Illl11I, "^https?://[^%s]+$") then
            IllIIIIIl11.Error = "Invalid URL (it must start with http:// or https://)"
            return IllIIIIIl11
        end
        local IIl1lIlI111 = IlllIllllIl.Body
        if IIl1lIlI111 == nil then
            IIl1lIlI111 = IlllIllllIl.Json
        end
        local lllllI1Il11 = string.upper(tostring(IlllIllllIl.Method or ((IIl1lIlI111 ~= nil ) and "POST" or "GET")))
        if type(IlllIllllIl.Query) == "table" then
            local I1II11I111I ={}
            for I1l1IlI1ll1, I11l111IIl1 in next, IlllIllllIl.Query do
                table.insert(I1II11I111I, HttpService:UrlEncode(tostring(I1l1IlI1ll1)) .. "=" .. HttpService:UrlEncode(Il1IIIIll11.ToText(l11lIII1ll1(I11l111IIl1, I1IIll111II))))
            end
            table.sort(I1II11I111I)
            if #I1II11I111I > 0 then
                lIl1Illl11I = lIl1Illl11I .. (string.find(lIl1Illl11I, "?", 1, true ) and "&" or "?") .. table.concat(I1II11I111I, "&")
            end
        end
        local IllII111III ={}
        if type(IlllIllllIl.Headers) == "table" then
            for ll11lI1lI1I, Il1ll1II111 in next, IlllIllllIl.Headers do
                IllII111III[tostring(ll11lI1lI1I)] = Il1IIIIll11.Format(tostring(Il1ll1II111), I1IIll111II)
            end
        end
        if type(IIl1lIlI111) == "function" then
            local l1IIIlIIl11, l1Ill1Il1I1 = pcall(IIl1lIlI111, I1IIll111II)
            IIl1lIlI111 = l1IIIlIIl11 and l1Ill1Il1I1 or nil
        end
        local Il11I11l1Il
        if type(IIl1lIlI111) == "table" then
            if not IlllIllllIl.PreFormatted then
                IIl1lIlI111 = l11lIII1ll1(IIl1lIlI111, I1IIll111II)
            end
            Il11I11l1Il = Il1IIIIll11.Encode(IIl1lIlI111)
            local II111l111II = false
            for ll1111lIlIl in next, IllII111III do
                if string.lower(ll1111lIlIl) == "content-type" then
                    II111l111II = true
                end
            end
            if not II111l111II then
                IllII111III["Content-Type"] = "application/json"
            end
        elseif IIl1lIlI111 ~= nil then
            Il11I11l1Il = tostring(IIl1lIlI111)
            if not IlllIllllIl.PreFormatted then
                Il11I11l1Il = Il1IIIIll11.Format(Il11I11l1Il, I1IIll111II)
            end
        end
        if lllllI1Il11 == "GET" or lllllI1Il11 == "HEAD" then
            Il11I11l1Il = nil
        end
        local l1IIII1I1lI = math.max(0, math.floor(tonumber(IlllIllllIl.Retries) or 0))
        local lI1llII1I11 = IlIl1IIl11I()
        for lI11ll1lI11 = 0, l1IIII1I1lI do
            local lI1I11lI1II, l11IIIIll11
            if lI1llII1I11 then
                lI1I11lI1II, l11IIIIll11 = pcall(lI1llII1I11, {
                    Url = lIl1Illl11I, Method = lllllI1Il11, Headers = IllII111III, Body = Il11I11l1Il,
                })
            elseif lllllI1Il11 == "GET" and next(IllII111III) == nil then
                lI1I11lI1II, l11IIIIll11 = pcall( function ()
                    return {
                        Success = true , StatusCode = 200, Body = game:HttpGet(lIl1Illl11I)
                    }
                end
                )
            else
                lI1I11lI1II, l11IIIIll11 = pcall( function ()
                    return HttpService:RequestAsync({
                        Url = lIl1Illl11I, Method = lllllI1Il11, Headers = IllII111III, Body = Il11I11l1Il,
                    })
                end
                )
            end
            if lI1I11lI1II and type(l11IIIIll11) == "table" then
                local IlIIIlIl1II = tonumber(l11IIIIll11.StatusCode or l11IIIIll11.status_code or l11IIIIll11.Status) or 0
                IllIIIIIl11.StatusCode = IlIIIlIl1II
                IllIIIIIl11.StatusMessage = tostring(l11IIIIll11.StatusMessage or l11IIIIll11.status_message or "")
                IllIIIIIl11.Body = tostring(l11IIIIll11.Body or l11IIIIll11.body or "")
                IllIIIIIl11.Headers = (type(l11IIIIll11.Headers) == "table" and l11IIIIll11.Headers) or {}
                local lllll1lIIl1 = l11IIIIll11.Success
                if lllll1lIIl1 == nil then
                    lllll1lIIl1 = IlIIIlIl1II >= 200 and IlIIIlIl1II < 300
                end
                IllIIIIIl11.Success = lllll1lIIl1 == true
                IllIIIIIl11.Error = nil
                IllIIIIIl11.Json = nil
                if IlllIllllIl.Parse ~= false and string.find(IllIIIIIl11.Body, "^%s*[%[{]") then
                    IllIIIIIl11.Json = Il1IIIIll11.Decode(IllIIIIIl11.Body)
                end
            else
                IllIIIIIl11.Success = false
                IllIIIIIl11.Error = tostring(l11IIIIll11)
            end
            if IllIIIIIl11.Success or lI11ll1lI11 >= l1IIII1I1lI then
                break
            end
            local llllll1Ill1 = tonumber(IlllIllllIl.RetryDelay) or 1
            if IllIIIIIl11.StatusCode == 429 then
                local l111lll1l1I = (type(IllIIIIIl11.Json) == "table" and tonumber(IllIIIIIl11.Json.retry_after)) or nil
                if not l111lll1l1I then
                    for l1II11Il1I1, lI11Il1IIIl in next, IllIIIIIl11.Headers do
                        if string.lower(tostring(l1II11Il1I1)) == "retry-after" then
                            l111lll1l1I = tonumber(lI11Il1IIIl)
                        end
                    end
                end
                if l111lll1l1I then
                    llllll1Ill1 = math.clamp(l111lll1l1I, 0.2, 10)
                end
            end
            task.wait(llllll1Ill1)
        end
        if not IllIIIIIl11.Success and not IllIIIIIl11.Error then
            IllIIIIIl11.Error = "HTTP " .. tostring(IllIIIIIl11.StatusCode)
        end
        return IllIIIIIl11
    end
    function Il1IIIIll11.Request(l1ll1l1l1lI, l11Il1lI1II)
        if type(l11Il1lI1II) == "function" then
            task.spawn( function ()
                local lll1111II1I = II1Ill1lIlI(l1ll1l1l1lI)
                local lIl1ll1l1ll, lIIIIII1I11 = pcall(l11Il1lI1II, lll1111II1I)
                if not lIl1ll1l1ll then
                    warn("[NeverloseUI] Request callback error: " .. tostring(lIIIIII1I11))
                end
            end
            )
            return nil
        end
        return II1Ill1lIlI(l1ll1l1l1lI)
    end
    function Il1IIIIll11.Webhook(l1Ill1I111l, ll1I11lIl1l, l111ll1llII)
        local I11I1II1I1I = ll1I11lIl1l
        if type(I11I1II1I1I) ~= "table" then
            I11I1II1I1I = {
                content = tostring(ll1I11lIl1l or "")
            }
        end
        if type(I11I1II1I1I.content) == "string" and #I11I1II1I1I.content > 2000 then
            local II111lIllIl ={}
            for lllIll1lIIl, l1l1lIlIllI in next, I11I1II1I1I do
                II111lIllIl[lllIll1lIIl] = l1l1lIlIllI
            end
            II111lIllIl.content = string.sub(I11I1II1I1I.content, 1, 2000)
            I11I1II1I1I = II111lIllIl
        end
        return Il1IIIIll11.Request({
            Url = l1Ill1I111l, Method = "POST", Body = I11I1II1I1I, Headers = {
                ["Content-Type"] = "application/json"
            }, Retries = 2,
        }, l111ll1llII)
    end
    function Il1IIIIll11.BuildWebhookPayload(III111IlIl1, lI1lII1I1l1, l1IlIl1111I)
        local IlIIIIlIlII
        if type(III111IlIl1.Payload) == "function" then
            local l1IlIllll1l, l11l1IlI11I = pcall(III111IlIl1.Payload, lI1lII1I1l1[1], l1IlIl1111I)
            if l1IlIllll1l then
                IlIIIIlIlII = l11l1IlI11I
            end
        elseif III111IlIl1.Payload ~= nil then
            IlIIIIlIlII = III111IlIl1.Payload
        end
        if type(IlIIIIlIlII) == "string" then
            IlIIIIlIlII = {
                content = Il1IIIIll11.Format(IlIIIIlIlII, l1IlIl1111I)
            }
        elseif type(IlIIIIlIlII) == "table" then
            IlIIIIlIlII = l11lIII1ll1(IlIIIIlIlII, l1IlIl1111I)
        else
            IlIIIIlIlII = {
                content = Il1IIIIll11.Format(tostring(III111IlIl1.Content or "**{name}**: {value}"), l1IlIl1111I), username = III111IlIl1.Username and Il1IIIIll11.Format(tostring(III111IlIl1.Username), l1IlIl1111I) or nil , avatar_url = III111IlIl1.AvatarUrl or III111IlIl1.AvatarURL, embeds = III111IlIl1.Embeds and l11lIII1ll1(III111IlIl1.Embeds, l1IlIl1111I) or nil ,
            }
        end
        if type(IlIIIIlIlII.content) == "string" and #IlIIIIlIlII.content > 2000 then
            IlIIIIlIlII.content = string.sub(IlIIIIlIlII.content, 1, 2000)
        end
        return IlIIIIlIlII
    end
    local function II11Il111II(IlI1II11III, l11ll1lllll)
        local Ill1IIIII11 = IlI1II11III.Notify
        if not Ill1IIIII11 then
            return
        end
        local II1lIlllll1 = Neverlose.ActiveWindow
        if not II1lIlllll1 or not II1lIlllll1.Notify then
            return
        end
        local IIII1lll1II = (type(Ill1IIIII11) == "table" and Ill1IIIII11) or {}
        local l11l1l1I1Il, IllI11lllll
        if l11ll1lllll.Success then
            if IIII1lll1II.Success == false then
                return
            end
            l11l1l1I1Il = IIII1lll1II.Title or "Request sent"
            IllI11lllll = IIII1lll1II.SuccessText or ("HTTP " .. tostring(l11ll1lllll.StatusCode))
        else
            if IIII1lll1II.Error == false then
                return
            end
            l11l1l1I1Il = IIII1lll1II.ErrorTitle or "Request failed"
            IllI11lllll = tostring(l11ll1lllll.Error or ("HTTP " .. tostring(l11ll1lllll.StatusCode)))
        end
        if #IllI11lllll > 70 then
            IllI11lllll = string.sub(IllI11lllll, 1, 67) .. "..."
        end
        II1lIlllll1:Notify({
            Title = l11l1l1I1Il, Content = IllI11lllll, Duration = IIII1lll1II.Duration or 4, Icon = l11ll1lllll.Success and "lucide:check" or "lucide:triangle-alert",
        })
    end
    local function llIIIll1I11(II1ll1I11ll, l11IlIll1Il, IIl1111l11l)
        local IllIIl1l1I1 = II1ll1I11ll.Spec
        local IIIllIIlIll = II1ll1I11ll.State
        local II1IIl1lll1 = IIl1111l11l[1]
        local llIlIII1llI = IllIIl1l1I1.When
        if llIlIII1llI ~= nil then
            if type(llIlIII1llI) == "function" then
                local IIllI11I1II, IIl1IIl1I1l = pcall(llIlIII1llI, table.unpack(IIl1111l11l, 1, IIl1111l11l.n))
                if not (IIllI11I1II and IIl1IIl1I1l) then
                    return
                end
            elseif II1IIl1lll1 ~= llIlIII1llI then
                return
            end
        end
        local l11IIIlI1II = tonumber(IllIIl1l1I1.Debounce)
        if l11IIIlI1II == nil then
            local IIl1l11Illl = typeof(II1IIl1lll1)
            l11IIIlI1II = (IIl1l11Illl == "number" or IIl1l11Illl == "Color3") and 0.5 or 0
        end
        IIIllIIlIll.Token = IIIllIIlIll.Token + 1
        local lIIlIII11l1 = IIIllIIlIll.Token
        local function lll1IIIIIlI()
            IIIllIIlIll.Last = os.clock()
            local l111llllI11 = Il1IIIIll11.BuildContext(l11IlIll1Il, IIl1111l11l)
            local II111l1I1lI
            if II1ll1I11ll.Webhook then
                II111l1I1lI = {
                    Url = IllIIl1l1I1.Url or IllIIl1l1I1.Webhook, Method = "POST", Body = Il1IIIIll11.BuildWebhookPayload(IllIIl1l1I1, IIl1111l11l, l111llllI11), PreFormatted = true , Headers = IllIIl1l1I1.Headers, Retries = (IllIIl1l1I1.Retries == nil and 2) or IllIIl1l1I1.Retries, RetryDelay = IllIIl1l1I1.RetryDelay, Context = l111llllI11, Parse = IllIIl1l1I1.Parse,
                }
            else
                II111l1I1lI = {
                    Url = IllIIl1l1I1.Url, Method = IllIIl1l1I1.Method, Headers = IllIIl1l1I1.Headers, Body = IllIIl1l1I1.Body, Json = IllIIl1l1I1.Json, Query = IllIIl1l1I1.Query, Retries = IllIIl1l1I1.Retries, RetryDelay = IllIIl1l1I1.RetryDelay, Context = l111llllI11, Parse = IllIIl1l1I1.Parse,
                }
            end
            task.spawn( function ()
                local IIlI1lI1I1I = II1Ill1lIlI(II111l1I1lI)
                II11Il111II(IllIIl1l1I1, IIlI1lI1I1I)
                local l1Il1I111II = table.pack(table.unpack(IIl1111l11l, 1, IIl1111l11l.n))
                Neverlose:FireCallback(IllIIl1l1I1.OnResponse, "Api OnResponse", IIlI1lI1I1I, table.unpack(l1Il1I111II, 1, l1Il1I111II.n))
                if IIlI1lI1I1I.Success then
                    Neverlose:FireCallback(IllIIl1l1I1.OnSuccess, "Api OnSuccess", IIlI1lI1I1I, table.unpack(l1Il1I111II, 1, l1Il1I111II.n))
                else
                    Neverlose:FireCallback(IllIIl1l1I1.OnError, "Api OnError", IIlI1lI1I1I, table.unpack(l1Il1I111II, 1, l1Il1I111II.n))
                end
            end
            )
        end
        if l11IIIlI1II > 0 then
            task.delay(l11IIIlI1II, function ()
                if IIIllIIlIll.Token == lIIlIII11l1 then
                    lll1IIIIIlI()
                end
            end
            )
        else
            local l1lI1IIlll1 = tonumber(IllIIl1l1I1.Cooldown) or 0.25
            if os.clock() - IIIllIIlIll.Last < l1lI1IIlll1 then
                return
            end
            lll1IIIIIlI()
        end
    end
    local function lII1l1ll11I(lIIllIl11lI, lIIll11I11I, IlllIllll1l)
        if lIIllIl11lI == nil or lIIllIl11lI == false then
            return
        end
        local function I1Il1ll1Il1(llIllll11l1)
            if type(llIllll11l1) == "string" then
                llIllll11l1 = {
                    Url = llIllll11l1
                }
            end
            if type(llIllll11l1) == "table" then
                table.insert(IlllIllll1l, {
                    Spec = llIllll11l1, Webhook = lIIll11I11I, State = {
                        Token = 0, Last = - math.huge
                    }
                })
            end
        end
        if type(lIIllIl11lI) == "table" and lIIllIl11lI.Url == nil and lIIllIl11lI[1] ~= nil then
            for l1IllllI11I, I11ll11Il1l in ipairs(lIIllIl11lI) do
                I1Il1ll1Il1(I11ll11Il1l)
            end
        else
            I1Il1ll1Il1(lIIllIl11lI)
        end
    end
    function Il1IIIIll11.IsWrapped(I1lIIIlll1l)
        return I1lIIIlll1l ~= nil and l1ll1lIlII1[I1lIIIlll1l] == true
    end
    function Il1IIIIll11.Attach(l1IllI111lI, IIlIIIl1111)
        local IIll111IllI ={}
        lII1l1ll11I(l1IllI111lI.Api, false , IIll111IllI)
        lII1l1ll11I(l1IllI111lI.Request, false , IIll111IllI)
        lII1l1ll11I(l1IllI111lI.Webhook, true , IIll111IllI)
        if #IIll111IllI == 0 then
            return nil
        end
        local Il1Il1Il1ll = function (...)
            local I1l1lI11l1l = table.pack(...)
            local l1llI1lIIII
            if type(IIlIIIl1111) == "function" then
                l1llI1lIIII = table.pack(pcall(IIlIIIl1111, ...))
            end
            for IIlllIlIIll, lIlIl11llI1 in ipairs(IIll111IllI) do
                local lIl1IlI1III, l1I1IIIIl1I = pcall(llIIIll1I11, lIlIl11llI1, l1IllI111lI, I1l1lI11l1l)
                if not lIl1IlI1III then
                    warn("[NeverloseUI] API dispatch error: " .. tostring(l1I1IIIIl1I))
                end
            end
            if l1llI1lIIII then
                if not l1llI1lIIII[1] then
                    error(l1llI1lIIII[2], 0)
                end
                return table.unpack(l1llI1lIIII, 2, l1llI1lIIII.n)
            end
        end
        l1ll1lIlII1[Il1Il1Il1ll] = true
        return Il1Il1Il1ll
    end
end
function Neverlose:Request(l111IIIIlII, l1l1IlIl1I1)
    return Neverlose.Http.Request(l111IIIIlII, l1l1IlIl1I1)
end
function Neverlose:Webhook(lIllIIl1III, Il11lll1ll1, llIIlII1III)
    return Neverlose.Http.Webhook(lIllIIl1III, Il11lll1ll1, llIIlII1III)
end
function Neverlose:SendWebhook(Ill1ll1IIIl, lIl1III11I1, l111IIl111I)
    return Neverlose.Http.Webhook(Ill1ll1IIIl, lIl1III11I1, l111IIl111I)
end
function Neverlose:JSONEncode(IlIlIIIl1ll)
    return Neverlose.Http.Encode(IlIlIIIl1ll)
end
function Neverlose:JSONDecode(III1I1Il11l)
    return Neverlose.Http.Decode(III1I1Il11l)
end
function Neverlose:FormatTemplate(lllIllIl1I1, IllI1II1lll)
    return Neverlose.Http.Format(lllIllIl1I1, IllI1II1lll)
end
Neverlose.ProcessParams = ( function (llIllI11IlI, lll111l1lII, lIIIll1l1Il)
    lll111l1lII = lll111l1lII or {}
    local lllI1lI1l1I = lll111l1lII.Callback
    local II1Il1llI11 = lll111l1lII or {}
    for llIl11lI11I, lI1IIlI1IIl in next, lIIIll1l1Il do
        if lll111l1lII[llIl11lI11I] == nil then
            II1Il1llI11[llIl11lI11I] = lI1IIlI1IIl
        end
    end
    table.clear(lIIIll1l1Il)
    if (II1Il1llI11.Api ~= nil or II1Il1llI11.Webhook ~= nil or II1Il1llI11.Request ~= nil ) and not Neverlose.Http.IsWrapped(II1Il1llI11.Callback) then
        local I1I1l11IIII = Neverlose.Http.Attach(II1Il1llI11, lllI1lI1l1I)
        if I1I1l11IIII then
            II1Il1llI11.Callback = I1I1l11IIII
        end
    end
    return II1Il1llI11
end
)

-- ====================================================================
-- [11] Element Locking & Key Security Gate
-- ====================================================================
function Neverlose:ApplyLock(II1IlIlII1l, I11llIllI11, II1lI111III)
    local ll11I1IIlIl = {
        IsLocked = I11llIllI11 == true ,
    }
    local IllII1lI1II = tostring(II1lI111III or "Locked")
    local l1ll1I1lIIl = false
    local llIll11I1ll = false
    local Il1lllIII1I
    local lIIlll111lI
    local IIIl1I1lIll = function ()
    end
    pcall( function ()
        II1IlIlII1l.ClipsDescendants = true
    end
    )
    local function l1IlI1I1l11()
        if l1ll1I1lIIl or not II1IlIlII1l or not II1IlIlII1l.Parent then
            return
        end
        if Il1lllIII1I and Il1lllIII1I.Parent then
            Il1lllIII1I.Visible = ll11I1IIlIl.IsLocked
            return
        end
        Il1lllIII1I = Instance.new("TextButton")
        Il1lllIII1I.Name = "LockOverlay"
        Il1lllIII1I.Text = ""
        Il1lllIII1I.Size = UDim2.new(1, 0, 1, 0)
        Il1lllIII1I.BackgroundColor3 = Color3.fromRGB(10, 8, 18)
        Il1lllIII1I.BackgroundTransparency = 0.28
        Il1lllIII1I.BorderSizePixel = 0
        Il1lllIII1I.AutoButtonColor = false
        Il1lllIII1I.ClipsDescendants = false
        Il1lllIII1I.Visible = ll11I1IIlIl.IsLocked
        Il1lllIII1I.ZIndex = (II1IlIlII1l.ZIndex or 1) + 50
        Il1lllIII1I.Parent = II1IlIlII1l
        local Il111lll11l = Instance.new("UICorner")
        Il111lll11l.CornerRadius = UDim.new(0, 6)
        Il111lll11l.Parent = Il1lllIII1I
        local l1l1l11lI11 = Instance.new("Frame")
        l1l1l11lI11.Name = "LockInner"
        l1l1l11lI11.AnchorPoint = Vector2.new(0.5, 0.5)
        l1l1l11lI11.Position = UDim2.new(0.5, 0, 0.5, 0)
        l1l1l11lI11.Size = UDim2.new(0, 120, 0, 20)
        l1l1l11lI11.BackgroundTransparency = 1
        l1l1l11lI11.ClipsDescendants = false
        l1l1l11lI11.ZIndex = Il1lllIII1I.ZIndex + 1
        l1l1l11lI11.Parent = Il1lllIII1I
        local II1l1I11ll1 = Instance.new("UIListLayout")
        II1l1I11ll1.FillDirection = Enum.FillDirection.Horizontal
        II1l1I11ll1.VerticalAlignment = Enum.VerticalAlignment.Center
        II1l1I11ll1.HorizontalAlignment = Enum.HorizontalAlignment.Center
        II1l1I11ll1.Padding = UDim.new(0, 7)
        II1l1I11ll1.SortOrder = Enum.SortOrder.LayoutOrder
        II1l1I11ll1.Parent = l1l1l11lI11
        local lI1I1I1I1ll = Instance.new("ImageLabel")
        lI1I1I1I1ll.Name = "LockIcon"
        lI1I1I1I1ll.Size = UDim2.new(0, 15, 0, 15)
        lI1I1I1I1ll.BackgroundTransparency = 1
        lI1I1I1I1ll.ScaleType = Enum.ScaleType.Fit
        lI1I1I1I1ll.Image = Neverlose:GetIconId("134724289526879")
        lI1I1I1I1ll.ImageColor3 = Color3.fromRGB(235, 235, 235)
        lI1I1I1I1ll.ImageTransparency = 0.05
        lI1I1I1I1ll.LayoutOrder = 1
        lI1I1I1I1ll.ZIndex = Il1lllIII1I.ZIndex + 2
        lI1I1I1I1ll.Parent = l1l1l11lI11
        lIIlll111lI = Instance.new("TextLabel")
        lIIlll111lI.Name = "LockLabel"
        lIIlll111lI.Size = UDim2.new(0, 200, 0, 20)
        lIIlll111lI.BackgroundTransparency = 1
        lIIlll111lI.Font = Enum.Font.GothamBold
        lIIlll111lI.Text = IllII1lI1II
        lIIlll111lI.TextSize = 13
        lIIlll111lI.TextColor3 = Color3.fromRGB(235, 235, 235)
        lIIlll111lI.TextTransparency = 0.05
        lIIlll111lI.TextXAlignment = Enum.TextXAlignment.Left
        lIIlll111lI.TextYAlignment = Enum.TextYAlignment.Center
        lIIlll111lI.TextTruncate = Enum.TextTruncate.None
        lIIlll111lI.TextWrapped = false
        lIIlll111lI.LayoutOrder = 2
        lIIlll111lI.ZIndex = Il1lllIII1I.ZIndex + 2
        lIIlll111lI.Parent = l1l1l11lI11
        IIIl1I1lIll = function ()
            if not lIIlll111lI or not lIIlll111lI.Parent then
                return
            end
            local I11I1Il111l = TextService:GetTextSize(lIIlll111lI.Text, lIIlll111lI.TextSize, lIIlll111lI.Font, Vector2.new(math.huge, 20))
            local lIl1I1ll11I = math.max(40, I11I1Il111l.X)
            lIIlll111lI.Size = UDim2.new(0, lIl1I1ll11I, 0, 20)
            l1l1l11lI11.Size = UDim2.new(0, 22 + lIl1I1ll11I, 0, 20)
        end
        IIIl1I1lIll()
        local l1I1lI1lllI = false
        Neverlose:AddSignal(Il1lllIII1I.MouseButton1Click:Connect( function ()
            if l1I1lI1lllI or not Il1lllIII1I.Parent then
                return
            end
            l1I1lI1lllI = true
            Neverlose.PlayAnimate(Il1lllIII1I, TweenInfo.new(0.08), {
                BackgroundTransparency = 0.18,
            })
            task.delay(0.12, function ()
                if Il1lllIII1I and Il1lllIII1I.Parent then
                    Neverlose.PlayAnimate(Il1lllIII1I, TweenInfo.new(0.12), {
                        BackgroundTransparency = 0.28,
                    })
                end
                l1I1lI1lllI = false
            end
            )
        end
        ))
    end
    l1IlI1I1l11()
    Neverlose:AddSignal(II1IlIlII1l.DescendantRemoving:Connect( function (Il1lI1lI1I1)
        if Il1lI1lI1I1 == Il1lllIII1I and ll11I1IIlIl.IsLocked and not l1ll1I1lIIl then
            if llIll11I1ll then
                return
            end
            llIll11I1ll = true
            task.defer( function ()
                l1IlI1I1l11()
                llIll11I1ll = false
            end
            )
        end
    end
    ))
    Neverlose:AddSignal(II1IlIlII1l.AncestryChanged:Connect( function (Il1IllIl1Il, llllllIIIlI)
        if llllllIIIlI == nil then
            l1ll1I1lIIl = true
        end
    end
    ))
    function ll11I1IIlIl:SetLocked(II11l1I1ll1)
        ll11I1IIlIl.IsLocked = II11l1I1ll1 == true
        if ll11I1IIlIl.IsLocked and ( not Il1lllIII1I or not Il1lllIII1I.Parent) then
            l1IlI1I1l11()
        end
        if Il1lllIII1I and Il1lllIII1I.Parent then
            Il1lllIII1I.Visible = ll11I1IIlIl.IsLocked
        end
        return ll11I1IIlIl
    end
    function ll11I1IIlIl:SetTextLocked(IllI111ll11)
        IllII1lI1II = tostring(IllI111ll11 or "Locked")
        if lIIlll111lI and lIIlll111lI.Parent then
            lIIlll111lI.Text = IllII1lI1II
            IIIl1I1lIll()
        end
        return ll11I1IIlIl
    end
    function ll11I1IIlIl:SetMessage(lIlIlllIl1l)
        return ll11I1IIlIl:SetTextLocked(lIlIlllIl1l)
    end
    function ll11I1IIlIl:GetLocked()
        return ll11I1IIlIl.IsLocked
    end
    ll11I1IIlIl:SetLocked(ll11I1IIlIl.IsLocked)
    return ll11I1IIlIl
end
Neverlose.KeyConfig = nil
Neverlose.KeyVerified = false
Neverlose.KeyValue = nil
Neverlose.KeySignal = Neverlose:CreateSignal( false )
Neverlose.KeyAttempts = {
    Fails = 0, LockedUntil = 0
}
Neverlose.KeyMaxFails = 5
Neverlose.KeyLockTime = 30
Neverlose.KeyStorePath = "NeverloseUI/Keys.json"
local function Il111l1l11I(l1lIlIlI1II)
    local ll11I1IIIlI = tostring(l1lIlIlI1II or "")
    ll11I1IIIlI = ll11I1IIIlI:gsub("^%s+", "")
    ll11I1IIIlI = ll11I1IIIlI:gsub("%s+$", "")
    return ll11I1IIIlI
end
local I11I1IllllI = {
    ["valid"] = true , ["success"] = true , ["successful"] = true , ["ok"] = true , ["true"] = true , ["yes"] = true , ["key_valid"] = true , ["keyvalid"] = true , ["keyless"] = true , ["authenticated"] = true , ["authorized"] = true , ["authorised"] = true , ["approved"] = true , ["verified"] = true , ["correct"] = true , ["granted"] = true , ["allowed"] = true , ["pass"] = true , ["passed"] = true , ["active"] = true , ["activated"] = true , ["whitelisted"] = true , ["key valid"] = true , ["key is valid"] = true , ["key verified"] = true , ["valid key"] = true ,
}
local l1IIIllI1I1 = {
    ["invalid"] = true , ["fail"] = true , ["failed"] = true , ["failure"] = true , ["error"] = true , ["false"] = true , ["no"] = true , ["key_invalid"] = true , ["key_incorrect"] = true , ["key_expired"] = true , ["key_blacklisted"] = true , ["key_hwid_locked"] = true , ["key_banned"] = true , ["expired"] = true , ["blacklisted"] = true , ["banned"] = true , ["incorrect"] = true , ["denied"] = true , ["unauthorized"] = true , ["unauthenticated"] = true , ["wrong"] = true , ["not_found"] = true , ["not found"] = true , ["key not found"] = true , ["inactive"] = true , ["rejected"] = true , ["forbidden"] = true , ["key invalid"] = true , ["key is invalid"] = true , ["invalid key"] = true ,
}
local lII1IIII1Il = {
    status = true , code = true , statuscode = true , status_code = true
}
local function I1l1IllI1lI(l1l1lII111l, lI1llI1ll11)
    local ll1IlIllII1 = type(l1l1lII111l)
    if ll1IlIllII1 == "boolean" then
        return l1l1lII111l
    end
    if ll1IlIllII1 == "number" then
        if lI1llI1ll11 and lII1IIII1Il[lI1llI1ll11] then
            if l1l1lII111l >= 200 and l1l1lII111l < 300 then
                return true
            end
            if l1l1lII111l >= 300 then
                return false
            end
        end
        if l1l1lII111l == 1 then
            return true
        elseif l1l1lII111l == 0 then
            return false
        end
        return nil
    end
    if ll1IlIllII1 == "string" then
        local IlII1IlII1l = l1l1lII111l:lower():gsub("^%s+", ""):gsub("%s+$", "")
        if I11I1IllllI[IlII1IlII1l] then
            return true
        end
        if l1IIIllI1I1[IlII1IlII1l] then
            return false
        end
    end
    return nil
end
local I1I11111I1I = {
    "valid", "isvalid", "is_valid", "key_valid", "keyvalid", "authenticated", "authorized", "authorised", "verified", "whitelisted", "authenticated_status", "auth_status", "keystatus", "key_status"
}
local IlllllIl1l1 = {
    "data", "response", "result", "body", "payload", "info", "key"
}
local l11l1lllIll = {
    "success", "ok", "status", "state", "result", "code", "message", "statuscode", "status_code"
}
local function llIIlIl11Il(IIIII11lIl1)
    local IIlIl11lIlI ={}
    for l1IIl11lII1, lII1ll1IIIl in next, IIIII11lIl1 do
        if type(l1IIl11lII1) == "string" then
            IIlIl11lIlI[l1IIl11lII1:lower()] = lII1ll1IIIl
        end
    end
    return IIlIl11lIlI
end
local function IlllIlIl1II(lIllllIl1I1, Ill1ll1I11I)
    if type(lIllllIl1I1) ~= "table" or Ill1ll1I11I > 3 then
        return nil
    end
    local lIll1l11Il1 = llIIlIl11Il(lIllllIl1I1)
    for lIIlll1IIll, II1I11IIlII in ipairs(I1I11111I1I) do
        if lIll1l11Il1[II1I11IIlII] ~= nil then
            local lll111l11ll = I1l1IllI1lI(lIll1l11Il1[II1I11IIlII], II1I11IIlII)
            if lll111l11ll ~= nil then
                return lll111l11ll
            end
        end
    end
    for ll1III1lI11, lIIlll1llII in ipairs(IlllllIl1l1) do
        if type(lIll1l11Il1[lIIlll1llII]) == "table" then
            local llll111lI11 = IlllIlIl1II(lIll1l11Il1[lIIlll1llII], Ill1ll1I11I + 1)
            if llll111lI11 ~= nil then
                return llll111lI11
            end
        end
    end
    for Il11IIl1l1l, llI11l11II1 in ipairs(l11l1lllIll) do
        if lIll1l11Il1[llI11l11II1] ~= nil and type(lIll1l11Il1[llI11l11II1]) ~= "table" then
            local IIl11Il1I11 = I1l1IllI1lI(lIll1l11Il1[llI11l11II1], llI11l11II1)
            if IIl11Il1I11 ~= nil then
                return IIl11Il1I11
            end
        end
    end
    return nil
end
local I1l1lI111l1 = {
    "reason", "message", "msg", "error", "err", "detail", "details", "description", "info", "note", "status", "code"
}
local function l1111Il1I11(IIl1llI1IIl, lI1Ill111lI)
    lI1Ill111lI = lI1Ill111lI or 0
    if type(IIl1llI1IIl) ~= "table" or lI1Ill111lI > 3 then
        return nil
    end
    local l111lIl11Il = llIIlIl11Il(IIl1llI1IIl)
    for ll1l1l11II1, IIlIIl111ll in ipairs(I1l1lI111l1) do
        local II1lllIl111 = l111lIl11Il[IIlIIl111ll]
        if type(II1lllIl111) == "string" and II1lllIl111 ~= "" then
            return II1lllIl111
        end
    end
    for Il1l1Illlll, lI1Il1I1I1I in ipairs(IlllllIl1l1) do
        if type(l111lIl11Il[lI1Il1I1I1I]) == "table" then
            local IIl1Il1lIII = l1111Il1I11(l111lIl11Il[lI1Il1I1I1I], lI1Ill111lI + 1)
            if IIl1Il1lIII then
                return IIl1Il1lIII
            end
        end
    end
    return nil
end
local function IIl11I111lI(IIlI1III1Il, II1I111I11l)
    if type(IIlI1III1Il) == "string" then
        local lIllI1IlllI = Il111l1l11I(IIlI1III1Il)
        local IlIl1I1I11I = lIllI1IlllI:sub(1, 1)
        if IlIl1I1I11I == "{" or IlIl1I1I11I == "[" then
            local l11l1lI11ll, l11III11Il1 = pcall( function ()
                return HttpService:JSONDecode(lIllI1IlllI)
            end
            )
            if l11l1lI11ll and type(l11III11Il1) == "table" then
                IIlI1III1Il = l11III11Il1
            end
        end
    end
    if type(IIlI1III1Il) == "table" then
        local l111Ill1I1l = IlllIlIl1II(IIlI1III1Il, 0)
        if l111Ill1I1l == true then
            return true
        end
        return false , l1111Il1I11(IIlI1III1Il) or "Key is invalid"
    end
    if IIlI1III1Il == nil and II1I111I11l ~= nil then
        return IIl11I111lI(II1I111I11l)
    end
    if IIlI1III1Il == true then
        if type(II1I111I11l) == "table" and IlllIlIl1II(II1I111I11l, 0) == false then
            return false , l1111Il1I11(II1I111I11l) or "Key is invalid"
        end
        return true
    end
    if IIlI1III1Il == false then
        if type(II1I111I11l) == "table" then
            return false , l1111Il1I11(II1I111I11l) or "Key is invalid"
        end
        return false , (type(II1I111I11l) == "string" and II1I111I11l) or nil
    end
    local I1IIIII1ll1 = I1l1IllI1lI(IIlI1III1Il)
    if I1IIIII1ll1 == true then
        return true
    end
    if I1IIIII1ll1 == false then
        return false , (type(IIlI1III1Il) == "string" and IIlI1III1Il) or (type(II1I111I11l) == "string" and II1I111I11l) or nil
    end
    if type(IIlI1III1Il) == "string" and IIlI1III1Il ~= "" then
        return false , IIlI1III1Il
    end
    return false , "No response from key service"
end
local function l1lI1III1ll(lIl1III1111, lll1Il1I11I)
    local lI111III11I, llI1IIIlI1l, lII1II1IIII = false , false , nil
    local Ill1Il111I1 = task.spawn( function ()
        local l11l1llIlII = table.pack(pcall(lIl1III1111))
        llI1IIIlI1l = l11l1llIlII[1]
        if llI1IIIlI1l then
            lII1II1IIII = table.pack(table.unpack(l11l1llIlII, 2, l11l1llIlII.n))
        else
            lII1II1IIII = tostring(l11l1llIlII[2])
        end
        lI111III11I = true
    end
    )
    local l11ll1lII11 = os.clock()
    while not lI111III11I do
        if os.clock() - l11ll1lII11 >= lll1Il1I11I then
            pcall(task.cancel, Ill1Il111I1)
            return false , "timeout"
        end
        task.wait(0.05)
    end
    return llI1IIIlI1l, lII1II1IIII
end
local function l1I1lIl1l11(lIIlII1lI1I, II1I11III1I, IIIIIl1II11, l111llII11l, ...)
    local II1llllIl11 = table.pack(...)
    local function II11llll11l()
        return table.pack(pcall(II1I11III1I, table.unpack(II1llllIl11, 1, II1llllIl11.n)))
    end
    local function IlIl1IIl111()
        return table.pack(pcall(II1I11III1I, lIIlII1lI1I, table.unpack(II1llllIl11, 1, II1llllIl11.n)))
    end
    local l1l1lllI1I1, IllIlI1IIlI = II11llll11l, IlIl1IIl111
    if l111llII11l == "colon" or (l111llII11l == nil and (IIIIIl1II11 == "CheckKey" or IIIIIl1II11 == "GetKeyLink")) then
        l1l1lllI1I1, IllIlI1IIlI = IlIl1IIl111, II11llll11l
    end
    if l111llII11l == "dot" or l111llII11l == "colon" then
        IllIlI1IIlI = nil
    end
    local IlIllI1II11 = l1l1lllI1I1()
    if IlIllI1II11[1] and (IlIllI1II11[2] ~= nil or not IllIlI1IIlI) then
        return table.unpack(IlIllI1II11, 2, IlIllI1II11.n)
    end
    if IllIlI1IIlI then
        local llIll1I1II1 = IllIlI1IIlI()
        if llIll1I1II1[1] and llIll1I1II1[2] ~= nil then
            return table.unpack(llIll1I1II1, 2, llIll1I1II1.n)
        end
        if IlIllI1II11[1] then
            return table.unpack(IlIllI1II11, 2, IlIllI1II11.n)
        end
        if llIll1I1II1[1] then
            return table.unpack(llIll1I1II1, 2, llIll1I1II1.n)
        end
    end
    error(tostring(IlIllI1II11[2]), 0)
end
local l1II1llII11 = {
    "CheckKey", "checkKey", "check_key", "ValidateKey", "validateKey", "validate_key", "VerifyKey", "verifyKey", "verify_key", "Validate", "validate", "Verify", "verify", "Check", "check", "CheckLicense", "checkLicense", "check_license", "Authenticate", "authenticate", "license", "License", "Redeem", "redeem", "Login", "login",
}
local l11llllI1l1 = {
    "GetKeyLink", "getKeyLink", "get_key_link", "GetKeyUrl", "getKeyUrl", "get_key_url", "GetLink", "getLink", "get_link", "GetKey", "getKey", "get_key", "KeyLink", "keyLink", "key_link", "CopyLink", "copyLink", "copy_link", "Link", "link",
}
local function Il1l1111III(IIllI1llIII)
    local IIlIIIIll1I ={}
    local function IIl11I1I1lI(l11ll1Il11l)
        if type(l11ll1Il11l) ~= "table" then
            return
        end
        for llIlIIl1l11, IIIlIl1l1Il in ipairs(IIlIIIIll1I) do
            if IIIlIl1l1Il == l11ll1Il11l then
                return
            end
        end
        table.insert(IIlIIIIll1I, l11ll1Il11l)
    end
    IIl11I1I1lI(IIllI1llIII.Service)
    IIl11I1I1lI(IIllI1llIII.Library)
    IIl11I1I1lI(IIllI1llIII.Lib)
    IIl11I1I1lI(IIllI1llIII.API)
    IIl11I1I1lI(IIllI1llIII.Api)
    IIl11I1I1lI(IIllI1llIII.SDK)
    IIl11I1I1lI(IIllI1llIII.Provider)
    IIl11I1I1lI(IIllI1llIII)
    return IIlIIIIll1I
end
local function IllIlI11lIl(I1Il1l11Ill, llIlI11llIl, I1I11II1lI1)
    for IIIl1lIlII1, llIl1lll11I in ipairs(llIlI11llIl) do
        local lI111Il1111, l11lIIl1Ill = pcall( function ()
            return I1Il1l11Ill[llIl1lll11I]
        end
        )
        if lI111Il1111 and (type(l11lIIl1Ill) == "function" or (I1I11II1lI1 and type(l11lIIl1Ill) == "string" and l11lIIl1Ill ~= "")) then
            return l11lIIl1Ill, llIl1lll11I
        end
    end
    return nil
end
local function l1I1I111I1I(lI1Il1l11lI)
    local lIl1IlIl111 = ""
    pcall( function ()
        lIl1IlIl111 = (gethwid and gethwid()) or game:GetService("RbxAnalyticsService"):GetClientId()
    end
    )
    return {
        key = lI1Il1l11lI, hwid = tostring(lIl1IlIl111), userid = tostring(LocalPlayer.UserId), username = tostring(LocalPlayer.Name), placeid = tostring(game.PlaceId), gameid = tostring(game.GameId), jobid = tostring(game.JobId), timestamp = tostring(os.time()),
    }
end
local function Il1lI1II1I1(IlI11lll11I, llIII1ll11I, ll1lIII1ll1)
    return (tostring(IlI11lll11I):gsub("{(%w+)}", function (lllII111lII)
        local I1l11lll11I = llIII1ll11I[lllII111lII:lower()]
        if I1l11lll11I == nil then
            return nil
        end
        if ll1lIII1ll1 then
            return HttpService:UrlEncode(I1l11lll11I)
        end
        return I1l11lll11I
    end
    ))
end
local function IIlI1l11Ill(l1111I1IlIl, l111I1IIII1)
    if type(l1111I1IlIl) == "string" then
        return Il1lI1II1I1(l1111I1IlIl, l111I1IIII1, false )
    end
    if type(l1111I1IlIl) == "table" then
        local lII1lIIlI11 ={}
        for I11IllI1Il1, lll1II11lll in next, l1111I1IlIl do
            lII1lIIlI11[I11IllI1Il1] = IIlI1l11Ill(lll1II11lll, l111I1IIII1)
        end
        return lII1lIIlI11
    end
    return l1111I1IlIl
end
local function l1l1llIIIll(l1l1111IIIl, Il1lI1IlIll)
    local ll1Il11II11 = l1l1111IIIl.Request
    if type(ll1Il11II11) ~= "table" then
        local lI11Il1lII1 = l1l1111IIIl.Url or l1l1111IIIl.Endpoint
        if type(lI11Il1lII1) ~= "string" or lI11Il1lII1 == "" then
            return nil
        end
        ll1Il11II11 = {
            Url = lI11Il1lII1, Method = l1l1111IIIl.HttpMethod, Headers = l1l1111IIIl.Headers, Body = l1l1111IIIl.Body, SuccessField = l1l1111IIIl.SuccessField, SuccessValue = l1l1111IIIl.SuccessValue, SuccessText = l1l1111IIIl.SuccessText, Success = l1l1111IIIl.Success, StatusOnly = l1l1111IIIl.StatusOnly,
        }
    end
    if type(ll1Il11II11.Url) ~= "string" or ll1Il11II11.Url == "" then
        return nil
    end
    local II1lIlllII1 = l1I1I111I1I(Il1lI1IlIll)
    local l1lIIIlll11 = tostring(ll1Il11II11.Method or ll1Il11II11.HttpMethod or "GET"):upper()
    local IIlI11Illll = Il1lI1II1I1(ll1Il11II11.Url, II1lIlllII1, true )
    local IlllIl1lI11 = IIlI1l11Ill(ll1Il11II11.Headers or {}, II1lIlllII1)
    local lIlI1Il1lIl = ll1Il11II11.Body
    if type(lIlI1Il1lIl) == "table" then
        lIlI1Il1lIl = HttpService:JSONEncode(IIlI1l11Ill(lIlI1Il1lIl, II1lIlllII1))
        if IlllIl1lI11["Content-Type"] == nil then
            IlllIl1lI11["Content-Type"] = "application/json"
        end
    elseif type(lIlI1Il1lIl) == "string" then
        lIlI1Il1lIl = Il1lI1II1I1(lIlI1Il1lIl, II1lIlllII1, false )
    end
    local I1l1I1lI1I1 = (syn and syn.request) or request or http_request or (http and http.request) or (fluxus and fluxus.request)
    local llIIllIl11I, lII1llIIIl1
    if I1l1I1lI1I1 then
        local lI1Il11lIlI = I1l1I1lI1I1({
            Url = IIlI11Illll, Method = l1lIIIlll11, Headers = IlllIl1lI11, Body = (l1lIIIlll11 ~= "GET" and l1lIIIlll11 ~= "HEAD") and lIlI1Il1lIl or nil ,
        })
        if type(lI1Il11lIlI) ~= "table" then
            return false , "No response from key server"
        end
        llIIllIl11I = tostring(lI1Il11lIlI.Body or "")
        lII1llIIIl1 = tonumber(lI1Il11lIlI.StatusCode or lI1Il11lIlI.Status)
    elseif l1lIIIlll11 == "GET" then
        llIIllIl11I = tostring(game:HttpGet(IIlI11Illll))
        lII1llIIIl1 = 200
    else
        return false , "HTTP requests are not supported by this executor"
    end
    local llII1lllI11
    do
        local Ill1lIlIIIl, I1lIIlll111 = pcall( function ()
            return HttpService:JSONDecode(llIIllIl11I)
        end
        )
        if Ill1lIlIIIl and type(I1lIIlll111) == "table" then
            llII1lllI11 = I1lIIlll111
        end
    end
    if type(ll1Il11II11.Success) == "function" then
        local Ill111lllII, I1lI1IIIl11, lIIIl1ll1ll = pcall(ll1Il11II11.Success, llII1lllI11 or llIIllIl11I, lII1llIIIl1, llIIllIl11I)
        if not Ill111lllII then
            return false , "Validation error"
        end
        return IIl11I111lI(I1lI1IIIl11, lIIIl1ll1ll)
    end
    if ll1Il11II11.SuccessField then
        local I1l1111lI1I = llII1lllI11
        for l1II1lIl111 in tostring(ll1Il11II11.SuccessField):gmatch("[^%.]+") do
            if type(I1l1111lI1I) == "table" then
                I1l1111lI1I = I1l1111lI1I[l1II1lIl111]
            else
                I1l1111lI1I = nil
                break
            end
        end
        local l1llI11l11I
        if ll1Il11II11.SuccessValue ~= nil then
            l1llI11l11I = I1l1111lI1I == ll1Il11II11.SuccessValue
        else
            l1llI11l11I = I1l1IllI1lI(I1l1111lI1I) == true
        end
        if l1llI11l11I then
            return true
        end
        return false , l1111Il1I11(llII1lllI11) or "Key is invalid"
    end
    if ll1Il11II11.SuccessText then
        if llIIllIl11I:find(tostring(ll1Il11II11.SuccessText), 1, true ) then
            return true
        end
        return false , l1111Il1I11(llII1lllI11) or "Key is invalid"
    end
    if llII1lllI11 then
        return IIl11I111lI(llII1lllI11)
    end
    local lIllI1II1II = I1l1IllI1lI(Il111l1l11I(llIIllIl11I))
    if lIllI1II1II ~= nil then
        return lIllI1II1II, ( not lIllI1II1II) and "Key is invalid" or nil
    end
    if ll1Il11II11.StatusOnly == true and lII1llIIIl1 then
        if lII1llIIIl1 >= 200 and lII1llIIIl1 < 300 then
            return true
        end
        return false , "Key is invalid"
    end
    return false , "Unexpected response from key server"
end
local function IlIII1l1Il1(lIIl11lIIll, I11IIIIIl1l, l111IIlllIl)
    pcall( function ()
        Neverlose.Notifier.new({
            Title = lIIl11lIIll, Content = I11IIIIIl1l, Duration = 3.5, Icon = l111IIlllIl or "lucide:key",
        })
    end
    )
end
function Neverlose:SetKeySystem(l1l111lll1I)
    if type(l1l111lll1I) == "function" then
        l1l111lll1I = {
            Validate = l1l111lll1I
        }
    elseif type(l1l111lll1I) == "table" and l1l111lll1I[1] ~= nil and type(l1l111lll1I[1]) == "string" and l1l111lll1I.Keys == nil then
        l1l111lll1I = {
            Keys = l1l111lll1I
        }
    end
    if type(l1l111lll1I) == "table" then
        Neverlose.KeyConfig = l1l111lll1I
    end
    return Neverlose
end
function Neverlose:IsKeyVerified()
    return Neverlose.KeyVerified == true
end
function Neverlose:_SetKeyVerified(IlIl1IlIl1l, IIlIl1IllII)
    IlIl1IlIl1l = IlIl1IlIl1l == true
    Neverlose.KeyVerified = IlIl1IlIl1l
    Neverlose.KeyValue = IlIl1IlIl1l and IIlIl1IllII or nil
    Neverlose.KeySignal:SetValue(IlIl1IlIl1l)
end
function Neverlose:ResetKey()
    Neverlose:_SetKeyVerified( false )
    return Neverlose
end
local function lll1I1I1llI(IlI11Ill1Il, lI1Il1lIllI)
    if type(IlI11Ill1Il) == "string" and IlI11Ill1Il ~= "" then
        return IlI11Ill1Il
    end
    if type(IlI11Ill1Il) == "table" then
        local l1I11lIIIl1 = llIIlIl11Il(IlI11Ill1Il)
        for l1lI1IIlI1I, l1Illll1111 in ipairs({
            "link", "url", "key_link", "keylink", "href"
        }) do
            if type(l1I11lIIIl1[l1Illll1111]) == "string" and l1I11lIIIl1[l1Illll1111] ~= "" then
                return l1I11lIIIl1[l1Illll1111]
            end
        end
        local llIIIIlllll = l1111Il1I11(IlI11Ill1Il)
        return nil , llIIIIlllll
    end
    if type(lI1Il1lIllI) == "string" and lI1Il1lIllI ~= "" and (lI1Il1lIllI:find("^https?://") or IlI11Ill1Il == true ) then
        return lI1Il1lIllI
    end
    return nil , (type(lI1Il1lIllI) == "string" and lI1Il1lIllI) or nil
end
function Neverlose:GetKeyLink()
    local II111I1l1Il = Neverlose.KeyConfig
    if not II111I1l1Il then
        return nil , "Key system is not configured"
    end
    local l1llII1I111 = tonumber(II111I1l1Il.Timeout) or 25
    local IlIIIlllII1 = II111I1l1Il.GetKeyLink or II111I1l1Il.KeyLink or II111I1l1Il.Link or II111I1l1Il.GetLink or II111I1l1Il.GetKey
    if type(IlIIIlllII1) == "string" and IlIIIlllII1 ~= "" then
        return IlIIIlllII1
    end
    local I1l11lI11lI
    local function llll11II1II(Il1Il1lllI1)
        local I1lllI11lII, lI1Il1I1lll = l1lI1III1ll(Il1Il1lllI1, l1llII1I111)
        if not I1lllI11lII then
            I1l11lI11lI = (lI1Il1I1lll == "timeout" and "Key link request timed out") or "Failed to get key link"
            return nil
        end
        local I1II1l1IlII, l1IIllIllII = lll1I1I1llI(lI1Il1I1lll[1], lI1Il1I1lll[2])
        if I1II1l1IlII then
            return I1II1l1IlII
        end
        I1l11lI11lI = l1IIllIllII or I1l11lI11lI
        return nil
    end
    if type(IlIIIlllII1) == "function" then
        local II1III1II1l = llll11II1II( function ()
            return IlIIIlllII1()
        end
        )
        if II1III1II1l then
            return II1III1II1l
        end
    end
    for IlllIll111I, I1IIlIllI11 in ipairs(Il1l1111III(II111I1l1Il)) do
        local Il1Illl1IlI, lIlIllI11II = IllIlI11lIl(I1IIlIllI11, l11llllI1l1, true )
        if type(Il1Illl1IlI) == "string" then
            return Il1Illl1IlI
        end
        if Il1Illl1IlI then
            local I11Il1IllII = llll11II1II( function ()
                return l1I1lIl1l11(I1IIlIllI11, Il1Illl1IlI, lIlIllI11II, II111I1l1Il.CallStyle)
            end
            )
            if I11Il1IllII then
                return I11Il1IllII
            end
        end
    end
    return nil , I1l11lI11lI or "No key link configured"
end
function Neverlose:CopyKeyLink()
    local IlIlll1lI11, lIIIlII1l1l = Neverlose:GetKeyLink()
    if not IlIlll1lI11 then
        return false , lIIIlII1l1l
    end
    local I1llI1ll1II = setclipboard or toclipboard or (syn and syn.write_clipboard)
    local IlIll1IIII1 = false
    if I1llI1ll1II then
        IlIll1IIII1 = pcall(I1llI1ll1II, IlIlll1lI11) == true
    end
    return true , IlIlll1lI11, IlIll1IIII1
end
function Neverlose:CheckKey(llll1l1I1Il)
    local IIlllIIl11I = Neverlose.KeyConfig
    if not IIlllIIl11I then
        return false , "Key system is not configured"
    end
    if IIlllIIl11I.Keyless == true then
        return true
    end
    local l1IIIIl1Ill = Il111l1l11I(llll1l1I1Il)
    if l1IIIIl1Ill == "" then
        return false , "Key is empty"
    end
    local Il1ll1IlIlI = tonumber(IIlllIIl11I.Timeout) or 25
    local function lll1l11lIIl(ll1I1l1l11l)
        if ll1I1l1l11l == "timeout" then
            return false , "Validation timed out"
        end
        return false , "Validation error"
    end
    local l1l1IIl1l1l = IIlllIIl11I.Keys or IIlllIIl11I.ValidKeys
    if type(l1l1IIl1l1l) == "table" then
        local lIII1111I1I = IIlllIIl11I.CaseSensitive ~= false
        for ll1I1IlII1I, I1ll11llllI in next, l1l1IIl1l1l do
            local IlIlI1l11l1, I11lIII111l = Il111l1l11I(I1ll11llllI), l1IIIIl1Ill
            if not lIII1111I1I then
                IlIlI1l11l1, I11lIII111l = IlIlI1l11l1:lower(), I11lIII111l:lower()
            end
            if IlIlI1l11l1 == I11lIII111l then
                return true
            end
        end
    end
    local IlIII1IIII1
    for Il1I1lII1l1, llIl1Il1I1I in ipairs({
        "Validate", "Validator", "CheckKey", "ValidateKey", "VerifyKey", "Verify", "Check"
    }) do
        if type(IIlllIIl11I[llIl1Il1I1I]) == "function" then
            IlIII1IIII1 = IIlllIIl11I[llIl1Il1I1I]
            break
        end
    end
    if IlIII1IIII1 then
        local lIIllIl1I11, lllIIll11Il = l1lI1III1ll( function ()
            return IlIII1IIII1(l1IIIIl1Ill)
        end
        , Il1ll1IlIlI)
        if not lIIllIl1I11 then
            warn("[NeverloseUI] Key validator error: " .. tostring(lllIIll11Il))
            return lll1l11lIIl(lllIIll11Il)
        end
        return IIl11I111lI(lllIIll11Il[1], lllIIll11Il[2])
    end
    if type(IIlllIIl11I.Service) == "function" then
        local l11llllIl1I = IIlllIIl11I.Service
        local Il1lI1llllI, I1III111I1l = l1lI1III1ll( function ()
            return l11llllIl1I(l1IIIIl1Ill)
        end
        , Il1ll1IlIlI)
        if not Il1lI1llllI then
            warn("[NeverloseUI] Key service error: " .. tostring(I1III111I1l))
            return lll1l11lIIl(I1III111I1l)
        end
        return IIl11I111lI(I1III111I1l[1], I1III111I1l[2])
    end
    do
        local llI1Ill111I, Il1111III11, l1l1llI1llI = ( function ()
            local lI11lIlIlll, l1Il1I11ll1 = l1lI1III1ll( function ()
                return l1l1llIIIll(IIlllIIl11I, l1IIIIl1Ill)
            end
            , Il1ll1IlIlI)
            if not lI11lIlIlll then
                return false , l1Il1I11ll1
            end
            return true , l1Il1I11ll1[1], l1Il1I11ll1[2]
        end
        )()
        if not llI1Ill111I then
            warn("[NeverloseUI] Key request error: " .. tostring(Il1111III11))
            return lll1l11lIIl(Il1111III11)
        end
        if Il1111III11 ~= nil then
            return Il1111III11 == true , (Il1111III11 ~= true and type(l1l1llI1llI) == "string" and l1l1llI1llI) or nil
        end
    end
    for lIl11lllI1l, llI1Ill1lIl in ipairs(Il1l1111III(IIlllIIl11I)) do
        local I1lIIIl1llI, IIl1IIllIII = IllIlI11lIl(llI1Ill1lIl, l1II1llII11, false )
        if I1lIIIl1llI then
            local I1llI11lIll, IIl1IllII1l = l1lI1III1ll( function ()
                return l1I1lIl1l11(llI1Ill1lIl, I1lIIIl1llI, IIl1IIllIII, IIlllIIl11I.CallStyle, l1IIIIl1Ill)
            end
            , Il1ll1IlIlI)
            if not I1llI11lIll then
                warn("[NeverloseUI] Key service error: " .. tostring(IIl1IllII1l))
                return lll1l11lIIl(IIl1IllII1l)
            end
            return IIl11I111lI(IIl1IllII1l[1], IIl1IllII1l[2])
        end
    end
    if type(l1l1IIl1l1l) == "table" then
        return false , "Key is invalid"
    end
    return false , "Key system is not configured"
end
function Neverlose:VerifyKey(lIlII1I1llI)
    local l1IIl1Il1II = Neverlose.KeyAttempts
    local l1l1IIllII1 = os.clock()
    if l1l1IIllII1 < l1IIl1Il1II.LockedUntil then
        return false , "Too many attempts, wait " .. tostring(math.ceil(l1IIl1Il1II.LockedUntil - l1l1IIllII1)) .. "s"
    end
    local ll111IIllll, lIlII111lll = Neverlose:CheckKey(lIlII1I1llI)
    if ll111IIllll then
        l1IIl1Il1II.Fails = 0
        Neverlose:_SetKeyVerified( true , Il111l1l11I(lIlII1I1llI))
        return true
    end
    if Il111l1l11I(lIlII1I1llI) ~= "" then
        l1IIl1Il1II.Fails = l1IIl1Il1II.Fails + 1
        if l1IIl1Il1II.Fails >= Neverlose.KeyMaxFails then
            l1IIl1Il1II.Fails = 0
            l1IIl1Il1II.LockedUntil = os.clock() + Neverlose.KeyLockTime
            lIlII111lll = "Too many attempts, wait " .. tostring(Neverlose.KeyLockTime) .. "s"
        end
    end
    return false , lIlII111lll or "Key is invalid"
end
function Neverlose:ReadSavedKey(II1ll1llIl1)
    local l1lIIII1IIl = Neverlose:_ReadJson(Neverlose.KeyStorePath)
    if l1lIIII1IIl and type(l1lIIII1IIl[II1ll1llIl1]) == "string" and l1lIIII1IIl[II1ll1llIl1] ~= "" then
        return l1lIIII1IIl[II1ll1llIl1]
    end
    return nil
end
function Neverlose:WriteSavedKey(l1ll1l1l1Il, I11lI1111I1)
    local I1l11lll1ll = Neverlose:_ReadJson(Neverlose.KeyStorePath) or {}
    I1l11lll1ll[l1ll1l1l1Il] = I11lI1111I1
    return Neverlose:_WriteJson(Neverlose.KeyStorePath, I1l11lll1ll)
end
function Neverlose:ApplyKeyLock(ll111111IlI, IllIIIlIII1)
    local IIl1IIl1Ill = {
        Wanted = IllIIIlIII1 == true
    }
    local l1Illll1IIl, IlI1l1I1I11, I1I11Ill1I1, IlIlI1llIIl, IIl111ll1lI
    local I1l11l1l1I1 = false
    local function lllII1lI1I1()
        return IIl1IIl1Ill.Wanted and not Neverlose.KeyVerified and not I1l11l1l1I1
    end
    local function l1lI1IIlIIl(I1III1lllll)
        if IlIlI1llIIl then
            IlIlI1llIIl:Disconnect()
            IlIlI1llIIl = nil
        end
        local llI1llI1lIl = IlI1l1I1I11
        IlI1l1I1I11 = nil
        I1I11Ill1I1 = nil
        if not llI1llI1lIl then
            return
        end
        if I1III1lllll or not llI1llI1lIl.Parent then
            llI1llI1lIl:Destroy()
            return
        end
        Neverlose.PlayAnimate(llI1llI1lIl, TweenInfo.new(0.16), {
            GroupTransparency = 1
        })
        task.delay(0.2, function ()
            if llI1llI1lIl then
                llI1llI1lIl:Destroy()
            end
        end
        )
    end
    local function IIl11llI1I1()
        if not lllII1lI1I1() or IlI1l1I1I11 or not ll111111IlI.Parent then
            return
        end
        local I1I11IIIl11 = Neverlose._ThemeAccent or Neverlose.AccentColor
        local llI1l1IIlll = Color3.fromRGB(255, 102, 105)
        local llIlI1l11ll = (ll111111IlI.ZIndex or 1) + 70
        local l1IIl1lII11 = Instance.new("CanvasGroup")
        l1IIl1lII11.Name = Neverlose.RandomString()
        l1IIl1lII11.Size = UDim2.new(1, 0, 1, 0)
        l1IIl1lII11.BackgroundColor3 = Color3.fromRGB(12, 10, 22)
        l1IIl1lII11.BackgroundTransparency = 0.04
        l1IIl1lII11.BorderSizePixel = 0
        l1IIl1lII11.GroupTransparency = 1
        l1IIl1lII11.ZIndex = llIlI1l11ll
        l1IIl1lII11.Parent = ll111111IlI
        local Il1I1I111I1 = Instance.new("UICorner")
        Il1I1I111I1.CornerRadius = UDim.new(0, 6)
        Il1I1I111I1.Parent = l1IIl1lII11
        local II1l1lI1I1I = Instance.new("UIStroke")
        II1l1lI1I1I.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        II1l1lI1I1I.Thickness = 1
        II1l1lI1I1I.Color = llI1l1IIlll
        II1l1lI1I1I.Transparency = 0.35
        II1l1lI1I1I.Parent = l1IIl1lII11
        local l1lll11IIIl = Instance.new("UIScale")
        l1lll11IIIl.Scale = 0.94
        l1lll11IIIl.Parent = l1IIl1lII11
        IlI1l1I1I11 = l1IIl1lII11
        I1I11Ill1I1 = 1
        local l11Ill1ll1l = Instance.new("CanvasGroup")
        l11Ill1ll1l.Name = Neverlose.RandomString()
        l11Ill1ll1l.Size = UDim2.new(1, 0, 1, 0)
        l11Ill1ll1l.BackgroundTransparency = 1
        l11Ill1ll1l.BorderSizePixel = 0
        l11Ill1ll1l.ZIndex = llIlI1l11ll + 1
        l11Ill1ll1l.Parent = l1IIl1lII11
        local l11lI1II1ll = Instance.new("Frame")
        l11lI1II1ll.AnchorPoint = Vector2.new(0.5, 0.5)
        l11lI1II1ll.Position = UDim2.new(0.5, 0, 0.5, 0)
        l11lI1II1ll.Size = UDim2.new(0, 165, 0, 20)
        l11lI1II1ll.BackgroundTransparency = 1
        l11lI1II1ll.ZIndex = llIlI1l11ll + 2
        l11lI1II1ll.Parent = l11Ill1ll1l
        local lll1I1l111I = Instance.new("UIListLayout")
        lll1I1l111I.FillDirection = Enum.FillDirection.Horizontal
        lll1I1l111I.VerticalAlignment = Enum.VerticalAlignment.Center
        lll1I1l111I.HorizontalAlignment = Enum.HorizontalAlignment.Center
        lll1I1l111I.Padding = UDim.new(0, 7)
        lll1I1l111I.SortOrder = Enum.SortOrder.LayoutOrder
        lll1I1l111I.Parent = l11lI1II1ll
        local lI1lIlIlllI = Instance.new("ImageLabel")
        lI1lIlIlllI.Size = UDim2.new(0, 15, 0, 15)
        lI1lIlIlllI.BackgroundTransparency = 1
        lI1lIlIlllI.ScaleType = Enum.ScaleType.Fit
        lI1lIlIlllI.Image = Neverlose:GetIconId("134724289526879")
        lI1lIlIlllI.ImageColor3 = llI1l1IIlll
        lI1lIlIlllI.LayoutOrder = 1
        lI1lIlIlllI.ZIndex = llIlI1l11ll + 3
        lI1lIlIlllI.Parent = l11lI1II1ll
        local IlIlIIlll11 = Instance.new("TextLabel")
        IlIlIIlll11.Size = UDim2.new(0, 140, 0, 20)
        IlIlIIlll11.BackgroundTransparency = 1
        IlIlIIlll11.Font = Enum.Font.GothamBold
        IlIlIIlll11.Text = "Key validation error"
        IlIlIIlll11.TextSize = 13
        IlIlIIlll11.TextColor3 = llI1l1IIlll
        IlIlIIlll11.TextXAlignment = Enum.TextXAlignment.Left
        IlIlIIlll11.LayoutOrder = 2
        IlIlIIlll11.ZIndex = llIlI1l11ll + 3
        IlIlIIlll11.Parent = l11lI1II1ll
        local l1I1I1l1l1I = Instance.new("CanvasGroup")
        l1I1I1l1l1I.Name = Neverlose.RandomString()
        l1I1I1l1l1I.Size = UDim2.new(1, 0, 1, 0)
        l1I1I1l1l1I.BackgroundTransparency = 1
        l1I1I1l1l1I.BorderSizePixel = 0
        l1I1I1l1l1I.GroupTransparency = 1
        l1I1I1l1l1I.Visible = false
        l1I1I1l1l1I.ZIndex = llIlI1l11ll + 1
        l1I1I1l1l1I.Parent = l1IIl1lII11
        local IIlIl1lI11I = Instance.new("TextBox")
        IIlIl1lI11I.AnchorPoint = Vector2.new(0, 0.5)
        IIlIl1lI11I.Position = UDim2.new(0, 5, 0.5, 0)
        IIlIl1lI11I.Size = UDim2.new(1, - 135, 0.78, 0)
        IIlIl1lI11I.BackgroundColor3 = Color3.fromRGB(24, 22, 38)
        IIlIl1lI11I.BorderSizePixel = 0
        IIlIl1lI11I.ClearTextOnFocus = false
        IIlIl1lI11I.Font = Enum.Font.GothamMedium
        IIlIl1lI11I.PlaceholderText = "Enter key..."
        IIlIl1lI11I.PlaceholderColor3 = Color3.fromRGB(125, 125, 145)
        IIlIl1lI11I.Text = ""
        IIlIl1lI11I.TextColor3 = Color3.fromRGB(235, 235, 245)
        IIlIl1lI11I.TextSize = 12
        IIlIl1lI11I.TextXAlignment = Enum.TextXAlignment.Left
        IIlIl1lI11I.ClipsDescendants = true
        IIlIl1lI11I.ZIndex = llIlI1l11ll + 2
        IIlIl1lI11I.Parent = l1I1I1l1l1I
        local ll1IllIl111 = Instance.new("UICorner")
        ll1IllIl111.CornerRadius = UDim.new(0, 5)
        ll1IllIl111.Parent = IIlIl1lI11I
        local lIII1l111lI = Instance.new("UIPadding")
        lIII1l111lI.PaddingLeft = UDim.new(0, 8)
        lIII1l111lI.PaddingRight = UDim.new(0, 6)
        lIII1l111lI.Parent = IIlIl1lI11I
        local I111l1IlII1 = Instance.new("TextButton")
        I111l1IlII1.AnchorPoint = Vector2.new(1, 0.5)
        I111l1IlII1.Position = UDim2.new(1, - 62, 0.5, 0)
        I111l1IlII1.Size = UDim2.new(0, 58, 0.78, 0)
        I111l1IlII1.BackgroundColor3 = Color3.fromRGB(34, 32, 52)
        I111l1IlII1.BorderSizePixel = 0
        I111l1IlII1.AutoButtonColor = false
        I111l1IlII1.Font = Enum.Font.GothamBold
        I111l1IlII1.Text = "Get Key"
        I111l1IlII1.TextSize = 11
        I111l1IlII1.TextColor3 = Color3.fromRGB(235, 235, 245)
        I111l1IlII1.ZIndex = llIlI1l11ll + 2
        I111l1IlII1.Parent = l1I1I1l1l1I
        local IllIlIllI1I = Instance.new("UICorner")
        IllIlIllI1I.CornerRadius = UDim.new(0, 5)
        IllIlIllI1I.Parent = I111l1IlII1
        local llIllIl1IlI = Instance.new("TextButton")
        llIllIl1IlI.AnchorPoint = Vector2.new(1, 0.5)
        llIllIl1IlI.Position = UDim2.new(1, - 5, 0.5, 0)
        llIllIl1IlI.Size = UDim2.new(0, 52, 0.78, 0)
        llIllIl1IlI.BackgroundColor3 = I1I11IIIl11
        llIllIl1IlI.BorderSizePixel = 0
        llIllIl1IlI.AutoButtonColor = false
        llIllIl1IlI.Font = Enum.Font.GothamBold
        llIllIl1IlI.Text = "Verify"
        llIllIl1IlI.TextSize = 11
        llIllIl1IlI.TextColor3 = Color3.fromRGB(255, 255, 255)
        llIllIl1IlI.ZIndex = llIlI1l11ll + 2
        llIllIl1IlI.Parent = l1I1I1l1l1I
        local I1I1l11111l = Instance.new("UICorner")
        I1I1l11111l.CornerRadius = UDim.new(0, 5)
        I1I1l11111l.Parent = llIllIl1IlI
        Neverlose:ApplyFont(IlIlIIlll11)
        Neverlose:ApplyFont(IIlIl1lI11I)
        Neverlose:ApplyFont(I111l1IlII1)
        Neverlose:ApplyFont(llIllIl1IlI)
        Neverlose.PlayAnimate(l1IIl1lII11, TweenInfo.new(0.18), {
            GroupTransparency = 0
        })
        Neverlose.PlayAnimate(l1lll11IIIl, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Scale = 1
        })
        local function IlIlllI1I1l()
            if IlI1l1I1I11 ~= l1IIl1lII11 or I1I11Ill1I1 ~= 1 then
                return
            end
            I1I11Ill1I1 = 2
            Neverlose.PlayAnimate(l11Ill1ll1l, TweenInfo.new(0.12), {
                GroupTransparency = 1
            })
            task.delay(0.13, function ()
                if IlI1l1I1I11 ~= l1IIl1lII11 then
                    return
                end
                l11Ill1ll1l.Visible = false
                l1I1I1l1l1I.Visible = true
                Neverlose.PlayAnimate(l1I1I1l1l1I, TweenInfo.new(0.18), {
                    GroupTransparency = 0
                })
                Neverlose.PlayAnimate(II1l1lI1I1I, TweenInfo.new(0.18), {
                    Color = I1I11IIIl11, Transparency = 0.5
                })
            end
            )
        end
        task.delay(0.95, function ()
            IlIlllI1I1l()
        end
        )
        local IlIl1IlllII = false
        local function l11llIIII11()
            if IlIl1IlllII or IlI1l1I1I11 ~= l1IIl1lII11 then
                return
            end
            IlIl1IlllII = true
            llIllIl1IlI.Text = "..."
            local I111lI1Ill1, l1I111IllIl = Neverlose:VerifyKey(IIlIl1lI11I.Text)
            IlIl1IlllII = false
            if I111lI1Ill1 or IlI1l1I1I11 ~= l1IIl1lII11 then
                return
            end
            llIllIl1IlI.Text = "Verify"
            IIlIl1lI11I.Text = ""
            IIlIl1lI11I.PlaceholderText = string.sub(tostring(l1I111IllIl or "Key is invalid"), 1, 22)
            II1l1lI1I1I.Color = llI1l1IIlll
            Neverlose.PlayAnimate(II1l1lI1I1I, TweenInfo.new(0.4), {
                Color = I1I11IIIl11
            })
        end
        Neverlose:AddSignal(llIllIl1IlI.MouseButton1Click:Connect(l11llIIII11))
        Neverlose:AddSignal(IIlIl1lI11I.FocusLost:Connect( function (I1IIlIlII1I)
            if I1IIlIlII1I then
                l11llIIII11()
            end
        end
        ))
        Neverlose:AddSignal(I111l1IlII1.MouseButton1Click:Connect( function ()
            local Il11l111l11, lIIl11lI1ll, ll1I1lIlllI = Neverlose:CopyKeyLink()
            if Il11l111l11 then
                IlIII1l1Il1("Get Key", ll1I1lIlllI and "Key link copied to clipboard." or tostring(lIIl11lI1ll), "lucide:link")
            else
                IlIII1l1Il1("Get Key", tostring(lIIl11lI1ll or "No key link configured"), "lucide:triangle-alert")
            end
        end
        ))
        IlIlI1llIIl = UserInputService.InputBegan:Connect( function (lI1l1I1lIl1)
            if lI1l1I1lIl1.UserInputType ~= Enum.UserInputType.MouseButton1 and lI1l1I1lIl1.UserInputType ~= Enum.UserInputType.Touch then
                return
            end
            if IlI1l1I1I11 ~= l1IIl1lII11 then
                return
            end
            local IIlllllllII = lI1l1I1lIl1.Position
            local lII1I111lIl, lIlI1IlI1II = l1IIl1lII11.AbsolutePosition, l1IIl1lII11.AbsoluteSize
            local Ill11l1II11 = IIlllllllII.X >= lII1I111lIl.X and IIlllllllII.X <= lII1I111lIl.X + lIlI1IlI1II.X and IIlllllllII.Y >= lII1I111lIl.Y and IIlllllllII.Y <= lII1I111lIl.Y + lIlI1IlI1II.Y
            if Ill11l1II11 then
                IlIlllI1I1l()
            else
                l1lI1IIlIIl()
            end
        end
        )
    end
    local function lIlII1111II()
        if l1Illll1IIl and l1Illll1IIl.Parent then
            l1Illll1IIl.Visible = true
            return
        end
        l1Illll1IIl = Instance.new("TextButton")
        l1Illll1IIl.Name = Neverlose.RandomString()
        l1Illll1IIl.Text = ""
        l1Illll1IIl.AutoButtonColor = false
        l1Illll1IIl.Active = true
        l1Illll1IIl.BackgroundTransparency = 1
        l1Illll1IIl.BorderSizePixel = 0
        l1Illll1IIl.Size = UDim2.new(1, 0, 1, 0)
        l1Illll1IIl.ZIndex = (ll111111IlI.ZIndex or 1) + 55
        l1Illll1IIl.Parent = ll111111IlI
        pcall( function ()
            ll111111IlI.ClipsDescendants = true
        end
        )
        Neverlose:AddSignal(l1Illll1IIl.MouseButton1Click:Connect(IIl11llI1I1))
    end
    local function IllI1llll1l()
        if lllII1lI1I1() then
            lIlII1111II()
        else
            if l1Illll1IIl then
                l1Illll1IIl.Visible = false
            end
        end
    end
    local function lIlIIIIlIIl()
        if IIl111ll1lI then
            return
        end
        IIl111ll1lI = Neverlose.KeySignal:Connect( function (Illl111llI1)
            if I1l11l1l1I1 then
                return
            end
            if Illl111llI1 then
                if IlI1l1I1I11 then
                    local I1l1Illl11I = IlI1l1I1I11
                    local l1l1I1I111l = I1l1Illl11I:FindFirstChildOfClass("UIStroke")
                    if l1l1I1I111l then
                        Neverlose.PlayAnimate(l1l1I1I111l, TweenInfo.new(0.15), {
                            Color = Color3.fromRGB(135, 255, 143), Transparency = 0
                        })
                    end
                    task.delay(0.3, function ()
                        if IlI1l1I1I11 == I1l1Illl11I then
                            l1lI1IIlIIl()
                        end
                    end
                    )
                end
            else
                l1lI1IIlIIl()
            end
            IllI1llll1l()
        end
        )
        Neverlose:AddSignal(ll111111IlI.Destroying:Connect( function ()
            I1l11l1l1I1 = true
            l1lI1IIlIIl( true )
        end
        ))
    end
    function IIl1IIl1Ill:SetRequired(l1IIlIIIIll)
        IIl1IIl1Ill.Wanted = l1IIlIIIIll == true
        if IIl1IIl1Ill.Wanted then
            lIlIIIIlIIl()
        else
            l1lI1IIlIIl()
        end
        IllI1llll1l()
        return IIl1IIl1Ill
    end
    function IIl1IIl1Ill:IsActive()
        return lllII1lI1I1()
    end
    if IIl1IIl1Ill.Wanted then
        lIlIIIIlIIl()
        IllI1llll1l()
    end
    return IIl1IIl1Ill
end
function Neverlose:RunKeyGate(IIlll1ll1ll, l1lIIllIIlI)
    l1lIIllIIlI = type(l1lIIllIIlI) == "table" and l1lIIllIIlI or {}
    local IlllIll1Il1 = {
        Ready = false , Closing = false
    }
    local IIlI1II11lI = Neverlose._ThemeAccent or Neverlose.AccentColor
    local IlII1l11II1 = Color3.fromRGB(9, 11, 18)
    local III1l111l1I = Color3.fromRGB(150, 155, 172)
    local l11l1l11l1l = Color3.fromRGB(255, 102, 105)
    local IlIl1llllll = Color3.fromRGB(135, 255, 143)
    local I11I1lIllIl = tonumber(l1lIIllIIlI.IntroSize or l1lIIllIIlI.StartIntroSize) or 80
    local lIllllII111 = tonumber(l1lIIllIIlI.IntroTime) or 1.2
    local I1I1IIIlll1 = tonumber(l1lIIllIIlI.LoadingTime) or 0.8
    local l1lIlllll11 = tonumber(l1lIIllIIlI.Width) or 320
    local Ill1lI11llI = tonumber(l1lIIllIIlI.Height) or 212
    local Ill1lll1lI1 = l1lIIllIIlI.Intro ~= false
    local Il111lIlIl1 = tostring(l1lIIllIIlI.Logo or IIlll1ll1ll.Logo or Neverlose.GlobalLogo or "")
    local IllI11IIII1 = Enum.EasingStyle.Quint
    local function l1llII1111l(IIllIllIlI1, IIIIlIl1I1I, IlI1IIl111I, I11lIIlll11, lII1IIIlI11)
        return Neverlose.PlayAnimate(IIllIllIlI1, TweenInfo.new(IIIIlIl1I1I, I11lIIlll11 or Enum.EasingStyle.Quad, lII1IIIlI11 or Enum.EasingDirection.Out), IlI1IIl111I)
    end
    local function lIl111ll1l1(l11IIII1II1, I1I1ll1lII1, lI11Illl11l)
        local IIIllIIIIII = Instance.new(l11IIII1II1)
        IIIllIIIIII.Name = Neverlose.RandomString()
        for lIlI1IIl11I, IIlI11lI1l1 in next, I1I1ll1lII1 do
            IIIllIIIIII[lIlI1IIl11I] = IIlI11lI1l1
        end
        IIIllIIIIII.Parent = lI11Illl11l
        Neverlose:ApplyFont(IIIllIIIIII)
        return IIIllIIIIII
    end
    local l1l1ll1IlIl = lIl111ll1l1("Frame", {
        BackgroundTransparency = 1, BorderSizePixel = 0, Size = UDim2.new(1, 0, 1, 0), ZIndex = 1000,
    }, Neverlose.ScreenGui)
    local IlIllII1111 = lIl111ll1l1("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.fromOffset(I11I1lIllIl, I11I1lIllIl), BackgroundColor3 = IlII1l11II1, BackgroundTransparency = 1, BorderSizePixel = 0, ClipsDescendants = true , ZIndex = 1001,
    }, l1l1ll1IlIl)
    lIl111ll1l1("UICorner", {
        CornerRadius = UDim.new(0, 10)
    }, IlIllII1111)
    local I1111IlIlI1 = Neverlose:CreateSpinBorder(IlIllII1111, {
        Transparency = 1
    })
    local llIllI1IllI = UDim2.new(0.5, 0, 0.5, 34 - (Ill1lI11llI / 2))
    local IIlllI111II = lIl111ll1l1("ImageLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.fromOffset(56, 52), BackgroundTransparency = 1, Image = Il111lIlIl1, ImageTransparency = 1, ScaleType = Enum.ScaleType.Fit, ZIndex = 1004,
    }, IlIllII1111)
    local II1lII1l1l1 = lIl111ll1l1("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 36), Size = UDim2.fromOffset(22, 22), BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 1003,
    }, IlIllII1111)
    lIl111ll1l1("UICorner", {
        CornerRadius = UDim.new(1, 0)
    }, II1lII1l1l1)
    local lIIl1II11l1 = lIl111ll1l1("UIStroke", {
        Thickness = 2.5, Color = IIlI1II11lI, Transparency = 1,
    }, II1lII1l1l1)
    local l1IIIIll1lI = lIl111ll1l1("UIGradient", {
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.45, 0.2), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 1),
        }),
    }, lIIl1II11l1)
    local Ill1Il11l11
    local function IlII1111II1()
        if Ill1Il11l11 then
            return
        end
        Ill1Il11l11 = RunService.RenderStepped:Connect( function (lll1l11lIl1)
            l1IIIIll1lI.Rotation = (l1IIIIll1lI.Rotation + 360 * math.min(lll1l11lIl1, 0.1)) % 360
        end
        )
    end
    local function l11lI11III1()
        if Ill1Il11l11 then
            Ill1Il11l11:Disconnect()
            Ill1Il11l11 = nil
        end
    end
    local IIlIII1I1I1 = lIl111ll1l1("CanvasGroup", {
        AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.fromOffset(l1lIlllll11, Ill1lI11llI), BackgroundTransparency = 1, BorderSizePixel = 0, GroupTransparency = 1, Visible = false , ZIndex = 1002,
    }, IlIllII1111)
    lIl111ll1l1("TextLabel", {
        Position = UDim2.new(0, 0, 0, 58), Size = UDim2.new(1, 0, 0, 20), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, Text = tostring(l1lIIllIIlI.Title or IIlll1ll1ll.Name or "Key System"), TextSize = 16, TextColor3 = Color3.fromRGB(240, 240, 250), ZIndex = 1003,
    }, IIlIII1I1I1)
    lIl111ll1l1("TextLabel", {
        Position = UDim2.new(0, 0, 0, 79), Size = UDim2.new(1, 0, 0, 16), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, Text = tostring(l1lIIllIIlI.Content or l1lIIllIIlI.Description or "Enter your key to continue"), TextSize = 12, TextColor3 = III1l111l1I, ZIndex = 1003,
    }, IIlIII1I1I1)
    local IIIIII1l111 = lIl111ll1l1("TextBox", {
        Position = UDim2.new(0, 20, 0, 104), Size = UDim2.new(1, - 40, 0, 34), BackgroundColor3 = Color3.fromRGB(20, 22, 34), BorderSizePixel = 0, ClearTextOnFocus = false , Font = Enum.Font.GothamMedium, PlaceholderText = tostring(l1lIIllIIlI.Placeholder or "Enter key..."), PlaceholderColor3 = Color3.fromRGB(125, 125, 145), Text = "", TextColor3 = Color3.fromRGB(235, 235, 245), TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, ClipsDescendants = true , ZIndex = 1003,
    }, IIlIII1I1I1)
    lIl111ll1l1("UICorner", {
        CornerRadius = UDim.new(0, 7)
    }, IIIIII1l111)
    lIl111ll1l1("UIPadding", {
        PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10)
    }, IIIIII1l111)
    local ll1lI1l1llI = lIl111ll1l1("TextButton", {
        Position = UDim2.new(0, 20, 0, 148), Size = UDim2.new(0.5, - 24, 0, 34), BackgroundColor3 = Color3.fromRGB(28, 30, 46), BorderSizePixel = 0, AutoButtonColor = false , Font = Enum.Font.GothamBold, Text = tostring(l1lIIllIIlI.GetKeyText or "Get Key"), TextSize = 13, TextColor3 = Color3.fromRGB(235, 235, 245), ZIndex = 1003,
    }, IIlIII1I1I1)
    lIl111ll1l1("UICorner", {
        CornerRadius = UDim.new(0, 7)
    }, ll1lI1l1llI)
    local II1lIII1llI = lIl111ll1l1("TextButton", {
        Position = UDim2.new(0.5, 4, 0, 148), Size = UDim2.new(0.5, - 24, 0, 34), BackgroundColor3 = IIlI1II11lI, BorderSizePixel = 0, AutoButtonColor = false , Font = Enum.Font.GothamBold, Text = tostring(l1lIIllIIlI.VerifyText or "Verify"), TextSize = 13, TextColor3 = Color3.fromRGB(255, 255, 255), ZIndex = 1003,
    }, IIlIII1I1I1)
    lIl111ll1l1("UICorner", {
        CornerRadius = UDim.new(0, 7)
    }, II1lIII1llI)
    local ll1111IlI1l = lIl111ll1l1("TextLabel", {
        Position = UDim2.new(0, 10, 0, 188), Size = UDim2.new(1, - 20, 0, 16), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, Text = "", TextSize = 11, TextColor3 = III1l111l1I, ZIndex = 1003,
    }, IIlIII1I1I1)
    local lII1IIlIIll
    if l1lIIllIIlI.Closable ~= false then
        lII1IIlIIll = lIl111ll1l1("TextButton", {
            AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, - 8, 0, 8), Size = UDim2.fromOffset(22, 22), BackgroundTransparency = 1, AutoButtonColor = false , Font = Enum.Font.GothamBold, Text = "X", TextSize = 13, TextColor3 = III1l111l1I, ZIndex = 1003,
        }, IIlIII1I1I1)
    end
    local function l1I1lllIII1(l1I1Il1lIIl, IlI1IIlIll1, IlIlIIll11l)
        Neverlose:AddSignal(l1I1Il1lIIl.MouseEnter:Connect( function ()
            l1llII1111l(l1I1Il1lIIl, 0.12, {
                BackgroundColor3 = IlIlIIll11l
            })
        end
        ))
        Neverlose:AddSignal(l1I1Il1lIIl.MouseLeave:Connect( function ()
            l1llII1111l(l1I1Il1lIIl, 0.12, {
                BackgroundColor3 = IlI1IIlIll1
            })
        end
        ))
    end
    l1I1lllIII1(ll1lI1l1llI, ll1lI1l1llI.BackgroundColor3, Color3.fromRGB(40, 43, 64))
    l1I1lllIII1(II1lIII1llI, IIlI1II11lI, IIlI1II11lI:Lerp(Color3.new(1, 1, 1), 0.18))
    local function Il11llIl1ll(Il1llllI11I, lI1IlIl1Il1)
        ll1111IlI1l.Text = tostring(Il1llllI11I or "")
        ll1111IlI1l.TextColor3 = lI1IlIl1Il1 or III1l111l1I
    end
    local function I1l1l1l1ll1()
        for ll1IlIl11II, ll1lIIIllII in ipairs({
            - 8, 8, - 5, 5, 0
        }) do
            l1llII1111l(IlIllII1111, 0.05, {
                Position = UDim2.new(0.5, ll1lIIIllII, 0.5, 0)
            })
            task.wait(0.05)
        end
    end
    local function llI1l111I1l()
        local Il1l1l1lII1 = IIlll1ll1ll._MenuIcon
        if Il1l1l1lII1 then
            pcall( function ()
                if Il1l1l1lII1.AutoHide then
                    Il1l1l1lII1:OnWindowToggle(IIlll1ll1ll.Signal:GetValue())
                else
                    Il1l1l1lII1:SetVisible( true )
                end
            end
            )
        end
    end
    local function I1III1llIII(lI1lIl1lIII)
        IlllIll1Il1.Closing = true
        l1llII1111l(IIlIII1I1I1, 0.25, {
            GroupTransparency = 1
        })
        task.wait(0.28)
        IIlIII1I1I1.Visible = false
        local I1ll111Il1I = IIlll1ll1ll:GetCurrentSize()
        local IIIlIII1I1I = Neverlose.ScreenGui.AbsoluteSize
        local l1IlIlllll1 = (IIlll1ll1ll.GetFitScale and IIlll1ll1ll:GetFitScale()) or 1
        local lI11llIIIII = ((I1ll111Il1I.X.Scale * IIIlIII1I1I.X) + I1ll111Il1I.X.Offset) * l1IlIlllll1
        local IlI111ll1l1 = ((I1ll111Il1I.Y.Scale * IIIlIII1I1I.Y) + I1ll111Il1I.Y.Offset) * l1IlIlllll1
        l1llII1111l(IlIllII1111, 0.55, {
            Size = UDim2.fromOffset(lI11llIIIII, IlI111ll1l1)
        }, IllI11IIII1, Enum.EasingDirection.InOut)
        l1llII1111l(IIlllI111II, 0.55, {
            Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.fromOffset(64, 58)
        }, IllI11IIII1, Enum.EasingDirection.InOut)
        task.wait(0.6)
        local function Ill1lIIlIII(Il1llIl11l1)
            local llI111ll1lI = lIl111ll1l1("Frame", {
                AnchorPoint = Vector2.new(Il1llIl11l1 and 1 or 0, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.fromOffset(lI11llIIIII / 2, IlI111ll1l1), BackgroundColor3 = IlII1l11II1, BorderSizePixel = 0, ClipsDescendants = true , ZIndex = 1010,
            }, l1l1ll1IlIl)
            lIl111ll1l1("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }, llI111ll1lI)
            local l1IIIlIlIlI = lIl111ll1l1("Frame", {
                AnchorPoint = Vector2.new(Il1llIl11l1 and 1 or0, 0), Position = UDim2.new(Il1llIl11l1 and 1 or0, 0, 0, 0), Size = UDim2.new(0, 16, 1, 0), BackgroundColor3 = IlII1l11II1, BorderSizePixel = 0, ZIndex = 1010,
            }, llI111ll1lI)
            local Ill1I111III = lIl111ll1l1("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(Il1llIl11l1 and 1 or 0, 0, 0.5, 0), Size = UDim2.fromOffset(64, 58), BackgroundTransparency = 1, Image = Il111lIlIl1, ZIndex = 1011,
            }, llI111ll1lI)
            return llI111ll1lI, l1IIIlIlIlI, Ill1I111III
        end
        local II1l1lI1l1l, l1lI1lll1l1, Il11l111III = Ill1lIIlIII( true )
        local IlII1llIlll, lI11lIIIlII, lll11lI1lll = Ill1lIIlIII( false )
        IlIllII1111.Visible = false
        l11lI11III1()
        IIlll1ll1ll.KeyGateActive = false
        IIlll1ll1ll.Signal:SetValue( true )
        task.wait(0.2)
        local I1lIIIII1II = (lI11llIIIII / 2) + 24
        local lII111l1111 = {
            0.8, IllI11IIII1, Enum.EasingDirection.InOut
        }
        l1llII1111l(II1l1lI1l1l, lII111l1111[1], {
            Position = UDim2.new(0.5, - I1lIIIII1II, 0.5, 0), BackgroundTransparency = 1
        }, lII111l1111[2], lII111l1111[3])
        l1llII1111l(IlII1llIlll, lII111l1111[1], {
            Position = UDim2.new(0.5, I1lIIIII1II, 0.5, 0), BackgroundTransparency = 1
        }, lII111l1111[2], lII111l1111[3])
        l1llII1111l(l1lI1lll1l1, lII111l1111[1], {
            BackgroundTransparency = 1
        }, lII111l1111[2], lII111l1111[3])
        l1llII1111l(lI11lIIIlII, lII111l1111[1], {
            BackgroundTransparency = 1
        }, lII111l1111[2], lII111l1111[3])
        l1llII1111l(Il11l111III, lII111l1111[1], {
            ImageTransparency = 1
        }, lII111l1111[2], lII111l1111[3])
        l1llII1111l(lll11lI1lll, lII111l1111[1], {
            ImageTransparency = 1
        }, lII111l1111[2], lII111l1111[3])
        llI1l111I1l()
        task.wait(0.85)
        l1l1ll1IlIl:Destroy()
        IlllIll1Il1.Done = true
        Neverlose:FireCallback(l1lIIllIIlI.OnSuccess or l1lIIllIIlI.Callback, "KeySystem", lI1lIl1lIII)
    end
    local llI1IlI11II = false
    local I1lll1I1l1I = tostring(l1lIIllIIlI.SaveName or IIlll1ll1ll.AutoSaveKey or IIlll1ll1ll.Name or "Default")
    local function IlllIlIIII1()
        if not IlllIll1Il1.Ready or llI1IlI11II or IlllIll1Il1.Closing then
            return
        end
        llI1IlI11II = true
        II1lIII1llI.Text = "Verifying..."
        Il11llIl1ll("", III1l111l1I)
        local lll1lII11l1, IlIlI1lIIll = Neverlose:VerifyKey(IIIIII1l111.Text)
        llI1IlI11II = false
        if IlllIll1Il1.Closing then
            return
        end
        if lll1lII11l1 then
            if l1lIIllIIlI.SaveKey == true then
                Neverlose:WriteSavedKey(I1lll1I1l1I, Il111l1l11I(IIIIII1l111.Text))
            end
            II1lIII1llI.Text = "Verified"
            Il11llIl1ll("Key verified", IlIl1llllll)
            task.spawn(I1III1llIII, Neverlose.KeyValue)
        else
            II1lIII1llI.Text = tostring(l1lIIllIIlI.VerifyText or "Verify")
            Il11llIl1ll(IlIlI1lIIll or "Key is invalid", l11l1l11l1l)
            if l1lIIllIIlI.SaveKey == true then
                Neverlose:WriteSavedKey(I1lll1I1l1I, nil )
            end
            task.spawn(I1l1l1l1ll1)
        end
    end
    Neverlose:AddSignal(II1lIII1llI.MouseButton1Click:Connect(IlllIlIIII1))
    Neverlose:AddSignal(IIIIII1l111.FocusLost:Connect( function (lllIIlIll11)
        if lllIIlIll11 then
            IlllIlIIII1()
        end
    end
    ))
    Neverlose:AddSignal(ll1lI1l1llI.MouseButton1Click:Connect( function ()
        if not IlllIll1Il1.Ready or IlllIll1Il1.Closing then
            return
        end
        local l1lI111IllI, I1I1lllI1l1, I1I11Ill1ll = Neverlose:CopyKeyLink()
        if l1lI111IllI then
            Il11llIl1ll(I1I11Ill1ll and "Key link copied to clipboard" or tostring(I1I1lllI1l1), IlIl1llllll)
        else
            Il11llIl1ll(I1I1lllI1l1 or "No key link configured", l11l1l11l1l)
        end
    end
    ))
    if lII1IIlIIll then
        Neverlose:AddSignal(lII1IIlIIll.MouseButton1Click:Connect( function ()
            if not IlllIll1Il1.Ready or IlllIll1Il1.Closing then
                return
            end
            IlllIll1Il1.Closing = true
            l1llII1111l(IIlIII1I1I1, 0.2, {
                GroupTransparency = 1
            })
            task.wait(0.2)
            l1llII1111l(IlIllII1111, 0.3, {
                BackgroundTransparency = 1
            })
            l1llII1111l(IIlllI111II, 0.3, {
                ImageTransparency = 1
            })
            l1llII1111l(I1111IlIlI1.Stroke, 0.3, {
                Transparency = 1
            })
            task.wait(0.35)
            l11lI11III1()
            l1l1ll1IlIl:Destroy()
            IIlll1ll1ll:Destroy()
        end
        ))
    end
    task.spawn( function ()
        if Ill1lll1lI1 then
            IlIllII1111.Size = UDim2.fromOffset(I11I1lIllIl - 20, I11I1lIllIl - 20)
            l1llII1111l(IlIllII1111, 0.6, {
                Size = UDim2.fromOffset(I11I1lIllIl, I11I1lIllIl)
            }, IllI11IIII1)
            l1llII1111l(IlIllII1111, 0.5, {
                BackgroundTransparency = 0
            })
            l1llII1111l(IIlllI111II, 0.5, {
                ImageTransparency = 0
            })
            l1llII1111l(I1111IlIlI1.Stroke, 0.5, {
                Transparency = 0.55
            })
            task.wait(lIllllII111)
            l1llII1111l(IlIllII1111, 0.85, {
                Size = UDim2.fromOffset(l1lIlllll11, Ill1lI11llI)
            }, IllI11IIII1)
            l1llII1111l(IIlllI111II, 0.85, {
                Position = llIllI1IllI, Size = UDim2.fromOffset(38, 34)
            }, IllI11IIII1)
            task.wait(0.35)
            IlII1111II1()
            l1llII1111l(lIIl1II11l1, 0.4, {
                Transparency = 0
            })
            task.wait(I1I1IIIlll1)
            l1llII1111l(lIIl1II11l1, 0.3, {
                Transparency = 1
            })
            task.wait(0.25)
            l11lI11III1()
        else
            IlIllII1111.Size = UDim2.fromOffset(l1lIlllll11, Ill1lI11llI)
            IIlllI111II.Position = llIllI1IllI
            IIlllI111II.Size = UDim2.fromOffset(38, 34)
            l1llII1111l(IlIllII1111, 0.5, {
                BackgroundTransparency = 0
            })
            l1llII1111l(IIlllI111II, 0.5, {
                ImageTransparency = 0
            })
            l1llII1111l(I1111IlIlI1.Stroke, 0.5, {
                Transparency = 0.55
            })
            task.wait(0.3)
        end
        if IlllIll1Il1.Closing then
            return
        end
        IIlIII1I1I1.Visible = true
        l1llII1111l(IIlIII1I1I1, 0.45, {
            GroupTransparency = 0
        })
        task.wait(0.3)
        IlllIll1Il1.Ready = true
        if l1lIIllIIlI.SaveKey == true then
            local IllIIIll1II = Neverlose:ReadSavedKey(I1lll1I1l1I)
            if IllIIIll1II then
                IIIIII1l111.Text = IllIIIll1II
                task.wait(0.15)
                IlllIlIIII1()
            end
        end
    end
    )
    IlllIll1Il1.Root = l1l1ll1IlIl
    return IlllIll1Il1
end
Neverlose.EnabledBlur = true
Neverlose.BlurModuleParent = workspace.CurrentCamera
Neverlose.GetCalculatePosition = ( function (lIlllIlll1l, I1lII1llI1l, l1l1lI1lI1I, I1IIII111ll)
    local lIl1I11l1II = I1lII1llI1l
    local lIllIIIl1ll = I1IIII111ll
    local I1Il1lII111 = l1l1lI1lI1I - lIlllIlll1l
    local I1lIll1I111 = (lIl1I11l1II.x * I1Il1lII111.x) + (lIl1I11l1II.y * I1Il1lII111.y) + (lIl1I11l1II.z * I1Il1lII111.z)
    local llIII11l1ll = (lIl1I11l1II.x * lIllIIIl1ll.x) + (lIl1I11l1II.y * lIllIIIl1ll.y) + (lIl1I11l1II.z * lIllIIIl1ll.z)
    local lIlI1I1lI1I = - I1lIll1I111 / llIII11l1ll
    return l1l1lI1lI1I + (lIlI1I1lI1I * I1IIII111ll)
end
)

-- ====================================================================
-- [12] Depth of Field Camera Blur Module
-- ====================================================================
Neverlose.CreateBlurModule = ( function (lII1Il1111I, l1lIl1I1II1, l1II1llIl1I, ll1lIIIl111)
    if not Neverlose.EnabledBlur then
        return Neverlose:AddSignal(Instance.new("BindableEvent").Event:Connect( function ()
            return "nl"
        end
        ))
    end
    local l1l1l1IIIIl = Instance.new("Part", Neverlose.BlurModuleParent)
    local Illll111111 = Instance.new("DepthOfFieldEffect", cloneRef(game:GetService("Lighting")))
    local I1111III111 = Instance.new("BlockMesh")
    I1111III111.Parent = l1l1l1IIIIl
    l1l1l1IIIIl.Material = Enum.Material.SmoothPlastic
    l1l1l1IIIIl.Transparency = 1
    l1l1l1IIIIl.Reflectance = 0
    l1l1l1IIIIl.CastShadow = false
    l1l1l1IIIIl.Anchored = true
    l1l1l1IIIIl.CanCollide = false
    l1l1l1IIIIl.CanQuery = false
    l1l1l1IIIIl.CollisionGroup = Neverlose.RandomString()
    l1l1l1IIIIl.Size = Vector3.new(1, 1, 1) * 0.01
    l1l1l1IIIIl.Color = Color3.fromRGB(0, 0, 0)
    Illll111111.Enabled = true
    Illll111111.FarIntensity = 0
    Illll111111.FocusDistance = 0
    Illll111111.InFocusRadius = 1000
    Illll111111.NearIntensity = 1
    Illll111111.Name = Neverlose.RandomString()
    l1l1l1IIIIl.Name = Neverlose.RandomString()
    local l1I1lIl1lI1
    local IIll1Il11Il = function ()
        local lll1lII1I11 = l1II1llIl1I:GetValue()
        if lll1lII1I11 and type(ll1lIIIl111) == "function" then
            local l11I11lllII, l111lIIIl1I = pcall(ll1lIIIl111)
            if l11I11lllII and l111lIIIl1I == false then
                lll1lII1I11 = false
            end
        end
        if lll1lII1I11 and not Neverlose.Global3DRenderMode then
            Neverlose.PlayAnimate(Illll111111, TweenInfo.new(0.1), {
                NearIntensity = 1
            })Neverlose.PlayAnimate(l1l1l1IIIIl, TweenInfo.new(0.1), {
                Transparency = 0.97, Size = Vector3.new(1, 1, 1) * 0.01
            })l1l1l1IIIIl.Parent = Neverlose.BlurModuleParent
        else
            Neverlose.PlayAnimate(Illll111111, TweenInfo.new(0.1), {
                NearIntensity = 0
            })Neverlose.PlayAnimate(l1l1l1IIIIl, TweenInfo.new(0.1), {
                Size = Vector3.zero, Transparency = 1.5,
            })l1l1l1IIIIl.Parent = nil
            return false
        end
        if lll1lII1I11 then
            local I1II1ll1IlI = l1lIl1I1II1.AbsolutePosition
            local IlI1llIIIIl = I1II1ll1IlI + l1lIl1I1II1.AbsoluteSize
            local II11IlI11ll = Camera.ScreenPointToRay(Camera, I1II1ll1IlI.X, I1II1ll1IlI.Y, 1)
            local l11I11IlllI = Camera.ScreenPointToRay(Camera, IlI1llIIIIl.X, IlI1llIIIIl.Y, 1)
            local I1111l1l11l = Camera.CFrame.Position + Camera.CFrame.LookVector * (0.05 - Camera.NearPlaneZ)
            local lI11IIl1lI1 = Camera.CFrame.LookVector
            local IIl1l1ll1II = Neverlose.GetCalculatePosition(I1111l1l11l, lI11IIl1lI1, II11IlI11ll.Origin, II11IlI11ll.Direction)
            local Il1II1IIl1l = Neverlose.GetCalculatePosition(I1111l1l11l, lI11IIl1lI1, l11I11IlllI.Origin, l11I11IlllI.Direction)
            IIl1l1ll1II = Camera.CFrame:PointToObjectSpace(IIl1l1ll1II)
            Il1II1IIl1l = Camera.CFrame:PointToObjectSpace(Il1II1IIl1l)
            local l1I111llIll = Il1II1IIl1l - IIl1l1ll1II
            local llIl1lIIllI = (IIl1l1ll1II + Il1II1IIl1l) / 2
            I1111III111.Offset = llIl1lIIllI I1111III111.Scale = l1I111llIll / 0.0101
            l1l1l1IIIIl.CFrame = Camera.CFrame
        end
    end
    local lIIIIl1111I = Neverlose:AddSignal(Camera:GetPropertyChangedSignal("CFrame"):Connect(IIll1Il11Il)) local lIlIIlIlllI = Neverlose:AddSignal(UserInputService.InputChanged:Connect( function (I1Ill1lIlll)
        if I1Ill1lIlll.UserInputType == Enum.UserInputType.MouseButton1 or I1Ill1lIlll.UserInputType == Enum.UserInputType.MouseMovement or I1Ill1lIlll.UserInputType == Enum.UserInputType.Touch then
            pcall(IIll1Il11Il)
        end
    end
    ))
    local IlIIlll1Il1 = task.spawn( function ()
        while true do
            task.wait(0.1)pcall(IIll1Il11Il)
        end
    end
    )
    l1I1lIl1lI1 = function ()
        lIIIIl1111I:Disconnect()
        lIlIIlIlllI:Disconnect()
        task.cancel(IlIIlll1Il1)
        l1l1l1IIIIl:Destroy()
        Illll111111:Destroy()
    end
    l1lIl1I1II1.Destroying:Connect(l1I1lIl1lI1)
    return lIIIIl1111I
end
)
local lIIlIlII11I = function ()
end
function Neverlose:FireCallback(lll1Ill111I, IIIIl1IIIIl, ...)
    if type(lll1Ill111I) ~= "function" then
        return true
    end
    local Il1lll1I1ll = table.pack(...)
    local III111111lI = Neverlose.ActiveWindow
    local lII1Il1l1II, l1Il1l1l1ll = xpcall( function ()
        return lll1Ill111I(table.unpack(Il1lll1I1ll, 1, Il1lll1I1ll.n))
    end
    , (debug and debug.traceback) or tostring)
    if not lII1Il1l1II then
        warn(("[NeverloseUI] %s callback error: %s"):format(tostring(IIIIl1IIIIl or "Unknown"), tostring(l1Il1l1l1ll)))
        if III111111lI and III111111lI.NotifyOnCallbackError and III111111lI.Notify then
            III111111lI:Notify({
                Title = "Callback Error", Content = tostring(l1Il1l1l1ll), Duration = 5, Icon = "lucide:triangle-alert",
            })
        end
    end
    return lII1Il1l1II, l1Il1l1l1ll
end
local function wrapCaseInsensitive(lIlllI1IIII)
    return setmetatable(lIlllI1IIII, {
        __index = function (I1Il1III1ll, I1llII1Il11)
            local IIlI1lI1l11 = rawget(I1Il1III1ll, I1llII1Il11)
            if IIlI1lI1l11 ~= nil then
                return IIlI1lI1l11
            end
            local III1I11IlIl = string.lower(tostring(I1llII1Il11))
            for llI1II1lIlI, lI1lllIll1l in next, I1Il1III1ll do
                if string.lower(tostring(llI1II1lIlI)) == III1I11IlIl then
                    return lI1lllIll1l
                end
            end
        end
    })
end
function Neverlose:RollingEffect(l11llIIl1ll)
    local l1lIllll1lI = Instance.new("UIGradient")l1lIllll1lI.Transparency = NumberSequence.new {
        NumberSequenceKeypoint.new(0.00, 0.4), NumberSequenceKeypoint.new(1.00, 0.00)
    }
    l1lIllll1lI.Parent = l11llIIl1ll return l1lIllll1lI
end
function Neverlose:CreateShadow(I11IIl11I11, lllIllll11l)
    local ll111IlIIIl ={}
    local Il11I111l11 = Instance.new("UIStroke") local I1l1IIII1II = Instance.new("UIStroke") local lIIl1l1lIl1 = Instance.new("UIStroke") local IIIllIIlIl1 = Instance.new("UIStroke")Il11I111l11.Thickness = 6.000 Il11I111l11.Transparency = 1 Il11I111l11.Parent = I11IIl11I11 I1l1IIII1II.Thickness = 5.000 I1l1IIII1II.Transparency = 1 I1l1IIII1II.Parent = I11IIl11I11 lIIl1l1lIl1.Thickness = 4.000 lIIl1l1lIl1.Transparency = 1 lIIl1l1lIl1.Parent = I11IIl11I11 IIIllIIlIl1.Thickness = 3.000 IIIllIIlIl1.Transparency = 1 IIIllIIlIl1.Parent = I11IIl11I11 local IlI1lII11l1
    local ll1Illl11II, IIIllI11Il1, IIIllIIl1Il, II11I1lIIlI
    if lllIllll11l then
        ll1Illl11II = Neverlose:RollingEffect(Il11I111l11)
        IIIllI11Il1 = Neverlose:RollingEffect(I1l1IIII1II)
        IIIllIIl1Il = Neverlose:RollingEffect(lIIl1l1lIl1)
        II11I1lIIlI = Neverlose:RollingEffect(IIIllIIlIl1)
    end
    ll111IlIIIl.Render = ( function (l1I1lI1Il1l, I1IlI1II11l)
        if IlI1lII11l1 then
            task.cancel(IlI1lII11l1)
            IlI1lII11l1 = nil
        end
        if I1IlI1II11l then
            Neverlose.PlayAnimate(Il11I111l11, TweenInfo0175, {
                Transparency = 0.900
            })Neverlose.PlayAnimate(I1l1IIII1II, TweenInfo0175, {
                Transparency = 0.900
            })Neverlose.PlayAnimate(lIIl1l1lIl1, TweenInfo0175, {
                Transparency = 0.900
            })Neverlose.PlayAnimate(IIIllIIlIl1, TweenInfo0175, {
                Transparency = 0.900
            }) if lllIllll11l then
                IlI1lII11l1 = task.spawn( function ()
                    local I11IIllIIll = 20
                    while true do
                        task.wait(0.025)Neverlose.PlayAnimate(ll1Illl11II, TweenInfo0175, {
                            Rotation = ll1Illl11II.Rotation + I11IIllIIll
                        })
                        Neverlose.PlayAnimate(IIIllI11Il1, TweenInfo0175, {
                            Rotation = IIIllI11Il1.Rotation + I11IIllIIll
                        })
                        Neverlose.PlayAnimate(IIIllIIl1Il, TweenInfo0175, {
                            Rotation = IIIllIIl1Il.Rotation + I11IIllIIll
                        })
                        Neverlose.PlayAnimate(II11I1lIIlI, TweenInfo0175, {
                            Rotation = II11I1lIIlI.Rotation + I11IIllIIll
                        })
                    end
                end
                )
            end
        else
            Neverlose.PlayAnimate(Il11I111l11, TweenInfo0175, {
                Transparency = 1
            })Neverlose.PlayAnimate(I1l1IIII1II, TweenInfo0175, {
                Transparency = 1
            })Neverlose.PlayAnimate(lIIl1l1lIl1, TweenInfo0175, {
                Transparency = 1
            })Neverlose.PlayAnimate(IIIllIIlIl1, TweenInfo0175, {
                Transparency = 1
            })
        end
    end
    )
    return ll111IlIIIl
end
function Neverlose:CreateOptionWindow(lllI111lllI, llll111IIII)
    llll111IIII = llll111IIII or 9
    local II111Il11I1 = {
        Signal = Neverlose:CreateSignal( false ),
    }
    local l1lIlIlIlII = Instance.new("Frame") local llI1Ill11lI = Instance.new("UICorner") local I1I1IIlIl11 = Instance.new("UIListLayout") local I1lIIIlI11l = Instance.new("UIStroke") local lII111IIllI = Neverlose:CreateShadow(l1lIlIlIlII)
    l1lIlIlIlII.Name = Neverlose.RandomString()
    l1lIlIlIlII.Parent = Neverlose.ScreenGui l1lIlIlIlII.AnchorPoint = Vector2.new(0, 0)l1lIlIlIlII.BackgroundColor3 = Color3.fromRGB(20, 22, 27)l1lIlIlIlII.BackgroundTransparency = 0.035 l1lIlIlIlII.BorderColor3 = Color3.fromRGB(0, 0, 0)l1lIlIlIlII.BorderSizePixel = 0 l1lIlIlIlII.ClipsDescendants = true l1lIlIlIlII.Position = UDim2.new(255, 255, 255, 255)l1lIlIlIlII.Size = UDim2.new(0, 220, 0, 75)l1lIlIlIlII.ZIndex = llll111IIII + 9 llI1Ill11lI.CornerRadius = UDim.new(0, 10)llI1Ill11lI.Parent = l1lIlIlIlII I1I1IIlIl11.Parent = l1lIlIlIlII I1I1IIlIl11.HorizontalAlignment = Enum.HorizontalAlignment.Center I1I1IIlIl11.SortOrder = Enum.SortOrder.LayoutOrder I1lIIIlI11l.Transparency = 0.650 I1lIIIlI11l.Color = Color3.fromRGB(45, 48, 58)I1lIIIlI11l.Parent = l1lIlIlIlII Neverlose:AddSignal(I1I1IIlIl11:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(( function ()
        Neverlose.PlayAnimate(l1lIlIlIlII, TweenInfo0175, {
            Size = UDim2.new(0, 220, 0, I1I1IIlIl11.AbsoluteContentSize.Y - 1)
        })
    end
    )))
    Neverlose:AddSignal(l1lIlIlIlII:GetPropertyChangedSignal("BackgroundTransparency"):Connect(( function ()
        if l1lIlIlIlII.BackgroundTransparency > 0.9 then
            l1lIlIlIlII.Visible = false
            I1I1IIlIl11.Parent = nil
            l1lIlIlIlII.Parent = nil
        else
            l1lIlIlIlII.Visible = true
            I1I1IIlIl11.Parent = l1lIlIlIlII if Neverlose.Global3DRenderMode then
                l1lIlIlIlII.Parent = Neverlose.GlobalSurfaceGui
            else
                l1lIlIlIlII.Parent = Neverlose.ScreenGui
            end
        end
    end
    )))
    local lII1l1I1lI1
    local lI111Illl11 = ( function ()
        if Neverlose:MoreThanHalfY(lllI111lllI.AbsolutePosition.Y + 65) then
            l1lIlIlIlII.AnchorPoint = Vector2.new(0, 1)
        else
            l1lIlIlIlII.AnchorPoint = Vector2.new(0, 0)
        end
        l1lIlIlIlII.Position = UDim2.fromOffset(lllI111lllI.AbsolutePosition.X + 18, lllI111lllI.AbsolutePosition.Y + 65)
    end
    )
    II111Il11I1.SetRender = ( function (lI11IIllIll)
        if lII1l1I1lI1 then
            task.cancel(lII1l1I1lI1)
            lII1l1I1lI1 = nil
        end
        if lI11IIllIll then
            lI111Illl11()
            Neverlose.PlayAnimate(l1lIlIlIlII, TweenInfo0175, {
                BackgroundTransparency = 0.035
            })Neverlose.PlayAnimate(I1lIIIlI11l, TweenInfo0175, {
                Transparency = 0.650
            })lII111IIllI:Render( true )
            if Neverlose.Global3DRenderMode then
                l1lIlIlIlII.Parent = Neverlose.GlobalSurfaceGui
            else
                l1lIlIlIlII.Parent = Neverlose.ScreenGui
            end
            lII1l1I1lI1 = task.spawn( function ()
                while true do
                    task.wait()lI111Illl11()
                end
            end
            )
        else
            Neverlose.PlayAnimate(l1lIlIlIlII, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(I1lIIIlI11l, TweenInfo0175, {
                Transparency = 1
            })lII111IIllI:Render( false )
        end
    end
    )
    II111Il11I1.SetRender( false )
    II111Il11I1.Signal:Connect(II111Il11I1.SetRender) local IlIIlIlI1Il = Neverlose:RegisiterItem(l1lIlIlIlII, II111Il11I1.Signal)
    IlIIlIlI1Il.Winbdow = II111Il11I1
    IlIIlIlI1Il.Root = l1lIlIlIlII
    IlIIlIlI1Il.Signal = II111Il11I1.Signal
    return IlIIlIlI1Il
end

-- ====================================================================
-- [13] ColorPicker & Option Popups
-- ====================================================================
function Neverlose:CreateColorPicker(I1lIl1lIIl1)
    local III111lIll1 = I1lIl1lIIl1.ZIndex
    local llll1I1ll1I ={}
    local llIllIll11I = Instance.new("Frame") local II1IllI1I1l = Instance.new("UICorner") local II1llI11lI1 = Instance.new("UIStroke") local l11ll1l1ll1 = Instance.new("ImageLabel") local III1lll1lIl = Instance.new("UICorner") local l1I1Il11l11 = Instance.new("Frame") local II111IlllII = Instance.new("UICorner") local l1II1I1IIlI = Instance.new("UIStroke") local I1Illll11lI = Instance.new("Frame") local I1lI1ll1IIl = Instance.new("UIGradient") local IllIlIl11Il = Instance.new("UICorner") local I1l11IllIl1 = Instance.new("Frame") local llIlIl11lll = Instance.new("UIStroke") local I1lIIlI1lll = Instance.new("UICorner") local I11lIlI11I1 = Instance.new("TextLabel") local lI111I1IlII = Instance.new("UICorner") local I11lIIll1ll = Neverlose:CreateShadow(llIllIll11I)
    llIllIll11I.Name = Neverlose.RandomString()
    llIllIll11I.Parent = Neverlose.ScreenGui llIllIll11I.AnchorPoint = Vector2.new(0, 0)llIllIll11I.BackgroundColor3 = Color3.fromRGB(20, 22, 27)llIllIll11I.BackgroundTransparency = 0.035 llIllIll11I.BorderColor3 = Color3.fromRGB(0, 0, 0)llIllIll11I.BorderSizePixel = 0 llIllIll11I.ClipsDescendants = true llIllIll11I.Position = UDim2.new(255, 0, 255, 20)llIllIll11I.Size = UDim2.new(0, 200, 0, 240)llIllIll11I.ZIndex = III111lIll1 + 125 IIlllIIl1II:AddSignal(llIllIll11I:GetPropertyChangedSignal("BackgroundTransparency"):Connect(( function ()
        if llIllIll11I.BackgroundTransparency > 0.9 then
            llIllIll11I.Visible = false
            llIllIll11I.Parent = nil
        else
            llIllIll11I.Visible = true
            if Neverlose.Global3DRenderMode then
                llIllIll11I.Parent = Neverlose.GlobalSurfaceGui
            else
                llIllIll11I.Parent = Neverlose.ScreenGui
            end
        end
    end
    )))
    II1IllI1I1l.CornerRadius = UDim.new(0, 10)II1IllI1I1l.Parent = llIllIll11I II1llI11lI1.Transparency = 0.650 II1llI11lI1.Color = Color3.fromRGB(45, 48, 58)II1llI11lI1.Parent = llIllIll11I l11ll1l1ll1.Name = Neverlose.RandomString()
    l11ll1l1ll1.Parent = llIllIll11I l11ll1l1ll1.AnchorPoint = Vector2.new(0.5, 0)l11ll1l1ll1.BackgroundColor3 = Color3.fromRGB(255, 0, 4)l11ll1l1ll1.BorderColor3 = Color3.fromRGB(0, 0, 0)l11ll1l1ll1.BorderSizePixel = 0 l11ll1l1ll1.Position = UDim2.new(0.5, 0, 0, 5)l11ll1l1ll1.Size = UDim2.new(0, 185, 0, 185)l11ll1l1ll1.ZIndex = III111lIll1 + 126 l11ll1l1ll1.Image = Neverlose.ImageColorMapping III1lll1lIl.CornerRadius = UDim.new(0, 5)III1lll1lIl.Parent = l11ll1l1ll1 l1I1Il11l11.Name = Neverlose.RandomString()
    l1I1Il11l11.Parent = l11ll1l1ll1 l1I1Il11l11.AnchorPoint = Vector2.new(0.5, 0.5)l1I1Il11l11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l1I1Il11l11.BackgroundTransparency = 1.000 l1I1Il11l11.BorderColor3 = Color3.fromRGB(0, 0, 0)l1I1Il11l11.BorderSizePixel = 0 l1I1Il11l11.Position = UDim2.new(0.5, 0, 0.5, 0)l1I1Il11l11.Size = UDim2.new(0, 10, 0, 10)l1I1Il11l11.ZIndex = III111lIll1 + 127 II111IlllII.CornerRadius = UDim.new(1, 0)II111IlllII.Parent = l1I1Il11l11 l1II1I1IIlI.Color = Color3.fromRGB(255, 255, 255)l1II1I1IIlI.Parent = l1I1Il11l11 I1Illll11lI.Name = Neverlose.RandomString()
    I1Illll11lI.Parent = llIllIll11I I1Illll11lI.AnchorPoint = Vector2.new(0.5, 0)I1Illll11lI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)I1Illll11lI.BorderColor3 = Color3.fromRGB(0, 0, 0)I1Illll11lI.BorderSizePixel = 0 I1Illll11lI.Position = UDim2.new(0.5, 0, 0, 200)I1Illll11lI.Size = UDim2.new(1, - 15, 0, 10)I1Illll11lI.ZIndex = III111lIll1 + 126 I1lI1ll1IIl.Color = ColorSequence.new {
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 153, 0)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(203, 255, 0)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(50, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 102)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 101, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(50, 0, 255)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(204, 0, 255)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 153)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
    }
    I1lI1ll1IIl.Parent = I1Illll11lI IllIlIl11Il.CornerRadius = UDim.new(0, 3)IllIlIl11Il.Parent = I1Illll11lI I1l11IllIl1.Name = Neverlose.RandomString()
    I1l11IllIl1.Parent = I1Illll11lI I1l11IllIl1.AnchorPoint = Vector2.new(0.5, 0.5)I1l11IllIl1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)I1l11IllIl1.BackgroundTransparency = 1.000 I1l11IllIl1.BorderColor3 = Color3.fromRGB(0, 0, 0)I1l11IllIl1.BorderSizePixel = 0 I1l11IllIl1.Position = UDim2.new(0, 0, 0.5, 0)I1l11IllIl1.Size = UDim2.new(0, 5, 1, 0)I1l11IllIl1.ZIndex = III111lIll1 + 126 llIlIl11lll.Thickness = 2.000 llIlIl11lll.Color = Color3.fromRGB(255, 255, 255)llIlIl11lll.Parent = I1l11IllIl1 I1lIIlI1lll.CornerRadius = UDim.new(0, 3)I1lIIlI1lll.Parent = I1l11IllIl1 I11lIlI11I1.Name = Neverlose.RandomString()
    I11lIlI11I1.Parent = llIllIll11I I11lIlI11I1.BackgroundColor3 = Color3.fromRGB(26, 28, 36)I11lIlI11I1.BackgroundTransparency = 0.750 I11lIlI11I1.BorderColor3 = Color3.fromRGB(0, 0, 0)I11lIlI11I1.BorderSizePixel = 0 I11lIlI11I1.Position = UDim2.new(0, 10, 0, 217)I11lIlI11I1.Size = UDim2.new(1, - 20, 0, 15)I11lIlI11I1.ZIndex = III111lIll1 + 127 I11lIlI11I1.Font = Enum.Font.GothamBold I11lIlI11I1.Text = "#FFFFFF"I11lIlI11I1.TextColor3 = Color3.fromRGB(255, 255, 255)I11lIlI11I1.TextSize = 12.000 I11lIlI11I1.TextTransparency = 0.400 I11lIlI11I1.TextXAlignment = Enum.TextXAlignment.Left lI111I1IlII.CornerRadius = UDim.new(0, 4)lI111I1IlII.Parent = I11lIlI11I1 llll1I1ll1I.SetRender = ( function (l1lIIII1lll)
        if l1lIIII1lll then
            llIllIll11I.Position = UDim2.new(0, I1lIl1lIIl1.AbsolutePosition.X + 20, 0, I1lIl1lIIl1.AbsolutePosition.Y + 75)
            Neverlose.PlayAnimate(llIllIll11I, TweenInfo0175, {
                BackgroundTransparency = 0.035
            })Neverlose.PlayAnimate(II1llI11lI1, TweenInfo0175, {
                Transparency = 0.650
            })Neverlose.PlayAnimate(l11ll1l1ll1, TweenInfo0175, {
                BackgroundTransparency = 0, ImageTransparency = 0
            })Neverlose.PlayAnimate(l1II1I1IIlI, TweenInfo0175, {
                Transparency = 0
            })Neverlose.PlayAnimate(I1Illll11lI, TweenInfo0175, {
                BackgroundTransparency = 0
            })Neverlose.PlayAnimate(llIlIl11lll, TweenInfo0175, {
                Transparency = 0
            })Neverlose.PlayAnimate(I11lIlI11I1, TweenInfo0175, {
                BackgroundTransparency = 0.750, TextTransparency = 0.400
            })I11lIIll1ll:Render( true )
        else
            Neverlose.PlayAnimate(llIllIll11I, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(II1llI11lI1, TweenInfo0175, {
                Transparency = 1
            })Neverlose.PlayAnimate(l11ll1l1ll1, TweenInfo0175, {
                BackgroundTransparency = 1, ImageTransparency = 1
            })Neverlose.PlayAnimate(l1II1I1IIlI, TweenInfo0175, {
                Transparency = 1
            })Neverlose.PlayAnimate(I1Illll11lI, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(llIlIl11lll, TweenInfo0175, {
                Transparency = 1
            })Neverlose.PlayAnimate(I11lIlI11I1, TweenInfo0175, {
                BackgroundTransparency = 1, TextTransparency = 1
            })I11lIIll1ll:Render( false )
        end
    end
    )
    llll1I1ll1I.SetRender( false )
    llll1I1ll1I.Root = llIllIll11I
    llll1I1ll1I.H = 1
    llll1I1ll1I.S = 1
    llll1I1ll1I.V = 1
    llll1I1ll1I.Callback = lIIlIlII11I
    function llll1I1ll1I:Update()
        local I1IIlII11lI = Color3.fromHSV(llll1I1ll1I.H, llll1I1ll1I.S, llll1I1ll1I.V)
        Neverlose.PlayAnimate(l1I1Il11l11, TweenInfo01, {
            Position = UDim2.fromScale(llll1I1ll1I.S, 1 - llll1I1ll1I.V)
        })
        Neverlose.PlayAnimate(l11ll1l1ll1, TweenInfo01, {
            BackgroundColor3 = Color3.fromHSV(llll1I1ll1I.H, 1, 1)
        })
        Neverlose.PlayAnimate(I1l11IllIl1, TweenInfo01, {
            Position = UDim2.fromScale(llll1I1ll1I.H, 0.5)
        })
        I11lIlI11I1.Text = "#" .. I1IIlII11lI:ToHex()
        llll1I1ll1I.Callback(I1IIlII11lI)
    end
    function llll1I1ll1I:SetValue(Il1IlIIIl1I)
        if typeof(Il1IlIIIl1I) == "string" then
            Il1IlIIIl1I = Color3.fromHex(Il1IlIIIl1I)
        end
        local l11Il11ll1I, II11lIlll1l, lI1ll1111lI = Il1IlIIIl1I:ToHSV()
        llll1I1ll1I.H = l11Il11ll1I
        llll1I1ll1I.S = II11lIlll1l
        llll1I1ll1I.V = lI1ll1111lI
        llll1I1ll1I:Update()
    end
    llll1I1ll1I.IsHold = false
    Neverlose:AddSignal(llIllIll11I.InputBegan:Connect( function (llIlIIII1l1)
        if llIlIIII1l1.UserInputType == Enum.UserInputType.MouseButton1 or llIlIIII1l1.UserInputType == Enum.UserInputType.Touch then
            llll1I1ll1I.IsHold = true
        end
    end
    ))
    Neverlose:AddSignal(llIllIll11I.InputEnded:Connect( function (IIlII1lII11)
        if IIlII1lII11.UserInputType == Enum.UserInputType.MouseButton1 or IIlII1lII11.UserInputType == Enum.UserInputType.Touch then
            llll1I1ll1I.IsHold = false
        end
    end
    ))
    Neverlose:AddSignal(I1Illll11lI.InputBegan:Connect(( function (I1III11I1ll)
        if I1III11I1ll.UserInputType == Enum.UserInputType.MouseButton1 or I1III11I1ll.UserInputType == Enum.UserInputType.Touch then
            llll1I1ll1I.IsHold = true
            while (UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or llll1I1ll1I.IsHold) do
                task.wait() local I1lIlllll11 = I1Illll11lI.AbsolutePosition.X local IIlI111Il11 = I1lIlllll11 + I1Illll11lI.AbsoluteSize.X
                local l1l111Ill11 = math.clamp(Mouse.X, I1lIlllll11, IIlI111Il11) local II111I1l1ll = ((l1l111Ill11 - I1lIlllll11) / (IIlI111Il11 - I1lIlllll11))
                llll1I1ll1I.H = II111I1l1ll
                llll1I1ll1I:Update()
            end
        end
    end
    )))
    Neverlose:AddSignal(l11ll1l1ll1.InputBegan:Connect(( function (II11lI1IIlI)
        if II11lI1IIlI.UserInputType == Enum.UserInputType.MouseButton1 or II11lI1IIlI.UserInputType == Enum.UserInputType.Touch then
            llll1I1ll1I.IsHold = true
            while (UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or llll1I1ll1I.IsHold) do
                task.wait()
                local l1I1IlI11II = l11ll1l1ll1.AbsolutePosition.X
                local I11l11lI1l1 = l1I1IlI11II + l11ll1l1ll1.AbsoluteSize.X
                local IlIII1lll1I, lIIIIl11lII = math.clamp(Mouse.X, l1I1IlI11II, I11l11lI1l1), l11ll1l1ll1.AbsolutePosition.Y
                local II1I1lll111 = lIIIIl11lII + l11ll1l1ll1.AbsoluteSize.Y
                local l11l1l1Illl = math.clamp(Mouse.Y, lIIIIl11lII, II1I1lll111)
                llll1I1ll1I.S = (IlIII1lll1I - l1I1IlI11II) / (I11l11lI1l1 - l1I1IlI11II)
                llll1I1ll1I.V = (1 - ((l11l1l1Illl - lIIIIl11lII) / (II1I1lll111 - lIIIIl11lII)))
                llll1I1ll1I:Update()
            end
        end
    end
    )))
    return llll1I1ll1I
end
Neverlose.KeyEnum = {
    One = "1", Two = "2", Three = "3", Four = "4", Five = "5", Six = "6", Seven = "7", Eight = "8", Nine = "9", Zero = "0", ["Minus"] = "-", ["Plus"] = "+", BackSlash = "\\", Slash = "/", Period = ".", Semicolon = ";", Colon = ":", LeftControl = "LCtrl", RightControl = "RCtrl", LeftShift = "LShift", RightShift = "RShift", Return = "Enter", LeftBracket = "[", RightBracket = "]", Quote = "'", Comma = ",", Equals = "=", LeftSuper = "Super", RightSuper = "Super", LeftAlt = "LAlt", RightAlt = "RAlt", Escape = "Esc",
}
Neverlose.EnumReverse ={}
for Ill11Illlll, IIII1II1IIl in next, Neverlose.KeyEnum do
    Neverlose.EnumReverse[IIII1II1IIl] = Ill11Illlll
end
function Neverlose:NormalizeKeybindValue(I111lI1l11l)
    if I111lI1l11l == nil then
        return "None"
    end
    if typeof(I111lI1l11l) == "EnumItem" then
        return I111lI1l11l.Name
    end
    if typeof(I111lI1l11l) == "table" and I111lI1l11l.Name ~= nil then
        return tostring(I111lI1l11l.Name)
    end
    return tostring(I111lI1l11l)
end
function Neverlose:KeyCodeToStr(Il11lIlIlI1)
    local II1II1I1I1I = Neverlose:NormalizeKeybindValue(Il11lIlIlI1)
    if Neverlose.KeyEnum[II1II1I1I1I] then
        return Neverlose.KeyEnum[II1II1I1I1I]
    end
    return II1II1I1I1I
end
function Neverlose:StrToKeyCode(I11lIl1II11)
    I11lIl1II11 = Neverlose:NormalizeKeybindValue(I11lIl1II11)
    if Neverlose.EnumReverse[I11lIl1II11] then
        return Enum.KeyCode[Neverlose.EnumReverse[I11lIl1II11]]
    end
    return Enum.KeyCode[I11lIl1II11] or Enum.KeyCode.Unknown
end

-- ====================================================================
-- [14] Element Controls (Toggle, Slider, Keybind, Input, Dropdown)
-- ====================================================================
function Neverlose:RegisiterHandler(l1Ill1l1lll, l11lIll11I1)
    local IlIIIll11l1 ={}
    local lI1IIIlI1ll = l1Ill1l1lll.ZIndex
    function IlIIIll11l1:AddToggle(II1lll1Il1I)
        II1lll1Il1I = Neverlose:ProcessParams(II1lll1Il1I, {
            Name = nil , Default = false , Type = "Switch", Icon = "check", Flag = nil , Key = nil , ConfigKey = nil , Locked = false , TextLocked = "Locked", Callback = lIIlIlII11I,
        })
        Neverlose:ResolveConfigFlag(II1lll1Il1I)
        local I11lII1II1l = string.lower(tostring(II1lll1Il1I.Type)) == "checkbox"
        local l1111lllll1 = Instance.new("Frame") local I1l111lIll1 = Instance.new("UICorner") local lII1lIIIl1l = Instance.new("Frame") local Ill1l111lI1 = Instance.new("UICorner") local l1Il1l11IlI = Instance.new("ImageLabel") local I1l1l1IlIII = Instance.new("UIStroke")l1111lllll1.Name = Neverlose.RandomString()
        l1111lllll1.Parent = l1Ill1l1lll l1111lllll1.BackgroundColor3 = Color3.fromRGB(10, 13, 21)l1111lllll1.BorderColor3 = Color3.fromRGB(0, 0, 0)l1111lllll1.BorderSizePixel = 0 l1111lllll1.ClipsDescendants = true l1111lllll1.Size = I11lII1II1l and UDim2.new(0, 18, 0, 18) or UDim2.new(0, 30, 0, 18)l1111lllll1.ZIndex = lI1IIIlI1ll + 13 l1111lllll1.LayoutOrder = - (#l1Ill1l1lll:GetChildren() + 5)
        I1l111lIll1.CornerRadius = I11lII1II1l and UDim.new(0, 4) or UDim.new(1, 0)I1l111lIll1.Parent = l1111lllll1 I1l1l1IlIII.Transparency = I11lII1II1l and 0.650 or 1 I1l1l1IlIII.Color = Color3.fromRGB(45, 48, 58)I1l1l1IlIII.Parent = l1111lllll1 lII1lIIIl1l.Name = Neverlose.RandomString()
        lII1lIIIl1l.Parent = l1111lllll1 lII1lIIIl1l.AnchorPoint = Vector2.new(0.5, 0.5)lII1lIIIl1l.BackgroundColor3 = Color3.fromRGB(255, 255, 255)lII1lIIIl1l.BackgroundTransparency = 0.500 lII1lIIIl1l.BorderColor3 = Color3.fromRGB(0, 0, 0)lII1lIIIl1l.BorderSizePixel = 0 lII1lIIIl1l.Position = UDim2.new(0.300000012, 0, 0.5, 0)lII1lIIIl1l.Size = I11lII1II1l and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 16, 0, 16)lII1lIIIl1l.Visible = not I11lII1II1l lII1lIIIl1l.ZIndex = lI1IIIlI1ll + 14 Ill1l111lI1.CornerRadius = UDim.new(1, 0)Ill1l111lI1.Parent = lII1lIIIl1l l1Il1l11IlI.Name = Neverlose.RandomString()
        l1Il1l11IlI.Parent = l1111lllll1 l1Il1l11IlI.AnchorPoint = Vector2.new(0.5, 0.5)l1Il1l11IlI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l1Il1l11IlI.BackgroundTransparency = 1.000 l1Il1l11IlI.BorderColor3 = Color3.fromRGB(0, 0, 0)l1Il1l11IlI.BorderSizePixel = 0 l1Il1l11IlI.Position = UDim2.new(0.5, 0, 0.5, 0)l1Il1l11IlI.Size = UDim2.new(1, - 4, 1, - 4)l1Il1l11IlI.Visible = I11lII1II1l l1Il1l11IlI.ZIndex = lI1IIIlI1ll + 14 l1Il1l11IlI.ImageColor3 = Color3.fromRGB(255, 255, 255)l1Il1l11IlI.ImageTransparency = 1 l1Il1l11IlI.ScaleType = Enum.ScaleType.Fit Neverlose:SetIconMode(l1Il1l11IlI, II1lll1Il1I.Icon or "check") local Ill1Il1l1l1 = {
            Root = l1111lllll1
        }
        Neverlose:AttachLockMethods(Ill1Il1l1l1, self.Root or l1111lllll1, II1lll1Il1I)
        Ill1Il1l1l1.SetUI = ( function (l1111lIl111)
            if I11lII1II1l then
                if l1111lIl111 then
                    Neverlose.PlayAnimate(l1111lllll1, TweenInfo0175, {
                        BackgroundTransparency = 0, BackgroundColor3 = Neverlose.AccentColor
                    })Neverlose.PlayAnimate(I1l1l1IlIII, TweenInfo0175, {
                        Transparency = 1
                    })Neverlose.PlayAnimate(l1Il1l11IlI, TweenInfo0175, {
                        TextTransparency = 0
                    })
                else
                    Neverlose.PlayAnimate(l1111lllll1, TweenInfo0175, {
                        BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(10, 13, 21)
                    })Neverlose.PlayAnimate(I1l1l1IlIII, TweenInfo0175, {
                        Transparency = 0.650
                    })Neverlose.PlayAnimate(l1Il1l11IlI, TweenInfo0175, {
                        TextTransparency = 1
                    })
                end
            elseif l1111lIl111 then
                Neverlose.PlayAnimate(l1111lllll1, TweenInfo0175, {
                    BackgroundTransparency = 0, BackgroundColor3 = Neverlose.AccentColor
                })Neverlose.PlayAnimate(lII1lIIIl1l, TweenInfo0175, {
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0, Position = UDim2.new(0.7, 0, 0.5, 0)
                })
            else
                Neverlose.PlayAnimate(l1111lllll1, TweenInfo0175, {
                    BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(10, 13, 21)
                })Neverlose.PlayAnimate(lII1lIIIl1l, TweenInfo0175, {
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.500, Position = UDim2.new(0.300000012, 0, 0.5, 0)
                })
            end
        end
        )
        Ill1Il1l1l1.SetVisible = ( function (llI1III11Il)
            if llI1III11Il then
                Ill1Il1l1l1.SetUI(II1lll1Il1I.Default)
            else
                Neverlose.PlayAnimate(l1111lllll1, TweenInfo0175, {
                    BackgroundTransparency = 1, BackgroundColor3 = Color3.fromRGB(10, 13, 21)
                })Neverlose.PlayAnimate(lII1lIIIl1l, TweenInfo0175, {
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, Position = UDim2.new(0.300000012, 0, 0.5, 0)
                })Neverlose.PlayAnimate(I1l1l1IlIII, TweenInfo0175, {
                    Transparency = 1
                })Neverlose.PlayAnimate(l1Il1l11IlI, TweenInfo0175, {
                    TextTransparency = 1
                })
            end
        end
        )
        Ill1Il1l1l1.SetUI(II1lll1Il1I.Default)
        Ill1Il1l1l1.SetVisible(l11lIll11I1:GetValue())
        Neverlose:CreateInput(l1111lllll1, ( function ()
            II1lll1Il1I.Default = not II1lll1Il1I.Default
            Ill1Il1l1l1.SetUI(II1lll1Il1I.Default)
            Neverlose:FireCallback(II1lll1Il1I.Callback, II1lll1Il1I.Name, II1lll1Il1I.Default)
        end
        ))Ill1Il1l1l1.Signal = l11lIll11I1:Connect(Ill1Il1l1l1.SetVisible)
        function Ill1Il1l1l1:GetValue()
            return II1lll1Il1I.Default
        end
        function Ill1Il1l1l1:SetValue(l111ll1I1lI)
            II1lll1Il1I.Default = l111ll1I1lI == true
            if l11lIll11I1:GetValue() then
                Ill1Il1l1l1.SetUI(II1lll1Il1I.Default)
            end
            Neverlose:FireCallback(II1lll1Il1I.Callback, II1lll1Il1I.Name, II1lll1Il1I.Default) return Ill1Il1l1l1
        end
        function Ill1Il1l1l1:Toggle()
            Ill1Il1l1l1:SetValue( not II1lll1Il1I.Default)
            return Ill1Il1l1l1
        end
        function Ill1Il1l1l1:On()
            Ill1Il1l1l1:SetValue( true )
            return Ill1Il1l1l1
        end
        function Ill1Il1l1l1:Off()
            Ill1Il1l1l1:SetValue( false )
            return Ill1Il1l1l1
        end
        function Ill1Il1l1l1:SetCallback(Il1lIIIIIl1)
            II1lll1Il1I.Callback = Il1lIIIIIl1 or lIIlIlII11I
            return Ill1Il1l1l1
        end
        function Ill1Il1l1l1:SetIcon(IIl111llIlI)
            II1lll1Il1I.Icon = IIl111llIlI or II1lll1Il1I.Icon
            if I11lII1II1l then
                Neverlose:SetIconMode(l1Il1l11IlI, II1lll1Il1I.Icon)
            end
            return Ill1Il1l1l1
        end
        function Ill1Il1l1l1:SetEnabled(l1II11ll1lI)
            l1111lllll1.Visible = l1II11ll1lI ~= false
            return Ill1Il1l1l1
        end
        if II1lll1Il1I.Flag then
            Neverlose:RegisterFlag(II1lll1Il1I.Flag, Ill1Il1l1l1)
        end
        return wrapCaseInsensitive(Ill1Il1l1l1)
    end
    function IlIIIll11l1:AddSlider(IlI1l1I1llI)
        IlI1l1I1llI = Neverlose:ProcessParams(IlI1l1I1llI, {
            Name = nil , Default = 50, Min = 0, Max = 10, Type = "", Rounding = 0, Nums ={}, Flag = nil , Key = nil , ConfigKey = nil , Locked = false , TextLocked = "Locked", Size = 125, Tooltip = false , Callback = lIIlIlII11I,
        })
        Neverlose:ResolveConfigFlag(IlI1l1I1llI)
        local ll1l1lIII1I ={}
        ll1l1lIII1I.GetSize = ( function ()
            return (IlI1l1I1llI.Default - IlI1l1I1llI.Min) / (IlI1l1I1llI.Max - IlI1l1I1llI.Min)
        end
        )
        local I1Ill1III1I = TextService:GetTextSize(string.rep("0", (IlI1l1I1llI.Rounding + #tostring(IlI1l1I1llI.Max)) + 1) .. tostring(IlI1l1I1llI.Type), 10, Enum.Font.GothamMedium, Vector2.new(math.huge, math.huge))
        ll1l1lIII1I.MaximumSize = I1Ill1III1I.X
        if IlI1l1I1llI.Nums then
            local I11llI1lll1 = 0
            for I1l1III1Il1, lI1111IIlll in next, IlI1l1I1llI.Nums do
                local I1IIlII1Ill = TextService:GetTextSize(string.rep("m", string.len(tostring(lI1111IIlll))), 10, Enum.Font.GothamMedium, Vector2.new(math.huge, math.huge))
                if I11llI1lll1 < I1IIlII1Ill.X then
                    I11llI1lll1 = I1IIlII1Ill.X
                end
            end
            if ll1l1lIII1I.MaximumSize < I11llI1lll1 then
                ll1l1lIII1I.MaximumSize = I11llI1lll1
            end
        end
        local l1II1lII1l1 = Instance.new("Frame") local II11lII1II1 = Instance.new("UICorner") local ll11IIlIIl1 = Instance.new("Frame") local ll1l1ll1IlI = Instance.new("UICorner") local II1l1l1I1Il = Instance.new("UIStroke") local IlIl111Illl = Instance.new("TextBox") local lll1lIIIIII = Instance.new("Frame") local l1I111Ill11 = Instance.new("Frame") local I11l1IlllIl = Instance.new("UICorner") local IIlII1IIl1I = Instance.new("Frame") local l1lIlIIIlII = Instance.new("UICorner") local lIII11I111l = Instance.new("Frame") local I11I11I1lIl = Instance.new("UICorner") local l111lIl1IIl = 2
        local lI11lI11l1l = 5
        local I111l1I11II = IlI1l1I1llI.Tooltip == true
        local I1lIII1IIII
        local I1llIl1I111
        local II1IIII1l11
        local ll1l111lIIl
        l1II1lII1l1.Name = Neverlose.RandomString()
        l1II1lII1l1.Parent = l1Ill1l1lll l1II1lII1l1.BackgroundColor3 = Color3.fromRGB(26, 28, 36)l1II1lII1l1.BackgroundTransparency = 1.000 l1II1lII1l1.BorderColor3 = Color3.fromRGB(0, 0, 0)l1II1lII1l1.BorderSizePixel = 0 l1II1lII1l1.ClipsDescendants = false l1II1lII1l1.Size = UDim2.new(0, IlI1l1I1llI.Size, 0, 18)l1II1lII1l1.ZIndex = lI1IIIlI1ll + 13 l1II1lII1l1.LayoutOrder = - (#l1Ill1l1lll:GetChildren() + 5)
        Neverlose:AttachLockMethods(ll1l1lIII1I, self.Root or l1II1lII1l1, IlI1l1I1llI)
        II11lII1II1.CornerRadius = UDim.new(0, 4)II11lII1II1.Parent = l1II1lII1l1 ll11IIlIIl1.Name = Neverlose.RandomString()
        ll11IIlIIl1.Parent = l1II1lII1l1 ll11IIlIIl1.AnchorPoint = Vector2.new(1, 0)ll11IIlIIl1.BackgroundColor3 = Color3.fromRGB(26, 28, 36)ll11IIlIIl1.BorderColor3 = Color3.fromRGB(0, 0, 0)ll11IIlIIl1.BorderSizePixel = 0 ll11IIlIIl1.ClipsDescendants = true ll11IIlIIl1.Position = UDim2.new(1, 0, 0, 0)ll11IIlIIl1.Size = UDim2.new(0, ll1l1lIII1I.MaximumSize + l111lIl1IIl, 0, 18)ll11IIlIIl1.ZIndex = lI1IIIlI1ll + 13 ll1l1ll1IlI.CornerRadius = UDim.new(0, 4)ll1l1ll1IlI.Parent = ll11IIlIIl1 II1l1l1I1Il.Transparency = 0.650 II1l1l1I1Il.Color = Color3.fromRGB(45, 48, 58)II1l1l1I1Il.Parent = ll11IIlIIl1 IlIl111Illl.Name = Neverlose.RandomString()
        IlIl111Illl.Parent = ll11IIlIIl1 IlIl111Illl.AnchorPoint = Vector2.new(0.5, 0.5)IlIl111Illl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)IlIl111Illl.BackgroundTransparency = 1.000 IlIl111Illl.BorderColor3 = Color3.fromRGB(0, 0, 0)IlIl111Illl.BorderSizePixel = 0 IlIl111Illl.Position = UDim2.new(0.5, 0, 0.5, 0)IlIl111Illl.Size = UDim2.new(1, 0, 1, 0)IlIl111Illl.ZIndex = lI1IIIlI1ll + 14 IlIl111Illl.Font = Enum.Font.GothamMedium IlIl111Illl.Text = tostring(IlI1l1I1llI.Default) .. tostring(IlI1l1I1llI.Type)
        IlIl111Illl.TextColor3 = Color3.fromRGB(255, 255, 255)IlIl111Illl.TextSize = 10.000 IlIl111Illl.ClearTextOnFocus = false
        IlIl111Illl.TextTransparency = 0.350 lll1lIIIIII.Name = Neverlose.RandomString()
        lll1lIIIIII.Parent = l1II1lII1l1 lll1lIIIIII.AnchorPoint = Vector2.new(0, 0.5)lll1lIIIIII.BackgroundColor3 = Color3.fromRGB(255, 255, 255)lll1lIIIIII.BackgroundTransparency = 1.000 lll1lIIIIII.BorderColor3 = Color3.fromRGB(0, 0, 0)lll1lIIIIII.BorderSizePixel = 0 lll1lIIIIII.Position = UDim2.new(0, 0, 0.5, 0)lll1lIIIIII.Size = UDim2.new(1, - ((ll1l1lIII1I.MaximumSize + l111lIl1IIl + lI11lI11l1l)), 0, 18)lll1lIIIIII.ZIndex = lI1IIIlI1ll + 13 l1I111Ill11.Name = Neverlose.RandomString()
        l1I111Ill11.Parent = lll1lIIIIII l1I111Ill11.AnchorPoint = Vector2.new(0, 0.5)l1I111Ill11.BackgroundColor3 = Color3.fromRGB(30, 29, 36)l1I111Ill11.BorderColor3 = Color3.fromRGB(0, 0, 0)l1I111Ill11.BorderSizePixel = 0 l1I111Ill11.Position = UDim2.new(0, 0, 0.5, 0)l1I111Ill11.Size = UDim2.new(1, 0, 0, 5)l1I111Ill11.ZIndex = lI1IIIlI1ll + 13 I11l1IlllIl.CornerRadius = UDim.new(1, 0)I11l1IlllIl.Parent = l1I111Ill11 IIlII1IIl1I.Name = Neverlose.RandomString()
        IIlII1IIl1I.Parent = l1I111Ill11 IIlII1IIl1I.BackgroundColor3 = Neverlose.AccentColor IIlII1IIl1I.BorderColor3 = Color3.fromRGB(0, 0, 0)IIlII1IIl1I.BorderSizePixel = 0 IIlII1IIl1I.Size = UDim2.new(ll1l1lIII1I.GetSize(), 0, 1, 0)IIlII1IIl1I.ZIndex = lI1IIIlI1ll + 14 l1lIlIIIlII.CornerRadius = UDim.new(1, 0)l1lIlIIIlII.Parent = IIlII1IIl1I lIII11I111l.Parent = IIlII1IIl1I lIII11I111l.AnchorPoint = Vector2.new(1, 0.5)lIII11I111l.BackgroundColor3 = Color3.fromRGB(255, 255, 255)lIII11I111l.BorderColor3 = Color3.fromRGB(0, 0, 0)lIII11I111l.BorderSizePixel = 0 lIII11I111l.Position = UDim2.new(1, 5, 0.5, 0)lIII11I111l.Size = UDim2.new(0, 10, 0, 10)lIII11I111l.ZIndex = lI1IIIlI1ll + 15 I11I11I1lIl.CornerRadius = UDim.new(1, 0)I11I11I1lIl.Parent = lIII11I111l local function l1IIllI1I1l()
            if I1lIII1IIII then
                return
            end
            I1lIII1IIII = Instance.new("Frame")
            I1lIII1IIII.Name = Neverlose.RandomString()
            I1lIII1IIII.Parent = Neverlose.ScreenGui
            I1lIII1IIII.AnchorPoint = Vector2.new(0.5, 1)
            I1lIII1IIII.BackgroundColor3 = Color3.fromRGB(20, 22, 27)
            I1lIII1IIII.BackgroundTransparency = 1
            I1lIII1IIII.BorderSizePixel = 0
            I1lIII1IIII.ClipsDescendants = true
            I1lIII1IIII.Position = UDim2.fromOffset(0, 0)
            I1lIII1IIII.Size = UDim2.fromOffset(40, 22)
            I1lIII1IIII.Visible = false
            I1lIII1IIII.ZIndex = lI1IIIlI1ll + 200
            I1llIl1I111 = Instance.new("UICorner")
            I1llIl1I111.CornerRadius = UDim.new(0, 5)
            I1llIl1I111.Parent = I1lIII1IIII
            II1IIII1l11 = Instance.new("UIStroke")
            II1IIII1l11.Color = Color3.fromRGB(45, 48, 58)
            II1IIII1l11.Transparency = 1
            II1IIII1l11.Parent = I1lIII1IIII
            ll1l111lIIl = Instance.new("TextLabel")
            ll1l111lIIl.Name = Neverlose.RandomString()
            ll1l111lIIl.Parent = I1lIII1IIII
            ll1l111lIIl.BackgroundTransparency = 1
            ll1l111lIIl.BorderSizePixel = 0
            ll1l111lIIl.Position = UDim2.fromOffset(6, 0)
            ll1l111lIIl.Size = UDim2.new(1, - 12, 1, 0)
            ll1l111lIIl.ZIndex = I1lIII1IIII.ZIndex + 1
            ll1l111lIIl.Font = Enum.Font.GothamMedium
            ll1l111lIIl.TextColor3 = Color3.fromRGB(255, 255, 255)
            ll1l111lIIl.TextSize = 11
            ll1l111lIIl.TextTransparency = 1
            ll1l111lIIl.TextXAlignment = Enum.TextXAlignment.Center
        end
        local function lI1l1l1IlII()
            if not I1lIII1IIII or not ll1l111lIIl then
                return
            end
            ll1l111lIIl.Text = IlIl111Illl.Text
            local I11lI1l111l = TextService:GetTextSize(ll1l111lIIl.Text, ll1l111lIIl.TextSize, ll1l111lIIl.Font, Vector2.new(math.huge, math.huge))
            I1lIII1IIII.Size = UDim2.fromOffset(math.max(34, I11lI1l111l.X + 14), 22)
            I1lIII1IIII.Position = UDim2.fromOffset(lIII11I111l.AbsolutePosition.X + (lIII11I111l.AbsoluteSize.X / 2), lIII11I111l.AbsolutePosition.Y - 2)
        end
        local function llIlIlIII11(ll1l1Il1111)
            if not I111l1I11II or not ll1l1Il1111 then
                if I1lIII1IIII then
                    Neverlose.PlayAnimate(I1lIII1IIII, TweenInfo0175, {
                        BackgroundTransparency = 1,
                    })
                    Neverlose.PlayAnimate(II1IIII1l11, TweenInfo0175, {
                        Transparency = 1,
                    })
                    Neverlose.PlayAnimate(ll1l111lIIl, TweenInfo0175, {
                        TextTransparency = 1,
                    })
                    task.delay(0.18, function ()
                        if I1lIII1IIII and I1lIII1IIII.BackgroundTransparency > 0.95 then
                            I1lIII1IIII.Visible = false
                        end
                    end
                    )
                end
                return
            end
            l1IIllI1I1l()
            lI1l1l1IlII()
            I1lIII1IIII.Visible = true
            Neverlose.PlayAnimate(I1lIII1IIII, TweenInfo0175, {
                BackgroundTransparency = 0.075,
            })
            Neverlose.PlayAnimate(II1IIII1l11, TweenInfo0175, {
                Transparency = 0.650,
            })
            Neverlose.PlayAnimate(ll1l111lIIl, TweenInfo0175, {
                TextTransparency = 0.200,
            })
        end
        local lIlI1l111l1 = ( function ()
            if IlI1l1I1llI.Nums[IlI1l1I1llI.Default] then
                IlIl111Illl.Text = IlI1l1I1llI.Nums[IlI1l1I1llI.Default]
            else
                IlIl111Illl.Text = tostring(IlI1l1I1llI.Default) .. tostring(IlI1l1I1llI.Type)
            end
            lI1l1l1IlII()
        end
        )
        IlIl111Illl.FocusLost:Connect(( function ()
            local ll1l1II1lIl = Neverlose:ParseInput(IlIl111Illl.Text, true )
            if ll1l1II1lIl then
                local lI111lIlI1l = math.clamp(ll1l1II1lIl, IlI1l1I1llI.Min, IlI1l1I1llI.Max)
                local IlII11IIIIl = Neverlose.Rounding(lI111lIlI1l, IlI1l1I1llI.Rounding)
                if IlII11IIIIl then
                    IlI1l1I1llI.Default = IlII11IIIIl
                    TweenService:Create(IIlII1IIl1I, TweenInfo01, {
                        Size = UDim2.new(ll1l1lIII1I.GetSize(), 0, 1, 0)
                    }):Play()
                    lIlI1l111l1()
                    Neverlose:FireCallback(IlI1l1I1llI.Callback, IlI1l1I1llI.Name, IlI1l1I1llI.Default)
                else
                    lIlI1l111l1()
                end
            else
                lIlI1l111l1()
            end
        end
        ))
        ll1l1lIII1I.SetRender = ( function (I1IlllI1l11)
            if I1IlllI1l11 then
                Neverlose.PlayAnimate(ll11IIlIIl1, TweenInfo0175, {
                    BackgroundTransparency = 0, Size = UDim2.new(0, ll1l1lIII1I.MaximumSize + l111lIl1IIl, 0, 18)
                })
                Neverlose.PlayAnimate(II1l1l1I1Il, TweenInfo0175, {
                    Transparency = 0.650
                })
                Neverlose.PlayAnimate(IlIl111Illl, TweenInfo0175, {
                    TextTransparency = 0.350
                })
                Neverlose.PlayAnimate(l1I111Ill11, TweenInfo0175, {
                    BackgroundTransparency = 0
                })
                Neverlose.PlayAnimate(IIlII1IIl1I, TweenInfo0175, {
                    BackgroundTransparency = 0, Size = UDim2.new(ll1l1lIII1I.GetSize(), 0, 1, 0)
                })
                Neverlose.PlayAnimate(lIII11I111l, TweenInfo0175, {
                    BackgroundTransparency = 0
                })
            else
                llIlIlIII11( false )
                Neverlose.PlayAnimate(ll11IIlIIl1, TweenInfo0175, {
                    BackgroundTransparency = 1,
                })
                Neverlose.PlayAnimate(II1l1l1I1Il, TweenInfo0175, {
                    Transparency = 1
                })
                Neverlose.PlayAnimate(IlIl111Illl, TweenInfo0175, {
                    TextTransparency = 1
                })
                Neverlose.PlayAnimate(l1I111Ill11, TweenInfo0175, {
                    BackgroundTransparency = 1
                })
                Neverlose.PlayAnimate(IIlII1IIl1I, TweenInfo0175, {
                    BackgroundTransparency = 1, Size = UDim2.new(0, 0, 1, 0)
                })
                Neverlose.PlayAnimate(lIII11I111l, TweenInfo0175, {
                    BackgroundTransparency = 1
                })
            end
        end
        )
        ll1l1lIII1I.SetRender(l11lIll11I1:GetValue())
        ll1l1lIII1I.Signal = l11lIll11I1:Connect(ll1l1lIII1I.SetRender)
        local IllllIll11l = function (llll1l1lIlI)
            local l1lll11llI1 = math.clamp((((llll1l1lIlI.Position.X) - lll1lIIIIII.AbsolutePosition.X) / lll1lIIIIII.AbsoluteSize.X), 0, 1)
            local Il1I1lIIlII = ((IlI1l1I1llI.Max - IlI1l1I1llI.Min) * l1lll11llI1) + IlI1l1I1llI.Min
            local I1llIl111l1 = Neverlose.Rounding(Il1I1lIIlII, IlI1l1I1llI.Rounding)
            local IlI1IllIlIl = UDim2.fromScale(l1lll11llI1, 1)
            local I1llllIIlI1 = ((I1llIl111l1 - IlI1l1I1llI.Min) / (IlI1l1I1llI.Max - IlI1l1I1llI.Min)) + 0.02
            IlI1l1I1llI.Default = I1llIl111l1
            TweenService:Create(IIlII1IIl1I, TweenInfo01, {
                Size = UDim2.new(ll1l1lIII1I.GetSize(), 0, 1, 0)
            }):Play()
            lIlI1l111l1()Neverlose:FireCallback(IlI1l1I1llI.Callback, IlI1l1I1llI.Name, I1llIl111l1)
        end
        local Il1l1lIIll1 = false
        do
            Neverlose:AddSignal(lll1lIIIIII.MouseEnter:Connect(( function ()
                llIlIlIII11( true )
            end
            )))
            Neverlose:AddSignal(lll1lIIIIII.MouseLeave:Connect(( function ()
                if not Il1l1lIIll1 then
                    llIlIlIII11( false )
                end
            end
            )))
            lll1lIIIIII.InputBegan:Connect(( function (l1I11I1IIIl)
                if l1I11I1IIIl.UserInputType == Enum.UserInputType.MouseButton1 or l1I11I1IIIl.UserInputType == Enum.UserInputType.Touch then
                    Il1l1lIIll1 = true IllllIll11l(l1I11I1IIIl)llIlIlIII11( true )
                end
            end
            ))lll1lIIIIII.InputEnded:Connect(( function (I1IIl111I1I)
                if I1IIl111I1I.UserInputType == Enum.UserInputType.MouseButton1 or I1IIl111I1I.UserInputType == Enum.UserInputType.Touch then
                    if UserInputService.TouchEnabled then
                        if not Neverlose:IsMouseOverFrame(lll1lIIIIII) then
                            Il1l1lIIll1 = false
                        end
                    else
                        Il1l1lIIll1 = false
                    end
                    if not Il1l1lIIll1 and not Neverlose:IsMouseOverFrame(lll1lIIIIII) then
                        llIlIlIII11( false )
                    end
                end
            end
            ))UserInputService.InputChanged:Connect(( function (lI11IlIIl1l)
                if Il1l1lIIll1 then
                    if (lI11IlIIl1l.UserInputType == Enum.UserInputType.MouseMovement or lI11IlIIl1l.UserInputType == Enum.UserInputType.Touch) then
                        if UserInputService.TouchEnabled then
                            if not Neverlose:IsMouseOverFrame(lll1lIIIIII) then
                                Il1l1lIIll1 = false
                            else
                                IllllIll11l(lI11IlIIl1l)lI1l1l1IlII()
                            end
                        else
                            IllllIll11l(lI11IlIIl1l)lI1l1l1IlII()
                        end
                    end
                end
            end
            ))
        end
        function ll1l1lIII1I:GetValue()
            return IlI1l1I1llI.Default
        end
        function ll1l1lIII1I:SetValue(IlIIIl1I111)
            local l11IIl1l1II = tonumber(IlIIIl1I111)
            if not l11IIl1l1II then
                return ll1l1lIII1I
            end
            IlI1l1I1llI.Default = Neverlose.Rounding(math.clamp(l11IIl1l1II, IlI1l1I1llI.Min, IlI1l1I1llI.Max), IlI1l1I1llI.Rounding)
            if l11lIll11I1:GetValue() then
                Neverlose.PlayAnimate(IIlII1IIl1I, TweenInfo0175, {
                    BackgroundTransparency = 0, Size = UDim2.new(ll1l1lIII1I.GetSize(), 0, 1, 0)
                })
            end
            lIlI1l111l1()Neverlose:FireCallback(IlI1l1I1llI.Callback, IlI1l1I1llI.Name, IlI1l1I1llI.Default)
            return ll1l1lIII1I
        end
        function ll1l1lIII1I:SetRange(IIIIlI1l111, IllIll1ll1l)
            IlI1l1I1llI.Min = tonumber(IIIIlI1l111) or IlI1l1I1llI.Min
            IlI1l1I1llI.Max = tonumber(IllIll1ll1l) or IlI1l1I1llI.Max
            if IlI1l1I1llI.Min > IlI1l1I1llI.Max then
                IlI1l1I1llI.Min, IlI1l1I1llI.Max = IlI1l1I1llI.Max, IlI1l1I1llI.Min
            end
            ll1l1lIII1I:SetValue(IlI1l1I1llI.Default)
            return ll1l1lIII1I
        end
        function ll1l1lIII1I:SetMin(lII1111lIlI)
            return ll1l1lIII1I:SetRange(lII1111lIlI, IlI1l1I1llI.Max)
        end
        function ll1l1lIII1I:SetMax(IlllIIlI1ll)
            return ll1l1lIII1I:SetRange(IlI1l1I1llI.Min, IlllIIlI1ll)
        end
        function ll1l1lIII1I:SetCallback(Il1II111lIl)
            IlI1l1I1llI.Callback = Il1II111lIl or lIIlIlII11I
            return ll1l1lIII1I
        end
        function ll1l1lIII1I:SetSuffix(lIlIIllI11l)
            IlI1l1I1llI.Type = tostring(lIlIIllI11l or "")
            lIlI1l111l1()
            return ll1l1lIII1I
        end
        function ll1l1lIII1I:SetTooltip(ll11lI1III1)
            I111l1I11II = ll11lI1III1 == true
            IlI1l1I1llI.Tooltip = I111l1I11II
            if not I111l1I11II then
                llIlIlIII11( false )
            end
            return ll1l1lIII1I
        end
        function ll1l1lIII1I:SetEnabled(II11III111l)
            l1II1lII1l1.Visible = II11III111l ~= false
            return ll1l1lIII1I
        end
        if IlI1l1I1llI.Flag then
            Neverlose:RegisterFlag(IlI1l1I1llI.Flag, ll1l1lIII1I)
        end
        return wrapCaseInsensitive(ll1l1lIII1I)
    end
    function IlIIIll11l1:AddOption(lIllllIll11)
        local Ill1IIIlII1 = Instance.new("Frame") local lIIl11IlIll = Instance.new("ImageLabel") local IIllIl1IIl1 = Instance.new("UICorner")Ill1IIIlII1.Name = Neverlose.RandomString()
        Ill1IIIlII1.Parent = l1Ill1l1lll Ill1IIIlII1.BackgroundColor3 = Color3.fromRGB(39, 40, 49)Ill1IIIlII1.BackgroundTransparency = 1.000 Ill1IIIlII1.BorderColor3 = Color3.fromRGB(0, 0, 0)Ill1IIIlII1.BorderSizePixel = 0 Ill1IIIlII1.ClipsDescendants = true Ill1IIIlII1.Size = UDim2.new(0, 20, 0, 18)Ill1IIIlII1.ZIndex = lI1IIIlI1ll + 13 Ill1IIIlII1.LayoutOrder = - (#l1Ill1l1lll:GetChildren() + 5)
        lIIl11IlIll.Name = Neverlose.RandomString()
        lIIl11IlIll.Parent = Ill1IIIlII1 lIIl11IlIll.AnchorPoint = Vector2.new(0.5, 0.5)lIIl11IlIll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)lIIl11IlIll.BackgroundTransparency = 1.000 lIIl11IlIll.BorderColor3 = Color3.fromRGB(0, 0, 0)lIIl11IlIll.BorderSizePixel = 0 lIIl11IlIll.Position = UDim2.new(0.5, 0, 0.5, 0)lIIl11IlIll.Size = UDim2.new(1, 0, 1, 0)lIIl11IlIll.ZIndex = lI1IIIlI1ll + 14 IIlllIIl1II:SetIconMode(lIIl11IlIll, (lIllllIll11 == 1 and "gear") or (lIllllIll11 == 2 and "chevron-large-right") or "three-dots-horizontal")
        lIIl11IlIll.ImageColor3 = Color3.fromRGB(223, 223, 223)lIIl11IlIll.ImageTransparency = 0.400 lIIl11IlIll.ScaleType = Enum.ScaleType.Fit IIllIl1IIl1.CornerRadius = UDim.new(0, 4)IIllIl1IIl1.Parent = Ill1IIIlII1 local l1IIllll1I1 = Neverlose:CreateOptionWindow(Ill1IIIlII1, lI1IIIlI1ll + 13)
        local II1Il111lll
        l1IIllll1I1.SetRender = ( function (lII1IIlIllI)
            if lII1IIlIllI then
                Neverlose.PlayAnimate(lIIl11IlIll, TweenInfo0175, {
                    TextTransparency = 0.400
                })
            else
                Neverlose.PlayAnimate(lIIl11IlIll, TweenInfo0175, {
                    TextTransparency = 1
                })
            end
        end
        )
        l1IIllll1I1.SetRender(l11lIll11I1:GetValue())
        l11lIll11I1:Connect(l1IIllll1I1.SetRender)
        local I11111lIl1l = Neverlose:CreateInput(Ill1IIIlII1, ( function ()
            if II1Il111lll then
                II1Il111lll:Disconnect()
                II1Il111lll = nil
            end
            l1IIllll1I1.Signal:SetValue( true )
            II1Il111lll = UserInputService.InputBegan:Connect( function (l1l11l11l11)
                if l1l11l11l11.UserInputType == Enum.UserInputType.MouseButton1 or l1l11l11l11.UserInputType == Enum.UserInputType.Touch then
                    if not Neverlose:IsMouseOverFrame(l1IIllll1I1.Root) and not Neverlose:IsMouseOverFrame(Ill1IIIlII1) then
                        if II1Il111lll then
                            II1Il111lll:Disconnect()
                            II1Il111lll = nil
                        end
                        l1IIllll1I1.Signal:SetValue( false )
                    end
                end
            end
            )
        end
        ))
        Neverlose:AddSignal(I11111lIl1l.MouseEnter:Connect(( function ()
            Neverlose.PlayAnimate(Ill1IIIlII1, TweenInfo0175, {
                BackgroundTransparency = 0.5
            })Neverlose.PlayAnimate(lIIl11IlIll, TweenInfo0175, {
                TextTransparency = 0.25
            })
        end
        )))
        Neverlose:AddSignal(I11111lIl1l.MouseLeave:Connect(( function ()
            Neverlose.PlayAnimate(Ill1IIIlII1, TweenInfo0175, {
                BackgroundTransparency = 1.000
            })Neverlose.PlayAnimate(lIIl11IlIll, TweenInfo0175, {
                TextTransparency = 0.400
            })
        end
        )))
        return wrapCaseInsensitive(l1IIllll1I1)
    end
    function IlIIIll11l1:AddColorPicker(l11II11I11I)
        l11II11I11I = Neverlose:ProcessParams(l11II11I11I, {
            Name = nil , Default = Color3.fromRGB(255, 255, 255), Flag = nil , Key = nil , ConfigKey = nil , Locked = false , TextLocked = "Locked", Callback = lIIlIlII11I,
        })
        Neverlose:ResolveConfigFlag(l11II11I11I)
        if typeof(l11II11I11I.Default) == "string" then
            l11II11I11I.Default = Color3.fromHex(l11II11I11I.Default:gsub("#", ""))
        end
        local I1IIl11l1ll ={}
        local l1I11IlIll1 = Instance.new("Frame") local lIII1l11II1 = Instance.new("UICorner") local lI1II1I1l1l = Instance.new("UIStroke") local ll1llI11lI1 = Instance.new("ImageLabel") local II1IlI1I11l = Instance.new("UICorner")l1I11IlIll1.Name = Neverlose.RandomString()
        l1I11IlIll1.Parent = l1Ill1l1lll l1I11IlIll1.BackgroundColor3 = l11II11I11I.Default
        l1I11IlIll1.BackgroundTransparency = 0 l1I11IlIll1.BorderColor3 = Color3.fromRGB(0, 0, 0)l1I11IlIll1.BorderSizePixel = 0 l1I11IlIll1.ClipsDescendants = true l1I11IlIll1.Size = UDim2.new(0, 18, 0, 18)l1I11IlIll1.ZIndex = lI1IIIlI1ll + 13 IIlllIIl1II:AttachLockMethods(I1IIl11l1ll, self.Root or l1I11IlIll1, l11II11I11I)
        lIII1l11II1.CornerRadius = UDim.new(0, 4)lIII1l11II1.Parent = l1I11IlIll1 lI1II1I1l1l.Transparency = 0.650 lI1II1I1l1l.Color = Color3.fromRGB(45, 48, 58)lI1II1I1l1l.Parent = l1I11IlIll1 ll1llI11lI1.Parent = l1I11IlIll1 ll1llI11lI1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)ll1llI11lI1.BorderColor3 = Color3.fromRGB(0, 0, 0)ll1llI11lI1.BorderSizePixel = 0 ll1llI11lI1.Size = UDim2.new(1, 0, 1, 0)ll1llI11lI1.ZIndex = lI1IIIlI1ll + 11 ll1llI11lI1.Image = "rbxasset://textures/meshPartFallback.png"ll1llI11lI1.ImageTransparency = 0.9 ll1llI11lI1.BackgroundTransparency = 1
        ll1llI11lI1.ScaleType = Enum.ScaleType.Crop II1IlI1I11l.CornerRadius = UDim.new(0, 4)II1IlI1I11l.Parent = ll1llI11lI1 local IlI11I1l1ll = Neverlose:CreateColorPicker(l1I11IlIll1)
        IlI11I1l1ll:SetValue(l11II11I11I.Default)IlI11I1l1ll.Callback = function (l1IlIll1III)
            l1I11IlIll1.BackgroundColor3 = l1IlIll1III
            l11II11I11I.Default = l1IlIll1III
            Neverlose:FireCallback(l11II11I11I.Callback, l11II11I11I.Name, l11II11I11I.Default)
        end
        local Il11I1111Il
        Neverlose:CreateInput(l1I11IlIll1, ( function ()
            if Il11I1111Il then
                Il11I1111Il:Disconnect()
                Il11I1111Il = nil
            end
            IlI11I1l1ll.SetRender( true )
            Il11I1111Il = UserInputService.InputBegan:Connect( function (ll1l1Ill1Il)
                if ll1l1Ill1Il.UserInputType == Enum.UserInputType.MouseButton1 or ll1l1Ill1Il.UserInputType == Enum.UserInputType.Touch then
                    if not Neverlose:IsMouseOverFrame(l1I11IlIll1) and not Neverlose:IsMouseOverFrame(IlI11I1l1ll.Root) then
                        if Il11I1111Il then
                            Il11I1111Il:Disconnect()
                            Il11I1111Il = nil
                        end
                        IlI11I1l1ll.SetRender( false )
                    end
                end
            end
            )
        end
        ))
        I1IIl11l1ll.SetRender = ( function (I1ll1II1lIl)
            if I1ll1II1lIl then
                Neverlose.PlayAnimate(l1I11IlIll1, TweenInfo0175, {
                    BackgroundTransparency = 0
                })Neverlose.PlayAnimate(lI1II1I1l1l, TweenInfo0175, {
                    Transparency = 0.650
                })Neverlose.PlayAnimate(ll1llI11lI1, TweenInfo0175, {
                    ImageTransparency = 0.9
                })
            else
                Neverlose.PlayAnimate(l1I11IlIll1, TweenInfo0175, {
                    BackgroundTransparency = 1
                })Neverlose.PlayAnimate(lI1II1I1l1l, TweenInfo0175, {
                    Transparency = 1
                })Neverlose.PlayAnimate(ll1llI11lI1, TweenInfo0175, {
                    ImageTransparency = 1
                })
            end
        end
        )
        I1IIl11l1ll.SetRender(l11lIll11I1:GetValue())
        l11lIll11I1:Connect(I1IIl11l1ll.SetRender)
        function I1IIl11l1ll:GetValue()
            return l11II11I11I.Default
        end
        function I1IIl11l1ll:SetValue(l111IlII1Il)
            l11II11I11I.Default = l111IlII1Il
            IlI11I1l1ll:SetValue(l11II11I11I.Default) return I1IIl11l1ll
        end
        function I1IIl11l1ll:GetHex()
            return l11II11I11I.Default:ToHex()
        end
        function I1IIl11l1ll:SetHex(l11llllIllI)
            I1IIl11l1ll:SetValue(Color3.fromHex(tostring(l11llllIllI):gsub("#", "")))
            return I1IIl11l1ll
        end
        function I1IIl11l1ll:SetCallback(l11lI11IIIl)
            l11II11I11I.Callback = l11lI11IIIl or lIIlIlII11I
            IlI11I1l1ll.Callback = function (lll11ll1lI1)
                l1I11IlIll1.BackgroundColor3 = lll11ll1lI1
                l11II11I11I.Default = lll11ll1lI1
                Neverlose:FireCallback(l11II11I11I.Callback, l11II11I11I.Name, l11II11I11I.Default)
            end
            return I1IIl11l1ll
        end
        function I1IIl11l1ll:SetEnabled(Il1111l1I1l)
            l1I11IlIll1.Visible = Il1111l1I1l ~= false
            return I1IIl11l1ll
        end
        if l11II11I11I.Flag then
            Neverlose:RegisterFlag(l11II11I11I.Flag, I1IIl11l1ll)
        end
        return wrapCaseInsensitive(I1IIl11l1ll)
    end
    function IlIIIll11l1:AddKeybind(l1IlII11II1)
        l1IlII11II1 = Neverlose:ProcessParams(l1IlII11II1, {
            Name = nil , Default = nil , Mode = "Toggle", ModeFlag = nil , ChangedCallback = nil , ModeChangedCallback = nil , Blacklist ={}, Callback = lIIlIlII11I, Flag = nil , Key = nil , ConfigKey = nil , Locked = false , TextLocked = "Locked",
        })
        Neverlose:ResolveConfigFlag(l1IlII11II1)
        l1IlII11II1.Default = Neverlose:NormalizeKeybindValue(l1IlII11II1.Default)
        l1IlII11II1.Mode = string.lower(tostring(l1IlII11II1.Mode or "Toggle")) == "hold" and "Hold" or "Toggle"
        l1IlII11II1.ChangedCallback = l1IlII11II1.ChangedCallback or l1IlII11II1.OnChanged or lIIlIlII11I
        l1IlII11II1.ModeChangedCallback = l1IlII11II1.ModeChangedCallback or l1IlII11II1.OnModeChanged or lIIlIlII11I
        local llI1l11Illl = l1IlII11II1.ModeFlag or l1IlII11II1.ModeKey or l1IlII11II1.ModeConfigKey
        if llI1l11Illl ~= nil then
            l1IlII11II1.ModeFlag = tostring(llI1l11Illl)
        end
        local ll1l1l111I1 ={}
        local llll1I11llI = false
        local I1l1lIIII1I = false
        local lI1llll1llI = Instance.new("Frame") local lllIlI1Il11 = Instance.new("UICorner") local Il1lll111Il = Instance.new("UIStroke") local I111l1I1Ill = Instance.new("TextLabel")lI1llll1llI.Name = Neverlose.RandomString()
        lI1llll1llI.Parent = l1Ill1l1lll lI1llll1llI.BackgroundColor3 = Color3.fromRGB(26, 28, 36)lI1llll1llI.BorderColor3 = Color3.fromRGB(0, 0, 0)lI1llll1llI.BorderSizePixel = 0 lI1llll1llI.ClipsDescendants = true lI1llll1llI.Size = UDim2.new(0, 45, 0, 18)lI1llll1llI.ZIndex = lI1IIIlI1ll + 13 IIlllIIl1II:AttachLockMethods(ll1l1l111I1, self.Root or lI1llll1llI, l1IlII11II1)
        lllIlI1Il11.CornerRadius = UDim.new(0, 4)lllIlI1Il11.Parent = lI1llll1llI Il1lll111Il.Transparency = 0.650 Il1lll111Il.Color = Color3.fromRGB(45, 48, 58)Il1lll111Il.Parent = lI1llll1llI I111l1I1Ill.Name = Neverlose.RandomString()
        I111l1I1Ill.Parent = lI1llll1llI I111l1I1Ill.AnchorPoint = Vector2.new(0.5, 0.5)I111l1I1Ill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)I111l1I1Ill.BackgroundTransparency = 1.000 I111l1I1Ill.BorderColor3 = Color3.fromRGB(0, 0, 0)I111l1I1Ill.BorderSizePixel = 0 I111l1I1Ill.ClipsDescendants = true I111l1I1Ill.Position = UDim2.new(0.5, 0, 0.5, 0)I111l1I1Ill.Size = UDim2.new(1, 0, 1, 0)I111l1I1Ill.ZIndex = lI1IIIlI1ll + 14 I111l1I1Ill.Font = Enum.Font.GothamMedium I111l1I1Ill.Text = Neverlose:KeyCodeToStr(l1IlII11II1.Default or "None")I111l1I1Ill.TextColor3 = Color3.fromRGB(255, 255, 255)I111l1I1Ill.TextSize = 10.000 I111l1I1Ill.TextTransparency = 0.500 ll1l1l111I1.SetRender = ( function (llI1lIl111l)
            if llI1lIl111l then
                Neverlose.PlayAnimate(lI1llll1llI, TweenInfo0175, {
                    BackgroundTransparency = 0
                })Neverlose.PlayAnimate(Il1lll111Il, TweenInfo0175, {
                    Transparency = 0.650
                })Neverlose.PlayAnimate(I111l1I1Ill, TweenInfo0175, {
                    TextTransparency = 0.500
                })
            else
                Neverlose.PlayAnimate(lI1llll1llI, TweenInfo0175, {
                    BackgroundTransparency = 1
                })Neverlose.PlayAnimate(Il1lll111Il, TweenInfo0175, {
                    Transparency = 1
                })Neverlose.PlayAnimate(I111l1I1Ill, TweenInfo0175, {
                    TextTransparency = 1
                })
            end
        end
        )
        function ll1l1l111I1:Update()
            local Il1l1l1lIlI = TextService:GetTextSize(I111l1I1Ill.Text, I111l1I1Ill.TextSize, I111l1I1Ill.Font, Vector2.new(math.huge, math.huge))
            Neverlose.PlayAnimate(lI1llll1llI, TweenInfo0175, {
                Size = UDim2.new(0, Il1l1l1lIlI.X + 7, 0, 18)
            })
        end
        local lll1IlllllI = ( function (llII11llIII)
            return l1IlII11II1.Blacklist and (l1IlII11II1.Blacklist[llII11llIII] or table.find(l1IlII11II1.Blacklist, llII11llIII))
        end
        )
        ll1l1l111I1:Update()ll1l1l111I1.SetRender(l11lIll11I1:GetValue())
        l11lIll11I1:Connect(ll1l1l111I1.SetRender)
        local lIIIIllII1l = false
        local function IllI1lIlIlI(l1ll111IIlI)
            Neverlose:FireCallback(l1IlII11II1.Callback, l1IlII11II1.Name, l1ll111IIlI, l1IlII11II1.Default, l1IlII11II1.Mode)
        end
        local function I1Il1lI111l(IlI11l1III1)
            if not l1IlII11II1.Default or l1IlII11II1.Default == "None" then
                return false
            end
            if l1IlII11II1.Default == "M1B" then
                return IlI11l1III1.UserInputType == Enum.UserInputType.MouseButton1
            elseif l1IlII11II1.Default == "M2B" then
                return IlI11l1III1.UserInputType == Enum.UserInputType.MouseButton2
            end
            local lll1I1IlIII = Neverlose:StrToKeyCode(l1IlII11II1.Default)
            return lll1I1IlIII and IlI11l1III1.KeyCode == lll1I1IlIII
        end
        Neverlose:CreateInput(lI1llll1llI, function ()
            if lIIIIllII1l then
                return
            end
            lIIIIllII1l = true
            I111l1I1Ill.Text = "..."
            ll1l1l111I1:Update()
            local llI1lIl1I11 = nil
            while not llI1lIl1I11 do
                local l1IllI111I1 = UserInputService.InputBegan:Wait()
                if l1IllI111I1.KeyCode ~= Enum.KeyCode.Unknown and not lll1IlllllI(l1IllI111I1.KeyCode) and not lll1IlllllI(l1IllI111I1.KeyCode.Name) then
                    llI1lIl1I11 = l1IllI111I1.KeyCode
                else
                    if l1IllI111I1.UserInputType == Enum.UserInputType.MouseButton1 and not lll1IlllllI(Enum.UserInputType.MouseButton1) and not lll1IlllllI("M1B") then
                        llI1lIl1I11 = "M1B"
                    elseif l1IllI111I1.UserInputType == Enum.UserInputType.MouseButton2 and not lll1IlllllI(Enum.UserInputType.MouseButton2) and not lll1IlllllI("M2B") then
                        llI1lIl1I11 = "M2B"
                    end
                end
            end
            lIIIIllII1l = false
            local llll1l11lI1 = Neverlose:NormalizeKeybindValue(llI1lIl1I11)
            l1IlII11II1.Default = llll1l11lI1
            I111l1I1Ill.Text = Neverlose:KeyCodeToStr(llll1l11lI1)
            ll1l1l111I1:Update()
            Neverlose:FireCallback(l1IlII11II1.ChangedCallback, l1IlII11II1.Name, llll1l11lI1)
            Neverlose:FireCallback(l1IlII11II1.Callback, l1IlII11II1.Name, llll1l11lI1, "Changed", l1IlII11II1.Mode)
        end
        )Neverlose:AddSignal(UserInputService.InputBegan:Connect( function (Ill1I1lIllI, lIIl11I11II)
            if lIIl11I11II or lIIIIllII1l or (ll1l1l111I1.GetLocked and ll1l1l111I1:GetLocked()) then
                return
            end
            if not I1Il1lI111l(Ill1I1lIllI) then
                return
            end
            if l1IlII11II1.Mode == "Hold" then
                if not I1l1lIIII1I then
                    I1l1lIIII1I = true
                    IllI1lIlIlI( true )
                end
            else
                llll1I11llI = not llll1I11llI
                IllI1lIlIlI(llll1I11llI)
            end
        end
        ))Neverlose:AddSignal(UserInputService.InputEnded:Connect( function (ll1lI1111II)
            if l1IlII11II1.Mode ~= "Hold" or not I1l1lIIII1I or not I1Il1lI111l(ll1lI1111II) then
                return
            end
            I1l1lIIII1I = false
            IllI1lIlIlI( false )
        end
        )) function ll1l1l111I1:GetValue()
            return l1IlII11II1.Default
        end
        function ll1l1l111I1:SetValue(Il1II1III1l)
            l1IlII11II1.Default = Neverlose:NormalizeKeybindValue(Il1II1III1l)
            I111l1I1Ill.Text = Neverlose:KeyCodeToStr(l1IlII11II1.Default)
            ll1l1l111I1:Update()
            Neverlose:FireCallback(l1IlII11II1.ChangedCallback, l1IlII11II1.Name, l1IlII11II1.Default)
            Neverlose:FireCallback(l1IlII11II1.Callback, l1IlII11II1.Name, l1IlII11II1.Default, "Changed", l1IlII11II1.Mode)
            return ll1l1l111I1
        end
        function ll1l1l111I1:SetMode(IIIlIlllll1)
            local lIlI1l1IlII = string.lower(tostring(IIIlIlllll1 or "Toggle")) == "hold" and "Hold" or "Toggle"
            if l1IlII11II1.Mode == lIlI1l1IlII then
                return ll1l1l111I1
            end
            if I1l1lIIII1I then
                I1l1lIIII1I = false
                IllI1lIlIlI( false )
            end
            l1IlII11II1.Mode = lIlI1l1IlII
            llll1I11llI = false
            Neverlose:FireCallback(l1IlII11II1.ModeChangedCallback, l1IlII11II1.Name, l1IlII11II1.Mode)
            return ll1l1l111I1
        end
        function ll1l1l111I1:GetMode()
            return l1IlII11II1.Mode
        end
        function ll1l1l111I1:GetActionState()
            return l1IlII11II1.Mode == "Hold" and I1l1lIIII1I or llll1I11llI
        end
        function ll1l1l111I1:SetCallback(II11Il1I111)
            l1IlII11II1.Callback = II11Il1I111 or lIIlIlII11I
            return ll1l1l111I1
        end
        function ll1l1l111I1:SetBlacklist(I1l11lIIl1l)
            l1IlII11II1.Blacklist = I1l11lIIl1l or {}
            return ll1l1l111I1
        end
        function ll1l1l111I1:GetKeyCode()
            return Neverlose:StrToKeyCode(l1IlII11II1.Default)
        end
        function ll1l1l111I1:SetEnabled(Il11IllIIlI)
            lI1llll1llI.Visible = Il11IllIIlI ~= false
            return ll1l1l111I1
        end
        if l1IlII11II1.Flag then
            Neverlose:RegisterFlag(l1IlII11II1.Flag, ll1l1l111I1)
        end
        if l1IlII11II1.ModeFlag then
            Neverlose:RegisterFlag(l1IlII11II1.ModeFlag, {
                GetValue = function ()
                    return ll1l1l111I1:GetMode()
                end
                , SetValue = function (ll1ll1l11lI, I1lIl1lIllI)
                    return ll1l1l111I1:SetMode(I1lIl1lIllI)
                end
                ,
            })
        end
        return wrapCaseInsensitive(ll1l1l111I1)
    end
    function IlIIIll11l1:AddTextInput(l11l1I1I1l1)
        l11l1I1I1l1 = Neverlose:ProcessParams(l11l1I1I1l1, {
            Name = nil , Default = "", Placeholder = "Placeholder", Callback = print, Flag = nil , Key = nil , ConfigKey = nil , Locked = false , TextLocked = "Locked", Size = 100, Height = nil , Type = "TextInput", Numeric = false , FullWidth = false ,
        })
        Neverlose:ResolveConfigFlag(l11l1I1I1l1)
        local I11111l1lll = string.lower(tostring(l11l1I1I1l1.Type or "TextInput")) == "textarea"
        if I11111l1lll then
            l11l1I1I1l1.Numeric = false
        end
        local Ill1lIlI1ll = l11l1I1I1l1.Height or (I11111l1lll and 72 or18)
        local I111ll11l11 = ( function ()
            if l11l1I1I1l1.FullWidth then
                return UDim2.new(1, 0, 0, Ill1lIlI1ll)
            end
            return UDim2.new(0, l11l1I1I1l1.Size, 0, Ill1lIlI1ll)
        end
        )
        local Il1lIIlIll1 ={}
        local llll1ll1IIl = Instance.new("Frame") local IIII1l1Il11 = Instance.new("UICorner") local I1111I1I11l = Instance.new("UIStroke") local I1IlIIl1lll = Instance.new("TextBox")llll1ll1IIl.Name = Neverlose.RandomString()
        llll1ll1IIl.Parent = l1Ill1l1lll llll1ll1IIl.BackgroundColor3 = Color3.fromRGB(26, 28, 36)llll1ll1IIl.BorderColor3 = Color3.fromRGB(0, 0, 0)llll1ll1IIl.BorderSizePixel = 0 llll1ll1IIl.ClipsDescendants = true llll1ll1IIl.Size = I111ll11l11()llll1ll1IIl.ZIndex = lI1IIIlI1ll + 13 IIlllIIl1II:AttachLockMethods(Il1lIIlIll1, self.Root or llll1ll1IIl, l11l1I1I1l1)
        IIII1l1Il11.CornerRadius = UDim.new(0, 4)IIII1l1Il11.Parent = llll1ll1IIl I1111I1I11l.Transparency = 0.650 I1111I1I11l.Color = Color3.fromRGB(45, 48, 58)I1111I1I11l.Parent = llll1ll1IIl I1IlIIl1lll.Parent = llll1ll1IIl I1IlIIl1lll.AnchorPoint = I11111l1lll and Vector2.new(0, 0) or Vector2.new(0, 0.5)I1IlIIl1lll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)I1IlIIl1lll.BackgroundTransparency = 1.000 I1IlIIl1lll.BorderColor3 = Color3.fromRGB(0, 0, 0)I1IlIIl1lll.BorderSizePixel = 0 I1IlIIl1lll.Position = I11111l1lll and UDim2.new(0, 6, 0, 5) or UDim2.new(0, 5, 0.5, 0)I1IlIIl1lll.Size = I11111l1lll and UDim2.new(1, - 12, 1, - 10) or UDim2.new(1, - 5, 0, 17)I1IlIIl1lll.ZIndex = lI1IIIlI1ll + 14 I1IlIIl1lll.ClearTextOnFocus = false I1IlIIl1lll.Font = Enum.Font.GothamMedium I1IlIIl1lll.PlaceholderText = l11l1I1I1l1.Placeholder I1IlIIl1lll.Text = tostring(l11l1I1I1l1.Default)I1IlIIl1lll.TextColor3 = Color3.fromRGB(255, 255, 255)I1IlIIl1lll.TextSize = 11.000 I1IlIIl1lll.TextTransparency = 0.350 I1IlIIl1lll.TextXAlignment = Enum.TextXAlignment.Left I1IlIIl1lll.TextYAlignment = I11111l1lll and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center I1IlIIl1lll.TextWrapped = I11111l1lll I1IlIIl1lll.MultiLine = I11111l1lll Il1lIIlIll1.SetRender = ( function (IllllIl1I1I)
            if IllllIl1I1I then
                Neverlose.PlayAnimate(llll1ll1IIl, TweenInfo0175, {
                    BackgroundTransparency = 0
                })Neverlose.PlayAnimate(I1111I1I11l, TweenInfo0175, {
                    Transparency = 0.650
                })Neverlose.PlayAnimate(I1IlIIl1lll, TweenInfo0175, {
                    TextTransparency = 0.350
                })
            else
                Neverlose.PlayAnimate(llll1ll1IIl, TweenInfo0175, {
                    BackgroundTransparency = 1
                })Neverlose.PlayAnimate(I1111I1I11l, TweenInfo0175, {
                    Transparency = 1
                })Neverlose.PlayAnimate(I1IlIIl1lll, TweenInfo0175, {
                    TextTransparency = 1
                })
            end
        end
        )
        Neverlose:AddSignal(I1IlIIl1lll:GetPropertyChangedSignal("Text"):Connect(( function ()
            local I1I111ll11I = Neverlose:ParseInput(I1IlIIl1lll.Text, l11l1I1I1l1.Numeric)
            if l11l1I1I1l1.Numeric then
                I1IlIIl1lll.Text = string.gsub(I1IlIIl1lll.Text, "[^0-9.]", "")
            end
            if I1I111ll11I then
                l11l1I1I1l1.Default = I1I111ll11I
                Neverlose:FireCallback(l11l1I1I1l1.Callback, l11l1I1I1l1.Name, I1I111ll11I)
            end
        end
        )))
        Il1lIIlIll1.SetRender(l11lIll11I1:GetValue())
        l11lIll11I1:Connect(Il1lIIlIll1.SetRender)
        function Il1lIIlIll1:GetValue()
            return l11l1I1I1l1.Default
        end
        function Il1lIIlIll1:SetValue(I1l1ll11I1l)
            l11l1I1I1l1.Default = I1l1ll11I1l
            I1IlIIl1lll.Text = tostring(I1l1ll11I1l)
            Neverlose:FireCallback(l11l1I1I1l1.Callback, l11l1I1I1l1.Name, l11l1I1I1l1.Default)
            return Il1lIIlIll1
        end
        function Il1lIIlIll1:Clear()
            Il1lIIlIll1:SetValue("")
            return Il1lIIlIll1
        end
        function Il1lIIlIll1:SetPlaceholder(l1I11l111l1)
            l11l1I1I1l1.Placeholder = tostring(l1I11l111l1 or "")
            I1IlIIl1lll.PlaceholderText = l11l1I1I1l1.Placeholder
            return Il1lIIlIll1
        end
        function Il1lIIlIll1:SetNumeric(IIIIIl1Il11)
            l11l1I1I1l1.Numeric = IIIIIl1Il11 == true
            if l11l1I1I1l1.Numeric then
                l11l1I1I1l1.Type = "TextInput"
                Il1lIIlIll1:SetType("TextInput")
            end
            return Il1lIIlIll1
        end
        function Il1lIIlIll1:SetType(I11Il1ll1I1)
            l11l1I1I1l1.Type = tostring(I11Il1ll1I1 or "TextInput")
            I11111l1lll = string.lower(l11l1I1I1l1.Type) == "textarea"
            if I11111l1lll then
                l11l1I1I1l1.Numeric = false
            end
            Ill1lIlI1ll = l11l1I1I1l1.Height or (I11111l1lll and 72 or18)
            llll1ll1IIl.Size = I111ll11l11()
            I1IlIIl1lll.AnchorPoint = I11111l1lll and Vector2.new(0, 0) or Vector2.new(0, 0.5)
            I1IlIIl1lll.Position = I11111l1lll and UDim2.new(0, 6, 0, 5) or UDim2.new(0, 5, 0.5, 0)
            I1IlIIl1lll.Size = I11111l1lll and UDim2.new(1, - 12, 1, - 10) or UDim2.new(1, - 5, 0, 17)
            I1IlIIl1lll.TextYAlignment = I11111l1lll and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center
            I1IlIIl1lll.TextWrapped = I11111l1lll
            I1IlIIl1lll.MultiLine = I11111l1lll
            return Il1lIIlIll1
        end
        function Il1lIIlIll1:SetHeight(II111ll1Il1)
            l11l1I1I1l1.Height = tonumber(II111ll1Il1) or l11l1I1I1l1.Height
            Ill1lIlI1ll = l11l1I1I1l1.Height or (I11111l1lll and 72 or 18)
            llll1ll1IIl.Size = I111ll11l11()
            return Il1lIIlIll1
        end
        function Il1lIIlIll1:SetCallback(IlIl1lIII1I)
            l11l1I1I1l1.Callback = IlIl1lIII1I or lIIlIlII11I
            return Il1lIIlIll1
        end
        function Il1lIIlIll1:Focus()
            I1IlIIl1lll:CaptureFocus()
            return Il1lIIlIll1
        end
        function Il1lIIlIll1:SetEnabled(II1111lIlIl)
            llll1ll1IIl.Visible = II1111lIlIl ~= false
            return Il1lIIlIll1
        end
        if l11l1I1I1l1.Flag then
            Neverlose:RegisterFlag(l11l1I1I1l1.Flag, Il1lIIlIll1)
        end
        return wrapCaseInsensitive(Il1lIIlIll1)
    end
    IlIIIll11l1.AddInput = IlIIIll11l1.AddTextInput
    function IlIIIll11l1:AddDropdown(ll111lII11l)
        ll111lII11l = Neverlose:ProcessParams(ll111lII11l, {
            Name = nil , Default = nil , Values ={}, Multi = false , Callback = lIIlIlII11I, AutoUpdate = false , Flag = nil , Key = nil , ConfigKey = nil , Locked = false , TextLocked = "Locked", Size = 100, Search = true , Position = "Dropdown", Placement = nil , DropdownPosition = nil , PopupPosition = nil , OptionsIcon ={}, DisabledOptions ={}, AllowNil = false , AutoSelectFirst = false , ValidateValue = true , RefreshInterval = nil , OptionsProvider = nil ,
        })Neverlose:ResolveConfigFlag(ll111lII11l)
        ll111lII11l.Default = Neverlose.ProcessDropdown(ll111lII11l.Default)
        ll111lII11l.OptionsIcon = ll111lII11l.OptionsIcon or ll111lII11l.OptionIcons or ll111lII11l.Icons or {}
        ll111lII11l.DisabledOptions = ll111lII11l.DisabledOptions or ll111lII11l.Disabled or {}
        ll111lII11l.AllowNil = ll111lII11l.AllowNil == true
        ll111lII11l.AutoSelectFirst = ll111lII11l.AutoSelectFirst == true
        ll111lII11l.ValidateValue = ll111lII11l.ValidateValue ~= false
        ll111lII11l.DropdownPosition = ll111lII11l.DropdownPosition or ll111lII11l.PopupPosition or ll111lII11l.Placement or ll111lII11l.Position
        local function Ill1ll11lI1(l1I1111lIIl)
            local lII1IllI1ll ={}
            if typeof(l1I1111lIIl) == "string" or typeof(l1I1111lIIl) == "number" then
                lII1IllI1ll[tostring(l1I1111lIIl)] = true
                return lII1IllI1ll
            end
            if typeof(l1I1111lIIl) ~= "table" then
                return lII1IllI1ll
            end
            for l11lI11I1Il, I11l1lIllI1 in next, l1I1111lIIl do
                if typeof(l11lI11I1Il) == "number" then
                    lII1IllI1ll[tostring(I11l1lIllI1)] = true
                elseif I11l1lIllI1 == true then
                    lII1IllI1ll[tostring(l11lI11I1Il)] = true
                end
            end
            return lII1IllI1ll
        end
        local function III11lIl11I(II1IIlIlIlI)
            local lIlII1Ill1I ={}
            if typeof(II1IIlIlIlI) ~= "table" then
                return lIlII1Ill1I
            end
            for I11I1lIIllI, IIll11l1Ill in next, II1IIlIlIlI do
                if typeof(I11I1lIIllI) ~= "number" and IIll11l1Ill ~= nil then
                    lIlII1Ill1I[tostring(I11I1lIIllI)] = IIll11l1Ill
                elseif typeof(IIll11l1Ill) == "table" and IIll11l1Ill.Value and IIll11l1Ill.Icon then
                    lIlII1Ill1I[tostring(IIll11l1Ill.Value)] = IIll11l1Ill.Icon
                end
            end
            return lIlII1Ill1I
        end
        local I1lI1IIIlIl = Ill1ll11lI1(ll111lII11l.DisabledOptions)
        local IIl1II1II11 = III11lIl11I(ll111lII11l.OptionsIcon)
        local function IllII1l11Il()
            for Il1lIIlll1I, l1I1ll1llIl in next, ll111lII11l.Values do
                return l1I1ll1llIl
            end
        end
        local function IlI1lIIIIll(I1IIlllI1ll)
            for Il11IlI1I1l, llIl11I1lII in next, ll111lII11l.Values do
                if llIl11I1lII == I1IIlllI1ll then
                    return true
                end
            end
            return false
        end
        local function I11l1I11lI1(l1I111lI1II)
            if l1I111lI1II == nil then
                if ll111lII11l.AutoSelectFirst then
                    return IllII1l11Il()
                end
                return nil
            end
            if ll111lII11l.ValidateValue and not IlI1lIIIIll(l1I111lI1II) then
                if ll111lII11l.AutoSelectFirst then
                    return IllII1l11Il()
                end
                return nil
            end
            return l1I111lI1II
        end
        local function IIllI1ll11I(I11IlIIIIll)
            return ll111lII11l.Multi or I11IlIIIIll ~= nil or ll111lII11l.AllowNil
        end
        local function Il111lIl11l(ll111I1Il1I)
            local IIlllI1lIIl = Neverlose.ProcessDropdown(ll111I1Il1I)
            if typeof(IIlllI1lIIl) == "table" then
                return IIlllI1lIIl
            end
            if IIlllI1lIIl ~= nil then
                return {
                    [IIlllI1lIIl] = true ,
                }
            end
            return {}
        end
        if ll111lII11l.Multi then
            ll111lII11l.Default = Il111lIl11l(ll111lII11l.Default)
        else
            ll111lII11l.Default = I11l1I11lI1(ll111lII11l.Default)
        end
        local lII1l1IllIl = Instance.new("Frame") local l1l1l111l1l = Instance.new("ImageLabel") local I1l111lIIlI = Instance.new("UICorner") local l11I1Illl11 = Instance.new("UIStroke") local llIII111l1I = Instance.new("TextLabel")lII1l1IllIl.Name = Neverlose.RandomString()
        lII1l1IllIl.Parent = l1Ill1l1lll lII1l1IllIl.BackgroundColor3 = Color3.fromRGB(26, 28, 36)lII1l1IllIl.BorderColor3 = Color3.fromRGB(0, 0, 0)lII1l1IllIl.BorderSizePixel = 0 lII1l1IllIl.ClipsDescendants = true lII1l1IllIl.Size = UDim2.new(0, ll111lII11l.Size, 0, 18)lII1l1IllIl.ZIndex = lI1IIIlI1ll + 13 l1l1l111l1l.Name = Neverlose.RandomString()
        l1l1l111l1l.Parent = lII1l1IllIl l1l1l111l1l.AnchorPoint = Vector2.new(1, 0.5)l1l1l111l1l.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l1l1l111l1l.BackgroundTransparency = 1.000 l1l1l111l1l.BorderColor3 = Color3.fromRGB(0, 0, 0)l1l1l111l1l.BorderSizePixel = 0 l1l1l111l1l.Position = UDim2.new(1, - 2, 0.5, 0)l1l1l111l1l.Size = UDim2.new(0, 18, 0, 18)l1l1l111l1l.ZIndex = lI1IIIlI1ll + 14 IIlllIIl1II:SetIconMode(l1l1l111l1l, "chevron-small-down")l1l1l111l1l.ImageColor3 = Color3.fromRGB(223, 223, 223)l1l1l111l1l.ImageTransparency = 0.250 l1l1l111l1l.ScaleType = Enum.ScaleType.Fit I1l111lIIlI.CornerRadius = UDim.new(0, 4)I1l111lIIlI.Parent = lII1l1IllIl l11I1Illl11.Transparency = 0.650 l11I1Illl11.Color = Color3.fromRGB(45, 48, 58)l11I1Illl11.Parent = lII1l1IllIl llIII111l1I.Name = Neverlose.RandomString()
        llIII111l1I.Parent = lII1l1IllIl llIII111l1I.AnchorPoint = Vector2.new(0, 0.5)llIII111l1I.BackgroundColor3 = Color3.fromRGB(255, 255, 255)llIII111l1I.BackgroundTransparency = 1.000 llIII111l1I.BorderColor3 = Color3.fromRGB(0, 0, 0)llIII111l1I.BorderSizePixel = 0 llIII111l1I.ClipsDescendants = true llIII111l1I.Position = UDim2.new(0, 5, 0.5, 0)llIII111l1I.Size = UDim2.new(1, - 25, 0, 15)llIII111l1I.ZIndex = lI1IIIlI1ll + 14 llIII111l1I.Font = Enum.Font.GothamMedium llIII111l1I.Text = Neverlose.ParseDropdown(ll111lII11l.Default)
        llIII111l1I.TextColor3 = Color3.fromRGB(255, 255, 255)llIII111l1I.TextSize = 12.000 llIII111l1I.TextTransparency = 0.5 llIII111l1I.TextXAlignment = Enum.TextXAlignment.Left do
            local llIll1lIllI = Instance.new("UIGradient")llIll1lIllI.Transparency = NumberSequence.new {
                NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.85, 0.23), NumberSequenceKeypoint.new(1.00, 1.00)
            }
            llIll1lIllI.Parent = llIII111l1I
        end
        Neverlose:AddSignal(lII1l1IllIl.MouseEnter:Connect(( function ()
            Neverlose.PlayAnimate(llIII111l1I, TweenInfo0175, {
                TextTransparency = 0.200
            })
        end
        )))
        Neverlose:AddSignal(lII1l1IllIl.MouseLeave:Connect(( function ()
            Neverlose.PlayAnimate(llIII111l1I, TweenInfo0175, {
                TextTransparency = 0.5
            })
        end
        )))
        local I1IIlIIllIl = {
            OpenSignal = Neverlose:CreateSignal( false ), Signals ={}, Refuse ={}, Items ={},
        }
        Neverlose:AttachLockMethods(I1IIlIIllIl, self.Root or lII1l1IllIl, ll111lII11l)
        I1IIlIIllIl.SetRender = ( function (ll1IIII11l1)
            if ll1IIII11l1 then
                Neverlose.PlayAnimate(lII1l1IllIl, TweenInfo0175, {
                    BackgroundTransparency = 0
                })
                Neverlose.PlayAnimate(l1l1l111l1l, TweenInfo0175, {
                    TextTransparency = 0.250
                })
                Neverlose.PlayAnimate(l11I1Illl11, TweenInfo0175, {
                    Transparency = 0.650
                })
                Neverlose.PlayAnimate(llIII111l1I, TweenInfo0175, {
                    TextTransparency = 0.5
                })
            else
                Neverlose.PlayAnimate(lII1l1IllIl, TweenInfo0175, {
                    BackgroundTransparency = 1
                })
                Neverlose.PlayAnimate(l1l1l111l1l, TweenInfo0175, {
                    TextTransparency = 1
                })
                Neverlose.PlayAnimate(l11I1Illl11, TweenInfo0175, {
                    Transparency = 1
                })
                Neverlose.PlayAnimate(llIII111l1I, TweenInfo0175, {
                    TextTransparency = 1
                })
            end
        end
        )
        I1IIlIIllIl.SetRender(l11lIll11I1:GetValue())l11lIll11I1:Connect(I1IIlIIllIl.SetRender)
        I1IIlIIllIl.ExtentSize = 0
        do
            local I111lI1Il11 = Instance.new("Frame") local ll1III11l1I = Instance.new("UICorner") local IIIIIl111Il = Instance.new("UIStroke") local IlIlIl1lIII = Instance.new("Frame") local I1IIlI1l11I = Instance.new("UICorner") local ll11II1Il1I = Instance.new("UIStroke") local lIlll1lI11I = Instance.new("ImageLabel") local I1lIlI1lI11 = Instance.new("TextBox") local l1lI1I11I1l = Instance.new("ScrollingFrame") local llIIlI1IllI = Instance.new("UIListLayout") local I11lIII11I1 = Neverlose:CreateShadow(I111lI1Il11)
            I111lI1Il11.Name = Neverlose.RandomString()
            I111lI1Il11.Parent = Neverlose.ScreenGui
            I111lI1Il11.AnchorPoint = Vector2.new(0.5, 0)I111lI1Il11.BackgroundColor3 = Color3.fromRGB(20, 22, 27)I111lI1Il11.BackgroundTransparency = 0.5 I111lI1Il11.BorderColor3 = Color3.fromRGB(0, 0, 0)I111lI1Il11.BorderSizePixel = 0 I111lI1Il11.ClipsDescendants = true I111lI1Il11.Position = UDim2.new(255, 255, 255, 255)I111lI1Il11.Size = UDim2.new(0, 125, 0, 50)I111lI1Il11.ZIndex = lI1IIIlI1ll + 125 I1IIlIIllIl.BlockRoot = I111lI1Il11
            Neverlose:AddSignal(I111lI1Il11:GetPropertyChangedSignal("BackgroundTransparency"):Connect( function ()
                if I111lI1Il11.BackgroundTransparency > 0.9 then
                    I111lI1Il11.Visible = false
                    I111lI1Il11.Parent = nil
                else
                    I111lI1Il11.Visible = true
                    if Neverlose.Global3DRenderMode then
                        I111lI1Il11.Parent = Neverlose.GlobalSurfaceGui
                    else
                        I111lI1Il11.Parent = Neverlose.ScreenGui
                    end
                end
            end
            ))
            ll1III11l1I.CornerRadius = UDim.new(0, 10)ll1III11l1I.Parent = I111lI1Il11 IIIIIl111Il.Transparency = 0.650 IIIIIl111Il.Color = Color3.fromRGB(45, 48, 58)IIIIIl111Il.Parent = I111lI1Il11 IlIlIl1lIII.Name = Neverlose.RandomString()
            IlIlIl1lIII.Parent = I111lI1Il11 IlIlIl1lIII.AnchorPoint = Vector2.new(0.5, 0)IlIlIl1lIII.BackgroundColor3 = Color3.fromRGB(26, 28, 36)IlIlIl1lIII.BackgroundTransparency = 0.250 IlIlIl1lIII.BorderColor3 = Color3.fromRGB(0, 0, 0)IlIlIl1lIII.BorderSizePixel = 0 IlIlIl1lIII.ClipsDescendants = true IlIlIl1lIII.Position = UDim2.new(0.5, 0, 0, 5)IlIlIl1lIII.Size = UDim2.new(1, - 10, 0, 26)IlIlIl1lIII.Visible = ll111lII11l.Search == true IlIlIl1lIII.ZIndex = lI1IIIlI1ll + 127 I1IIlI1l11I.CornerRadius = UDim.new(0, 5)I1IIlI1l11I.Parent = IlIlIl1lIII ll11II1Il1I.Transparency = 0.650 ll11II1Il1I.Color = Color3.fromRGB(45, 48, 58)ll11II1Il1I.Parent = IlIlIl1lIII lIlll1lI11I.Name = Neverlose.RandomString()
            lIlll1lI11I.Parent = IlIlIl1lIII lIlll1lI11I.AnchorPoint = Vector2.new(0, 0.5)lIlll1lI11I.BackgroundColor3 = Color3.fromRGB(255, 255, 255)lIlll1lI11I.BackgroundTransparency = 1.000 lIlll1lI11I.BorderColor3 = Color3.fromRGB(0, 0, 0)lIlll1lI11I.BorderSizePixel = 0 lIlll1lI11I.Position = UDim2.new(0, 4, 0.5, 0)lIlll1lI11I.Size = UDim2.new(0, 20, 0, 20)lIlll1lI11I.ZIndex = lI1IIIlI1ll + 128 IIlllIIl1II:SetIconMode(lIlll1lI11I, "magnifying-glass")lIlll1lI11I.ImageColor3 = Color3.fromRGB(223, 223, 223)lIlll1lI11I.ImageTransparency = 0.450 lIlll1lI11I.ScaleType = Enum.ScaleType.Fit I1lIlI1lI11.Name = Neverlose.RandomString()
            I1lIlI1lI11.Parent = IlIlIl1lIII I1lIlI1lI11.AnchorPoint = Vector2.new(0, 0.5)I1lIlI1lI11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)I1lIlI1lI11.BackgroundTransparency = 1.000 I1lIlI1lI11.BorderColor3 = Color3.fromRGB(0, 0, 0)I1lIlI1lI11.BorderSizePixel = 0 I1lIlI1lI11.ClearTextOnFocus = false I1lIlI1lI11.PlaceholderText = "Search"I1lIlI1lI11.Position = UDim2.new(0, 26, 0.5, 0)I1lIlI1lI11.Size = UDim2.new(1, - 31, 0, 20)I1lIlI1lI11.ZIndex = lI1IIIlI1ll + 128 I1lIlI1lI11.Font = Enum.Font.GothamMedium I1lIlI1lI11.Text = ""I1lIlI1lI11.TextColor3 = Color3.fromRGB(255, 255, 255)I1lIlI1lI11.PlaceholderColor3 = Color3.fromRGB(140, 140, 155)I1lIlI1lI11.TextSize = 12.000 I1lIlI1lI11.TextTransparency = 0.250 I1lIlI1lI11.TextXAlignment = Enum.TextXAlignment.Left l1lI1I11I1l.Name = Neverlose.RandomString()
            l1lI1I11I1l.Parent = I111lI1Il11 l1lI1I11I1l.Active = true l1lI1I11I1l.AnchorPoint = Vector2.new(0.5, 0)l1lI1I11I1l.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l1lI1I11I1l.BackgroundTransparency = 1.000 l1lI1I11I1l.BorderColor3 = Color3.fromRGB(0, 0, 0)l1lI1I11I1l.BorderSizePixel = 0 l1lI1I11I1l.Position = ll111lII11l.Search and UDim2.new(0.5, 0, 0, 35) or UDim2.new(0.5, 0, 0, 2)l1lI1I11I1l.Size = ll111lII11l.Search and UDim2.new(1, - 5, 1, - 38) or UDim2.new(1, - 5, 1, - 5)l1lI1I11I1l.ZIndex = lI1IIIlI1ll + 127 l1lI1I11I1l.ScrollBarThickness = 0 I1IIlIIllIl.RootItem = l1lI1I11I1l
            llIIlI1IllI.Parent = l1lI1I11I1l llIIlI1IllI.HorizontalAlignment = Enum.HorizontalAlignment.Center llIIlI1IllI.SortOrder = Enum.SortOrder.LayoutOrder local I11IlIl1Il1 = ( function ()
                return (ll111lII11l.Search == true and 35) or 5
            end
            )
            local II1llIII111 = ( function ()
                local l1IlI1Il11I = math.min(llIIlI1IllI.AbsoluteContentSize.Y + 5, 250)
                l1lI1I11I1l.CanvasSize = UDim2.fromOffset(0, llIIlI1IllI.AbsoluteContentSize.Y)Neverlose.PlayAnimate(I111lI1Il11, TweenInfo0175, {
                    Size = UDim2.new(0, (lII1l1IllIl.AbsoluteSize.X + 5) + I1IIlIIllIl.ExtentSize, 0, l1IlI1Il11I + I11IlIl1Il1())
                })
            end
            )
            I1IIlIIllIl.ApplySearch = ( function ()
                local III1II1l111 = string.lower(I1lIlI1lI11.Text or "")
                for llIIIIIllII, llIllIIlI11 in next, I1IIlIIllIl.Items do
                    if llIllIIlI11.Root then
                        if III1II1l111 == "" then
                            llIllIIlI11.Root.Visible = true
                        else
                            llIllIIlI11.Root.Visible = string.find(string.lower(llIllIIlI11.Text), III1II1l111, 1, true ) ~= nil
                        end
                    end
                end
                II1llIII111()
            end
            )
            Neverlose:AddSignal(I1lIlI1lI11:GetPropertyChangedSignal("Text"):Connect(( function ()
                I1IIlIIllIl.ApplySearch()
            end
            )))
            Neverlose:AddSignal(llIIlI1IllI:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(( function ()
                II1llIII111()
            end
            )))
            local Ill1I1ll1lI = ( function ()
                local IIl1lI1l1I1 = lII1l1IllIl
                while IIl1lI1l1I1 and IIl1lI1l1I1.Parent do
                    if IIl1lI1l1I1.Parent == Neverlose.ScreenGui or (Neverlose.GlobalSurfaceGui and IIl1lI1l1I1.Parent == Neverlose.GlobalSurfaceGui) then
                        return IIl1lI1l1I1
                    end
                    IIl1lI1l1I1 = IIl1lI1l1I1.Parent
                end
                if Neverlose.ActiveWindow and Neverlose.ActiveWindow.Root then
                    return Neverlose.ActiveWindow.Root
                end
            end
            )
            local l1IlllIlIll = ( function ()
                local IIl1llIIlll = string.lower(tostring(ll111lII11l.DropdownPosition or "Dropdown"))
                if IIl1llIIlll == "center" or IIl1llIIlll == "middle" then
                    local lll1lIIllII = Ill1I1ll1lI()
                    I111lI1Il11.AnchorPoint = Vector2.new(0.5, 0.5)
                    if lll1lIIllII and lll1lIIllII.Parent then
                        I111lI1Il11.Position = UDim2.fromOffset(lll1lIIllII.AbsolutePosition.X + (lll1lIIllII.AbsoluteSize.X / 2), lll1lIIllII.AbsolutePosition.Y + (lll1lIIllII.AbsoluteSize.Y / 2))
                    else
                        I111lI1Il11.Position = UDim2.fromOffset(Neverlose.ScreenGui.AbsoluteSize.X / 2, Neverlose.ScreenGui.AbsoluteSize.Y / 2)
                    end
                    return
                end
                if Neverlose:MoreThanHalfY(lII1l1IllIl.AbsolutePosition.Y + 85) then
                    I111lI1Il11.AnchorPoint = Vector2.new(0.5, 1)
                else
                    I111lI1Il11.AnchorPoint = Vector2.new(0.5, 0)
                end
                I111lI1Il11.Position = UDim2.fromOffset(lII1l1IllIl.AbsolutePosition.X + (I111lI1Il11.AbsoluteSize.X / 2), lII1l1IllIl.AbsolutePosition.Y + 85)
            end
            )
            I1IIlIIllIl.SetFrameRender = ( function (l11lI1l1lll)
                I1IIlIIllIl.OpenSignal:SetValue(l11lI1l1lll)
                if l11lI1l1lll then
                    I11lIII11I1:Render( true )
                    if ll111lII11l.Search then
                        I1lIlI1lI11.Text = ""
                    end
                    I111lI1Il11.Size = UDim2.new(0, (lII1l1IllIl.AbsoluteSize.X + 5) + I1IIlIIllIl.ExtentSize, 0, math.min(llIIlI1IllI.AbsoluteContentSize.Y + 5, 250) + I11IlIl1Il1())
                    l1IlllIlIll()
                    Neverlose.PlayAnimate(I111lI1Il11, TweenInfo0175, {
                        BackgroundTransparency = 0.035
                    })Neverlose.PlayAnimate(IlIlIl1lIII, TweenInfo0175, {
                        BackgroundTransparency = ll111lII11l.Search and 0.250 or 1
                    })Neverlose.PlayAnimate(ll11II1Il1I, TweenInfo0175, {
                        Transparency = ll111lII11l.Search and 0.650 or 1
                    })Neverlose.PlayAnimate(lIlll1lI11I, TweenInfo0175, {
                        TextTransparency = ll111lII11l.Search and 0.450 or 1
                    })Neverlose.PlayAnimate(I1lIlI1lI11, TweenInfo0175, {
                        TextTransparency = ll111lII11l.Search and 0.250 or 1
                    }) if ll111lII11l.AutoUpdate then
                        I1IIlIIllIl:Generate()
                    end
                else
                    Neverlose.PlayAnimate(I111lI1Il11, TweenInfo0175, {
                        BackgroundTransparency = 1
                    })I1lIlI1lI11:ReleaseFocus()
                    Neverlose.PlayAnimate(IlIlIl1lIII, TweenInfo0175, {
                        BackgroundTransparency = 1
                    })Neverlose.PlayAnimate(ll11II1Il1I, TweenInfo0175, {
                        Transparency = 1
                    })Neverlose.PlayAnimate(lIlll1lI11I, TweenInfo0175, {
                        TextTransparency = 1
                    })Neverlose.PlayAnimate(I1lIlI1lI11, TweenInfo0175, {
                        TextTransparency = 1
                    })I11lIII11I1:Render( false )
                end
            end
            )
            I1IIlIIllIl.SetFrameRender( false )
        end
        local lI1III1Ill1
        Neverlose:CreateInput(lII1l1IllIl, ( function ()
            if lI1III1Ill1 then
                lI1III1Ill1:Disconnect()
                lI1III1Ill1 = nil
            end
            I1IIlIIllIl.SetFrameRender( true )
            Neverlose.IsMosueOverOtherFrame = true
            lI1III1Ill1 = UserInputService.InputBegan:Connect( function (lII1111lIIl)
                if lII1111lIIl.UserInputType == Enum.UserInputType.MouseButton1 or lII1111lIIl.UserInputType == Enum.UserInputType.Touch then
                    if not Neverlose:IsMouseOverFrame(I1IIlIIllIl.BlockRoot) and not Neverlose:IsMouseOverFrame(lII1l1IllIl) then
                        if lI1III1Ill1 then
                            lI1III1Ill1:Disconnect()
                            lI1III1Ill1 = nil
                        end
                        Neverlose.IsMosueOverOtherFrame = false
                        I1IIlIIllIl.SetFrameRender( false )
                    end
                end
            end
            )
        end
        ))I1IIlIIllIl.IsMatch = ( function (I1lII1Il1lI)
            if typeof(ll111lII11l.Default) == "table" then
                if ll111lII11l.Default[I1lII1Il1lI] == true then
                    return true
                end
                for III111lII11, I11I1I11lI1 in next, ll111lII11l.Default do
                    if I11I1I11lI1 == I1lII1Il1lI then
                        return true
                    end
                end
            end
            if ll111lII11l.Default == I1lII1Il1lI then
                return true
            end
        end
        )
        function I1IIlIIllIl:Generate()
            for lIlIIlIl1ll, l1I111l1Il1 in next, I1IIlIIllIl.RootItem:GetChildren() do
                if l1I111l1Il1:IsA("Frame") then
                    l1I111l1Il1:Destroy()
                end
            end
            for I11I1l1lIll, I11l1llI1l1 in next, I1IIlIIllIl.Signals do
                I11l1llI1l1:Disconnect()
            end
            table.clear(I1IIlIIllIl.Signals)
            table.clear(I1IIlIIllIl.Refuse)
            table.clear(I1IIlIIllIl.Items)
            I1IIlIIllIl.ExtentSize = 0
            I1lI1IIIlIl = Ill1ll11lI1(ll111lII11l.DisabledOptions)
            IIl1II1II11 = III11lIl11I(ll111lII11l.OptionsIcon)
            local l1lI11lI1l1
            for I1llIlI1III, I1I11I11I1I in next, ll111lII11l.Values do
                local II1IlllII1l = Instance.new("Frame") local IIl1l1II1lI = Instance.new("TextLabel") local l1Ill11I111 = Instance.new("UICorner") local llIl1l11IIl = nil
                local IlI1lllllIl = tostring(I1I11I11I1I)
                local Il1I11II1I1 = I1lI1IIIlIl[IlI1lllllIl] == true
                local l1IIlI1lIl1 = IIl1II1II11[IlI1lllllIl]
                II1IlllII1l.Name = Neverlose.RandomString()
                II1IlllII1l.Parent = I1IIlIIllIl.RootItem II1IlllII1l.BackgroundColor3 = Color3.fromRGB(29, 31, 38)II1IlllII1l.BackgroundTransparency = 1.000 II1IlllII1l.BorderColor3 = Color3.fromRGB(0, 0, 0)II1IlllII1l.BorderSizePixel = 0 II1IlllII1l.Size = UDim2.new(1, 0, 0, 25)II1IlllII1l.ZIndex = lI1IIIlI1ll + 1258 IIl1l1II1lI.Name = Neverlose.RandomString()
                IIl1l1II1lI.Parent = II1IlllII1l IIl1l1II1lI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)IIl1l1II1lI.BackgroundTransparency = 1.000 IIl1l1II1lI.BorderColor3 = Color3.fromRGB(0, 0, 0)IIl1l1II1lI.BorderSizePixel = 0 IIl1l1II1lI.Position = UDim2.new(0, l1IIlI1lIl1 and (ll111lII11l.Multi and 50 or34) or 15, 0, 4)IIl1l1II1lI.Size = UDim2.new(0, 1, 0, 15)IIl1l1II1lI.ZIndex = lI1IIIlI1ll + 1258 IIl1l1II1lI.Font = Enum.Font.GothamMedium IIl1l1II1lI.Text = tostring(I1I11I11I1I)
                IIl1l1II1lI.TextColor3 = Il1I11II1I1 and Color3.fromRGB(140, 140, 155) or Color3.fromRGB(255, 255, 255)IIl1l1II1lI.TextSize = 13.000 IIl1l1II1lI.TextTransparency = Il1I11II1I1 and 0.600 or 0.200 IIl1l1II1lI.TextXAlignment = Enum.TextXAlignment.Left l1Ill11I111.CornerRadius = UDim.new(0, 10)l1Ill11I111.Parent = II1IlllII1l if l1IIlI1lIl1 then
                    llIl1l11IIl = Instance.new("ImageLabel")llIl1l11IIl.Parent = II1IlllII1l llIl1l11IIl.AnchorPoint = Vector2.new(0, 0.5)llIl1l11IIl.BackgroundTransparency = 1 llIl1l11IIl.BorderSizePixel = 0 llIl1l11IIl.Position = UDim2.new(0, ll111lII11l.Multi and 29 or 13, 0.5, 0)llIl1l11IIl.Size = UDim2.new(0, 15, 0, 15)llIl1l11IIl.ZIndex = lI1IIIlI1ll + 1259 IIlllIIl1II:SetIconMode(llIl1l11IIl, l1IIlI1lIl1)llIl1l11IIl.ImageColor3 = Il1I11II1I1 and Color3.fromRGB(120, 120, 135) or Color3.fromRGB(223, 223, 223)llIl1l11IIl.ImageTransparency = Il1I11II1I1 and 0.650 or 0.300 llIl1l11IIl.ScaleType = Enum.ScaleType.Fit
                end
                local l1II1l1II11 = TextService:GetTextSize(IIl1l1II1lI.Text, IIl1l1II1lI.TextSize, IIl1l1II1lI.Font, Vector2.new(math.huge, math.huge))
                I1IIlIIllIl.ExtentSize = math.max(I1IIlIIllIl.ExtentSize, l1II1l1II11.X + (l1IIlI1lIl1 and 20 or0))
                table.insert(I1IIlIIllIl.Items, {
                    Root = II1IlllII1l, Text = tostring(I1I11I11I1I), Disabled = Il1I11II1I1,
                })
                local l111l1Il11I, II111lIII1I = nil , nil
                if ll111lII11l.Multi then
                    local llll111IlI1 = Instance.new("ImageLabel")llll111IlI1.Parent = II1IlllII1l
                    llll111IlI1.AnchorPoint = Vector2.new(0, 0.5)llll111IlI1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)llll111IlI1.BackgroundTransparency = 1.000 llll111IlI1.BorderColor3 = Color3.fromRGB(0, 0, 0)llll111IlI1.BorderSizePixel = 0 llll111IlI1.Position = UDim2.new(0, 5, 0.5, 0)llll111IlI1.Size = UDim2.new(0, 20, 0, 20)llll111IlI1.ZIndex = lI1IIIlI1ll + 1259 IIlllIIl1II:SetIconMode(llll111IlI1, "check")llll111IlI1.ImageColor3 = Color3.fromRGB(223, 223, 223)llll111IlI1.ImageTransparency = 1 llll111IlI1.ScaleType = Enum.ScaleType.Fit local IIl11I11ll1 = ( function ()
                        if I1IIlIIllIl.IsMatch(I1I11I11I1I) then
                            Neverlose.PlayAnimate(IIl1l1II1lI, TweenInfoQuint, {
                                TextTransparency = Il1I11II1I1 and 0.600 or 0.200, Position = UDim2.new(0, l1IIlI1lIl1 and 50 or 30, 0, 4)
                            })Neverlose.PlayAnimate(llll111IlI1, TweenInfo0175, {
                                TextTransparency = Il1I11II1I1 and 0.650 or 0.250
                            }) local l1IIl1IIl11 = llll111IlI1:FindFirstChild("ModernIconFallbackText")
                            if l1IIl1IIl11 then
                                l1IIl1IIl11.TextTransparency = 0.250
                            end
                            l1lI11lI1l1 = IIl1l1II1lI
                        else
                            Neverlose.PlayAnimate(llll111IlI1, TweenInfo0175, {
                                TextTransparency = 1
                            }) local III111II1l1 = llll111IlI1:FindFirstChild("ModernIconFallbackText")
                            if III111II1l1 then
                                III111II1l1.TextTransparency = 1
                            end
                            Neverlose.PlayAnimate(IIl1l1II1lI, TweenInfoQuint, {
                                TextTransparency = Il1I11II1I1 and 0.650 or 0.5, Position = UDim2.new(0, l1IIlI1lIl1 and (ll111lII11l.Multi and 50 or 34) or 15, 0, 4)
                            })
                        end
                    end
                    )
                    l111l1Il11I = llll111IlI1
                    II111lIII1I = IIl11I11ll1
                else
                    local I1I1l1lllIl = ( function ()
                        if I1IIlIIllIl.IsMatch(I1I11I11I1I) then
                            Neverlose.PlayAnimate(IIl1l1II1lI, TweenInfo0175, {
                                TextTransparency = Il1I11II1I1 and 0.600 or 0.200
                            })l1lI11lI1l1 = IIl1l1II1lI
                        else
                            Neverlose.PlayAnimate(IIl1l1II1lI, TweenInfo0175, {
                                TextTransparency = Il1I11II1I1 and 0.650 or 0.5
                            })
                        end
                    end
                    )
                    II111lIII1I = I1I1l1lllIl
                end
                II111lIII1I()
                table.insert(I1IIlIIllIl.Refuse, II111lIII1I)table.insert(I1IIlIIllIl.Signals, II1IlllII1l.MouseEnter:Connect(( function ()
                    if Il1I11II1I1 then
                        return
                    end
                    Neverlose.PlayAnimate(II1IlllII1l, TweenInfo0175, {
                        BackgroundTransparency = 0.1
                    })
                end
                )))
                table.insert(I1IIlIIllIl.Signals, II1IlllII1l.MouseLeave:Connect(( function ()
                    Neverlose.PlayAnimate(II1IlllII1l, TweenInfo0175, {
                        BackgroundTransparency = 1
                    })
                end
                )))
                table.insert(I1IIlIIllIl.Signals, I1IIlIIllIl.OpenSignal:Connect(( function (I111llllI11)
                    if I111llllI11 then
                        II111lIII1I()
                        if llIl1l11IIl then
                            Neverlose.PlayAnimate(llIl1l11IIl, TweenInfo0175, {
                                TextTransparency = Il1I11II1I1 and 0.650 or 0.300
                            })
                        end
                    else
                        Neverlose.PlayAnimate(IIl1l1II1lI, TweenInfo0175, {
                            TextTransparency = 1
                        }) if llIl1l11IIl then
                            Neverlose.PlayAnimate(llIl1l11IIl, TweenInfo0175, {
                                TextTransparency = 1
                            })
                        end
                        if l111l1Il11I then
                            Neverlose.PlayAnimate(l111l1Il11I, TweenInfo0175, {
                                TextTransparency = 1
                            }) local Ill11l1IlIl = l111l1Il11I:FindFirstChild("ModernIconFallbackText")
                            if Ill11l1IlIl then
                                Ill11l1IlIl.TextTransparency = 1
                            end
                        end
                    end
                end
                )))
                if ll111lII11l.Multi then
                    local IlIl1lll1ll, lI1lI11l111 = Neverlose:CreateInput(II1IlllII1l, ( function ()
                        if Il1I11II1I1 then
                            return
                        end
                        ll111lII11l.Default[I1I11I11I1I] = not ll111lII11l.Default[I1I11I11I1I]
                        II111lIII1I()
                        llIII111l1I.Text = Neverlose.ParseDropdown(ll111lII11l.Default)
                        Neverlose:FireCallback(ll111lII11l.Callback, ll111lII11l.Name, ll111lII11l.Default)
                    end
                    ))
                    table.insert(I1IIlIIllIl.Signals, lI1lI11l111)
                else
                    local Illl1ll111I, IlI1l1l1II1 = Neverlose:CreateInput(II1IlllII1l, ( function ()
                        if Il1I11II1I1 then
                            return
                        end
                        ll111lII11l.Default = I1I11I11I1I
                        for I111llIl1lI, IlI1IlllII1 in next, I1IIlIIllIl.Refuse do
                            task.spawn(IlI1IlllII1)
                        end
                        llIII111l1I.Text = Neverlose.ParseDropdown(ll111lII11l.Default)
                        Neverlose:FireCallback(ll111lII11l.Callback, ll111lII11l.Name, ll111lII11l.Default)
                    end
                    ))
                    table.insert(I1IIlIIllIl.Signals, IlI1l1l1II1)
                end
            end
            if I1IIlIIllIl.ApplySearch then
                I1IIlIIllIl.ApplySearch()
            end
        end
        I1IIlIIllIl:Generate()
        if type(ll111lII11l.OptionsProvider) == "function" and tonumber(ll111lII11l.RefreshInterval) then
            local III1IIllllI = 0
            local llllll11l1I = math.max(tonumber(ll111lII11l.RefreshInterval) or 1, 0.1)
            I1IIlIIllIl.RefreshSignal = Neverlose:AddSignal(RunService.RenderStepped:Connect( function (III1IIIlll1)
                if not lII1l1IllIl or not lII1l1IllIl.Parent then
                    if I1IIlIIllIl.RefreshSignal then
                        I1IIlIIllIl.RefreshSignal:Disconnect()
                        I1IIlIIllIl.RefreshSignal = nil
                    end
                    return
                end
                III1IIllllI += III1IIIlll1 or 0
                if III1IIllllI < llllll11l1I then
                    return
                end
                III1IIllllI = 0
                local Ill1llIII1l, lllIlllII11 = pcall(ll111lII11l.OptionsProvider)
                if Ill1llIII1l and typeof(lllIlllII11) == "table" then
                    ll111lII11l.Values = lllIlllII11
                    if not ll111lII11l.Multi then
                        ll111lII11l.Default = I11l1I11lI1(ll111lII11l.Default)
                        llIII111l1I.Text = Neverlose.ParseDropdown(ll111lII11l.Default)
                    end
                    I1IIlIIllIl:Generate()
                end
            end
            ))
        end
        function I1IIlIIllIl:GetValue()
            return ll111lII11l.Default
        end
        function I1IIlIIllIl:SetValue(III1IlII1I1)
            ll111lII11l.Default = ll111lII11l.Multi and Il111lIl11l(III1IlII1I1) or I11l1I11lI1(III1IlII1I1)
            llIII111l1I.Text = Neverlose.ParseDropdown(ll111lII11l.Default)
            for I11lIIll1l1, IlI111l1Il1 in next, I1IIlIIllIl.Refuse do
                task.spawn(IlI111l1Il1)
            end
            if IIllI1ll11I(ll111lII11l.Default) then
                Neverlose:FireCallback(ll111lII11l.Callback, ll111lII11l.Name, ll111lII11l.Default)
            end
            return I1IIlIIllIl
        end
        function I1IIlIIllIl:SetValues(IIllI11lI11)
            ll111lII11l.Values = IIllI11lI11 or {}
            if not ll111lII11l.Multi then
                ll111lII11l.Default = I11l1I11lI1(ll111lII11l.Default)
                llIII111l1I.Text = Neverlose.ParseDropdown(ll111lII11l.Default)
            end
            if not ll111lII11l.AutoUpdate then
                I1IIlIIllIl:Generate()
            end
            return I1IIlIIllIl
        end
        function I1IIlIIllIl:SetDisabledOptions(lIIl1I1l1lI)
            ll111lII11l.DisabledOptions = lIIl1I1l1lI or {}
            I1lI1IIIlIl = Ill1ll11lI1(ll111lII11l.DisabledOptions)
            I1IIlIIllIl:Generate()
            return I1IIlIIllIl
        end
        function I1IIlIIllIl:AddDisabledOptions(IlllI1llIlI)
            local lIl1I1IIll1 = Ill1ll11lI1(IlllI1llIlI)
            for lllIl1Ill1l, Il1l111l1Il in next, lIl1I1IIll1 do
                I1lI1IIIlIl[lllIl1Ill1l] = true
            end
            ll111lII11l.DisabledOptions = I1lI1IIIlIl
            I1IIlIIllIl:Generate()
            return I1IIlIIllIl
        end
        function I1IIlIIllIl:RemoveDisabledOptions(IIl1IIIlIlI)
            local l1lIII1I1ll = Ill1ll11lI1(IIl1IIIlIlI)
            for lII11II1111, lIl1Il11lI1 in next, l1lIII1I1ll do
                I1lI1IIIlIl[lII11II1111] = nil
            end
            ll111lII11l.DisabledOptions = I1lI1IIIlIl
            I1IIlIIllIl:Generate()
            return I1IIlIIllIl
        end
        function I1IIlIIllIl:SetOptionsIcon(lIl1llII1l1)
            ll111lII11l.OptionsIcon = lIl1llII1l1 or {}
            IIl1II1II11 = III11lIl11I(ll111lII11l.OptionsIcon)
            I1IIlIIllIl:Generate()
            return I1IIlIIllIl
        end
        function I1IIlIIllIl:AddOptionsIcon(I1l1llI1IIl, llI1II1IIlI)
            ll111lII11l.OptionsIcon = ll111lII11l.OptionsIcon or {}
            ll111lII11l.OptionsIcon[tostring(I1l1llI1IIl)] = llI1II1IIlI
            IIl1II1II11 = III11lIl11I(ll111lII11l.OptionsIcon)
            I1IIlIIllIl:Generate()
            return I1IIlIIllIl
        end
        function I1IIlIIllIl:AddValue(lII11lIl11I)
            table.insert(ll111lII11l.Values, lII11lIl11I)
            I1IIlIIllIl:Generate()
            return I1IIlIIllIl
        end
        function I1IIlIIllIl:RemoveValue(Il1l1lI1l11)
            for II1llII1llI = #ll111lII11l.Values, 1, - 1 do
                if ll111lII11l.Values[II1llII1llI] == Il1l1lI1l11 then
                    table.remove(ll111lII11l.Values, II1llII1llI)
                end
            end
            if typeof(ll111lII11l.Default) == "table" then
                ll111lII11l.Default[Il1l1lI1l11] = nil
            elseif ll111lII11l.Default == Il1l1lI1l11 then
                ll111lII11l.Default = nil
            end
            llIII111l1I.Text = Neverlose.ParseDropdown(ll111lII11l.Default)
            I1IIlIIllIl:Generate()
            return I1IIlIIllIl
        end
        function I1IIlIIllIl:Clear()
            ll111lII11l.Default = ll111lII11l.Multi and {} or nil
            llIII111l1I.Text = Neverlose.ParseDropdown(ll111lII11l.Default)
            for llIIl11l1Il, Il11l1II11I in next, I1IIlIIllIl.Refuse do
                task.spawn(Il11l1II11I)
            end
            if IIllI1ll11I(ll111lII11l.Default) then
                Neverlose:FireCallback(ll111lII11l.Callback, ll111lII11l.Name, ll111lII11l.Default)
            end
            return I1IIlIIllIl
        end
        function I1IIlIIllIl:Select(II1l11lII1I)
            if ll111lII11l.Multi then
                ll111lII11l.Default = Neverlose.ProcessDropdown(ll111lII11l.Default)
                ll111lII11l.Default[II1l11lII1I] = true
                I1IIlIIllIl:SetValue(ll111lII11l.Default)
            else
                I1IIlIIllIl:SetValue(II1l11lII1I)
            end
            return I1IIlIIllIl
        end
        function I1IIlIIllIl:Unselect(I1l11Il1lII)
            if ll111lII11l.Multi then
                ll111lII11l.Default = Neverlose.ProcessDropdown(ll111lII11l.Default)
                ll111lII11l.Default[I1l11Il1lII] = nil
                I1IIlIIllIl:SetValue(ll111lII11l.Default)
            elseif ll111lII11l.Default == I1l11Il1lII then
                I1IIlIIllIl:Clear()
            end
            return I1IIlIIllIl
        end
        function I1IIlIIllIl:IsSelected(II1Ill11l1I)
            return I1IIlIIllIl.IsMatch(II1Ill11l1I) == true
        end
        function I1IIlIIllIl:SetCallback(II1l11IlI1I)
            ll111lII11l.Callback = II1l11IlI1I or lIIlIlII11I
            return I1IIlIIllIl
        end
        function I1IIlIIllIl:SetSearch(II1l1I11IIl)
            ll111lII11l.Search = II1l1I11IIl == true
            if I1IIlIIllIl.ApplySearch then
                I1IIlIIllIl.ApplySearch()
            end
            return I1IIlIIllIl
        end
        function I1IIlIIllIl:Open()
            I1IIlIIllIl.SetFrameRender( true )
            return I1IIlIIllIl
        end
        function I1IIlIIllIl:Close()
            I1IIlIIllIl.SetFrameRender( false )
            return I1IIlIIllIl
        end
        function I1IIlIIllIl:SetEnabled(I111l1I111l)
            lII1l1IllIl.Visible = I111l1I111l ~= false
            return I1IIlIIllIl
        end
        if ll111lII11l.Flag then
            Neverlose:RegisterFlag(ll111lII11l.Flag, I1IIlIIllIl)
        end
        return wrapCaseInsensitive(I1IIlIIllIl)
    end
    return wrapCaseInsensitive(IlIIIll11l1)
end
Neverlose.ProcessDropdown = ( function (Il1ll111l1l)
    if typeof(Il1ll111l1l) == "table" then
        local IlIII1lIlI1 ={}
        for IIll1I1Illl, l1I1l1IIlII in next, Il1ll111l1l do
            if typeof(l1I1l1IIlII) == "boolean" and typeof(IIll1I1Illl) ~= "number" then
                IlIII1lIlI1[IIll1I1Illl] = l1I1l1IIlII
            else
                IlIII1lIlI1[l1I1l1IIlII] = true
            end
        end
        return IlIII1lIlI1
    else
        return Il1ll111l1l
    end
end
)
Neverlose.ParseDropdown = ( function (l1lI1Il1l1I)
    if not l1lI1Il1l1I then
        return "Select"
    end
    local l1lI1lllIlI
    if typeof(l1lI1Il1l1I) == "table" then
        if #l1lI1Il1l1I > 0 then
            local lIIl11Illll ={}
            for I1IIlI1l1ll, lI1l1IllIII in next, l1lI1Il1l1I do
                table.insert(lIIl11Illll, tostring(lI1l1IllIII))
            end
            l1lI1lllIlI = table.concat(lIIl11Illll, " , ")
            table.clear(lIIl11Illll)
        else
            local IlIll11lIII ={}
            for IIIllII1I1I, l1I1llIlIII in next, l1lI1Il1l1I do
                if l1I1llIlIII == true then
                    table.insert(IlIll11lIII, tostring(IIIllII1I1I))
                end
            end
            l1lI1lllIlI = table.concat(IlIll11lIII, " , ")
            table.clear(IlIll11lIII) if not l1lI1lllIlI:byte() then
                l1lI1lllIlI = "Select"
            end
        end
    else
        l1lI1lllIlI = tostring(l1lI1Il1l1I or "Select")
    end
    return l1lI1lllIlI
end
)
function Neverlose:ParseInput(IlI1I11Il1I, II1IIlllIIl)
    if not IlI1I11Il1I then
        return (II1IIlllIIl and nil ) or ""
    end
    if II1IIlllIIl then
        local lIIIll11lIl = string.gsub(tostring(IlI1I11Il1I), "[^0-9.%-]", "") if tonumber(lIIIll11lIl) then
            return tonumber(lIIIll11lIl)
        end
        return nil
    end
    return IlI1I11Il1I
end
function Neverlose:CreateToolTips(I1llIIlIlll, Il1l111lI1l, lIIll1Il1l1)
    local Il1IIlllIII = Instance.new("Frame") local lI111ll11I1 = Instance.new("UICorner") local IlIII1llI1l = Instance.new("UIStroke") local Il1l1IlI1l1 = Instance.new("TextLabel") local IIl1IlIl1II = Instance.new("TextLabel") local I11111I1ll1 = Neverlose:CreateShadow(Il1IIlllIII)
    Il1IIlllIII.Name = Neverlose.RandomString()
    Il1IIlllIII.BackgroundColor3 = Color3.fromRGB(20, 22, 27)Il1IIlllIII.BackgroundTransparency = 0.075 Il1IIlllIII.BorderColor3 = Color3.fromRGB(0, 0, 0)Il1IIlllIII.BorderSizePixel = 0 Il1IIlllIII.ClipsDescendants = true Il1IIlllIII.Position = UDim2.new(255, 255, 255, 255)Il1IIlllIII.Size = UDim2.new(0, 0, 0, 0)Il1IIlllIII.ZIndex = 130 lI111ll11I1.CornerRadius = UDim.new(0, 10)lI111ll11I1.Parent = Il1IIlllIII IlIII1llI1l.Transparency = 0.650 IlIII1llI1l.Color = Color3.fromRGB(45, 48, 58)IlIII1llI1l.Parent = Il1IIlllIII Il1l1IlI1l1.Name = Neverlose.RandomString()
    Il1l1IlI1l1.Parent = Il1IIlllIII Il1l1IlI1l1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)Il1l1IlI1l1.BackgroundTransparency = 1.000 Il1l1IlI1l1.BorderColor3 = Color3.fromRGB(0, 0, 0)Il1l1IlI1l1.BorderSizePixel = 0 Il1l1IlI1l1.Position = UDim2.new(0, 15, 0, 5)Il1l1IlI1l1.Size = UDim2.new(0, 1, 0, 20)Il1l1IlI1l1.ZIndex = 132 Il1l1IlI1l1.Font = Enum.Font.GothamBold Il1l1IlI1l1.Text = Il1l111lI1l Il1l1IlI1l1.TextColor3 = Color3.fromRGB(255, 255, 255)Il1l1IlI1l1.TextSize = 15.000 Il1l1IlI1l1.TextXAlignment = Enum.TextXAlignment.Left IIl1IlIl1II.Name = Neverlose.RandomString()
    IIl1IlIl1II.Parent = Il1IIlllIII IIl1IlIl1II.BackgroundColor3 = Color3.fromRGB(255, 255, 255)IIl1IlIl1II.BackgroundTransparency = 1.000 IIl1IlIl1II.BorderColor3 = Color3.fromRGB(0, 0, 0)IIl1IlIl1II.BorderSizePixel = 0 IIl1IlIl1II.Position = UDim2.new(0, 15, 0, 30)IIl1IlIl1II.Size = UDim2.new(0, 1, 0, 15)IIl1IlIl1II.ZIndex = 132 IIl1IlIl1II.Font = Enum.Font.GothamBold IIl1IlIl1II.Text = lIIll1Il1l1 IIl1IlIl1II.TextColor3 = Color3.fromRGB(255, 255, 255)IIl1IlIl1II.TextSize = 12.000 IIl1IlIl1II.TextTransparency = 0.650 IIl1IlIl1II.TextXAlignment = Enum.TextXAlignment.Left IIl1IlIl1II.TextYAlignment = Enum.TextYAlignment.Top local ll11I1l1I1I ={}
    ll11I1l1I1I.Update = ( function ()
        local IIlIl11IIIl = TextService:GetTextSize(Il1l1IlI1l1.Text, Il1l1IlI1l1.TextSize, Il1l1IlI1l1.Font, Vector2.new(math.huge, math.huge))
        local ll1llll11I1 = TextService:GetTextSize(IIl1IlIl1II.Text, IIl1IlIl1II.TextSize, IIl1IlIl1II.Font, Vector2.new(math.huge, math.huge))
        local IIII1llIlI1 = math.max(IIlIl11IIIl.X, ll1llll11I1.X) + 65
        local lI1I11Il111 = IIlIl11IIIl.Y + ll1llll11I1.Y + 30
        Neverlose.PlayAnimate(Il1IIlllIII, TweenInfo0175, {
            Size = UDim2.new(0, IIII1llIlI1, 0, lI1I11Il111)
        })
    end
    )Neverlose:AddSignal(Il1IIlllIII:GetPropertyChangedSignal("BackgroundTransparency"):Connect(( function ()
        if Il1IIlllIII.BackgroundTransparency > 0.9 then
            Il1IIlllIII.Visible = false
            Il1IIlllIII.Parent = nil
        else
            Il1IIlllIII.Visible = true
            if Neverlose.Global3DRenderMode then
                Il1IIlllIII.Parent = Neverlose.GlobalSurfaceGui
            else
                Il1IIlllIII.Parent = Neverlose.ScreenGui
            end
        end
    end
    )))
    ll11I1l1I1I.SetRender = ( function (IlI1lII1111)
        if IlI1lII1111 then
            Il1IIlllIII.Position = UDim2.fromOffset(I1llIIlIlll.AbsolutePosition.X + I1llIIlIlll.AbsoluteSize.X, I1llIIlIlll.AbsolutePosition.Y + (I1llIIlIlll.AbsoluteSize.Y + 25))
            Neverlose.PlayAnimate(Il1IIlllIII, TweenInfo0175, {
                BackgroundTransparency = 0.075
            })Neverlose.PlayAnimate(IlIII1llI1l, TweenInfo0175, {
                Transparency = 0.650
            })Neverlose.PlayAnimate(Il1l1IlI1l1, TweenInfo0175, {
                TextTransparency = 0
            })Neverlose.PlayAnimate(IIl1IlIl1II, TweenInfo0175, {
                TextTransparency = 0.650
            })ll11I1l1I1I.Update()
            I11111I1ll1:Render( true )
        else
            Neverlose.PlayAnimate(Il1IIlllIII, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(IlIII1llI1l, TweenInfo0175, {
                Transparency = 1
            })Neverlose.PlayAnimate(Il1l1IlI1l1, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(IIl1IlIl1II, TweenInfo0175, {
                TextTransparency = 1
            })I11111I1ll1:Render( false )
        end
    end
    )
    ll11I1l1I1I.SetRender( false )
    ll11I1l1I1I.Update()
    local I11I1lllII1
    Neverlose:AddSignal(I1llIIlIlll.MouseEnter:Connect(( function ()
        if I11I1lllII1 then
            task.cancel(I11I1lllII1)
            I11I1lllII1 = nil
        end
        I11I1lllII1 = task.delay(1, ll11I1l1I1I.SetRender, true )
    end
    )))
    Neverlose:AddSignal(I1llIIlIlll.MouseLeave:Connect(( function ()
        if I11I1lllII1 then
            task.cancel(I11I1lllII1)
            I11I1lllII1 = nil
        end
        ll11I1l1I1I.SetRender( false )
        ll11I1l1I1I.Update()
    end
    ))) return ll11I1l1I1I
end

-- ====================================================================
-- [15] Section Items (Buttons, Labels, Paragraphs, Images, Codeblocks)
-- ====================================================================
function Neverlose:RegisiterItem(lIIllI1lI1l, l1Illlll11l)
    local I11I1IlI1I1 ={}
    local IIllIlI1lll = lIIllI1lI1l.ZIndex
    function I11I1IlI1I1:AddLabel(llIIIII1lIl, l1lIllI1111)
        local lllIIl1I111 = false
        local l111lIl1l1l = false
        local l11lIlI1llI = false
        if typeof(llIIIII1lIl) == "table" then
            local II11I11lIll = llIIIII1lIl
            llIIIII1lIl = II11I11lIll.Text or II11I11lIll.Name or II11I11lIll.Title or "Label"
            l111lIl1l1l = II11I11lIll.AutomaticSize == true
            l1lIllI1111 = II11I11lIll.Wrap or II11I11lIll.Warp or II11I11lIll.Wrapped or l111lIl1l1l or l1lIllI1111
            lllIIl1I111 = II11I11lIll.RichText
        end
        llIIIII1lIl = tostring(llIIIII1lIl or "Label")
        lllIIl1I111 = lllIIl1I111 == true
        l1lIllI1111 = l1lIllI1111 == true
        local Il1l111l1ll = Instance.new("Frame") local IllIIIIll1I = Instance.new("TextLabel") local IlIl1lI1Il1 = Instance.new("Frame") local l1llIIIIlll = Instance.new("Frame") local lIl1lIl1lIl = Instance.new("UIListLayout") local ll1IlIl1l1l = Instance.new("UICorner")Il1l111l1ll.Name = Neverlose.RandomString()
        Il1l111l1ll.Parent = lIIllI1lI1l Il1l111l1ll.BackgroundColor3 = Color3.fromRGB(25, 27, 33)Il1l111l1ll.BackgroundTransparency = 1.000 Il1l111l1ll.BorderColor3 = Color3.fromRGB(0, 0, 0)Il1l111l1ll.BorderSizePixel = 0 Il1l111l1ll.Size = UDim2.new(1, 0, 0, 30)Il1l111l1ll.ZIndex = IIllIlI1lll + 8 IIlllIIl1II:AddQuery(Il1l111l1ll, llIIIII1lIl)
        IllIIIIll1I.Name = Neverlose.RandomString()
        IllIIIIll1I.Parent = Il1l111l1ll IllIIIIll1I.BackgroundColor3 = Color3.fromRGB(255, 255, 255)IllIIIIll1I.BackgroundTransparency = 1.000 IllIIIIll1I.BorderColor3 = Color3.fromRGB(0, 0, 0)IllIIIIll1I.BorderSizePixel = 0 IllIIIIll1I.ClipsDescendants = true IllIIIIll1I.Position = UDim2.new(0, 11, 0, 6)IllIIIIll1I.Size = UDim2.new(0, 1, 0, 15)IllIIIIll1I.ZIndex = IIllIlI1lll + 9 IllIIIIll1I.Font = Enum.Font.GothamMedium IllIIIIll1I.RichText = lllIIl1I111 IllIIIIll1I.Text = llIIIII1lIl IllIIIIll1I.TextColor3 = Color3.fromRGB(255, 255, 255)IllIIIIll1I.TextSize = 13.000 IllIIIIll1I.TextTransparency = 0.35 IllIIIIll1I.TextTruncate = Enum.TextTruncate.None IllIIIIll1I.TextWrapped = l1lIllI1111 IllIIIIll1I.TextXAlignment = Enum.TextXAlignment.Left IllIIIIll1I.TextYAlignment = (l1lIllI1111 and Enum.TextYAlignment.Top) or Enum.TextYAlignment.Center Neverlose:AddTextGradient(IllIIIIll1I)
        IlIl1lI1Il1.Name = Neverlose.RandomString()
        IlIl1lI1Il1.Parent = Il1l111l1ll IlIl1lI1Il1.AnchorPoint = Vector2.new(0.5, 1)IlIl1lI1Il1.BackgroundColor3 = Color3.fromRGB(45, 48, 58)IlIl1lI1Il1.BackgroundTransparency = 0.650 IlIl1lI1Il1.BorderColor3 = Color3.fromRGB(0, 0, 0)IlIl1lI1Il1.BorderSizePixel = 0 IlIl1lI1Il1.Position = UDim2.new(0.5, 0, 1, 0)IlIl1lI1Il1.Size = UDim2.new(1, - 20, 0, 1)IlIl1lI1Il1.ZIndex = IIllIlI1lll + 11 l1llIIIIlll.Name = Neverlose.RandomString()
        l1llIIIIlll.Parent = Il1l111l1ll l1llIIIIlll.AnchorPoint = Vector2.new(1, 0)l1llIIIIlll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l1llIIIIlll.BackgroundTransparency = 1.000 l1llIIIIlll.BorderColor3 = Color3.fromRGB(0, 0, 0)l1llIIIIlll.BorderSizePixel = 0 l1llIIIIlll.Position = UDim2.new(1, - 11, 0, 2)l1llIIIIlll.Size = UDim2.new(1, - 20, 0, 25)l1llIIIIlll.ZIndex = IIllIlI1lll + 12 lIl1lIl1lIl.Parent = l1llIIIIlll lIl1lIl1lIl.FillDirection = Enum.FillDirection.Horizontal lIl1lIl1lIl.HorizontalAlignment = Enum.HorizontalAlignment.Right lIl1lIl1lIl.SortOrder = Enum.SortOrder.LayoutOrder lIl1lIl1lIl.VerticalAlignment = Enum.VerticalAlignment.Center lIl1lIl1lIl.Padding = UDim.new(0, 5)ll1IlIl1l1l.CornerRadius = UDim.new(0, 10)ll1IlIl1l1l.Parent = Il1l111l1ll local lII111II1ll = ( function ()
            task.defer( function ()
                if not Il1l111l1ll.Parent then
                    return
                end
                local I11llII1lII = Il1l111l1ll.AbsoluteSize.X
                if I11llII1lII <= 0 then
                    return
                end
                local IIIlIIl11ll = math.ceil(lIl1lIl1lIl.AbsoluteContentSize.X)
                local lllIIl1I1l1 = math.max(0, I11llII1lII - 28)
                IIIlIIl11ll = math.clamp(IIIlIIl11ll, 0, lllIIl1I1l1)
                local lII11l111II = math.max(25, lIl1lIl1lIl.AbsoluteContentSize.Y)
                local IlIlIlII1I1 = l11lIlI1llI and math.max(0, I11llII1lII - 22) or math.max(0, I11llII1lII - IIIlIIl11ll - 28)
                local lII1IlII11I = 13
                local IIllIlIIIII = 15
                if l1lIllI1111 then
                    IllIIIIll1I.TextWrapped = true
                    IllIIIIll1I.TextYAlignment = Enum.TextYAlignment.Top
                    if IlIlIlII1I1 > 0 then
                        IIllIlIIIII = math.max(15, TextService:GetTextSize(IllIIIIll1I.Text, lII1IlII11I, IllIIIIll1I.Font, Vector2.new(IlIlIlII1I1, math.huge)).Y)
                    end
                elseif IlIlIlII1I1 > 0 then
                    IllIIIIll1I.TextWrapped = false
                    IllIIIIll1I.TextYAlignment = Enum.TextYAlignment.Center
                    while lII1IlII11I > 9 and TextService:GetTextSize(IllIIIIll1I.Text, lII1IlII11I, IllIIIIll1I.Font, Vector2.new(math.huge, math.huge)).X > IlIlIlII1I1 do
                        lII1IlII11I = lII1IlII11I - 1
                    end
                end
                local IlI11ll1ll1 = l11lIlI1llI and math.max(30, IIllIlIIIII + lII11l111II + 18) or math.max(30, lII11l111II + 5, IIllIlIIIII + 13)
                IllIIIIll1I.TextSize = lII1IlII11I
                IllIIIIll1I.Size = UDim2.new(0, IlIlIlII1I1, 0, IIllIlIIIII)
                if l11lIlI1llI then
                    l1llIIIIlll.AnchorPoint = Vector2.new(0, 0)
                    l1llIIIIlll.Position = UDim2.new(0, 11, 0, IIllIlIIIII + 11)
                    l1llIIIIlll.Size = UDim2.new(1, - 22, 0, lII11l111II)
                else
                    l1llIIIIlll.AnchorPoint = Vector2.new(1, 0)
                    l1llIIIIlll.Size = UDim2.new(0, IIIlIIl11ll, 0, 25)
                    l1llIIIIlll.Position = UDim2.new(1, - 11, 0, math.max(2, math.floor((IlI11ll1ll1 - 25) / 2)))
                end
                Il1l111l1ll.Size = UDim2.new(1, 0, 0, IlI11ll1ll1)
            end
            )
        end
        )
        Neverlose:AddSignal(lIl1lIl1lIl:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(lII111II1ll))
        Neverlose:AddSignal(Il1l111l1ll:GetPropertyChangedSignal("AbsoluteSize"):Connect(lII111II1ll))
        lII111II1ll()
        local Ill1lI1I11I = ( function ()
            lII111II1ll()
        end
        )
        if l1lIllI1111 then
            Ill1lI1I11I()
        end
        local Il1III1II1I = Neverlose:RegisiterHandler(l1llIIIIlll, l1Illlll11l)
        Il1III1II1I.Root = Il1l111l1ll
        Il1III1II1I.SetRender = ( function (ll1ll1II1Il)
            if ll1ll1II1Il then
                Neverlose.PlayAnimate(Il1l111l1ll, TweenInfo0175, {
                    BackgroundTransparency = 1
                })
                Neverlose.PlayAnimate(IllIIIIll1I, TweenInfo0175, {
                    TextTransparency = 0.35
                })Neverlose.PlayAnimate(IlIl1lI1Il1, TweenInfo0175, {
                    BackgroundTransparency = 0.650
                })
            else
                Neverlose.PlayAnimate(Il1l111l1ll, TweenInfo0175, {
                    BackgroundTransparency = 1
                })
                Neverlose.PlayAnimate(IllIIIIll1I, TweenInfo0175, {
                    TextTransparency = 1
                })Neverlose.PlayAnimate(IlIl1lI1Il1, TweenInfo0175, {
                    BackgroundTransparency = 1
                })
            end
        end
        )
        function Il1III1II1I:SetVisible(I11l11lll1I)
            Il1l111l1ll.Visible = I11l11lll1I
            return Il1III1II1I
        end
        Neverlose:AddSignal(Il1l111l1ll.MouseEnter:Connect(( function ()
            Neverlose.PlayAnimate(Il1l111l1ll, TweenInfo0175, {
                BackgroundTransparency = 0.35
            })
            Neverlose.PlayAnimate(IllIIIIll1I, TweenInfo0175, {
                TextTransparency = 0.25
            })
        end
        )))Neverlose:AddSignal(Il1l111l1ll.MouseLeave:Connect(( function ()
            Neverlose.PlayAnimate(Il1l111l1ll, TweenInfo0175, {
                BackgroundTransparency = 1
            })
            Neverlose.PlayAnimate(IllIIIIll1I, TweenInfo0175, {
                TextTransparency = 0.35
            })
        end
        ))) function Il1III1II1I:SetText(I11lI11lI1l)
            local lllIIl1Il1l = IllIIIIll1I.Text
            IllIIIIll1I.Text = tostring(I11lI11lI1l or "")
            lII111II1ll()
            if l1lIllI1111 and lllIIl1Il1l ~= IllIIIIll1I.Text then
                Ill1lI1I11I()
            end
            return Il1III1II1I
        end
        function Il1III1II1I:GetText()
            return IllIIIIll1I.Text
        end
        function Il1III1II1I:SetRichText(I11lIIIlI1l)
            IllIIIIll1I.RichText = I11lIIIlI1l == true
            lII111II1ll()
            return Il1III1II1I
        end
        function Il1III1II1I:GetRichText()
            return IllIIIIll1I.RichText
        end
        function Il1III1II1I:SetWrapped(lIllllII1Il)
            l1lIllI1111 = lIllllII1Il == true
            IllIIIIll1I.TextWrapped = l1lIllI1111
            IllIIIIll1I.TextYAlignment = (l1lIllI1111 and Enum.TextYAlignment.Top) or Enum.TextYAlignment.Center
            lII111II1ll()
            return Il1III1II1I
        end
        function Il1III1II1I:SetAutomaticSize(ll1lll1II1l)
            l111lIl1l1l = ll1lll1II1l == true
            return Il1III1II1I:SetWrapped(l111lIl1l1l)
        end
        function Il1III1II1I:SetStacked(I1lI111I1lI)
            l11lIlI1llI = I1lI111I1lI == true
            lIl1lIl1lIl.HorizontalAlignment = (l11lIlI1llI and Enum.HorizontalAlignment.Left) or Enum.HorizontalAlignment.Right
            lII111II1ll()
            return Il1III1II1I
        end
        function Il1III1II1I:GetStacked()
            return l11lIlI1llI
        end
        function Il1III1II1I:ToolTip(l1I1l111l1l)
            Il1III1II1I.ToolTip = Neverlose:CreateToolTips(Il1l111l1ll, llIIIII1lIl, l1I1l111l1l)
            return Il1III1II1I
        end
        Il1III1II1I.SetRender(l1Illlll11l:GetValue())
        l1Illlll11l:Connect(Il1III1II1I.SetRender)
        return wrapCaseInsensitive(Il1III1II1I)
    end
    function I11I1IlI1I1:AddButton(lI11I1Ill11)
        lI11I1Ill11 = Neverlose:ProcessParams(lI11I1Ill11, {
            Icon = "chevron-large-left", IconPosition = "Left", Name = "Button", Callback = lIIlIlII11I, ToolTip = nil , Locked = false , TextLocked = "Locked",
        })
        local lllIIIIIl11 ={}
        local Il1IIIllllI = Instance.new("Frame") local lll11l1lll1 = Instance.new("TextLabel") local lllI1llI11l = Instance.new("Frame") local ll1111II1lI = Instance.new("UICorner") local l1l1lI11lI1 = Instance.new("ImageLabel")Neverlose:AddQuery(Il1IIIllllI, lI11I1Ill11.Name)
        Il1IIIllllI.Name = Neverlose.RandomString()
        Il1IIIllllI.Parent = lIIllI1lI1l Il1IIIllllI.BackgroundColor3 = Color3.fromRGB(25, 27, 33)Il1IIIllllI.BackgroundTransparency = 1.000 Il1IIIllllI.BorderColor3 = Color3.fromRGB(0, 0, 0)Il1IIIllllI.BorderSizePixel = 0 Il1IIIllllI.Size = UDim2.new(1, 0, 0, 30)Il1IIIllllI.ZIndex = IIllIlI1lll + 8 IIlllIIl1II:AttachLockMethods(lllIIIIIl11, Il1IIIllllI, lI11I1Ill11)
        lll11l1lll1.Name = Neverlose.RandomString()
        lll11l1lll1.Parent = Il1IIIllllI lll11l1lll1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)lll11l1lll1.BackgroundTransparency = 1.000 lll11l1lll1.BorderColor3 = Color3.fromRGB(0, 0, 0)lll11l1lll1.BorderSizePixel = 0 lll11l1lll1.Position = UDim2.new(0, 35, 0, 6)lll11l1lll1.Size = UDim2.new(0, 1, 0, 15)lll11l1lll1.ZIndex = IIllIlI1lll + 9 lll11l1lll1.Font = Enum.Font.GothamMedium lll11l1lll1.Text = lI11I1Ill11.Name
        lll11l1lll1.TextColor3 = Color3.fromRGB(255, 255, 255)lll11l1lll1.TextSize = 13.000 lll11l1lll1.TextTransparency = 0.200 lll11l1lll1.TextXAlignment = Enum.TextXAlignment.Left Neverlose:AddTextGradient(lll11l1lll1)
        lllI1llI11l.Name = Neverlose.RandomString()
        lllI1llI11l.Parent = Il1IIIllllI lllI1llI11l.AnchorPoint = Vector2.new(0.5, 1)lllI1llI11l.BackgroundColor3 = Color3.fromRGB(45, 48, 58)lllI1llI11l.BackgroundTransparency = 0.650 lllI1llI11l.BorderColor3 = Color3.fromRGB(0, 0, 0)lllI1llI11l.BorderSizePixel = 0 lllI1llI11l.Position = UDim2.new(0.5, 0, 1, 0)lllI1llI11l.Size = UDim2.new(1, - 20, 0, 1)lllI1llI11l.ZIndex = IIllIlI1lll + 11 ll1111II1lI.CornerRadius = UDim.new(0, 10)ll1111II1lI.Parent = Il1IIIllllI l1l1lI11lI1.Name = Neverlose.RandomString()
        l1l1lI11lI1.Parent = Il1IIIllllI l1l1lI11lI1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l1l1lI11lI1.BackgroundTransparency = 1.000 l1l1lI11lI1.BorderColor3 = Color3.fromRGB(0, 0, 0)l1l1lI11lI1.BorderSizePixel = 0 l1l1lI11lI1.Position = UDim2.new(0, 11, 0, 5)l1l1lI11lI1.Size = UDim2.new(0, 18, 0, 18)l1l1lI11lI1.ZIndex = IIllIlI1lll + 9 IIlllIIl1II:SetIconMode(l1l1lI11lI1, lI11I1Ill11.Icon)l1l1lI11lI1.ImageColor3 = Color3.fromRGB(223, 223, 223)l1l1lI11lI1.ImageTransparency = 0.250 l1l1lI11lI1.ScaleType = Enum.ScaleType.Fit local function I1l11II1ll1(lIIl11I11lI)
            lIIl11I11lI = string.lower(tostring(lIIl11I11lI or "left"))
            if lIIl11I11lI == "right" then
                return "Right"
            end
            return "Left"
        end
        local function l11IlI1II11()
            lI11I1Ill11.IconPosition = I1l11II1ll1(lI11I1Ill11.IconPosition)
            if lI11I1Ill11.IconPosition == "Right" then
                l1l1lI11lI1.AnchorPoint = Vector2.new(1, 0)
                l1l1lI11lI1.Position = UDim2.new(1, - 11, 0, 5)
                lll11l1lll1.Position = UDim2.new(0, 11, 0, 6)
                lll11l1lll1.Size = UDim2.new(1, - 46, 0, 15)
            else
                l1l1lI11lI1.AnchorPoint = Vector2.new(0, 0)
                l1l1lI11lI1.Position = UDim2.new(0, 11, 0, 5)
                lll11l1lll1.Position = UDim2.new(0, 35, 0, 6)
                lll11l1lll1.Size = UDim2.new(1, - 46, 0, 15)
            end
        end
        l11IlI1II11()
        function lllIIIIIl11:SetText(llI1IIl1lll)
            lll11l1lll1.Text = llI1IIl1lll
            return lllIIIIIl11
        end
        function lllIIIIIl11:SetIcon(IlI1I1l1II1)
            lI11I1Ill11.Icon = IlI1I1l1II1 or lI11I1Ill11.Icon
            Neverlose:SetIconMode(l1l1lI11lI1, lI11I1Ill11.Icon) return lllIIIIIl11
        end
        function lllIIIIIl11:SetIconPosition(l1I111IIl1I)
            lI11I1Ill11.IconPosition = I1l11II1ll1(l1I111IIl1I)
            l11IlI1II11()
            return lllIIIIIl11
        end
        function lllIIIIIl11:GetIconPosition()
            return lI11I1Ill11.IconPosition
        end
        function lllIIIIIl11:SetCallback(lll1lIlIlIl)
            lI11I1Ill11.Callback = lll1lIlIlIl or lIIlIlII11I
            return lllIIIIIl11
        end
        function lllIIIIIl11:Fire(...)
            Neverlose:FireCallback(lI11I1Ill11.Callback, lI11I1Ill11.Name, ...)
            return lllIIIIIl11
        end
        function lllIIIIIl11:Click(...)
            return lllIIIIIl11:Fire(...)
        end
        function lllIIIIIl11:SetVisible(lllIl1Il1lI)
            Il1IIIllllI.Visible = lllIl1Il1lI ~= false
            return lllIIIIIl11
        end
        function lllIIIIIl11:SetIconColor(lI1l1llIl11)
            l1l1lI11lI1.ImageColor3 = lI1l1llIl11 or l1l1lI11lI1.ImageColor3
            return lllIIIIIl11
        end
        function lllIIIIIl11:SetTextColor(I1II1111l1l)
            lll11l1lll1.TextColor3 = I1II1111l1l or lll11l1lll1.TextColor3
            return lllIIIIIl11
        end
        local lI1ll1l1l1l = Neverlose:CreateInput(Il1IIIllllI, ( function ()
            Neverlose:FireCallback(lI11I1Ill11.Callback, lI11I1Ill11.Name)
        end
        ))
        Neverlose:AddSignal(lI1ll1l1l1l.MouseEnter:Connect(( function ()
            Neverlose.PlayAnimate(Il1IIIllllI, TweenInfo0175, {
                BackgroundTransparency = 0.35
            })
        end
        )))Neverlose:AddSignal(lI1ll1l1l1l.MouseLeave:Connect(( function ()
            Neverlose.PlayAnimate(Il1IIIllllI, TweenInfo0175, {
                BackgroundTransparency = 1
            })
        end
        )))lllIIIIIl11.SetRender = ( function (IIIIIlIlI1I)
            if IIIIIlIlI1I then
                Neverlose.PlayAnimate(Il1IIIllllI, TweenInfo0175, {
                    BackgroundTransparency = 1
                })
                Neverlose.PlayAnimate(lll11l1lll1, TweenInfo0175, {
                    TextTransparency = 0.200
                })
                Neverlose.PlayAnimate(lllI1llI11l, TweenInfo0175, {
                    BackgroundTransparency = 0.650
                })
                Neverlose.PlayAnimate(l1l1lI11lI1, TweenInfo0175, {
                    TextTransparency = 0.250
                })
            else
                Neverlose.PlayAnimate(Il1IIIllllI, TweenInfo0175, {
                    BackgroundTransparency = 1
                })
                Neverlose.PlayAnimate(lll11l1lll1, TweenInfo0175, {
                    TextTransparency = 1
                })
                Neverlose.PlayAnimate(lllI1llI11l, TweenInfo0175, {
                    BackgroundTransparency = 1
                })
                Neverlose.PlayAnimate(l1l1lI11lI1, TweenInfo0175, {
                    TextTransparency = 1
                })
            end
        end
        )
        if lI11I1Ill11.ToolTip then
            lllIIIIIl11.ToolTip = Neverlose:CreateToolTips(Il1IIIllllI, lI11I1Ill11.Name, lI11I1Ill11.ToolTip)
        end
        lllIIIIIl11.SetRender(l1Illlll11l:GetValue())l1Illlll11l:Connect(lllIIIIIl11.SetRender)
        return wrapCaseInsensitive(lllIIIIIl11)
    end
    function I11I1IlI1I1:AddParagraph(Illlll1l1lI)
        if typeof(Illlll1l1lI) ~= "table" then
            Illlll1l1lI = {
                Content = tostring(Illlll1l1lI or ""),
            }
        end
        Illlll1l1lI = Neverlose:ProcessParams(Illlll1l1lI, {
            Name = "Information", Content = "", RichText = true , Locked = false , TextLocked = "Locked",
        })
        local II1l1lI1I1l ={}
        local lIIII1lII1l = Instance.new("Frame") local I11I1ll1l11 = Instance.new("TextLabel") local IIIl1I1II1l = Instance.new("TextLabel") local lIl111l111l = Instance.new("Frame") local IIIII1IIlI1 = Instance.new("UICorner")Neverlose:AddQuery(lIIII1lII1l, Illlll1l1lI.Name)
        lIIII1lII1l.Name = Neverlose.RandomString()
        lIIII1lII1l.Parent = lIIllI1lI1l lIIII1lII1l.BackgroundColor3 = Color3.fromRGB(25, 27, 33)lIIII1lII1l.BackgroundTransparency = 1.000 lIIII1lII1l.BorderColor3 = Color3.fromRGB(0, 0, 0)lIIII1lII1l.BorderSizePixel = 0 lIIII1lII1l.ClipsDescendants = true lIIII1lII1l.Size = UDim2.new(1, 0, 0, 58)lIIII1lII1l.ZIndex = IIllIlI1lll + 8 IIlllIIl1II:AttachLockMethods(II1l1lI1I1l, lIIII1lII1l, Illlll1l1lI)
        IIIII1IIlI1.CornerRadius = UDim.new(0, 10)IIIII1IIlI1.Parent = lIIII1lII1l I11I1ll1l11.Name = Neverlose.RandomString()
        I11I1ll1l11.Parent = lIIII1lII1l I11I1ll1l11.BackgroundTransparency = 1.000 I11I1ll1l11.BorderSizePixel = 0 I11I1ll1l11.Position = UDim2.new(0, 11, 0, 7)I11I1ll1l11.Size = UDim2.new(1, - 22, 0, 16)I11I1ll1l11.ZIndex = IIllIlI1lll + 9 I11I1ll1l11.Font = Enum.Font.GothamMedium I11I1ll1l11.RichText = Illlll1l1lI.RichText == true I11I1ll1l11.Text = tostring(Illlll1l1lI.Name)I11I1ll1l11.TextColor3 = Color3.fromRGB(255, 255, 255)I11I1ll1l11.TextSize = 13.000 I11I1ll1l11.TextTransparency = 0.200 I11I1ll1l11.TextXAlignment = Enum.TextXAlignment.Left I11I1ll1l11.TextYAlignment = Enum.TextYAlignment.Top Neverlose:AddTextGradient(I11I1ll1l11)
        IIIl1I1II1l.Name = Neverlose.RandomString()
        IIIl1I1II1l.Parent = lIIII1lII1l IIIl1I1II1l.BackgroundTransparency = 1.000 IIIl1I1II1l.BorderSizePixel = 0 IIIl1I1II1l.Position = UDim2.new(0, 11, 0, 26)IIIl1I1II1l.Size = UDim2.new(1, - 22, 0, 20)IIIl1I1II1l.ZIndex = IIllIlI1lll + 9 IIIl1I1II1l.Font = Enum.Font.GothamMedium IIIl1I1II1l.RichText = Illlll1l1lI.RichText == true IIIl1I1II1l.Text = tostring(Illlll1l1lI.Content)IIIl1I1II1l.TextColor3 = Color3.fromRGB(255, 255, 255)IIIl1I1II1l.TextSize = 12.000 IIIl1I1II1l.TextTransparency = 0.500 IIIl1I1II1l.TextWrapped = true IIIl1I1II1l.TextXAlignment = Enum.TextXAlignment.Left IIIl1I1II1l.TextYAlignment = Enum.TextYAlignment.Top lIl111l111l.Name = Neverlose.RandomString()
        lIl111l111l.Parent = lIIII1lII1l lIl111l111l.AnchorPoint = Vector2.new(0.5, 1)lIl111l111l.BackgroundColor3 = Color3.fromRGB(45, 48, 58)lIl111l111l.BackgroundTransparency = 0.650 lIl111l111l.BorderSizePixel = 0 lIl111l111l.Position = UDim2.new(0.5, 0, 1, 0)lIl111l111l.Size = UDim2.new(1, - 20, 0, 1)lIl111l111l.ZIndex = IIllIlI1lll + 11 local function I1l1I11Il1I()
            local I1IlI1l1II1 = math.max(120, lIIII1lII1l.AbsoluteSize.X - 22)
            local ll11ll1l11l = TextService:GetTextSize(IIIl1I1II1l.Text, IIIl1I1II1l.TextSize, IIIl1I1II1l.Font, Vector2.new(I1IlI1l1II1, math.huge))
            local l1lI1I11Ill = math.max(58, ll11ll1l11l.Y + 38)
            IIIl1I1II1l.Size = UDim2.new(1, - 22, 0, ll11ll1l11l.Y + 4)
            Neverlose.PlayAnimate(lIIII1lII1l, TweenInfo0175, {
                Size = UDim2.new(1, 0, 0, l1lI1I11Ill)
            })
        end
        task.defer(I1l1I11Il1I)
        Neverlose:AddSignal(lIIII1lII1l:GetPropertyChangedSignal("AbsoluteSize"):Connect(I1l1I11Il1I))
        function II1l1lI1I1l:SetName(l1lIlll1I11)
            Illlll1l1lI.Name = tostring(l1lIlll1I11 or "")
            I11I1ll1l11.Text = Illlll1l1lI.Name
            return II1l1lI1I1l
        end
        function II1l1lI1I1l:SetContent(III1IIllI11)
            Illlll1l1lI.Content = tostring(III1IIllI11 or "")
            IIIl1I1II1l.Text = Illlll1l1lI.Content
            I1l1I11Il1I()
            return II1l1lI1I1l
        end
        function II1l1lI1I1l:GetName()
            return Illlll1l1lI.Name
        end
        function II1l1lI1I1l:GetContent()
            return Illlll1l1lI.Content
        end
        function II1l1lI1I1l:SetRichText(l1lll11IlIl)
            Illlll1l1lI.RichText = l1lll11IlIl == true
            I11I1ll1l11.RichText = Illlll1l1lI.RichText
            IIIl1I1II1l.RichText = Illlll1l1lI.RichText
            return II1l1lI1I1l
        end
        function II1l1lI1I1l:GetRichText()
            return Illlll1l1lI.RichText == true
        end
        function II1l1lI1I1l:SetVisible(llIIl1I11II)
            lIIII1lII1l.Visible = llIIl1I11II ~= false
            return II1l1lI1I1l
        end
        II1l1lI1I1l.SetRender = ( function (Il111Il1llI)
            if Il111Il1llI then
                Neverlose.PlayAnimate(I11I1ll1l11, TweenInfo0175, {
                    TextTransparency = 0.200
                })
                Neverlose.PlayAnimate(IIIl1I1II1l, TweenInfo0175, {
                    TextTransparency = 0.500
                })
                Neverlose.PlayAnimate(lIl111l111l, TweenInfo0175, {
                    BackgroundTransparency = 0.650
                })
            else
                Neverlose.PlayAnimate(I11I1ll1l11, TweenInfo0175, {
                    TextTransparency = 1
                })
                Neverlose.PlayAnimate(IIIl1I1II1l, TweenInfo0175, {
                    TextTransparency = 1
                })
                Neverlose.PlayAnimate(lIl111l111l, TweenInfo0175, {
                    BackgroundTransparency = 1
                })
            end
        end
        )
        II1l1lI1I1l.SetRender(l1Illlll11l:GetValue())
        l1Illlll11l:Connect(II1l1lI1I1l.SetRender)
        return wrapCaseInsensitive(II1l1lI1I1l)
    end
    function I11I1IlI1I1:AddImage(lll1I1l1III)
        if typeof(lll1I1l1III) ~= "table" then
            lll1I1l1III = {
                Image = tostring(lll1I1l1III or ""),
            }
        end
        lll1I1l1III = Neverlose:ProcessParams(lll1I1l1III, {
            Name = "Image", Image = "", Size = UDim2.new(1, - 20, 0, 120), Height = nil , ScaleType = Enum.ScaleType.Fit, Color = Color3.fromRGB(255, 255, 255), Transparency = 0, Corner = 6, Locked = false , TextLocked = "Locked",
        })
        local IlIll1I1I1l ={}
        local l1l11IllIll = Instance.new("Frame") local l1111111l1l = Instance.new("UICorner") local ll1l1I11I11 = Instance.new("ImageLabel") local Il1IIlI1llI = Instance.new("UICorner") local lll1lIl1lII = Instance.new("Frame") if lll1I1l1III.Height then
            lll1I1l1III.Size = UDim2.new(1, - 20, 0, tonumber(lll1I1l1III.Height) or 120)
        end
        Neverlose:AddQuery(l1l11IllIll, lll1I1l1III.Name)
        l1l11IllIll.Name = Neverlose.RandomString()
        l1l11IllIll.Parent = lIIllI1lI1l l1l11IllIll.BackgroundColor3 = Color3.fromRGB(25, 27, 33)l1l11IllIll.BackgroundTransparency = 1.000 l1l11IllIll.BorderColor3 = Color3.fromRGB(0, 0, 0)l1l11IllIll.BorderSizePixel = 0 l1l11IllIll.ClipsDescendants = true l1l11IllIll.Size = UDim2.new(1, 0, 0, lll1I1l1III.Size.Y.Offset + 15)l1l11IllIll.ZIndex = IIllIlI1lll + 8 Neverlose:AttachLockMethods(IlIll1I1I1l, l1l11IllIll, lll1I1l1III)
        l1111111l1l.CornerRadius = UDim.new(0, 10)l1111111l1l.Parent = l1l11IllIll ll1l1I11I11.Name = Neverlose.RandomString()
        ll1l1I11I11.Parent = l1l11IllIll ll1l1I11I11.AnchorPoint = Vector2.new(0.5, 0)ll1l1I11I11.BackgroundColor3 = Color3.fromRGB(26, 28, 36)ll1l1I11I11.BackgroundTransparency = 1.000 ll1l1I11I11.BorderColor3 = Color3.fromRGB(0, 0, 0)ll1l1I11I11.BorderSizePixel = 0 ll1l1I11I11.Position = UDim2.new(0.5, 0, 0, 7)ll1l1I11I11.Size = lll1I1l1III.Size ll1l1I11I11.ZIndex = IIllIlI1lll + 9 ll1l1I11I11.ImageColor3 = lll1I1l1III.Color ll1l1I11I11.ImageTransparency = lll1I1l1III.Transparency ll1l1I11I11.ScaleType = lll1I1l1III.ScaleType Neverlose:SetIconMode(ll1l1I11I11, lll1I1l1III.Image)
        ll1l1I11I11.ScaleType = lll1I1l1III.ScaleType
        ll1l1I11I11.ImageColor3 = lll1I1l1III.Color
        ll1l1I11I11.ImageTransparency = lll1I1l1III.Transparency
        local ll1lIl1IlII = ll1l1I11I11:FindFirstChild("ModernIconScale")
        if ll1lIl1IlII then
            ll1lIl1IlII.Scale = 1
        end
        Il1IIlI1llI.CornerRadius = UDim.new(0, lll1I1l1III.Corner)Il1IIlI1llI.Parent = ll1l1I11I11 lll1lIl1lII.Name = Neverlose.RandomString()
        lll1lIl1lII.Parent = l1l11IllIll lll1lIl1lII.AnchorPoint = Vector2.new(0.5, 1)lll1lIl1lII.BackgroundColor3 = Color3.fromRGB(45, 48, 58)lll1lIl1lII.BackgroundTransparency = 0.650 lll1lIl1lII.BorderSizePixel = 0 lll1lIl1lII.Position = UDim2.new(0.5, 0, 1, 0)lll1lIl1lII.Size = UDim2.new(1, - 20, 0, 1)lll1lIl1lII.ZIndex = IIllIlI1lll + 11 local function l1Il1Il1IlI()
            local l11lI1l1Ill = math.max(30, ll1l1I11I11.Size.Y.Offset + 15)
            l1l11IllIll.Size = UDim2.new(1, 0, 0, l11lI1l1Ill)
        end
        function IlIll1I1I1l:SetImage(IIlIIII1I11)
            lll1I1l1III.Image = tostring(IIlIIII1I11 or "")
            Neverlose:SetIconMode(ll1l1I11I11, lll1I1l1III.Image)
            ll1l1I11I11.ScaleType = lll1I1l1III.ScaleType
            ll1l1I11I11.ImageColor3 = lll1I1l1III.Color
            ll1l1I11I11.ImageTransparency = lll1I1l1III.Transparency
            local III1IIIllII = ll1l1I11I11:FindFirstChild("ModernIconScale")
            if III1IIIllII then
                III1IIIllII.Scale = 1
            end
            return IlIll1I1I1l
        end
        function IlIll1I1I1l:GetImage()
            return lll1I1l1III.Image
        end
        function IlIll1I1I1l:SetSize(lI1Illl1Ill)
            if typeof(lI1Illl1Ill) == "UDim2" then
                lll1I1l1III.Size = lI1Illl1Ill
            elseif typeof(lI1Illl1Ill) == "number" then
                lll1I1l1III.Size = UDim2.new(1, - 20, 0, lI1Illl1Ill)
            end
            ll1l1I11I11.Size = lll1I1l1III.Size
            l1Il1Il1IlI()
            return IlIll1I1I1l
        end
        function IlIll1I1I1l:SetHeight(lIIII11IllI)
            return IlIll1I1I1l:SetSize(tonumber(lIIII11IllI) or ll1l1I11I11.Size.Y.Offset)
        end
        function IlIll1I1I1l:SetScaleType(I1I111llIII)
            lll1I1l1III.ScaleType = I1I111llIII or lll1I1l1III.ScaleType
            ll1l1I11I11.ScaleType = lll1I1l1III.ScaleType
            return IlIll1I1I1l
        end
        function IlIll1I1I1l:SetColor(I11l1111l11)
            lll1I1l1III.Color = I11l1111l11 or lll1I1l1III.Color
            ll1l1I11I11.ImageColor3 = lll1I1l1III.Color
            return IlIll1I1I1l
        end
        function IlIll1I1I1l:SetTransparency(ll1I1ll11II)
            lll1I1l1III.Transparency = tonumber(ll1I1ll11II) or lll1I1l1III.Transparency
            ll1l1I11I11.ImageTransparency = lll1I1l1III.Transparency
            return IlIll1I1I1l
        end
        function IlIll1I1I1l:SetVisible(lIII11lIIll)
            l1l11IllIll.Visible = lIII11lIIll ~= false
            return IlIll1I1I1l
        end
        IlIll1I1I1l.SetRender = ( function (Il1I1IIlll1)
            if Il1I1IIlll1 then
                Neverlose.PlayAnimate(ll1l1I11I11, TweenInfo0175, {
                    ImageTransparency = lll1I1l1III.Transparency
                })
                Neverlose.PlayAnimate(lll1lIl1lII, TweenInfo0175, {
                    BackgroundTransparency = 0.650
                })
            else
                Neverlose.PlayAnimate(ll1l1I11I11, TweenInfo0175, {
                    ImageTransparency = 1
                })
                Neverlose.PlayAnimate(lll1lIl1lII, TweenInfo0175, {
                    BackgroundTransparency = 1
                })
            end
        end
        )
        l1Il1Il1IlI()
        IlIll1I1I1l.SetRender(l1Illlll11l:GetValue())
        l1Illlll11l:Connect(IlIll1I1I1l.SetRender)
        return wrapCaseInsensitive(IlIll1I1I1l)
    end
    function I11I1IlI1I1:AddDivider(lI1l1I1I1l1)
        if typeof(lI1l1I1I1l1) ~= "table" then
            lI1l1I1I1l1 = {
                Text = tostring(lI1l1I1I1l1 or ""),
            }
        end
        lI1l1I1I1l1 = Neverlose:ProcessParams(lI1l1I1I1l1, {
            Text = "", Name = nil ,
        })
        local IIl1Il1lllI ={}
        local lllI1111IIl = Instance.new("Frame") local llIl1I1IIII = Instance.new("Frame") local II11lllIl11 = Instance.new("Frame") local lIIl1I11I1l = Instance.new("TextLabel")lllI1111IIl.Name = Neverlose.RandomString()
        lllI1111IIl.Parent = lIIllI1lI1l lllI1111IIl.BackgroundTransparency = 1.000 lllI1111IIl.BorderSizePixel = 0 lllI1111IIl.Size = UDim2.new(1, 0, 0, 22)lllI1111IIl.ZIndex = IIllIlI1lll + 8 llIl1I1IIII.Name = Neverlose.RandomString()
        llIl1I1IIII.Parent = lllI1111IIl llIl1I1IIII.AnchorPoint = Vector2.new(0, 0.5)llIl1I1IIII.BackgroundColor3 = Color3.fromRGB(45, 48, 58)llIl1I1IIII.BackgroundTransparency = 0.650 llIl1I1IIII.BorderSizePixel = 0 llIl1I1IIII.Position = UDim2.new(0, 10, 0.5, 0)llIl1I1IIII.Size = UDim2.new(0.5, - 20, 0, 1)llIl1I1IIII.ZIndex = IIllIlI1lll + 9 lIIl1I11I1l.Name = Neverlose.RandomString()
        lIIl1I11I1l.Parent = lllI1111IIl lIIl1I11I1l.AnchorPoint = Vector2.new(0.5, 0.5)lIIl1I11I1l.BackgroundTransparency = 1.000 lIIl1I11I1l.BorderSizePixel = 0 lIIl1I11I1l.Position = UDim2.fromScale(0.5, 0.5)lIIl1I11I1l.Size = UDim2.new(0, 0, 0, 16)lIIl1I11I1l.ZIndex = IIllIlI1lll + 9 lIIl1I11I1l.Font = Enum.Font.GothamMedium lIIl1I11I1l.Text = tostring(lI1l1I1I1l1.Text or lI1l1I1I1l1.Name or "")lIIl1I11I1l.TextColor3 = Color3.fromRGB(255, 255, 255)lIIl1I11I1l.TextSize = 11.000 lIIl1I11I1l.TextTransparency = 0.500 II11lllIl11.Name = Neverlose.RandomString()
        II11lllIl11.Parent = lllI1111IIl II11lllIl11.AnchorPoint = Vector2.new(1, 0.5)II11lllIl11.BackgroundColor3 = Color3.fromRGB(45, 48, 58)II11lllIl11.BackgroundTransparency = 0.650 II11lllIl11.BorderSizePixel = 0 II11lllIl11.Position = UDim2.new(1, - 10, 0.5, 0)II11lllIl11.Size = UDim2.new(0.5, - 20, 0, 1)II11lllIl11.ZIndex = IIllIlI1lll + 9 local function I111I11llI1()
            local llIIll11III = lIIl1I11I1l.Text
            if llIIll11III == "" then
                lIIl1I11I1l.Visible = false
                llIl1I1IIII.Size = UDim2.new(1, - 20, 0, 1)
                II11lllIl11.Visible = false
                return
            end
            lIIl1I11I1l.Visible = true
            II11lllIl11.Visible = true
            local lIlIll1lIIl = math.max(40, lllI1111IIl.AbsoluteSize.X - 70)
            local lIII1l1lI1I = math.min(TextService:GetTextSize(llIIll11III, lIIl1I11I1l.TextSize, lIIl1I11I1l.Font, Vector2.new(math.huge, math.huge)).X + 16, lIlIll1lIIl)
            lIIl1I11I1l.Size = UDim2.new(0, lIII1l1lI1I, 0, 16)
            llIl1I1IIII.Size = UDim2.new(0.5, - (lIII1l1lI1I / 2) - 12, 0, 1)
            II11lllIl11.Size = UDim2.new(0.5, - (lIII1l1lI1I / 2) - 12, 0, 1)
        end
        function IIl1Il1lllI:SetText(I1IIIl1lIlI)
            lI1l1I1I1l1.Text = tostring(I1IIIl1lIlI or "")
            lIIl1I11I1l.Text = lI1l1I1I1l1.Text
            I111I11llI1()
            return IIl1Il1lllI
        end
        function IIl1Il1lllI:GetText()
            return lIIl1I11I1l.Text
        end
        function IIl1Il1lllI:SetVisible(llIIlllI11I)
            lllI1111IIl.Visible = llIIlllI11I ~= false
            return IIl1Il1lllI
        end
        IIl1Il1lllI.SetRender = ( function (ll1IIlIII1l)
            Neverlose.PlayAnimate(llIl1I1IIII, TweenInfo0175, {
                BackgroundTransparency = ll1IIlIII1l and 0.650 or 1
            })
            Neverlose.PlayAnimate(II11lllIl11, TweenInfo0175, {
                BackgroundTransparency = ll1IIlIII1l and 0.650 or 1
            })
            Neverlose.PlayAnimate(lIIl1I11I1l, TweenInfo0175, {
                TextTransparency = ll1IIlIII1l and 0.500 or 1
            })
        end
        )
        I111I11llI1()
        Neverlose:AddSignal(lllI1111IIl:GetPropertyChangedSignal("AbsoluteSize"):Connect(I111I11llI1))
        IIl1Il1lllI.SetRender(l1Illlll11l:GetValue())
        l1Illlll11l:Connect(IIl1Il1lllI.SetRender)
        return wrapCaseInsensitive(IIl1Il1lllI)
    end
    function I11I1IlI1I1:AddSpacer(IlIII1lIIl1)
        local lI111l1II11 ={}
        local IIIIll1II1l = 8
        if typeof(IlIII1lIIl1) == "table" then
            IIIIll1II1l = tonumber(IlIII1lIIl1.Size or IlIII1lIIl1.Height or IlIII1lIIl1[1]) or IIIIll1II1l
        else
            IIIIll1II1l = tonumber(IlIII1lIIl1) or IIIIll1II1l
        end
        local ll1l1111l1l = Instance.new("Frame")ll1l1111l1l.Name = Neverlose.RandomString()
        ll1l1111l1l.Parent = lIIllI1lI1l ll1l1111l1l.BackgroundTransparency = 1.000 ll1l1111l1l.BorderSizePixel = 0 ll1l1111l1l.Size = UDim2.new(1, 0, 0, IIIIll1II1l)ll1l1111l1l.ZIndex = IIllIlI1lll + 8 function lI111l1II11:SetSize(l111Il111lI)
            IIIIll1II1l = tonumber(l111Il111lI) or IIIIll1II1l
            ll1l1111l1l.Size = UDim2.new(1, 0, 0, IIIIll1II1l)
            return lI111l1II11
        end
        function lI111l1II11:GetSize()
            return IIIIll1II1l
        end
        function lI111l1II11:SetVisible(llll1I11l1l)
            ll1l1111l1l.Visible = llll1I11l1l ~= false
            return lI111l1II11
        end
        lI111l1II11.SetRender = ( function (ll1IIll11II)
            ll1l1111l1l.Visible = ll1IIll11II == true
        end
        )
        lI111l1II11.SetRender(l1Illlll11l:GetValue())
        l1Illlll11l:Connect(lI111l1II11.SetRender)
        return wrapCaseInsensitive(lI111l1II11)
    end
    function I11I1IlI1I1:AddProgressBar(IlIll1I1l1l)
        if typeof(IlIll1I1l1l) ~= "table" then
            IlIll1I1l1l = {
                Value = tonumber(IlIll1I1l1l) or 0,
            }
        end
        IlIll1I1l1l = Neverlose:ProcessParams(IlIll1I1l1l, {
            Name = "Progress", Value = 0, Max = 100, Type = "%", Locked = false , TextLocked = "Locked",
        })
        local lIII1I1lllI ={}
        local III1I111III = Instance.new("Frame") local lIll11l1111 = Instance.new("UICorner") local Illl1l1Il1I = Instance.new("TextLabel") local lIll1I1I1I1 = Instance.new("TextLabel") local II11I1lIlll = Instance.new("Frame") local l1ll1l111Il = Instance.new("UICorner") local l1IllIIlIII = Instance.new("Frame") local l11lllIl1lI = Instance.new("UICorner") local Il1Il1III1I = Instance.new("Frame")Neverlose:AddQuery(III1I111III, IlIll1I1l1l.Name)
        III1I111III.Name = Neverlose.RandomString()
        III1I111III.Parent = lIIllI1lI1l III1I111III.BackgroundColor3 = Color3.fromRGB(25, 27, 33)III1I111III.BackgroundTransparency = 1.000 III1I111III.BorderSizePixel = 0 III1I111III.ClipsDescendants = true III1I111III.Size = UDim2.new(1, 0, 0, 45)III1I111III.ZIndex = IIllIlI1lll + 8 IIlllIIl1II:AttachLockMethods(lIII1I1lllI, III1I111III, IlIll1I1l1l)
        lIll11l1111.CornerRadius = UDim.new(0, 10)lIll11l1111.Parent = III1I111III Illl1l1Il1I.Name = Neverlose.RandomString()
        Illl1l1Il1I.Parent = III1I111III Illl1l1Il1I.BackgroundTransparency = 1.000 Illl1l1Il1I.BorderSizePixel = 0 Illl1l1Il1I.Position = UDim2.new(0, 11, 0, 6)Illl1l1Il1I.Size = UDim2.new(1, - 90, 0, 15)Illl1l1Il1I.ZIndex = IIllIlI1lll + 9 Illl1l1Il1I.Font = Enum.Font.GothamMedium Illl1l1Il1I.Text = tostring(IlIll1I1l1l.Name)Illl1l1Il1I.TextColor3 = Color3.fromRGB(255, 255, 255)Illl1l1Il1I.TextSize = 13.000 Illl1l1Il1I.TextTransparency = 0.250 Illl1l1Il1I.TextXAlignment = Enum.TextXAlignment.Left Neverlose:AddTextGradient(Illl1l1Il1I)
        lIll1I1I1I1.Name = Neverlose.RandomString()
        lIll1I1I1I1.Parent = III1I111III lIll1I1I1I1.BackgroundTransparency = 1.000 lIll1I1I1I1.BorderSizePixel = 0 lIll1I1I1I1.Position = UDim2.new(1, - 80, 0, 6)lIll1I1I1I1.Size = UDim2.new(0, 69, 0, 15)lIll1I1I1I1.ZIndex = IIllIlI1lll + 9 lIll1I1I1I1.Font = Enum.Font.GothamMedium lIll1I1I1I1.TextColor3 = Color3.fromRGB(255, 255, 255)lIll1I1I1I1.TextSize = 12.000 lIll1I1I1I1.TextTransparency = 0.500 lIll1I1I1I1.TextXAlignment = Enum.TextXAlignment.Right II11I1lIlll.Name = Neverlose.RandomString()
        II11I1lIlll.Parent = III1I111III II11I1lIlll.BackgroundColor3 = Color3.fromRGB(26, 28, 36)II11I1lIlll.BorderSizePixel = 0 II11I1lIlll.Position = UDim2.new(0, 11, 0, 27)II11I1lIlll.Size = UDim2.new(1, - 22, 0, 8)II11I1lIlll.ZIndex = IIllIlI1lll + 9 l1ll1l111Il.CornerRadius = UDim.new(1, 0)l1ll1l111Il.Parent = II11I1lIlll l1IllIIlIII.Name = Neverlose.RandomString()
        l1IllIIlIII.Parent = II11I1lIlll l1IllIIlIII.BackgroundColor3 = Neverlose.AccentColor l1IllIIlIII.BorderSizePixel = 0 l1IllIIlIII.Size = UDim2.fromScale(0, 1)l1IllIIlIII.ZIndex = IIllIlI1lll + 10 l11lllIl1lI.CornerRadius = UDim.new(1, 0)l11lllIl1lI.Parent = l1IllIIlIII Il1Il1III1I.Name = Neverlose.RandomString()
        Il1Il1III1I.Parent = III1I111III Il1Il1III1I.AnchorPoint = Vector2.new(0.5, 1)Il1Il1III1I.BackgroundColor3 = Color3.fromRGB(45, 48, 58)Il1Il1III1I.BackgroundTransparency = 0.650 Il1Il1III1I.BorderSizePixel = 0 Il1Il1III1I.Position = UDim2.new(0.5, 0, 1, 0)Il1Il1III1I.Size = UDim2.new(1, - 20, 0, 1)Il1Il1III1I.ZIndex = IIllIlI1lll + 11 local function llIll11Il11()
            local II1I11I1III = math.max(tonumber(IlIll1I1l1l.Max) or 1, 0.0001)
            local IIlIl1IllIl = math.clamp(tonumber(IlIll1I1l1l.Value) or 0, 0, II1I11I1III)
            local I1llllIl1l1 = IIlIl1IllIl / II1I11I1III
            local I1IIl1l1III = Neverlose.Rounding(IIlIl1IllIl, 2)
            local IllIlIIlll1 = Neverlose.Rounding(II1I11I1III, 2)
            if IlIll1I1l1l.Type == "%" then
                lIll1I1I1I1.Text = tostring(Neverlose.Rounding(I1llllIl1l1 * 100, 0)) .. "%"
            else
                lIll1I1I1I1.Text = tostring(I1IIl1l1III) .. "/" .. tostring(IllIlIIlll1) .. tostring(IlIll1I1l1l.Type or "")
            end
            Neverlose.PlayAnimate(l1IllIIlIII, TweenInfo0175, {
                Size = UDim2.fromScale(I1llllIl1l1, 1), BackgroundColor3 = Neverlose.AccentColor
            })
        end
        function lIII1I1lllI:SetValue(Il11I1IIIlI)
            IlIll1I1l1l.Value = tonumber(Il11I1IIIlI) or IlIll1I1l1l.Value
            llIll11Il11()
            return lIII1I1lllI
        end
        function lIII1I1lllI:GetValue()
            return IlIll1I1l1l.Value
        end
        function lIII1I1lllI:SetMax(l1lIlll1lI1)
            IlIll1I1l1l.Max = tonumber(l1lIlll1lI1) or IlIll1I1l1l.Max
            llIll11Il11()
            return lIII1I1lllI
        end
        function lIII1I1lllI:SetText(llI1Il1ll1l)
            IlIll1I1l1l.Name = tostring(llI1Il1ll1l or "")
            Illl1l1Il1I.Text = IlIll1I1l1l.Name
            return lIII1I1lllI
        end
        function lIII1I1lllI:SetType(Il1l1II11I1)
            IlIll1I1l1l.Type = tostring(Il1l1II11I1 or "")
            llIll11Il11()
            return lIII1I1lllI
        end
        function lIII1I1lllI:SetVisible(Il11l1I111l)
            III1I111III.Visible = Il11l1I111l ~= false
            return lIII1I1lllI
        end
        lIII1I1lllI.SetRender = ( function (ll1l1Il1II1)
            Neverlose.PlayAnimate(Illl1l1Il1I, TweenInfo0175, {
                TextTransparency = ll1l1Il1II1 and 0.250 or 1
            })
            Neverlose.PlayAnimate(lIll1I1I1I1, TweenInfo0175, {
                TextTransparency = ll1l1Il1II1 and 0.500 or 1
            })
            Neverlose.PlayAnimate(II11I1lIlll, TweenInfo0175, {
                BackgroundTransparency = ll1l1Il1II1 and 0 or1
            })
            Neverlose.PlayAnimate(l1IllIIlIII, TweenInfo0175, {
                BackgroundTransparency = ll1l1Il1II1 and 0 or 1
            })
            Neverlose.PlayAnimate(Il1Il1III1I, TweenInfo0175, {
                BackgroundTransparency = ll1l1Il1II1 and 0.650 or 1
            })
        end
        )
        llIll11Il11()
        lIII1I1lllI.SetRender(l1Illlll11l:GetValue())
        l1Illlll11l:Connect(lIII1I1lllI.SetRender)
        return wrapCaseInsensitive(lIII1I1lllI)
    end
    function I11I1IlI1I1:AddCodeBlock(l1lI1Ill1ll)
        if typeof(l1lI1Ill1ll) ~= "table" then
            l1lI1Ill1ll = {
                Code = tostring(l1lI1Ill1ll or ""),
            }
        end
        l1lI1Ill1ll = Neverlose:ProcessParams(l1lI1Ill1ll, {
            Name = "Code", Code = "", RichText = false , Copy = true , CopyText = "Copy", Locked = false , TextLocked = "Locked",
        })
        local IllIllII1lI ={}
        local IIl1III1IIl = Instance.new("Frame") local lIIlI1l111l = Instance.new("UICorner") local lIlIllll1Il = Instance.new("TextLabel") local IlI1111Ill1 = Instance.new("UICorner") local Il1lI1IIIlI = Instance.new("UIPadding") local llllII1l1I1 = Instance.new("Frame") local IIlIl111Il1 = Instance.new("UICorner") local I1lIlIl1lIl = Instance.new("UIStroke") local llI1lIIl11I = Instance.new("ImageLabel") local IIIl11ll1ll = Instance.new("Frame")Neverlose:AddQuery(IIl1III1IIl, l1lI1Ill1ll.Name)
        IIl1III1IIl.Name = Neverlose.RandomString()
        IIl1III1IIl.Parent = lIIllI1lI1l IIl1III1IIl.BackgroundColor3 = Color3.fromRGB(25, 27, 33)IIl1III1IIl.BackgroundTransparency = 1.000 IIl1III1IIl.BorderSizePixel = 0 IIl1III1IIl.ClipsDescendants = true IIl1III1IIl.Size = UDim2.new(1, 0, 0, 60)IIl1III1IIl.ZIndex = IIllIlI1lll + 8 IIlllIIl1II:AttachLockMethods(IllIllII1lI, IIl1III1IIl, l1lI1Ill1ll)
        lIIlI1l111l.CornerRadius = UDim.new(0, 10)lIIlI1l111l.Parent = IIl1III1IIl lIlIllll1Il.Name = Neverlose.RandomString()
        lIlIllll1Il.Parent = IIl1III1IIl lIlIllll1Il.BackgroundColor3 = Color3.fromRGB(18, 19, 25)lIlIllll1Il.BackgroundTransparency = 0.150 lIlIllll1Il.BorderSizePixel = 0 lIlIllll1Il.Position = UDim2.new(0, 10, 0, 7)lIlIllll1Il.Size = UDim2.new(1, - 20, 0, 40)lIlIllll1Il.ZIndex = IIllIlI1lll + 9 lIlIllll1Il.Font = Enum.Font.Code lIlIllll1Il.RichText = l1lI1Ill1ll.RichText == true lIlIllll1Il.Text = tostring(l1lI1Ill1ll.Code)lIlIllll1Il.TextColor3 = Color3.fromRGB(235, 235, 235)lIlIllll1Il.TextSize = 12.000 lIlIllll1Il.TextTransparency = 0.200 lIlIllll1Il.TextWrapped = true lIlIllll1Il.TextXAlignment = Enum.TextXAlignment.Left lIlIllll1Il.TextYAlignment = Enum.TextYAlignment.Top IlI1111Ill1.CornerRadius = UDim.new(0, 5)IlI1111Ill1.Parent = lIlIllll1Il Il1lI1IIIlI.PaddingTop = UDim.new(0, 7)Il1lI1IIIlI.PaddingBottom = UDim.new(0, 7)Il1lI1IIIlI.PaddingLeft = UDim.new(0, 7)Il1lI1IIIlI.PaddingRight = UDim.new(0, l1lI1Ill1ll.Copy ~= false and 35 or7)Il1lI1IIIlI.Parent = lIlIllll1Il llllII1l1I1.Name = Neverlose.RandomString()
        llllII1l1I1.Parent = IIl1III1IIl llllII1l1I1.AnchorPoint = Vector2.new(1, 0)llllII1l1I1.BackgroundColor3 = Color3.fromRGB(26, 28, 36)llllII1l1I1.BackgroundTransparency = l1lI1Ill1ll.Copy ~= false and 0.100 or 1 llllII1l1I1.BorderSizePixel = 0 llllII1l1I1.ClipsDescendants = true llllII1l1I1.Position = UDim2.new(1, - 16, 0, 13)llllII1l1I1.Size = UDim2.new(0, 24, 0, 24)llllII1l1I1.Visible = l1lI1Ill1ll.Copy ~= false llllII1l1I1.ZIndex = IIllIlI1lll + 12 IIlIl111Il1.CornerRadius = UDim.new(0, 5)IIlIl111Il1.Parent = llllII1l1I1 I1lIlIl1lIl.Transparency = 0.650 I1lIlIl1lIl.Color = Color3.fromRGB(45, 48, 58)I1lIlIl1lIl.Parent = llllII1l1I1 llI1lIIl11I.Name = Neverlose.RandomString()
        llI1lIIl11I.Parent = llllII1l1I1 llI1lIIl11I.AnchorPoint = Vector2.new(0.5, 0.5)llI1lIIl11I.BackgroundTransparency = 1 llI1lIIl11I.BorderSizePixel = 0 llI1lIIl11I.Position = UDim2.fromScale(0.5, 0.5)llI1lIIl11I.Size = UDim2.new(0, 15, 0, 15)llI1lIIl11I.ZIndex = IIllIlI1lll + 13 llI1lIIl11I.ImageColor3 = Color3.fromRGB(223, 223, 223)llI1lIIl11I.ImageTransparency = 0.250 llI1lIIl11I.ScaleType = Enum.ScaleType.Fit Neverlose:SetIconMode(llI1lIIl11I, "lucide:copy")IIIl11ll1ll.Name = Neverlose.RandomString()
        IIIl11ll1ll.Parent = IIl1III1IIl IIIl11ll1ll.AnchorPoint = Vector2.new(0.5, 1)IIIl11ll1ll.BackgroundColor3 = Color3.fromRGB(45, 48, 58)IIIl11ll1ll.BackgroundTransparency = 0.650 IIIl11ll1ll.BorderSizePixel = 0 IIIl11ll1ll.Position = UDim2.new(0.5, 0, 1, 0)IIIl11ll1ll.Size = UDim2.new(1, - 20, 0, 1)IIIl11ll1ll.ZIndex = IIllIlI1lll + 11 local function IIll1Il1Il1()
            local ll11II1I1II = math.max(120, IIl1III1IIl.AbsoluteSize.X - 32)
            local IlIlIlllI1l = TextService:GetTextSize(lIlIllll1Il.Text, lIlIllll1Il.TextSize, lIlIllll1Il.Font, Vector2.new(ll11II1I1II, math.huge))
            local I1IllI11l11 = math.max(40, IlIlIlllI1l.Y + 14)
            lIlIllll1Il.Size = UDim2.new(1, - 20, 0, I1IllI11l11)
            IIl1III1IIl.Size = UDim2.new(1, 0, 0, I1IllI11l11 + 15)
        end
        local function II11lll1II1()
            return setclipboard or toclipboard or set_clipboard or (syn and syn.write_clipboard) or nil
        end
        function IllIllII1lI:Copy()
            local I111lll1lIl = II11lll1II1()
            if not I111lll1lIl then
                Neverlose:SetIconMode(llI1lIIl11I, "lucide:x")task.delay(0.85, function ()
                    if llI1lIIl11I and llI1lIIl11I.Parent then
                        Neverlose:SetIconMode(llI1lIIl11I, "lucide:copy")
                    end
                end
                ) return false
            end
            local lllIlIIlIII = pcall( function ()
                I111lll1lIl(l1lI1Ill1ll.Code)
            end
            )
            Neverlose:SetIconMode(llI1lIIl11I, lllIlIIlIII and "lucide:check" or "lucide:x")task.delay(0.85, function ()
                if llI1lIIl11I and llI1lIIl11I.Parent then
                    Neverlose:SetIconMode(llI1lIIl11I, "lucide:copy")
                end
            end
            ) return lllIlIIlIII
        end
        function IllIllII1lI:SetCode(I1IllIllIll)
            l1lI1Ill1ll.Code = tostring(I1IllIllIll or "")
            lIlIllll1Il.Text = l1lI1Ill1ll.Code
            IIll1Il1Il1()
            return IllIllII1lI
        end
        function IllIllII1lI:GetCode()
            return l1lI1Ill1ll.Code
        end
        function IllIllII1lI:SetRichText(llIl1lllIII)
            l1lI1Ill1ll.RichText = llIl1lllIII == true
            lIlIllll1Il.RichText = l1lI1Ill1ll.RichText
            return IllIllII1lI
        end
        function IllIllII1lI:SetVisible(II1IIl1IllI)
            IIl1III1IIl.Visible = II1IIl1IllI ~= false
            return IllIllII1lI
        end
        function IllIllII1lI:SetCopyEnabled(II11ll1IlII)
            l1lI1Ill1ll.Copy = II11ll1IlII == true
            llllII1l1I1.Visible = l1lI1Ill1ll.Copy
            Il1lI1IIIlI.PaddingRight = UDim.new(0, l1lI1Ill1ll.Copy and 35 or7)
            return IllIllII1lI
        end
        local II1IlII1lI1 = Neverlose:CreateInput(llllII1l1I1, function ()
            IllIllII1lI:Copy()
        end
        )
        Neverlose:AddSignal(II1IlII1lI1.MouseEnter:Connect( function ()
            Neverlose.PlayAnimate(llllII1l1I1, TweenInfo0175, {
                BackgroundTransparency = 0
            })
            Neverlose.PlayAnimate(llI1lIIl11I, TweenInfo0175, {
                TextTransparency = 0
            })
        end
        ))
        Neverlose:AddSignal(II1IlII1lI1.MouseLeave:Connect( function ()
            Neverlose.PlayAnimate(llllII1l1I1, TweenInfo0175, {
                BackgroundTransparency = 0.100
            })
            Neverlose.PlayAnimate(llI1lIIl11I, TweenInfo0175, {
                TextTransparency = 0.250
            })
        end
        ))
        IllIllII1lI.SetRender = ( function (lI111lI1IlI)
            Neverlose.PlayAnimate(lIlIllll1Il, TweenInfo0175, {
                BackgroundTransparency = lI111lI1IlI and 0.150 or 1, TextTransparency = lI111lI1IlI and 0.200 or 1
            })
            Neverlose.PlayAnimate(llllII1l1I1, TweenInfo0175, {
                BackgroundTransparency = (lI111lI1IlI and l1lI1Ill1ll.Copy) and 0.100 or 1
            })
            Neverlose.PlayAnimate(I1lIlIl1lIl, TweenInfo0175, {
                Transparency = (lI111lI1IlI and l1lI1Ill1ll.Copy) and 0.650 or 1
            })
            Neverlose.PlayAnimate(llI1lIIl11I, TweenInfo0175, {
                TextTransparency = (lI111lI1IlI and l1lI1Ill1ll.Copy) and 0.250 or 1
            })
            Neverlose.PlayAnimate(IIIl11ll1ll, TweenInfo0175, {
                BackgroundTransparency = lI111lI1IlI and 0.650 or 1
            })
        end
        )
        task.defer(IIll1Il1Il1)
        Neverlose:AddSignal(IIl1III1IIl:GetPropertyChangedSignal("AbsoluteSize"):Connect(IIll1Il1Il1))
        IllIllII1lI.SetRender(l1Illlll11l:GetValue())
        l1Illlll11l:Connect(IllIllII1lI.SetRender)
        return wrapCaseInsensitive(IllIllII1lI)
    end
    function I11I1IlI1I1:AddDependencyBox(lIlIIlIlll1)
        if typeof(lIlIIlIlll1) ~= "table" then
            lIlIIlIlll1 = {
                Dependencies = lIlIIlIlll1 and {
                    lIlIIlIlll1
                }
                or {},
            }
        end
        lIlIIlIlll1 = Neverlose:ProcessParams(lIlIIlIlll1, {
            Name = "DependencyBox", Dependencies ={}, Mode = "Visible", Locked = false , TextLocked = "Dependency required",
        })
        local Il1lIlll1II ={}
        local II1Il111lII = Instance.new("Frame") local IllIlII1Ill = Instance.new("UIStroke") local lll11l1I111 = Instance.new("UICorner") local III1l1I111l = Instance.new("Frame") local llIIl1Il1lI = Instance.new("UIListLayout") local I11II1III1l = Neverlose:CreateSignal( false )
        local II1III1I1ll = l1Illlll11l:GetValue() == true
        local l1Il1I1l1ll
        local IlIllIlll1l = 0
        local l1lI1III1lI = string.lower(tostring(lIlIIlIlll1.Mode or "Visible"))
        local IIIII1I1IlI = l1lI1III1lI == "locked" or l1lI1III1lI == "lock"
        local function I1l1l1I1111(II1llIl1lIl)
            if typeof(II1llIl1lIl) == "string" then
                return Neverlose.Flags[II1llIl1lIl] or II1llIl1lIl
            end
            return II1llIl1lIl
        end
        local function l11I1I11IlI(I1ll11lI11l)
            I1ll11lI11l = I1l1l1I1111(I1ll11lI11l)
            if typeof(I1ll11lI11l) == "table" and I1ll11lI11l.GetValue then
                local Il1lII1ll1l, IIIl11lII1I = pcall( function ()
                    return I1ll11lI11l:GetValue()
                end
                )
                if Il1lII1ll1l then
                    return IIIl11lII1I
                end
            end
            return I1ll11lI11l
        end
        local function lIIIIl1l1lI(lIlllIllIlI, l1I1IlI1II1)
            if typeof(l1I1IlI1II1) == "function" then
                local I1llIl1I1I1, ll11lIl1l1l = pcall(l1I1IlI1II1, lIlllIllIlI)
                return I1llIl1I1I1 and ll11lIl1l1l == true
            end
            if l1I1IlI1II1 == nil then
                return lIlllIllIlI == true
            end
            if typeof(lIlllIllIlI) == "table" then
                if typeof(l1I1IlI1II1) == "table" then
                    for I1I1I1IllII, II1lllIl1II in next, l1I1IlI1II1 do
                        if lIlllIllIlI[I1I1I1IllII] ~= II1lllIl1II and lIlllIllIlI[II1lllIl1II] ~= true then
                            return false
                        end
                    end
                    return true
                end
                return lIlllIllIlI[l1I1IlI1II1] == true or table.find(lIlllIllIlI, l1I1IlI1II1) ~= nil
            end
            return lIlllIllIlI == l1I1IlI1II1
        end
        local function IIlIl1lll1l(III1l11111I)
            if typeof(III1l11111I) ~= "table" then
                return l11I1I11IlI(III1l11111I) == true
            end
            local llII1I11lII = III1l11111I.Object or III1l11111I.Element or III1l11111I[1] or III1l11111I.Flag
            local I1111II11Il = III1l11111I.Value
            if I1111II11Il == nil then
                I1111II11Il = III1l11111I.Expected or III1l11111I.Equals or III1l11111I[2]
            end
            return lIIIIl1l1lI(l11I1I11IlI(llII1I11lII), I1111II11Il)
        end
        local function IlllI1111l1()
            local IIIl1I1IIIl = lIlIIlIlll1.Dependencies or {}
            if #IIIl1I1IIIl <= 0 then
                return true
            end
            for llllI1Il111, Il11lI1lIll in ipairs(IIIl1I1IIIl) do
                if not IIlIl1lll1l(Il11lI1lIll) then
                    return false
                end
            end
            return true
        end
        II1Il111lII.Name = Neverlose.RandomString()
        II1Il111lII.Parent = lIIllI1lI1l II1Il111lII.BackgroundColor3 = Color3.fromRGB(20, 22, 27)II1Il111lII.BackgroundTransparency = 0.500 II1Il111lII.BorderSizePixel = 0 II1Il111lII.ClipsDescendants = true II1Il111lII.Size = UDim2.new(1, 0, 0, 0)II1Il111lII.ZIndex = IIllIlI1lll + 8 IIlllIIl1II:AttachLockMethods(Il1lIlll1II, II1Il111lII, {
            Locked = IIIII1I1IlI and not IlllI1111l1() or lIlIIlIlll1.Locked, TextLocked = lIlIIlIlll1.TextLocked,
        })
        lll11l1I111.CornerRadius = UDim.new(0, 10)lll11l1I111.Parent = II1Il111lII IllIlII1Ill.Transparency = 0.650 IllIlII1Ill.Color = Color3.fromRGB(45, 48, 58)IllIlII1Ill.Parent = II1Il111lII III1l1I111l.Name = Neverlose.RandomString()
        III1l1I111l.Parent = II1Il111lII III1l1I111l.AnchorPoint = Vector2.new(0.5, 0)III1l1I111l.BackgroundTransparency = 1.000 III1l1I111l.BorderSizePixel = 0 III1l1I111l.ClipsDescendants = true III1l1I111l.Position = UDim2.new(0.5, 0, 0, 5)III1l1I111l.Size = UDim2.new(1, - 10, 1, - 10)III1l1I111l.ZIndex = IIllIlI1lll + 9 llIIl1Il1lI.Parent = III1l1I111l llIIl1Il1lI.HorizontalAlignment = Enum.HorizontalAlignment.Center llIIl1Il1lI.SortOrder = Enum.SortOrder.LayoutOrder local Il1llI1ll11 = Neverlose:RegisiterItem(III1l1I111l, I11II1III1l)
        local function lII1lIllII1()
            local II1IIIIl1I1 = IlllI1111l1()
            local lIll1llllIl = II1III1I1ll and (IIIII1I1IlI or II1IIIIl1I1)
            local I1lI1l1l1l1 = llIIl1Il1lI.AbsoluteContentSize.Y
            local IIIl11lI11I = (lIll1llllIl and I1lI1l1l1l1 > 0) and (I1lI1l1l1l1 + 10) or 0
            II1Il111lII.Visible = lIll1llllIl
            I11II1III1l:SetValue(II1III1I1ll and (IIIII1I1IlI or II1IIIIl1I1))
            Il1lIlll1II:SetLocked(lIlIIlIlll1.Locked == true or (IIIII1I1IlI and not II1IIIIl1I1))
            Neverlose.PlayAnimate(II1Il111lII, TweenInfoQuint, {
                Size = UDim2.new(1, 0, 0, IIIl11lI11I), BackgroundTransparency = lIll1llllIl and 0.500 or 1,
            })
            Neverlose.PlayAnimate(IllIlII1Ill, TweenInfo0175, {
                Transparency = lIll1llllIl and 0.650 or 1,
            })
            l1Il1I1l1ll = II1IIIIl1I1
        end
        function Il1lIlll1II:SetDependencies(llIIll11l1I)
            lIlIIlIlll1.Dependencies = llIIll11l1I or {}
            lII1lIllII1()
            return Il1lIlll1II
        end
        function Il1lIlll1II:GetDependencies()
            return lIlIIlIlll1.Dependencies
        end
        function Il1lIlll1II:SetMode(Ill11lII111)
            lIlIIlIlll1.Mode = tostring(Ill11lII111 or lIlIIlIlll1.Mode)
            l1lI1III1lI = string.lower(lIlIIlIlll1.Mode)
            IIIII1I1IlI = l1lI1III1lI == "locked" or l1lI1III1lI == "lock"
            lII1lIllII1()
            return Il1lIlll1II
        end
        function Il1lIlll1II:GetValue()
            return IlllI1111l1()
        end
        function Il1lIlll1II:SetVisible(I1IIIlIl1l1)
            II1III1I1ll = I1IIIlIl1l1 ~= false and l1Illlll11l:GetValue() == true
            lII1lIllII1()
            return Il1lIlll1II
        end
        for lII1111Il1I, lI1l111IllI in next, Il1llI1ll11 do
            if Il1lIlll1II[lII1111Il1I] == nil then
                Il1lIlll1II[lII1111Il1I] = lI1l111IllI
            end
        end
        Neverlose:AddSignal(llIIl1Il1lI:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(lII1lIllII1))
        l1Illlll11l:Connect( function (llI11ll1ll1)
            II1III1I1ll = llI11ll1ll1 == true
            lII1lIllII1()
        end
        )
        Neverlose:AddSignal(RunService.RenderStepped:Connect( function (lIIIl1I11l1)
            IlIllIlll1l = IlIllIlll1l + (lIIIl1I11l1 or 0)
            if IlIllIlll1l < 0.1 then
                return
            end
            IlIllIlll1l = 0
            local l111IlIIlll = IlllI1111l1()
            if l111IlIIlll ~= l1Il1I1l1ll then
                lII1lIllII1()
            end
        end
        ))
        lII1lIllII1()
        return wrapCaseInsensitive(Il1lIlll1II)
    end
    function I11I1IlI1I1:AddDependencyGroupbox(IlI11Il1llI)
        if typeof(IlI11Il1llI) ~= "table" then
            IlI11Il1llI = {
                Name = tostring(IlI11Il1llI or "Dependency Groupbox"),
            }
        end
        IlI11Il1llI = Neverlose:ProcessParams(IlI11Il1llI, {
            Name = "Dependency Groupbox", Dependencies ={}, Mode = "Visible", Collapsible = false , Collapsed = false , Locked = false , TextLocked = "Dependency required",
        })
        local I1Il1ll11I1 ={}
        local lI1ll11Il1I = Instance.new("Frame") local l1lI1IIl1II = Instance.new("UICorner") local IIIII1IllIl = Instance.new("UIStroke") local IlI11lIl1l1 = Instance.new("TextLabel") local lIII1I111Il = Instance.new("ImageLabel") local IIl1111IIl1 = Instance.new("Frame") local IlIlIl1I1lI = Instance.new("UIListLayout") local l1llll1IIlI = Neverlose:CreateSignal( false )
        local IIlI1llll1I = l1Illlll11l:GetValue() == true
        local IIl1Il11lI1
        local II11ll11IIl = 0
        local lI1II1lII11 = 28
        local lIIl1l1llll = string.lower(tostring(IlI11Il1llI.Mode or "Visible"))
        local I1Il1I1IlIl = lIIl1l1llll == "locked" or lIIl1l1llll == "lock"
        local ll11lII1l11 = IlI11Il1llI.Collapsible == true
        local l1l1IIllI1l = IlI11Il1llI.Collapsed == true
        local function IllI1l1ll11(IIIlIl1lI1l)
            if typeof(IIIlIl1lI1l) == "string" then
                return Neverlose.Flags[IIIlIl1lI1l] or IIIlIl1lI1l
            end
            return IIIlIl1lI1l
        end
        local function llI11lIlIIl(IlIl1IIllll)
            IlIl1IIllll = IllI1l1ll11(IlIl1IIllll)
            if typeof(IlIl1IIllll) == "table" and IlIl1IIllll.GetValue then
                local I1l1I1Il1l1, l11IIIllI1I = pcall( function ()
                    return IlIl1IIllll:GetValue()
                end
                )
                if I1l1I1Il1l1 then
                    return l11IIIllI1I
                end
            end
            return IlIl1IIllll
        end
        local function IIlllIl1Il1(lIlIll11lI1, llIl11I1III)
            if typeof(llIl11I1III) == "function" then
                local lll1l11IllI, IllII1l11ll = pcall(llIl11I1III, lIlIll11lI1)
                return lll1l11IllI and IllII1l11ll == true
            end
            if llIl11I1III == nil then
                return lIlIll11lI1 == true
            end
            if typeof(lIlIll11lI1) == "table" then
                if typeof(llIl11I1III) == "table" then
                    for III1lI1l1l1, I1l111IlI1I in next, llIl11I1III do
                        if lIlIll11lI1[III1lI1l1l1] ~= I1l111IlI1I and lIlIll11lI1[I1l111IlI1I] ~= true then
                            return false
                        end
                    end
                    return true
                end
                return lIlIll11lI1[llIl11I1III] == true or table.find(lIlIll11lI1, llIl11I1III) ~= nil
            end
            return lIlIll11lI1 == llIl11I1III
        end
        local function II1lI1l1Ill(I111lII111l)
            if typeof(I111lII111l) ~= "table" then
                return llI11lIlIIl(I111lII111l) == true
            end
            local IIIlllII11l = I111lII111l.Object or I111lII111l.Element or I111lII111l[1] or I111lII111l.Flag
            local I11lllllIIl = I111lII111l.Value
            if I11lllllIIl == nil then
                I11lllllIIl = I111lII111l.Expected or I111lII111l.Equals or I111lII111l[2]
            end
            return IIlllIl1Il1(llI11lIlIIl(IIIlllII11l), I11lllllIIl)
        end
        local function lI1I1IlI1II()
            local I111IlIllI1 = IlI11Il1llI.Dependencies or {}
            if #I111IlIllI1 <= 0 then
                return true
            end
            for lI1II11III1, IIlII11IIIl in ipairs(I111IlIllI1) do
                if not II1lI1l1Ill(IIlII11IIIl) then
                    return false
                end
            end
            return true
        end
        lI1ll11Il1I.Name = Neverlose.RandomString()
        lI1ll11Il1I.Parent = lIIllI1lI1l lI1ll11Il1I.BackgroundColor3 = Color3.fromRGB(20, 22, 27)lI1ll11Il1I.BackgroundTransparency = 0.500 lI1ll11Il1I.BorderSizePixel = 0 lI1ll11Il1I.ClipsDescendants = true lI1ll11Il1I.Size = UDim2.new(1, 0, 0, 0)lI1ll11Il1I.ZIndex = IIllIlI1lll + 8 IIlllIIl1II:AttachLockMethods(I1Il1ll11I1, lI1ll11Il1I, {
            Locked = IlI11Il1llI.Locked == true or (I1Il1I1IlIl and not lI1I1IlI1II()), TextLocked = IlI11Il1llI.TextLocked,
        })
        l1lI1IIl1II.CornerRadius = UDim.new(0, 10)l1lI1IIl1II.Parent = lI1ll11Il1I IIIII1IllIl.Transparency = 0.650 IIIII1IllIl.Color = Color3.fromRGB(45, 48, 58)IIIII1IllIl.Parent = lI1ll11Il1I IlI11lIl1l1.Name = Neverlose.RandomString()
        IlI11lIl1l1.Parent = lI1ll11Il1I IlI11lIl1l1.BackgroundTransparency = 1.000 IlI11lIl1l1.BorderSizePixel = 0 IlI11lIl1l1.Position = UDim2.new(0, 11, 0, 7)IlI11lIl1l1.Size = UDim2.new(1, - 45, 0, 16)IlI11lIl1l1.ZIndex = IIllIlI1lll + 10 IlI11lIl1l1.Font = Enum.Font.GothamMedium IlI11lIl1l1.Text = tostring(IlI11Il1llI.Name)IlI11lIl1l1.TextColor3 = Color3.fromRGB(255, 255, 255)IlI11lIl1l1.TextSize = 13.000 IlI11lIl1l1.TextTransparency = 0.200 IlI11lIl1l1.TextXAlignment = Enum.TextXAlignment.Left Neverlose:AddTextGradient(IlI11lIl1l1)
        lIII1I111Il.Name = Neverlose.RandomString()
        lIII1I111Il.Parent = lI1ll11Il1I lIII1I111Il.AnchorPoint = Vector2.new(1, 0)lIII1I111Il.BackgroundTransparency = 1.000 lIII1I111Il.BorderSizePixel = 0 lIII1I111Il.Position = UDim2.new(1, - 8, 0, 2)lIII1I111Il.Size = UDim2.new(0, 22, 0, 22)lIII1I111Il.Visible = ll11lII1l11 lIII1I111Il.ZIndex = IIllIlI1lll + 10 IIlllIIl1II:SetIconMode(lIII1I111Il, "chevron-small-down")lIII1I111Il.ImageColor3 = Color3.fromRGB(223, 223, 223)lIII1I111Il.ImageTransparency = 0.500 lIII1I111Il.ScaleType = Enum.ScaleType.Fit IIl1111IIl1.Name = Neverlose.RandomString()
        IIl1111IIl1.Parent = lI1ll11Il1I IIl1111IIl1.AnchorPoint = Vector2.new(0.5, 0)IIl1111IIl1.BackgroundTransparency = 1.000 IIl1111IIl1.BorderSizePixel = 0 IIl1111IIl1.ClipsDescendants = true IIl1111IIl1.Position = UDim2.new(0.5, 0, 0, lI1II1lII11)IIl1111IIl1.Size = UDim2.new(1, - 10, 1, - lI1II1lII11 - 5)IIl1111IIl1.ZIndex = IIllIlI1lll + 9 IlIlIl1I1lI.Parent = IIl1111IIl1 IlIlIl1I1lI.HorizontalAlignment = Enum.HorizontalAlignment.Center IlIlIl1I1lI.SortOrder = Enum.SortOrder.LayoutOrder local I1Il1l1lIII = Neverlose:RegisiterItem(IIl1111IIl1, l1llll1IIlI)
        local function lIlllIll1ll()
            local lIIll1I1Il1 = lI1I1IlI1II()
            local I1lI11I11Il = IIlI1llll1I and (I1Il1I1IlIl or lIIll1I1Il1)
            local Ill1lll1lIl = I1lI11I11Il and not l1l1IIllI1l
            local l1ll111Il1I = IlIlIl1I1lI.AbsoluteContentSize.Y
            local IIlIlIIIl11 = I1lI11I11Il and lI1II1lII11 or 0
            if Ill1lll1lIl and l1ll111Il1I > 0 then
                IIlIlIIIl11 = l1ll111Il1I + lI1II1lII11 + 5
            end
            lI1ll11Il1I.Visible = I1lI11I11Il
            IIl1111IIl1.Visible = Ill1lll1lIl
            l1llll1IIlI:SetValue(Ill1lll1lIl)
            I1Il1ll11I1:SetLocked(IlI11Il1llI.Locked == true or (I1Il1I1IlIl and not lIIll1I1Il1))
            Neverlose.PlayAnimate(lI1ll11Il1I, TweenInfoQuint, {
                Size = UDim2.new(1, 0, 0, IIlIlIIIl11), BackgroundTransparency = I1lI11I11Il and 0.500 or 1,
            })
            Neverlose.PlayAnimate(IIIII1IllIl, TweenInfo0175, {
                Transparency = I1lI11I11Il and 0.650 or 1,
            })
            Neverlose.PlayAnimate(IlI11lIl1l1, TweenInfo0175, {
                TextTransparency = I1lI11I11Il and 0.200 or 1,
            })
            Neverlose.PlayAnimate(lIII1I111Il, TweenInfo0175, {
                ImageTransparency = (I1lI11I11Il and ll11lII1l11) and 0.500 or 1, Rotation = l1l1IIllI1l and - 90 or 0,
            })
            IIl1Il11lI1 = lIIll1I1Il1
        end
        function I1Il1ll11I1:SetText(l1IlII1I1II)
            IlI11Il1llI.Name = tostring(l1IlII1I1II or "")
            IlI11lIl1l1.Text = IlI11Il1llI.Name
            return I1Il1ll11I1
        end
        function I1Il1ll11I1:GetText()
            return IlI11lIl1l1.Text
        end
        function I1Il1ll11I1:SetDependencies(I1IIII1IIlI)
            IlI11Il1llI.Dependencies = I1IIII1IIlI or {}
            lIlllIll1ll()
            return I1Il1ll11I1
        end
        function I1Il1ll11I1:GetDependencies()
            return IlI11Il1llI.Dependencies
        end
        function I1Il1ll11I1:SetMode(Il1111lIlll)
            IlI11Il1llI.Mode = tostring(Il1111lIlll or IlI11Il1llI.Mode)
            lIIl1l1llll = string.lower(IlI11Il1llI.Mode)
            I1Il1I1IlIl = lIIl1l1llll == "locked" or lIIl1l1llll == "lock"
            lIlllIll1ll()
            return I1Il1ll11I1
        end
        function I1Il1ll11I1:GetValue()
            return lI1I1IlI1II()
        end
        function I1Il1ll11I1:SetCollapsed(IIIl1ll11l1)
            l1l1IIllI1l = IIIl1ll11l1 == true
            IlI11Il1llI.Collapsed = l1l1IIllI1l
            lIlllIll1ll()
            return I1Il1ll11I1
        end
        function I1Il1ll11I1:ToggleCollapsed()
            return I1Il1ll11I1:SetCollapsed( not l1l1IIllI1l)
        end
        function I1Il1ll11I1:GetCollapsed()
            return l1l1IIllI1l
        end
        function I1Il1ll11I1:SetCollapsible(ll11111l1ll)
            ll11lII1l11 = ll11111l1ll == true
            IlI11Il1llI.Collapsible = ll11lII1l11
            lIII1I111Il.Visible = ll11lII1l11
            if not ll11lII1l11 then
                l1l1IIllI1l = false
                IlI11Il1llI.Collapsed = false
            end
            lIlllIll1ll()
            return I1Il1ll11I1
        end
        function I1Il1ll11I1:SetVisible(llIl1l1llIl)
            IIlI1llll1I = llIl1l1llIl ~= false and l1Illlll11l:GetValue() == true
            lIlllIll1ll()
            return I1Il1ll11I1
        end
        for I11IlIlIIlI, llII1l11llI in next, I1Il1l1lIII do
            if I1Il1ll11I1[I11IlIlIIlI] == nil then
                I1Il1ll11I1[I11IlIlIIlI] = llII1l11llI
            end
        end
        if ll11lII1l11 then
            local I1I1l1I1IIl = Neverlose:CreateInput(lI1ll11Il1I, ( function ()
                I1Il1ll11I1:ToggleCollapsed()
            end
            ))
            I1I1l1I1IIl.ZIndex = IIllIlI1lll + 20
            I1I1l1I1IIl.Size = UDim2.new(1, 0, 0, lI1II1lII11)
        end
        Neverlose:AddSignal(IlIlIl1I1lI:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(lIlllIll1ll))
        l1Illlll11l:Connect( function (IIlIII1llI1)
            IIlI1llll1I = IIlIII1llI1 == true
            lIlllIll1ll()
        end
        )
        Neverlose:AddSignal(RunService.RenderStepped:Connect( function (I11l1IlI1I1)
            II11ll11IIl = II11ll11IIl + (I11l1IlI1I1 or 0)
            if II11ll11IIl < 0.1 then
                return
            end
            II11ll11IIl = 0
            local llI11l1lIII = lI1I1IlI1II()
            if llI11l1lIII ~= IIl1Il11lI1 then
                lIlllIll1ll()
            end
        end
        ))
        lIlllIll1ll()
        return wrapCaseInsensitive(I1Il1ll11I1)
    end
    function I11I1IlI1I1:AddUserFrame(I11lIII1lI1, lIlIlIll1I1, l1IlIIl1lI1)
        local lIlIl1I11l1 = Instance.new("Frame") local llI1III1III = Instance.new("TextLabel") local ll11I11llI1 = Instance.new("Frame") local lI1I1I1l1Il = Instance.new("UICorner") local Il1lIII1I1l = Instance.new("ImageLabel") local l11l11lllI1 = Instance.new("UICorner") local l1I11lllllI = Instance.new("TextLabel")lIlIl1I11l1.Name = Neverlose.RandomString()
        lIlIl1I11l1.Parent = lIIllI1lI1l lIlIl1I11l1.BackgroundColor3 = Color3.fromRGB(25, 27, 33)lIlIl1I11l1.BackgroundTransparency = 1.000 lIlIl1I11l1.BorderColor3 = Color3.fromRGB(0, 0, 0)lIlIl1I11l1.BorderSizePixel = 0 lIlIl1I11l1.Size = UDim2.new(1, 0, 0, 60)lIlIl1I11l1.ZIndex = IIllIlI1lll + 8 llI1III1III.Name = Neverlose.RandomString()
        llI1III1III.Parent = lIlIl1I11l1 llI1III1III.BackgroundColor3 = Color3.fromRGB(255, 255, 255)llI1III1III.BackgroundTransparency = 1.000 llI1III1III.BorderColor3 = Color3.fromRGB(0, 0, 0)llI1III1III.BorderSizePixel = 0 llI1III1III.Position = UDim2.new(0, 65, 0, 10)llI1III1III.Size = UDim2.new(1, - 35, 0, 15)llI1III1III.ZIndex = IIllIlI1lll + 9 llI1III1III.Font = Enum.Font.GothamMedium llI1III1III.Text = I11lIII1lI1 or "User"llI1III1III.TextColor3 = Color3.fromRGB(255, 255, 255)llI1III1III.TextSize = 13.000 llI1III1III.TextTransparency = 0.200 llI1III1III.TextXAlignment = Enum.TextXAlignment.Left ll11I11llI1.Name = Neverlose.RandomString()
        ll11I11llI1.Parent = lIlIl1I11l1 ll11I11llI1.AnchorPoint = Vector2.new(0.5, 1)ll11I11llI1.BackgroundColor3 = Color3.fromRGB(45, 48, 58)ll11I11llI1.BackgroundTransparency = 0.650 ll11I11llI1.BorderColor3 = Color3.fromRGB(0, 0, 0)ll11I11llI1.BorderSizePixel = 0 ll11I11llI1.Position = UDim2.new(0.5, 0, 1, 0)ll11I11llI1.Size = UDim2.new(1, - 20, 0, 1)ll11I11llI1.ZIndex = IIllIlI1lll + 11 lI1I1I1l1Il.CornerRadius = UDim.new(0, 10)lI1I1I1l1Il.Parent = lIlIl1I11l1 Il1lIII1I1l.Name = Neverlose.RandomString()
        Il1lIII1I1l.Parent = lIlIl1I11l1 Il1lIII1I1l.BackgroundColor3 = Color3.fromRGB(255, 255, 255)Il1lIII1I1l.BackgroundTransparency = 1.000 Il1lIII1I1l.BorderColor3 = Color3.fromRGB(0, 0, 0)Il1lIII1I1l.BorderSizePixel = 0 Il1lIII1I1l.Position = UDim2.new(0, 10, 0, 5)Il1lIII1I1l.Size = UDim2.new(0, 45, 0, 45)Il1lIII1I1l.ZIndex = IIllIlI1lll + 9 Il1lIII1I1l.Image = lIlIlIll1I1 or "rbxasset://textures/ui/clb_robux_20@3x.png"
        l11l11lllI1.CornerRadius = UDim.new(1, 0)l11l11lllI1.Parent = Il1lIII1I1l l1I11lllllI.Name = Neverlose.RandomString()
        l1I11lllllI.Parent = lIlIl1I11l1 l1I11lllllI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l1I11lllllI.BackgroundTransparency = 1.000 l1I11lllllI.BorderColor3 = Color3.fromRGB(0, 0, 0)l1I11lllllI.BorderSizePixel = 0 l1I11lllllI.Position = UDim2.new(0, 65, 0, 25)l1I11lllllI.Size = UDim2.new(1, - 35, 0, 15)l1I11lllllI.ZIndex = IIllIlI1lll + 9 l1I11lllllI.Font = Enum.Font.GothamMedium l1I11lllllI.Text = l1IlIIl1lI1 or "Never"l1I11lllllI.TextColor3 = Color3.fromRGB(255, 255, 255)l1I11lllllI.TextSize = 13.000 l1I11lllllI.TextTransparency = 0.200 l1I11lllllI.TextXAlignment = Enum.TextXAlignment.Left local I1II1l1lII1 ={}
        I1II1l1lII1.SetRender = ( function (lIl11lI1III)
            if lIl11lI1III then
                Neverlose.PlayAnimate(llI1III1III, TweenInfo0175, {
                    TextTransparency = 0.200
                })Neverlose.PlayAnimate(ll11I11llI1, TweenInfo0175, {
                    BackgroundTransparency = 0.650
                })Neverlose.PlayAnimate(Il1lIII1I1l, TweenInfo0175, {
                    ImageTransparency = 0
                })Neverlose.PlayAnimate(l1I11lllllI, TweenInfo0175, {
                    TextTransparency = 0.200
                })
            else
                Neverlose.PlayAnimate(llI1III1III, TweenInfo0175, {
                    TextTransparency = 1
                })Neverlose.PlayAnimate(ll11I11llI1, TweenInfo0175, {
                    BackgroundTransparency = 1
                })Neverlose.PlayAnimate(Il1lIII1I1l, TweenInfo0175, {
                    ImageTransparency = 1
                })Neverlose.PlayAnimate(l1I11lllllI, TweenInfo0175, {
                    TextTransparency = 1
                })
            end
        end
        )
        I1II1l1lII1.SetRender(l1Illlll11l:GetValue())l1Illlll11l:Connect(I1II1l1lII1.SetRender)
        function I1II1l1lII1:SetUsername(l1l111I1I11)
            llI1III1III.Text = l1l111I1I11 or "User"
        end
        function I1II1l1lII1:SetProfile(Il1lII11111)
            Il1lIII1I1l.Image = Il1lII11111 or "rbxasset://textures/ui/clb_robux_20@3x.png"
        end
        function I1II1l1lII1:SetExpires(l11ll1l1Ill)
            l1I11lllllI.Text = l11ll1l1Ill or "Never"
        end
        return wrapCaseInsensitive(I1II1l1lII1)
    end
    function I11I1IlI1I1:AddCustom(I1I11l1IIII)
        if typeof(I1I11l1IIII) == "function" then
            I1I11l1IIII = {
                Build = I1I11l1IIII,
            }
        end
        I1I11l1IIII = Neverlose:ProcessParams(I1I11l1IIII, {
            Name = "Custom", Height = 120, Build = nil , Background = true , Locked = false , TextLocked = "Locked",
        })
        local Il11l1Il1l1 ={}
        local Il11l1II1lI = Instance.new("Frame") local II11llIIIIl = Instance.new("UICorner") local I11Il11Il11 = Instance.new("Frame") local l1IIl11111l = Instance.new("UICorner") local Il1IllIIl11 = Instance.new("UIStroke") local llll1l1l11l = Instance.new("Frame") local Il111I111Il = IIllIlI1lll + 10
        Neverlose:AddQuery(Il11l1II1lI, tostring(I1I11l1IIII.Name))
        Il11l1II1lI.Name = Neverlose.RandomString()
        Il11l1II1lI.Parent = lIIllI1lI1l Il11l1II1lI.BackgroundTransparency = 1.000 Il11l1II1lI.BorderSizePixel = 0 Il11l1II1lI.ClipsDescendants = true Il11l1II1lI.Size = UDim2.new(1, 0, 0, (tonumber(I1I11l1IIII.Height) or 120) + 15)Il11l1II1lI.ZIndex = IIllIlI1lll + 8 IIlllIIl1II:AttachLockMethods(Il11l1Il1l1, Il11l1II1lI, I1I11l1IIII)
        II11llIIIIl.CornerRadius = UDim.new(0, 10)II11llIIIIl.Parent = Il11l1II1lI I11Il11Il11.Name = Neverlose.RandomString()
        I11Il11Il11.Parent = Il11l1II1lI I11Il11Il11.AnchorPoint = Vector2.new(0.5, 0)I11Il11Il11.BackgroundColor3 = Color3.fromRGB(13, 17, 22)I11Il11Il11.BackgroundTransparency = I1I11l1IIII.Background and 0.200 or 1 I11Il11Il11.BorderSizePixel = 0 I11Il11Il11.ClipsDescendants = true I11Il11Il11.Position = UDim2.new(0.5, 0, 0, 7)I11Il11Il11.Size = UDim2.new(1, - 20, 0, tonumber(I1I11l1IIII.Height) or 120)I11Il11Il11.ZIndex = IIllIlI1lll + 9 l1IIl11111l.CornerRadius = UDim.new(0, 6)l1IIl11111l.Parent = I11Il11Il11 Il1IllIIl11.Color = Color3.fromRGB(45, 48, 58)Il1IllIIl11.Transparency = I1I11l1IIII.Background and 0.650 or 1 Il1IllIIl11.Parent = I11Il11Il11 llll1l1l11l.Name = Neverlose.RandomString()
        llll1l1l11l.Parent = Il11l1II1lI llll1l1l11l.AnchorPoint = Vector2.new(0.5, 1)llll1l1l11l.BackgroundColor3 = Color3.fromRGB(45, 48, 58)llll1l1l11l.BackgroundTransparency = 0.650 llll1l1l11l.BorderSizePixel = 0 llll1l1l11l.Position = UDim2.new(0.5, 0, 1, 0)llll1l1l11l.Size = UDim2.new(1, - 20, 0, 1)llll1l1l11l.ZIndex = IIllIlI1lll + 11 Il11l1Il1l1.Root = Il11l1II1lI
        Il11l1Il1l1.Container = I11Il11Il11
        Il11l1Il1l1.ZIndex = Il111I111Il
        local I1ll1l1lI1l = setmetatable({}, {
            __mode = "k"
        })
        local II111IIII11 = math.max(1, tonumber(I1I11l1IIII.MaxZIndex) or 20)
        local function I1II1lI1l1I(IllII1I1I1l)
            if not IllII1I1I1l:IsA("GuiObject") or I1ll1l1lI1l[IllII1I1I1l] then
                return
            end
            local IIl1III11Il = IllII1I1I1l.ZIndex
            local l1l11lllIIl = false
            local function l1llIIlI1lI()
                l1l11lllIIl = true
                IllII1I1I1l.ZIndex = math.min(IIl1III11Il, II111IIII11) + Il111I111Il - 1
                l1l11lllIIl = false
            end
            local I1lll1II1II = IllII1I1I1l:GetPropertyChangedSignal("ZIndex"):Connect( function ()
                if l1l11lllIIl then
                    return
                end
                IIl1III11Il = IllII1I1I1l.ZIndex
                l1llIIlI1lI()
            end
            )
            I1ll1l1lI1l[IllII1I1I1l] = {
                Conn = I1lll1II1II, Raw = function ()
                    return IIl1III11Il
                end
                , Apply = l1llIIlI1lI
            }
            l1llIIlI1lI()
        end
        Neverlose:AddSignal(I11Il11Il11.DescendantAdded:Connect(I1II1lI1l1I))
        Neverlose:AddSignal(I11Il11Il11.DescendantRemoving:Connect( function (IlI1IlI111I)
            local I1lll1Il11I = I1ll1l1lI1l[IlI1IlI111I]
            if I1lll1Il11I then
                I1ll1l1lI1l[IlI1IlI111I] = nil
                I1lll1Il11I.Conn:Disconnect()
                pcall( function ()
                    IlI1IlI111I.ZIndex = I1lll1Il11I.Raw()
                end
                )
            end
        end
        ))
        for IIl1IllI1Il, lllI11lIIIl in next, I11Il11Il11:GetDescendants() do
            I1II1lI1l1I(lllI11lIIIl)
        end
        function Il11l1Il1l1:Create(III1l1IIIll, lIIllII1llI, l1Illl1llI1)
            local I1IllIlIII1 = Instance.new(III1l1IIIll)
            for lI11lII1Il1, IlII1l1lIIl in next, lIIllII1llI or {} do
                I1IllIlIII1[lI11lII1Il1] = IlII1l1lIIl
            end
            I1IllIlIII1.Parent = l1Illl1llI1 or I11Il11Il11
            return I1IllIlIII1
        end
        function Il11l1Il1l1:GetTheme()
            return Neverlose:GetTheme()
        end
        function Il11l1Il1l1:BindTheme(Il11lIl1I1I, lll111I1III)
            return Neverlose:BindTheme(Il11lIl1I1I, lll111I1III)
        end
        function Il11l1Il1l1:SetMaxZIndex(I11IIlI11Il)
            II111IIII11 = math.max(1, tonumber(I11IIlI11Il) or 20)
            for IIIllI111ll, II1III1111I in next, I1ll1l1lI1l do
                pcall(II1III1111I.Apply)
            end
            return Il11l1Il1l1
        end
        function Il11l1Il1l1:SetHeight(IIlIIllIIIl)
            IIlIIllIIIl = tonumber(IIlIIllIIIl) or I1I11l1IIII.Height
            I1I11l1IIII.Height = IIlIIllIIIl
            I11Il11Il11.Size = UDim2.new(1, - 20, 0, IIlIIllIIIl)
            Il11l1II1lI.Size = UDim2.new(1, 0, 0, IIlIIllIIIl + 15)
            return Il11l1Il1l1
        end
        function Il11l1Il1l1:GetHeight()
            return I1I11l1IIII.Height
        end
        function Il11l1Il1l1:Clear()
            for lIl111l1111, II111llll1I in next, I11Il11Il11:GetChildren() do
                if not II111llll1I:IsA("UICorner") and not II111llll1I:IsA("UIStroke") then
                    II111llll1I:Destroy()
                end
            end
            return Il11l1Il1l1
        end
        function Il11l1Il1l1:SetVisible(I1l1lII11II)
            Il11l1II1lI.Visible = I1l1lII11II ~= false
            return Il11l1Il1l1
        end
        function Il11l1Il1l1:ShowError(l1llIll111I)
            local ll11l1111ll = I11Il11Il11:FindFirstChild("NeverloseCustomError")
            if ll11l1111ll then
                ll11l1111ll:Destroy()
            end
            local I1ll11l1l11 = Instance.new("TextLabel")
            I1ll11l1l11.Name = "NeverloseCustomError"
            I1ll11l1l11.BackgroundTransparency = 1
            I1ll11l1l11.Position = UDim2.new(0, 6, 0, 6)
            I1ll11l1l11.Size = UDim2.new(1, - 12, 1, - 12)
            I1ll11l1l11.Font = Enum.Font.Code
            I1ll11l1l11.TextSize = 11
            I1ll11l1l11.TextColor3 = Color3.fromRGB(255, 90, 90)
            I1ll11l1l11.TextWrapped = true
            I1ll11l1l11.TextXAlignment = Enum.TextXAlignment.Left
            I1ll11l1l11.TextYAlignment = Enum.TextYAlignment.Top
            I1ll11l1l11.Text = "Custom build error:\n" .. string.sub(tostring(l1llIll111I), 1, 400)
            I1ll11l1l11.Parent = I11Il11Il11
            return Il11l1Il1l1
        end
        Il11l1Il1l1.IsReady = false
        local I1IIlI11Il1 ={}
        local function lIll1IlII1l()
            if Il11l1Il1l1.IsReady then
                return
            end
            local ll1Il1IIlIl = I11Il11Il11.AbsoluteSize
            if ll1Il1IIlIl.X > 0 and ll1Il1IIlIl.Y > 0 then
                Il11l1Il1l1.IsReady = true
                local III1IlIIlII = I1IIlI11Il1
                I1IIlI11Il1 ={}
                for I1llIlI11II, I1IlIl1ll1l in ipairs(III1IlIIlII) do
                    task.spawn(I1IlIl1ll1l)
                end
            end
        end
        Neverlose:AddSignal(I11Il11Il11:GetPropertyChangedSignal("AbsoluteSize"):Connect(lIll1IlII1l))
        function Il11l1Il1l1:OnReady(llll1lllI1I)
            if Il11l1Il1l1.IsReady then
                task.spawn(llll1lllI1I, I11Il11Il11, Il11l1Il1l1)
            else
                table.insert(I1IIlI11Il1, function ()
                    llll1lllI1I(I11Il11Il11, Il11l1Il1l1)
                end
                )
            end
            return Il11l1Il1l1
        end
        lIll1IlII1l()
        local function ll1Il1lll11(III11I1lIII)
            local IIIl1lIIIlI, l11IIlllIl1 = Neverlose:FireCallback(III11I1lIII, I1I11l1IIII.Name, I11Il11Il11, Il11l1Il1l1)
            if IIIl1lIIIlI == false then
                Il11l1Il1l1:ShowError(l11IIlllIl1)
            end
            return IIIl1lIIIlI
        end
        function Il11l1Il1l1:Rebuild(I111lIlII1l)
            Il11l1Il1l1:Clear()
            ll1Il1lll11(I111lIlII1l or I1I11l1IIII.Build)
            return Il11l1Il1l1
        end
        Il11l1Il1l1.SetRender = ( function (ll111Il1l1I)
            Neverlose.PlayAnimate(I11Il11Il11, TweenInfo0175, {
                BackgroundTransparency = (ll111Il1l1I and I1I11l1IIII.Background) and 0.200 or 1
            })
            Neverlose.PlayAnimate(Il1IllIIl11, TweenInfo0175, {
                Transparency = (ll111Il1l1I and I1I11l1IIII.Background) and 0.650 or 1
            })
            Neverlose.PlayAnimate(llll1l1l11l, TweenInfo0175, {
                BackgroundTransparency = ll111Il1l1I and 0.650 or 1
            })
        end
        )
        Il11l1Il1l1.SetRender(l1Illlll11l:GetValue())
        l1Illlll11l:Connect(Il11l1Il1l1.SetRender)
        if type(I1I11l1IIII.Build) == "function" then
            if I1I11l1IIII.Deferred == true and not Il11l1Il1l1.IsReady then
                Il11l1Il1l1:OnReady( function ()
                    ll1Il1lll11(I1I11l1IIII.Build)
                end
                )
            else
                local l1Ill1llllI = ll1Il1lll11(I1I11l1IIII.Build)
                if l1Ill1llllI == false and not Il11l1Il1l1.IsReady then
                    Il11l1Il1l1:OnReady( function ()
                        Il11l1Il1l1:Clear()
                        ll1Il1lll11(I1I11l1IIII.Build)
                    end
                    )
                end
            end
        end
        return wrapCaseInsensitive(Il11l1Il1l1)
    end
    function I11I1IlI1I1:AddToggle(II1lIIll1Il)
        if II1lIIll1Il.Name then
            return self:AddLabel(II1lIIll1Il.Name):AddToggle(II1lIIll1Il)
        else
            error("Name is required for AddToggle in sections")
        end
    end
    function I11I1IlI1I1:AddSlider(l1lIlIlI1lI)
        if l1lIlIlI1lI.Name then
            return self:AddLabel(l1lIlIlI1lI.Name):AddSlider(l1lIlIlI1lI)
        else
            error("Name is required for AddSlider in sections")
        end
    end
    function I11I1IlI1I1:AddDropdown(IIllIIl1IIl)
        if IIllIIl1IIl.Name then
            return self:AddLabel(IIllIIl1IIl.Name):AddDropdown(IIllIIl1IIl)
        else
            error("Name is required for AddDropdown in sections")
        end
    end
    function I11I1IlI1I1:AddKeybind(IIIll11llI1)
        if IIIll11llI1.Name then
            return self:AddLabel(IIIll11llI1.Name):AddKeybind(IIIll11llI1)
        else
            error("Name is required for AddKeybind in sections")
        end
    end
    function I11I1IlI1I1:AddColorPicker(l1II1lII11I)
        if l1II1lII11I.Name then
            return self:AddLabel(l1II1lII11I.Name):AddColorPicker(l1II1lII11I)
        else
            error("Name is required for AddColorPicker in sections")
        end
    end
    function I11I1IlI1I1:AddTextInput(lIl1I11llIl)
        if lIl1I11llIl.Name then
            local III1lI11llI = string.lower(tostring(lIl1I11llIl.Type or "TextInput")) == "textarea"
            if III1lI11llI then
                lIl1I11llIl.FullWidth = lIl1I11llIl.FullWidth ~= false
                return self:AddLabel(lIl1I11llIl.Name):SetStacked( true ):AddTextInput(lIl1I11llIl)
            end
            return self:AddLabel(lIl1I11llIl.Name):AddTextInput(lIl1I11llIl)
        else
            error("Name is required for AddTextInput in sections")
        end
    end
    return wrapCaseInsensitive(I11I1IlI1I1)
end

-- ====================================================================
-- [16] Main Window & Tab Management
-- ====================================================================
function Neverlose:CreateWindow(I1l1ll11l1l)
    I1l1ll11l1l = I1l1ll11l1l or {}
    local l1l1I11lI1l = (typeof(I1l1ll11l1l.Config) == "table" and I1l1ll11l1l.Config) or {}
    if I1l1ll11l1l.Title ~= nil and I1l1ll11l1l.Name == nil then
        I1l1ll11l1l.Name = I1l1ll11l1l.Title
    end
    if I1l1ll11l1l.Image ~= nil and I1l1ll11l1l.Logo == nil then
        local lIll11lIll1 = tostring(I1l1ll11l1l.Image)
        I1l1ll11l1l.Logo = (lIll11lIll1:find("rbxassetid://", 1, true ) and lIll11lIll1) or ("rbxassetid://" .. lIll11lIll1)
    end
    if typeof(I1l1ll11l1l.Color) == "Color3" then
        Neverlose.AccentColor = I1l1ll11l1l.Color
    end
    if l1l1I11lI1l.ConfigFolder ~= nil and I1l1ll11l1l.ConfigFolder == nil then
        I1l1ll11l1l.ConfigFolder = l1l1I11lI1l.ConfigFolder
    end
    if l1l1I11lI1l.TextGradient ~= nil and I1l1ll11l1l.TextGradient == nil then
        I1l1ll11l1l.TextGradient = l1l1I11lI1l.TextGradient
    end
    if I1l1ll11l1l.Size == nil then
        I1l1ll11l1l.Size = Neverlose.Scales.Mobile
    end
    I1l1ll11l1l = Neverlose:ProcessParams(I1l1ll11l1l, {
        Logo = Neverlose.GlobalLogo, Name = "NeverloseUI", Content = "Neverlose-UI | Premium", Size = Neverlose.Scales.Mobile, Font = nil , ConfigFolder = "NeverloseConfigs", Uitransparent = nil , ShowUser = true , Search = true , ConfigEnabled = true , TextGradient = true , RunningText = false , NotifyOnCallbackError = false , Loadingscreen = false , Enable3DRenderer = false , Keybind = "RightControl"
    })
    Neverlose:SetTextGradientEnabled(I1l1ll11l1l.TextGradient)
    if I1l1ll11l1l.Font ~= nil then
        Neverlose:SetFont(I1l1ll11l1l.Font)
    end
    I1l1ll11l1l.ConfigFolder = tostring(I1l1ll11l1l.ConfigFolder):gsub("[/\\]+$", "")
    local II1lIl1IIIl = I1l1ll11l1l.KeySystem
    if type(II1lIl1IIIl) == "function" then
        II1lIl1IIIl = {
            Validate = II1lIl1IIIl
        }
    elseif type(II1lIl1IIIl) == "table" and type(II1lIl1IIIl[1]) == "string" and II1lIl1IIIl.Keys == nil then
        II1lIl1IIIl = {
            Keys = II1lIl1IIIl
        }
    elseif type(II1lIl1IIIl) ~= "table" then
        II1lIl1IIIl = nil
    end
    if II1lIl1IIIl then
        Neverlose:SetKeySystem(II1lIl1IIIl)
        if II1lIl1IIIl.Keyless == true then
            Neverlose:_SetKeyVerified( true , "keyless")
        end
    end
    local lI1lI1lIl11 = II1lIl1IIIl ~= nil and II1lIl1IIIl.Enabled ~= false and II1lIl1IIIl.Gate ~= false and not Neverlose.KeyVerified
    local I1IlIl1l1I1 = {
        KeyGateActive = lI1lI1lIl11, Logo = I1l1ll11l1l.Logo, Name = I1l1ll11l1l.Name, Content = I1l1ll11l1l.Content, Size = I1l1ll11l1l.Size, ConfigFolder = I1l1ll11l1l.ConfigFolder, Font = I1l1ll11l1l.Font, Uitransparent = I1l1ll11l1l.Uitransparent, ShowUser = I1l1ll11l1l.ShowUser, SearchEnabled = I1l1ll11l1l.Search, ConfigEnabled = I1l1ll11l1l.ConfigEnabled and I1l1ll11l1l.Config ~= false , RunningText = I1l1ll11l1l.RunningText == true , ConfigAutoSaveFile = l1l1I11lI1l.AutoSaveFile or ( function ()
            local II1l11Il1lI = tostring(I1l1ll11l1l.Name or ""):gsub("[/\\:%*%?\"<>|]", ""):gsub("^%s+", ""):gsub("%s+$", "")
            II1l11Il1lI = string.sub(II1l11Il1lI, 1, 24):gsub("%s+$", "")
            if II1l11Il1lI == "" then
                return "Default"
            end
            return II1l11Il1lI
        end
        )(), ConfigAutoSave = l1l1I11lI1l.AutoSave ~= false , ConfigAutoLoad = l1l1I11lI1l.AutoLoad ~= false , ConfigOverwrite = l1l1I11lI1l.Overwrite ~= false , ConfigEncrypted = l1l1I11lI1l.Encrypted == true or string.lower(tostring(l1l1I11lI1l.Format or "")) == "encoded", ConfigShowAutoSaveToggle = l1l1I11lI1l.ShowAutoSaveToggle == true , ConfigSaveWindowState = l1l1I11lI1l.SaveWindowState == true , Signal = Neverlose:CreateSignal( not lI1lI1lIl11), Tabs ={}, CurrentTab = 1, NotifyOnCallbackError = I1l1ll11l1l.NotifyOnCallbackError == true , Loadingscreen = I1l1ll11l1l.Loadingscreen == true or I1l1ll11l1l.LoadingScreen == true or I1l1ll11l1l.Loading == true , OnDestroyCallbacks ={}, Keybind = I1l1ll11l1l.Keybind, Enable3DRenderer = I1l1ll11l1l.Enable3DRenderer
    }
    do
        local lll11I11ll1 = tostring(l1l1I11lI1l.AutoSaveKey or l1l1I11lI1l.AutoSaveFile or I1l1ll11l1l.Name or "Default")
        lll11I11ll1 = lll11I11ll1:gsub("[%c]", ""):gsub("^%s+", ""):gsub("%s+$", "")
        lll11I11ll1 = string.sub(lll11I11ll1, 1, 64)
        if lll11I11ll1 == "" then
            lll11I11ll1 = "Default"
        end
        I1IlIl1l1I1.AutoSaveKey = lll11I11ll1
    end
    if type(I1l1ll11l1l.OnDestroy) == "function" then
        table.insert(I1IlIl1l1I1.OnDestroyCallbacks, I1l1ll11l1l.OnDestroy)
    end
    Neverlose.GlobalLogo = I1IlIl1l1I1.Logo
    local llIll1ll1lI = Neverlose:CreateLogger()
    if not isfolder(I1IlIl1l1I1.ConfigFolder) then
        makefolder(I1IlIl1l1I1.ConfigFolder)
    end
    local Il1III11I1I = Instance.new("CanvasGroup") local llII1IlllII = Instance.new("UICorner") local Il11Illl11I = Instance.new("Frame") local lI111I111II = Instance.new("Frame") local IlllI1111Il = Instance.new("ImageLabel") local lIlIllI1l11 = Instance.new("UICorner") local l1lIIIII11I = Instance.new("TextLabel") local IIlII11IlI1 = Instance.new("TextLabel") local Il1IlIl1llI = Instance.new("Frame") local I11I11I11II = Instance.new("ScrollingFrame") local I11ll1lI111 = Instance.new("UIListLayout") local IlIlI11II1l = Instance.new("Frame") local llIlIIIlI1l = Instance.new("ImageLabel") local l1l1II1lIIl = Instance.new("UICorner") local llll1I1IIIl = Instance.new("TextLabel") local lllllIlI1Il = Instance.new("TextLabel") local l1IIlIlIIlI = Instance.new("Frame") local l1l11l1lI11 = Instance.new("ImageLabel") local llIIII1lII1 = Instance.new("Frame") local lIIlIIlll1l = Instance.new("UIStroke") local II111IlIIIl = Instance.new("UICorner") local I1Il11llllI = Instance.new("Frame") local IlI1II11l11 = Instance.new("Frame") local II11IIIll11 = Instance.new("Frame") local Il111ll1Ill = Instance.new("UIStroke") local IIIIl11IIlI = Instance.new("UICorner") local IIIlI1I111I = Instance.new("ImageLabel") local IlI1lIlll1l = Instance.new("Frame") local l1lIlII1ll1 = Instance.new("TextLabel") local lIlllllll11 = Instance.new("ImageLabel") local IIIIIIIII11 = Instance.new("Frame") local l111111lIIl = Instance.new("ImageLabel") local l1I11lllI1I = Instance.new("TextBox") local I1llII1I1ll = Instance.new("ImageLabel") local IllllIlIIll = Instance.new("ImageLabel") local IllllII1IIl = Instance.new("Frame")Il1III11I1I.Name = Neverlose.RandomString()
    Il1III11I1I.Parent = Neverlose.ScreenGui
    Il1III11I1I.AnchorPoint = Vector2.new(0.5, 0.5)Il1III11I1I.BackgroundColor3 = Color3.fromRGB(7, 10, 16)Il1III11I1I.BackgroundTransparency = I1IlIl1l1I1.Uitransparent or 0.055 Il1III11I1I.BorderColor3 = Color3.fromRGB(0, 0, 0)Il1III11I1I.BorderSizePixel = 0 Il1III11I1I.ClipsDescendants = true Il1III11I1I.Position = UDim2.new(255, 0, 255, 0)Il1III11I1I.Size = I1IlIl1l1I1.Size Il1III11I1I.Active = true
    I1IlIl1l1I1.Root = Il1III11I1I
    I1IlIl1l1I1._CreatedAt = os.clock()
    local l1IlI1lIIl1 = Instance.new("NumberValue")
    l1IlI1lIIl1.Name = "MinimizeMultiplier"
    l1IlI1lIIl1.Value = 1
    I1IlIl1l1I1._FitValue = Instance.new("NumberValue")
    I1IlIl1l1I1._FitValue.Name = "FitMultiplier"
    I1IlIl1l1I1._FitValue.Value = 1
    local IIl1IIIllII = Instance.new("UIScale")
    IIl1IIIllII.Name = "FitScale"
    IIl1IIIllII.Scale = 1
    IIl1IIIllII.Parent = Il1III11I1I
    I1IlIl1l1I1._ApplyWindowScale = function ()
        IIl1IIIllII.Scale = math.max(I1IlIl1l1I1._FitValue.Value * l1IlI1lIIl1.Value, 0.001)
    end
    l1IlI1lIIl1.Changed:Connect(I1IlIl1l1I1._ApplyWindowScale)
    I1IlIl1l1I1._FitValue.Changed:Connect(I1IlIl1l1I1._ApplyWindowScale)
    function I1IlIl1l1I1:GetFitScale()
        local II1IlIlIlIl = Neverlose.ScreenGui.AbsoluteSize
        local lIIlI1lIIl1 = I1IlIl1l1I1.Size
        local I1llI1IIlII = lIIlI1lIIl1.X.Offset + lIIlI1lIIl1.X.Scale * II1IlIlIlIl.X
        local lII1l1lI1l1 = lIIlI1lIIl1.Y.Offset + lIIlI1lIIl1.Y.Scale * II1IlIlIlIl.Y
        if I1llI1IIlII <= 0 or lII1l1lI1l1 <= 0 or II1IlIlIlIl.X <= 0 or II1IlIlIlIl.Y <= 0 then
            return1
        end
        local lllI11Il11l
        if Neverlose:IsSmallScreen() then
            lllI11Il11l = math.clamp(tonumber(Neverlose.MobileScale) or 0.72, 0.4, 1)
            lllI11Il11l = math.min(lllI11Il11l, (II1IlIlIlIl.X * 0.88) / I1llI1IIlII, (II1IlIlIlIl.Y * 0.82) / lII1l1lI1l1)
        else
            lllI11Il11l = math.min(1, (II1IlIlIlIl.X * 0.96) / I1llI1IIlII, (II1IlIlIlIl.Y * 0.96) / lII1l1lI1l1)
        end
        return math.clamp(lllI11Il11l, 0.35, 1)
    end
    function I1IlIl1l1I1:UpdateFitScale(IIlll1l1111)
        local lllIlI11Il1 = I1IlIl1l1I1:GetFitScale()
        if IIlll1l1111 then
            Neverlose.PlayAnimate(I1IlIl1l1I1._FitValue, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Value = lllIlI11Il1,
            })
        else
            I1IlIl1l1I1._FitValue.Value = lllIlI11Il1
        end
        return I1IlIl1l1I1
    end
    I1IlIl1l1I1:UpdateFitScale( false )
    Neverlose:AddSignal(Neverlose.ScreenGui:GetPropertyChangedSignal("AbsoluteSize"):Connect( function ()
        if not I1IlIl1l1I1.Destroyed then
            I1IlIl1l1I1:UpdateFitScale( true )
        end
    end
    ))
    if type(I1l1ll11l1l) == "table" and type(I1l1ll11l1l.Border) == "table" then
        Neverlose:SetBorder(I1l1ll11l1l.Border)
    end
    local Ill1lllII1I = Neverlose:CreateSpinBorder(Il1III11I1I, {
        Transparency = 1,
    })
    local llIlI11ll1I = Ill1lllII1I.Stroke
    I1IlIl1l1I1.Border = Ill1lllII1I
    function I1IlIl1l1I1:SetBorder(lII11ll1IlI)
        Neverlose:SetBorder(lII11ll1IlI)
        return I1IlIl1l1I1
    end
    if I1IlIl1l1I1.Loadingscreen then
        local l1I1l1IIlIl = Instance.new("Frame") local II1Il11ll11 = Instance.new("Frame") local I11II1I1ll1 = Instance.new("UICorner") local lIIll1II11l = Instance.new("UIStroke") local ll1l11l1IlI = Instance.new("ImageLabel") local IIl1IlII111 = Instance.new("TextLabel") local llIl1l1lIll = Instance.new("TextLabel")l1I1l1IIlIl.Name = Neverlose.RandomString()
        l1I1l1IIlIl.Parent = Neverlose.ScreenGui l1I1l1IIlIl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)l1I1l1IIlIl.BackgroundTransparency = 1 l1I1l1IIlIl.BorderSizePixel = 0 l1I1l1IIlIl.Size = UDim2.fromScale(1, 1)l1I1l1IIlIl.ZIndex = 250 II1Il11ll11.Name = Neverlose.RandomString()
        II1Il11ll11.Parent = l1I1l1IIlIl II1Il11ll11.AnchorPoint = Vector2.new(0.5, 0.5)II1Il11ll11.BackgroundColor3 = Color3.fromRGB(20, 22, 27)II1Il11ll11.BackgroundTransparency = 1 II1Il11ll11.BorderSizePixel = 0 II1Il11ll11.Position = UDim2.fromScale(0.5, 0.5)II1Il11ll11.Size = UDim2.fromOffset(260, 92)II1Il11ll11.ZIndex = 251 I11II1I1ll1.CornerRadius = UDim.new(0, 10)I11II1I1ll1.Parent = II1Il11ll11 lIIll1II11l.Color = Color3.fromRGB(45, 48, 58)lIIll1II11l.Transparency = 1 lIIll1II11l.Parent = II1Il11ll11 ll1l11l1IlI.Name = Neverlose.RandomString()
        ll1l11l1IlI.Parent = II1Il11ll11 ll1l11l1IlI.BackgroundTransparency = 1 ll1l11l1IlI.BorderSizePixel = 0 ll1l11l1IlI.Position = UDim2.new(0, 18, 0.5, - 17)ll1l11l1IlI.Size = UDim2.fromOffset(34, 34)ll1l11l1IlI.ZIndex = 252 ll1l11l1IlI.Image = I1IlIl1l1I1.Logo ll1l11l1IlI.ImageColor3 = Neverlose.IconColor ll1l11l1IlI.ImageTransparency = 1 IIl1IlII111.Name = Neverlose.RandomString()
        IIl1IlII111.Parent = II1Il11ll11 IIl1IlII111.BackgroundTransparency = 1 IIl1IlII111.BorderSizePixel = 0 IIl1IlII111.Position = UDim2.new(0, 64, 0, 22)IIl1IlII111.Size = UDim2.new(1, - 82, 0, 20)IIl1IlII111.ZIndex = 252 IIl1IlII111.Font = Enum.Font.GothamBold IIl1IlII111.Text = tostring(I1l1ll11l1l.LoadingTitle or I1IlIl1l1I1.Name)IIl1IlII111.TextColor3 = Color3.fromRGB(255, 255, 255)IIl1IlII111.TextSize = 15 IIl1IlII111.TextTransparency = 1 IIl1IlII111.TextXAlignment = Enum.TextXAlignment.Left Neverlose:AddTextGradient(IIl1IlII111)
        llIl1l1lIll.Name = Neverlose.RandomString()
        llIl1l1lIll.Parent = II1Il11ll11 llIl1l1lIll.BackgroundTransparency = 1 llIl1l1lIll.BorderSizePixel = 0 llIl1l1lIll.Position = UDim2.new(0, 64, 0, 45)llIl1l1lIll.Size = UDim2.new(1, - 82, 0, 18)llIl1l1lIll.ZIndex = 252 llIl1l1lIll.Font = Enum.Font.GothamMedium llIl1l1lIll.Text = tostring(I1l1ll11l1l.LoadingContent or "Loading...")llIl1l1lIll.TextColor3 = Color3.fromRGB(255, 255, 255)llIl1l1lIll.TextSize = 12 llIl1l1lIll.TextTransparency = 1 llIl1l1lIll.TextXAlignment = Enum.TextXAlignment.Left Neverlose.PlayAnimate(l1I1l1IIlIl, TweenInfo0175, {
            BackgroundTransparency = 0.250
        })Neverlose.PlayAnimate(II1Il11ll11, TweenInfo0175, {
            BackgroundTransparency = 0.035
        })Neverlose.PlayAnimate(lIIll1II11l, TweenInfo0175, {
            Transparency = 0.650
        })Neverlose.PlayAnimate(ll1l11l1IlI, TweenInfo0175, {
            ImageTransparency = 0
        })Neverlose.PlayAnimate(IIl1IlII111, TweenInfo0175, {
            TextTransparency = 0
        })Neverlose.PlayAnimate(llIl1l1lIll, TweenInfo0175, {
            TextTransparency = 0.350
        })task.delay(tonumber(I1l1ll11l1l.LoadingDuration) or 1.15, function ()
            if not l1I1l1IIlIl.Parent then
                return
            end
            Neverlose.PlayAnimate(l1I1l1IIlIl, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(II1Il11ll11, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(lIIll1II11l, TweenInfo0175, {
                Transparency = 1
            })Neverlose.PlayAnimate(ll1l11l1IlI, TweenInfo0175, {
                ImageTransparency = 1
            })Neverlose.PlayAnimate(IIl1IlII111, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(llIl1l1lIll, TweenInfo0175, {
                TextTransparency = 1
            })task.delay(0.2, function ()
                if l1I1l1IIlIl.Parent then
                    l1I1l1IIlIl:Destroy()
                end
            end
            )
        end
        )
    end
    if not Neverlose.EnabledBlur then
        Il1III11I1I.BackgroundTransparency = I1IlIl1l1I1.Uitransparent or 0.0255
    end
    local I111lllllll = ( function ()
        if I1IlIl1l1I1.__3DRender then
            if Il1III11I1I.BackgroundTransparency > 0.9 then
                Il1III11I1I.Visible = false
                Il1III11I1I.Parent = nil
            else
                Il1III11I1I.Visible = true
                Neverlose.PlayAnimate(Il1III11I1I, TweenInfoQuint, {
                    Position = UDim2.fromScale(0.5, 0.5)
                })
                Il1III11I1I.Parent = I1IlIl1l1I1.SurfaceGui
            end
        else
            if Il1III11I1I.BackgroundTransparency > 0.9 then
                Il1III11I1I.Visible = false
                Il1III11I1I.Parent = nil
            else
                Il1III11I1I.Visible = true
                Il1III11I1I.Parent = Neverlose.ScreenGui
            end
        end
    end
    )
    Neverlose:AddSignal(Il1III11I1I:GetPropertyChangedSignal("BackgroundTransparency"):Connect(I111lllllll))I1IlIl1l1I1.SetRender = ( function (lIll1llIlll, IIlIllIIlII)
        if IIlIllIIlII and not I1IlIl1l1I1.Destroyed then
            if I1IlIl1l1I1.Minimizing then
                return
            end
            if I1IlIl1l1I1.Minimized then
                if not I1IlIl1l1I1.Signal:GetValue() then
                    return
                end
                I1IlIl1l1I1.Minimized = false
            end
            I1IlIl1l1I1._RestoreStart = os.clock()
        end
        if IIlIllIIlII then
            if not I1IlIl1l1I1.__3DRender then
                Il1III11I1I.Visible = true
                Il1III11I1I.Parent = Neverlose.ScreenGui
            end
            if I1IlIl1l1I1.MinimizeRestore or l1IlI1lIIl1.Value < 0.999 then
                local llllI11lllI = I1IlIl1l1I1.MinimizeRestore or UDim2.new(0.5, 0, 0.5, 0)
                I1IlIl1l1I1.MinimizeRestore = nil
                Neverlose.PlayAnimate(Il1III11I1I, TweenInfoQuint, {
                    Position = llllI11lllI,
                })
                Neverlose.PlayAnimate(l1IlI1lIIl1, TweenInfoQuint, {
                    Value = 1,
                })
            end
            Neverlose.PlayAnimate(llIlI11ll1I, TweenInfo0175, {
                Transparency = 0
            })Neverlose.PlayAnimate(Il1III11I1I, TweenInfo.new(0.2), {
                GroupTransparency = 0
            }) if I1IlIl1l1I1.BackgroundLabel then
                Neverlose.PlayAnimate(I1IlIl1l1I1.BackgroundLabel, TweenInfo0175, {
                    ImageTransparency = 1 - (I1IlIl1l1I1.BackgroundImageOpacity or 0.5)
                })
            end
            Neverlose.PlayAnimate(Il1III11I1I, TweenInfo0175, {
                BackgroundTransparency = I1IlIl1l1I1.Uitransparent or ((Neverlose.EnabledBlur and 0.055) or 0.0255), Size = I1IlIl1l1I1:GetCurrentSize()
            })Neverlose.PlayAnimate(IlllI1111Il, TweenInfo0175, {
                ImageTransparency = 0
            })Neverlose.PlayAnimate(l1lIIIII11I, TweenInfo0175, {
                TextTransparency = 0
            })Neverlose.PlayAnimate(IIlII11IlI1, TweenInfo0175, {
                TextTransparency = 0.650
            })Neverlose.PlayAnimate(Il1IlIl1llI, TweenInfo0175, {
                BackgroundTransparency = 0.650
            })Neverlose.PlayAnimate(llIlIIIlI1l, TweenInfo0175, {
                ImageTransparency = 0
            })Neverlose.PlayAnimate(llll1I1IIIl, TweenInfo0175, {
                TextTransparency = 0
            })Neverlose.PlayAnimate(lllllIlI1Il, TweenInfo0175, {
                TextTransparency = 0.650
            })Neverlose.PlayAnimate(l1IIlIlIIlI, TweenInfo0175, {
                BackgroundTransparency = 0.650
            })Neverlose.PlayAnimate(l1l11l1lI11, TweenInfo0175, {
                TextTransparency = 0.5
            })Neverlose.PlayAnimate(llIIII1lII1, TweenInfo0175, {
                BackgroundTransparency = 0.600
            })Neverlose.PlayAnimate(lIIlIIlll1l, TweenInfo0175, {
                Transparency = 0.650
            })Neverlose.PlayAnimate(IlI1II11l11, TweenInfo0175, {
                BackgroundTransparency = 0.650
            })Neverlose.PlayAnimate(II11IIIll11, TweenInfo0175, {
                BackgroundTransparency = 0.750
            })Neverlose.PlayAnimate(Il111ll1Ill, TweenInfo0175, {
                Transparency = 0.650
            })Neverlose.PlayAnimate(IIIlI1I111I, TweenInfo0175, {
                TextTransparency = 0.250
            })Neverlose.PlayAnimate(IlI1lIlll1l, TweenInfo0175, {
                BackgroundTransparency = 0.650
            })Neverlose.PlayAnimate(l1lIlII1ll1, TweenInfo0175, {
                TextTransparency = 0.350
            })Neverlose.PlayAnimate(lIlllllll11, TweenInfo0175, {
                TextTransparency = 0.250
            })Neverlose.PlayAnimate(l111111lIIl, TweenInfo0175, {
                TextTransparency = 0.250
            })Neverlose.PlayAnimate(l1I11lllI1I, TweenInfo0175, {
                TextTransparency = 0.350
            })Neverlose.PlayAnimate(I1llII1I1ll, TweenInfo0175, {
                TextTransparency = 0.450
            })Neverlose.PlayAnimate(IllllIlIIll, TweenInfo0175, {
                TextTransparency = 0.450
            })I1IlIl1l1I1.Shadow:Render( true )
        else
            if I1IlIl1l1I1.BackgroundLabel then
                Neverlose.PlayAnimate(I1IlIl1l1I1.BackgroundLabel, TweenInfo0175, {
                    ImageTransparency = 1
                })
            end
            Neverlose.PlayAnimate(llIlI11ll1I, TweenInfo0175, {
                Transparency = 1
            })Neverlose.PlayAnimate(Il1III11I1I, TweenInfo0175, {
                BackgroundTransparency = 1, Size = I1IlIl1l1I1:GetCurrentSize() + UDim2.fromOffset(- 15, - 15)
            })Neverlose.PlayAnimate(IlllI1111Il, TweenInfo0175, {
                ImageTransparency = 1
            })Neverlose.PlayAnimate(l1lIIIII11I, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(IIlII11IlI1, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(Il1IlIl1llI, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(llIlIIIlI1l, TweenInfo0175, {
                ImageTransparency = 1
            })Neverlose.PlayAnimate(llll1I1IIIl, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(lllllIlI1Il, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(l1IIlIlIIlI, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(l1l11l1lI11, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(llIIII1lII1, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(lIIlIIlll1l, TweenInfo0175, {
                Transparency = 1
            })Neverlose.PlayAnimate(IlI1II11l11, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(II11IIIll11, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(Il111ll1Ill, TweenInfo0175, {
                Transparency = 1
            })Neverlose.PlayAnimate(IIIlI1I111I, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(IlI1lIlll1l, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(l1lIlII1ll1, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(lIlllllll11, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(l111111lIIl, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(l1I11lllI1I, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(I1llII1I1ll, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(IllllIlIIll, TweenInfo0175, {
                TextTransparency = 1
            })I1IlIl1l1I1.Shadow:Render( false )
        end
    end
    )
    if I1l1ll11l1l.WindowShadow == true then
        I1IlIl1l1I1.Shadow = Neverlose:CreateShadow(Il1III11I1I)
    else
        I1IlIl1l1I1.Shadow = {
            Render = function ()
            end
        }
    end
    I1IlIl1l1I1.Shadow:Render( false )
    task.delay(0.25, function ()
        Il1III11I1I.Position = UDim2.new(0.5, 0, 0.5, 0) if not I1IlIl1l1I1.KeyGateActive then
            I1IlIl1l1I1:SetRender( true )
        end
        Neverlose:AddSignal(I1IlIl1l1I1.Signal:Connect(( function (...)
            I1IlIl1l1I1:SetRender(...)
        end
        )))
    end
    ) if Neverlose.EnabledBlur then
        Neverlose:CreateBlurModule(Il1III11I1I, I1IlIl1l1I1.Signal, function ()
            return not I1IlIl1l1I1.Destroyed and not I1IlIl1l1I1.Minimizing and not I1IlIl1l1I1.Minimized
        end
        )
    end
    do
        local llllIl1lll1 = Instance.new("Frame")llllIl1lll1.Parent = Il1III11I1I llllIl1lll1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)llllIl1lll1.BorderColor3 = Color3.fromRGB(0, 0, 0)llllIl1lll1.BorderSizePixel = 0 llllIl1lll1.Size = UDim2.new(1, 0, 0, 50)llllIl1lll1.ZIndex = 7 llllIl1lll1.BackgroundTransparency = 1
        Neverlose.Drag(llllIl1lll1, Il1III11I1I, 0.15, function (IlII111lIll)
            IllllII1IIl.Visible = not IlII111lIll
            I11I11I11II.Visible = not IlII111lIll
        end
        )
    end
    llII1IlllII.CornerRadius = UDim.new(0, 6)llII1IlllII.Parent = Il1III11I1I do
        local lIll1l1llll = Instance.new("ImageLabel")
        lIll1l1llll.Name = Neverlose.RandomString()
        lIll1l1llll.Parent = Il1III11I1I
        lIll1l1llll.BackgroundTransparency = 1
        lIll1l1llll.BorderSizePixel = 0
        lIll1l1llll.Position = UDim2.fromScale(0, 0)
        lIll1l1llll.Size = UDim2.fromScale(1, 1)
        lIll1l1llll.ZIndex = 1
        lIll1l1llll.ScaleType = Enum.ScaleType.Crop
        lIll1l1llll.Image = ""
        lIll1l1llll.ImageTransparency = 1
        lIll1l1llll.Visible = false
        local l111llI1lI1 = Instance.new("UICorner")
        l111llI1lI1.CornerRadius = UDim.new(0, 6)
        l111llI1lI1.Parent = lIll1l1llll
        I1IlIl1l1I1.BackgroundLabel = lIll1l1llll
        I1IlIl1l1I1.BackgroundImage = ""
        I1IlIl1l1I1.BackgroundImageOpacity = math.clamp(tonumber(I1l1ll11l1l.BackgroundOpacity) or 0.5, 0, 1)
        function I1IlIl1l1I1:SetBackgroundOpacity(I1I1l1Il1l1)
            I1IlIl1l1I1.BackgroundImageOpacity = math.clamp(tonumber(I1I1l1Il1l1) or I1IlIl1l1I1.BackgroundImageOpacity, 0, 1)
            if I1IlIl1l1I1.Signal:GetValue() and lIll1l1llll.Visible then
                Neverlose.PlayAnimate(lIll1l1llll, TweenInfo0175, {
                    ImageTransparency = 1 - I1IlIl1l1I1.BackgroundImageOpacity
                })
            end
            return I1IlIl1l1I1
        end
        function I1IlIl1l1I1:SetBackground(l1Il11I1l11, lIlIlIllIIl)
            local I1lII1I11l1 = (tostring(l1Il11I1l11 or ""):gsub("%s", ""))
            I1IlIl1l1I1.BackgroundImage = I1lII1I11l1
            if lIlIlIllIIl ~= nil then
                I1IlIl1l1I1.BackgroundImageOpacity = math.clamp(tonumber(lIlIlIllIIl) or I1IlIl1l1I1.BackgroundImageOpacity, 0, 1)
            end
            if I1lII1I11l1 == "" then
                lIll1l1llll.Image = ""
                lIll1l1llll.Visible = false
                lIll1l1llll.ImageTransparency = 1
                return I1IlIl1l1I1
            end
            lIll1l1llll.Image = Neverlose:NormalizeIconId(I1lII1I11l1)
            lIll1l1llll.Visible = true
            if I1IlIl1l1I1.Signal:GetValue() then
                Neverlose.PlayAnimate(lIll1l1llll, TweenInfo0175, {
                    ImageTransparency = 1 - I1IlIl1l1I1.BackgroundImageOpacity
                })
            end
            return I1IlIl1l1I1
        end
        function I1IlIl1l1I1:ClearBackground()
            return I1IlIl1l1I1:SetBackground("")
        end
        local II11I11ll1I = I1l1ll11l1l.BackgroundImage or I1l1ll11l1l.Background
        if II11I11ll1I ~= nil and tostring(II11I11ll1I) ~= "" then
            I1IlIl1l1I1:SetBackground(II11I11ll1I)
        end
    end
    Il11Illl11I.Name = Neverlose.RandomString()
    Il11Illl11I.Parent = Il1III11I1I Il11Illl11I.BackgroundColor3 = Color3.fromRGB(255, 255, 255)Il11Illl11I.BackgroundTransparency = 1.000 Il11Illl11I.BorderColor3 = Color3.fromRGB(0, 0, 0)Il11Illl11I.BorderSizePixel = 0 Il11Illl11I.Size = UDim2.new(0, 175, 1, 0)lI111I111II.Name = Neverlose.RandomString()
    lI111I111II.Parent = Il11Illl11I lI111I111II.BackgroundColor3 = Color3.fromRGB(255, 255, 255)lI111I111II.BackgroundTransparency = 1.000 lI111I111II.BorderColor3 = Color3.fromRGB(0, 0, 0)lI111I111II.BorderSizePixel = 0 lI111I111II.ClipsDescendants = true lI111I111II.Size = UDim2.new(1, 0, 0, 50)lI111I111II.ZIndex = 7 IlllI1111Il.Name = Neverlose.RandomString()
    IlllI1111Il.Parent = lI111I111II IlllI1111Il.AnchorPoint = Vector2.new(0, 0.5)IlllI1111Il.BackgroundColor3 = Color3.fromRGB(255, 255, 255)IlllI1111Il.BackgroundTransparency = 1.000 IlllI1111Il.BorderColor3 = Color3.fromRGB(0, 0, 0)IlllI1111Il.BorderSizePixel = 0 IlllI1111Il.Position = UDim2.new(0, 10, 0.5, 0)IlllI1111Il.Size = UDim2.new(0, 35, 0, 35)IlllI1111Il.ZIndex = 7 IlllI1111Il.Image = I1IlIl1l1I1.Logo IlllI1111Il.ImageColor3 = Neverlose.IconColor if I1l1ll11l1l.IconsType ~= nil then
        Neverlose:SetIconsType(I1l1ll11l1l.IconsType)
    end
    I1IlIl1l1I1.Icon = I1l1ll11l1l.Icon or I1l1ll11l1l.TitleIcon or I1l1ll11l1l.LogoIcon
    if I1IlIl1l1I1.Icon ~= nil and tostring(I1IlIl1l1I1.Icon) ~= "" then
        Neverlose:SetIconMode(IlllI1111Il, I1IlIl1l1I1.Icon)
    end
    function I1IlIl1l1I1:SetIcon(II1lI111111)
        I1IlIl1l1I1.Icon = II1lI111111
        if II1lI111111 == nil or tostring(II1lI111111) == "" then
            IlllI1111Il.Image = I1IlIl1l1I1.Logo
        else
            Neverlose:SetIconMode(IlllI1111Il, II1lI111111)
        end
        return I1IlIl1l1I1
    end
    lIlIllI1l11.CornerRadius = UDim.new(0, 7)lIlIllI1l11.Parent = IlllI1111Il l1lIIIII11I.Name = Neverlose.RandomString()
    l1lIIIII11I.Parent = lI111I111II l1lIIIII11I.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l1lIIIII11I.BackgroundTransparency = 1.000 l1lIIIII11I.BorderColor3 = Color3.fromRGB(0, 0, 0)l1lIIIII11I.BorderSizePixel = 0 l1lIIIII11I.Position = UDim2.new(0, 55, 0, 4)l1lIIIII11I.Size = UDim2.new(1, - 65, 0, 25)l1lIIIII11I.ZIndex = 7 l1lIIIII11I.Font = Enum.Font.GothamBold l1lIIIII11I.Text = I1IlIl1l1I1.Name l1lIIIII11I.TextColor3 = Color3.fromRGB(255, 255, 255)l1lIIIII11I.TextSize = 18.000 l1lIIIII11I.TextXAlignment = Enum.TextXAlignment.Left Neverlose:AddTextGradient(l1lIIIII11I)
    IIlII11IlI1.Name = Neverlose.RandomString()
    IIlII11IlI1.Parent = lI111I111II IIlII11IlI1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)IIlII11IlI1.BackgroundTransparency = 1.000 IIlII11IlI1.BorderColor3 = Color3.fromRGB(0, 0, 0)IIlII11IlI1.BorderSizePixel = 0 IIlII11IlI1.Position = UDim2.new(0, 55, 0, 25)IIlII11IlI1.Size = UDim2.new(1, - 65, 0, 15)IIlII11IlI1.ZIndex = 7 IIlII11IlI1.Font = Enum.Font.GothamBold IIlII11IlI1.Text = I1IlIl1l1I1.Content IIlII11IlI1.TextColor3 = Color3.fromRGB(255, 255, 255)IIlII11IlI1.TextSize = 9.000 IIlII11IlI1.TextTransparency = 0.650 IIlII11IlI1.TextXAlignment = Enum.TextXAlignment.Left IIlII11IlI1.TextTruncate = Enum.TextTruncate.None local function I1I1lllI1II(I1l1l1I1lI1, IIlII1III11, IlI11l11Ill)
        IIlII1III11 = IIlII1III11 or I1l1l1I1lI1.TextSize
        IlI11l11Ill = IlI11l11Ill or 6
        local function IIIl1Illl11()
            task.defer( function ()
                if not I1l1l1I1lI1 or not I1l1l1I1lI1.Parent then
                    return
                end
                local lI1IlllII1l = math.max(1, I1l1l1I1lI1.AbsoluteSize.X)
                local Il1llIIlII1 = IIlII1III11
                while Il1llIIlII1 > IlI11l11Ill and TextService:GetTextSize(I1l1l1I1lI1.Text, Il1llIIlII1, I1l1l1I1lI1.Font, Vector2.new(math.huge, I1l1l1I1lI1.AbsoluteSize.Y)).X > lI1IlllII1l do
                    Il1llIIlII1 = Il1llIIlII1 - 1
                end
                I1l1l1I1lI1.TextSize = Il1llIIlII1
            end
            )
        end
        Neverlose:AddSignal(I1l1l1I1lI1:GetPropertyChangedSignal("Text"):Connect(IIIl1Illl11))
        Neverlose:AddSignal(I1l1l1I1lI1:GetPropertyChangedSignal("AbsoluteSize"):Connect(IIIl1Illl11))
        IIIl1Illl11()
    end
    local function IIIIlllIlII(I1IllII1II1, l1l11III1I1, IllIIlIlIl1)
        l1l11III1I1 = l1l11III1I1 or 22
        IllIIlIlIl1 = IllIIlIlIl1 or 45
        local IIl11I1IIl1 = Instance.new("Frame")
        IIl11I1IIl1.Name = Neverlose.RandomString()
        IIl11I1IIl1.Parent = I1IllII1II1.Parent
        IIl11I1IIl1.BackgroundTransparency = 1
        IIl11I1IIl1.BorderSizePixel = 0
        IIl11I1IIl1.ClipsDescendants = true
        IIl11I1IIl1.Position = I1IllII1II1.Position
        IIl11I1IIl1.Size = I1IllII1II1.Size
        IIl11I1IIl1.ZIndex = I1IllII1II1.ZIndex
        I1IllII1II1.Parent = IIl11I1IIl1
        I1IllII1II1.Position = UDim2.fromOffset(0, 0)
        I1IllII1II1.Size = UDim2.fromScale(1, 1)
        I1IllII1II1.TextTruncate = Enum.TextTruncate.None
        local l1III1I1111 = I1IllII1II1:Clone()
        l1III1I1111.Name = Neverlose.RandomString()
        l1III1I1111.Parent = IIl11I1IIl1
        l1III1I1111.Position = UDim2.fromOffset(0, 0)
        l1III1I1111.TextTruncate = Enum.TextTruncate.None
        l1III1I1111.Visible = false
        local llll11llIII = 0
        local I1lIII1l1I1 = 0
        local IIIllIIlIlI = false
        local Il11llIIl1I = tick()
        local function I1IIl111I11()
            l1III1I1111.Text = I1IllII1II1.Text
            l1III1I1111.TextColor3 = I1IllII1II1.TextColor3
            l1III1I1111.TextTransparency = I1IllII1II1.TextTransparency
            l1III1I1111.Font = I1IllII1II1.Font
            l1III1I1111.FontFace = I1IllII1II1.FontFace
            l1III1I1111.TextSize = I1IllII1II1.TextSize
        end
        local function Il1111lllI1()
            task.defer( function ()
                if not I1IllII1II1.Parent or not IIl11I1IIl1.Parent then
                    return
                end
                I1IIl111I11()
                llll11llIII = math.ceil(TextService:GetTextSize(I1IllII1II1.Text, I1IllII1II1.TextSize, I1IllII1II1.Font, Vector2.new(math.huge, IIl11I1IIl1.AbsoluteSize.Y)).X)
                I1lIII1l1I1 = math.max(1, IIl11I1IIl1.AbsoluteSize.X)
                IIIllIIlIlI = llll11llIII > I1lIII1l1I1
                if IIIllIIlIlI then
                    I1IllII1II1.Size = UDim2.new(0, llll11llIII, 1, 0)
                    l1III1I1111.Size = UDim2.new(0, llll11llIII, 1, 0)
                    l1III1I1111.Visible = true
                    Il11llIIl1I = tick()
                else
                    I1IllII1II1.Position = UDim2.fromOffset(0, 0)
                    I1IllII1II1.Size = UDim2.fromScale(1, 1)
                    l1III1I1111.Visible = false
                end
            end
            )
        end
        Neverlose:AddSignal(I1IllII1II1:GetPropertyChangedSignal("Text"):Connect(Il1111lllI1))
        Neverlose:AddSignal(I1IllII1II1:GetPropertyChangedSignal("TextSize"):Connect(Il1111lllI1))
        Neverlose:AddSignal(I1IllII1II1:GetPropertyChangedSignal("TextTransparency"):Connect(I1IIl111I11))
        Neverlose:AddSignal(I1IllII1II1:GetPropertyChangedSignal("TextColor3"):Connect(I1IIl111I11))
        Neverlose:AddSignal(IIl11I1IIl1:GetPropertyChangedSignal("AbsoluteSize"):Connect(Il1111lllI1))
        Neverlose:AddSignal(RunService.RenderStepped:Connect( function ()
            if not I1IllII1II1.Parent or not IIl11I1IIl1.Parent then
                return
            end
            if not IIIllIIlIlI then
                return
            end
            local llllIlIll1I = llll11llIII + IllIIlIlIl1
            local lIll1l111l1 = - (((tick() - Il11llIIl1I) * l1l11III1I1) % llllIlIll1I)
            I1IllII1II1.Position = UDim2.fromOffset(lIll1l111l1, 0)
            l1III1I1111.Position = UDim2.fromOffset(lIll1l111l1 + llllIlIll1I, 0)
        end
        ))
        Il1111lllI1()
        return IIl11I1IIl1
    end
    I1I1lllI1II(IIlII11IlI1, 9, 6)
    if I1IlIl1l1I1.RunningText then
        IIIIlllIlII(l1lIIIII11I, 24, 50)
    else
        l1lIIIII11I.TextTruncate = Enum.TextTruncate.None
    end
    Il1IlIl1llI.Name = Neverlose.RandomString()
    Il1IlIl1llI.Parent = lI111I111II Il1IlIl1llI.AnchorPoint = Vector2.new(0.5, 1)Il1IlIl1llI.BackgroundColor3 = Color3.fromRGB(45, 48, 58)Il1IlIl1llI.BackgroundTransparency = 0.650 Il1IlIl1llI.BorderColor3 = Color3.fromRGB(0, 0, 0)Il1IlIl1llI.BorderSizePixel = 0 Il1IlIl1llI.Position = UDim2.new(0.5, 0, 1, 0)Il1IlIl1llI.Size = UDim2.new(1, - 10, 0, 1)Il1IlIl1llI.ZIndex = 5 I11I11I11II.Name = Neverlose.RandomString()
    I11I11I11II.Parent = Il11Illl11I I11I11I11II.Active = true I11I11I11II.AnchorPoint = Vector2.new(0.5, 0)I11I11I11II.BackgroundColor3 = Color3.fromRGB(255, 255, 255)I11I11I11II.BackgroundTransparency = 1.000 I11I11I11II.BorderColor3 = Color3.fromRGB(0, 0, 0)I11I11I11II.BorderSizePixel = 0 I11I11I11II.Position = UDim2.new(0.5, 0, 0, 60)I11I11I11II.Size = UDim2.new(1, - 10, 1, - 115)I11I11I11II.ZIndex = 7 I11I11I11II.ScrollBarThickness = 0 I11ll1lI111.Parent = I11I11I11II I11ll1lI111.HorizontalAlignment = Enum.HorizontalAlignment.Center I11ll1lI111.SortOrder = Enum.SortOrder.LayoutOrder I11ll1lI111.Padding = UDim.new(0, 5)Neverlose:AddSignal(I11ll1lI111:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(( function ()
        I11I11I11II.CanvasSize = UDim2.fromOffset(0, I11ll1lI111.AbsoluteContentSize.Y + 1)
    end
    )))IlIlI11II1l.Name = Neverlose.RandomString()
    IlIlI11II1l.Parent = Il11Illl11I IlIlI11II1l.AnchorPoint = Vector2.new(0, 1)IlIlI11II1l.BackgroundColor3 = Color3.fromRGB(255, 255, 255)IlIlI11II1l.BackgroundTransparency = 1.000 IlIlI11II1l.BorderColor3 = Color3.fromRGB(0, 0, 0)IlIlI11II1l.BorderSizePixel = 0 IlIlI11II1l.Position = UDim2.new(0, 0, 1, 0)IlIlI11II1l.Size = UDim2.new(1, 0, 0, 50)IlIlI11II1l.ZIndex = 7 llIlIIIlI1l.Name = Neverlose.RandomString()
    llIlIIIlI1l.Parent = IlIlI11II1l llIlIIIlI1l.AnchorPoint = Vector2.new(0, 0.5)llIlIIIlI1l.BackgroundColor3 = Color3.fromRGB(255, 255, 255)llIlIIIlI1l.BackgroundTransparency = 1.000 llIlIIIlI1l.BorderColor3 = Color3.fromRGB(0, 0, 0)llIlIIIlI1l.BorderSizePixel = 0 llIlIIIlI1l.Position = UDim2.new(0, 10, 0.5, 0)llIlIIIlI1l.Size = UDim2.new(0, 35, 0, 35)llIlIIIlI1l.ZIndex = 7 llIlIIIlI1l.Image = Neverlose.UserProfile or ""l1l1II1lIIl.CornerRadius = UDim.new(1, 0)l1l1II1lIIl.Parent = llIlIIIlI1l llll1I1IIIl.Name = Neverlose.RandomString()
    llll1I1IIIl.Parent = IlIlI11II1l llll1I1IIIl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)llll1I1IIIl.BackgroundTransparency = 1.000 llll1I1IIIl.BorderColor3 = Color3.fromRGB(0, 0, 0)llll1I1IIIl.BorderSizePixel = 0 llll1I1IIIl.Position = UDim2.new(0, 55, 0, 5)llll1I1IIIl.Size = UDim2.new(0, 115, 0, 25)llll1I1IIIl.ZIndex = 7 llll1I1IIIl.Font = Enum.Font.GothamBold llll1I1IIIl.Text = LocalPlayer.DisplayName llll1I1IIIl.TextColor3 = Color3.fromRGB(255, 255, 255)llll1I1IIIl.TextSize = 14.000 llll1I1IIIl.TextXAlignment = Enum.TextXAlignment.Left llll1I1IIIl.TextTruncate = Enum.TextTruncate.AtEnd
    lllllIlI1Il.Name = Neverlose.RandomString()
    lllllIlI1Il.Parent = IlIlI11II1l lllllIlI1Il.BackgroundColor3 = Color3.fromRGB(255, 255, 255)lllllIlI1Il.BackgroundTransparency = 1.000 lllllIlI1Il.BorderColor3 = Color3.fromRGB(0, 0, 0)lllllIlI1Il.BorderSizePixel = 0 lllllIlI1Il.Position = UDim2.new(0, 55, 0, 25)lllllIlI1Il.Size = UDim2.new(0, 115, 0, 15)lllllIlI1Il.ZIndex = 7 lllllIlI1Il.Font = Enum.Font.GothamBold lllllIlI1Il.Text = "@" .. LocalPlayer.Name lllllIlI1Il.TextTruncate = Enum.TextTruncate.AtEnd lllllIlI1Il.TextColor3 = Color3.fromRGB(255, 255, 255)lllllIlI1Il.TextSize = 10.000 lllllIlI1Il.TextTransparency = 0.650 lllllIlI1Il.TextXAlignment = Enum.TextXAlignment.Left l1IIlIlIIlI.Name = Neverlose.RandomString()
    l1IIlIlIIlI.Parent = IlIlI11II1l l1IIlIlIIlI.AnchorPoint = Vector2.new(0.5, 0)l1IIlIlIIlI.BackgroundColor3 = Color3.fromRGB(45, 48, 58)l1IIlIlIIlI.BackgroundTransparency = 0.650 l1IIlIlIIlI.BorderColor3 = Color3.fromRGB(0, 0, 0)l1IIlIlIIlI.BorderSizePixel = 0 l1IIlIlIIlI.Position = UDim2.new(0.5, 0, 0, 0)l1IIlIlIIlI.Size = UDim2.new(1, - 10, 0, 1)l1IIlIlIIlI.ZIndex = 5 l1l11l1lI11.Name = Neverlose.RandomString()
    l1l11l1lI11.Parent = IlIlI11II1l l1l11l1lI11.AnchorPoint = Vector2.new(1, 0.5)l1l11l1lI11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l1l11l1lI11.BackgroundTransparency = 1.000 l1l11l1lI11.BorderColor3 = Color3.fromRGB(0, 0, 0)l1l11l1lI11.BorderSizePixel = 0 l1l11l1lI11.Position = UDim2.new(1, - 7, 0.5, 0)l1l11l1lI11.Size = UDim2.new(0, 25, 0, 25)l1l11l1lI11.ZIndex = 7 l1l11l1lI11.Visible = false Neverlose:SetIconMode(l1l11l1lI11, "chevron-large-right")l1l11l1lI11.ImageColor3 = Color3.fromRGB(255, 255, 255)l1l11l1lI11.ImageTransparency = 0.5 l1l11l1lI11.ScaleType = Enum.ScaleType.Fit Neverlose.Drag(IlIlI11II1l, Il1III11I1I, 0.15, function (lI1II1IIIIl)
        IllllII1IIl.Visible = not lI1II1IIIIl
        I11I11I11II.Visible = not lI1II1IIIIl
    end
    )
    Neverlose:AddSignal(IlIlI11II1l.MouseEnter:Connect(( function ()
        Neverlose.PlayAnimate(l1l11l1lI11, TweenInfo0175, {
            TextTransparency = 0.25
        })
    end
    )))Neverlose:AddSignal(IlIlI11II1l.MouseLeave:Connect(( function ()
        Neverlose.PlayAnimate(l1l11l1lI11, TweenInfo0175, {
            TextTransparency = 0.5
        })
    end
    )))llIIII1lII1.Name = Neverlose.RandomString()
    llIIII1lII1.Parent = Il1III11I1I llIIII1lII1.BackgroundColor3 = Color3.fromRGB(10, 14, 22)llIIII1lII1.BackgroundTransparency = 0.600 llIIII1lII1.BorderColor3 = Color3.fromRGB(0, 0, 0)llIIII1lII1.BorderSizePixel = 0 llIIII1lII1.ClipsDescendants = true llIIII1lII1.Position = UDim2.new(0, 176, 0, 0)llIIII1lII1.Size = UDim2.new(1, - 176, 1, 0)llIIII1lII1.ZIndex = 8 lIIlIIlll1l.Transparency = 0.650 lIIlIIlll1l.Color = Color3.fromRGB(45, 48, 58)lIIlIIlll1l.Parent = llIIII1lII1 II111IlIIIl.CornerRadius = UDim.new(0, 6)II111IlIIIl.Parent = llIIII1lII1 I1Il11llllI.Name = Neverlose.RandomString()
    I1Il11llllI.Parent = llIIII1lII1 I1Il11llllI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)I1Il11llllI.BackgroundTransparency = 1.000 I1Il11llllI.BorderColor3 = Color3.fromRGB(0, 0, 0)I1Il11llllI.BorderSizePixel = 0 I1Il11llllI.Size = UDim2.new(1, 0, 0, 50)I1Il11llllI.ZIndex = 9 IlI1II11l11.Name = Neverlose.RandomString()
    IlI1II11l11.Parent = I1Il11llllI IlI1II11l11.AnchorPoint = Vector2.new(0.5, 1)IlI1II11l11.BackgroundColor3 = Color3.fromRGB(45, 48, 58)IlI1II11l11.BackgroundTransparency = 0.650 IlI1II11l11.BorderColor3 = Color3.fromRGB(0, 0, 0)IlI1II11l11.BorderSizePixel = 0 IlI1II11l11.Position = UDim2.new(0.5, 0, 1, 0)IlI1II11l11.Size = UDim2.new(1, - 10, 0, 1)IlI1II11l11.ZIndex = 9 II11IIIll11.Name = Neverlose.RandomString()
    II11IIIll11.Parent = I1Il11llllI II11IIIll11.AnchorPoint = Vector2.new(0, 0.5)II11IIIll11.BackgroundColor3 = Color3.fromRGB(13, 17, 22)II11IIIll11.BackgroundTransparency = 0.750 II11IIIll11.BorderColor3 = Color3.fromRGB(0, 0, 0)II11IIIll11.BorderSizePixel = 0 II11IIIll11.Position = UDim2.new(0, 10, 0.5, 0)II11IIIll11.Size = UDim2.new(0, 115, 0, 30)II11IIIll11.ZIndex = 9 Il111ll1Ill.Transparency = 0.650 Il111ll1Ill.Color = Color3.fromRGB(45, 48, 58)Il111ll1Ill.Parent = II11IIIll11 IIIIl11IIlI.CornerRadius = UDim.new(0, 4)IIIIl11IIlI.Parent = II11IIIll11 IIIlI1I111I.Name = Neverlose.RandomString()
    IIIlI1I111I.Parent = II11IIIll11 IIIlI1I111I.AnchorPoint = Vector2.new(0, 0.5)IIIlI1I111I.BackgroundColor3 = Color3.fromRGB(255, 255, 255)IIIlI1I111I.BackgroundTransparency = 1.000 IIIlI1I111I.BorderColor3 = Color3.fromRGB(0, 0, 0)IIIlI1I111I.BorderSizePixel = 0 IIIlI1I111I.Position = UDim2.new(0, 2, 0.5, 0)IIIlI1I111I.Size = UDim2.new(0, 25, 0, 25)IIIlI1I111I.ZIndex = 9 IIlllIIl1II:SetIconMode(IIIlI1I111I, "pencil-square")IIIlI1I111I.ImageColor3 = Color3.fromRGB(223, 223, 223)IIIlI1I111I.ImageTransparency = 0.250 IIIlI1I111I.ScaleType = Enum.ScaleType.Fit IlI1lIlll1l.Name = Neverlose.RandomString()
    IlI1lIlll1l.Parent = II11IIIll11 IlI1lIlll1l.BackgroundColor3 = Color3.fromRGB(45, 48, 58)IlI1lIlll1l.BackgroundTransparency = 0.650 IlI1lIlll1l.BorderColor3 = Color3.fromRGB(0, 0, 0)IlI1lIlll1l.BorderSizePixel = 0 IlI1lIlll1l.Position = UDim2.new(0, 30, 0, 0)IlI1lIlll1l.Size = UDim2.new(0, 1, 1, 0)l1lIlII1ll1.Name = Neverlose.RandomString()
    l1lIlII1ll1.Parent = II11IIIll11 l1lIlII1ll1.AnchorPoint = Vector2.new(0, 0.5)l1lIlII1ll1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l1lIlII1ll1.BackgroundTransparency = 1.000 l1lIlII1ll1.BorderColor3 = Color3.fromRGB(0, 0, 0)l1lIlII1ll1.BorderSizePixel = 0 l1lIlII1ll1.Position = UDim2.new(0, 40, 0.5, 0)l1lIlII1ll1.Size = UDim2.new(1, - 7, 0, 15)l1lIlII1ll1.ZIndex = 9 l1lIlII1ll1.Font = Enum.Font.GothamMedium l1lIlII1ll1.Text = I1IlIl1l1I1.ConfigAutoSaveFile or "Default"l1lIlII1ll1.TextColor3 = Color3.fromRGB(255, 255, 255)l1lIlII1ll1.TextSize = 12.000 l1lIlII1ll1.TextTransparency = 0.350 l1lIlII1ll1.TextXAlignment = Enum.TextXAlignment.Left lIlllllll11.Name = Neverlose.RandomString()
    lIlllllll11.Parent = II11IIIll11 lIlllllll11.AnchorPoint = Vector2.new(1, 0.5)lIlllllll11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)lIlllllll11.BackgroundTransparency = 1.000 lIlllllll11.BorderColor3 = Color3.fromRGB(0, 0, 0)lIlllllll11.BorderSizePixel = 0 lIlllllll11.Position = UDim2.new(1, - 2, 0.5, 0)lIlllllll11.Size = UDim2.new(0, 25, 0, 25)lIlllllll11.ZIndex = 9 Neverlose:SetIconMode(lIlllllll11, "chevron-small-down")lIlllllll11.ImageColor3 = Color3.fromRGB(223, 223, 223)lIlllllll11.ImageTransparency = 0.250 lIlllllll11.ScaleType = Enum.ScaleType.Fit IIIIIIIII11.Name = Neverlose.RandomString()
    IIIIIIIII11.Parent = I1Il11llllI IIIIIIIII11.AnchorPoint = Vector2.new(1, 0.5)IIIIIIIII11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)IIIIIIIII11.BackgroundTransparency = 1.000 IIIIIIIII11.BorderColor3 = Color3.fromRGB(0, 0, 0)IIIIIIIII11.BorderSizePixel = 0 IIIIIIIII11.ClipsDescendants = true IIIIIIIII11.Position = UDim2.new(1, - 80, 0.5, 0)IIIIIIIII11.Size = UDim2.new(0, 30, 0, 30)IIIIIIIII11.ZIndex = 12 l111111lIIl.Name = Neverlose.RandomString()
    l111111lIIl.Parent = IIIIIIIII11 l111111lIIl.AnchorPoint = Vector2.new(0, 0.5)l111111lIIl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l111111lIIl.BackgroundTransparency = 1.000 l111111lIIl.BorderColor3 = Color3.fromRGB(0, 0, 0)l111111lIIl.BorderSizePixel = 0 l111111lIIl.Position = UDim2.new(0, 2, 0.5, 0)l111111lIIl.Size = UDim2.new(0, 25, 0, 25)l111111lIIl.ZIndex = 12 IIlllIIl1II:SetIconMode(l111111lIIl, "magnifying-glass")l111111lIIl.ImageColor3 = Color3.fromRGB(223, 223, 223)l111111lIIl.ImageTransparency = 0.45 l111111lIIl.ScaleType = Enum.ScaleType.Fit l1I11lllI1I.Name = Neverlose.RandomString()
    l1I11lllI1I.Parent = IIIIIIIII11 l1I11lllI1I.AnchorPoint = Vector2.new(0, 0.5)l1I11lllI1I.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l1I11lllI1I.BackgroundTransparency = 1.000 l1I11lllI1I.BorderColor3 = Color3.fromRGB(0, 0, 0)l1I11lllI1I.BorderSizePixel = 0 l1I11lllI1I.Position = UDim2.new(0, 35, 0.5, 0)l1I11lllI1I.Size = UDim2.new(1, - 35, 0, 25)l1I11lllI1I.ZIndex = 12 l1I11lllI1I.ClearTextOnFocus = false l1I11lllI1I.Font = Enum.Font.GothamMedium l1I11lllI1I.PlaceholderText = "Search"l1I11lllI1I.Text = ""l1I11lllI1I.TextColor3 = Color3.fromRGB(255, 255, 255)l1I11lllI1I.TextSize = 13.000 l1I11lllI1I.TextTransparency = 1 l1I11lllI1I.TextXAlignment = Enum.TextXAlignment.Left I1llII1I1ll.Name = Neverlose.RandomString()
    I1llII1I1ll.Parent = I1Il11llllI I1llII1I1ll.AnchorPoint = Vector2.new(1, 0.5)I1llII1I1ll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)I1llII1I1ll.BackgroundTransparency = 1.000 I1llII1I1ll.BorderColor3 = Color3.fromRGB(0, 0, 0)I1llII1I1ll.BorderSizePixel = 0 I1llII1I1ll.Position = UDim2.new(1, - 10, 0.5, 0)I1llII1I1ll.Size = UDim2.new(0, 30, 0, 30)I1llII1I1ll.ZIndex = 12 IIlllIIl1II:SetIconMode(I1llII1I1ll, "x")I1llII1I1ll.ImageColor3 = Color3.fromRGB(223, 223, 223)I1llII1I1ll.ImageTransparency = 0.45 I1llII1I1ll.ScaleType = Enum.ScaleType.Fit IllllIlIIll.Name = Neverlose.RandomString()
    IllllIlIIll.Parent = I1Il11llllI IllllIlIIll.AnchorPoint = Vector2.new(1, 0.5)IllllIlIIll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)IllllIlIIll.BackgroundTransparency = 1.000 IllllIlIIll.BorderSizePixel = 0 IllllIlIIll.Position = UDim2.new(1, - 45, 0.5, 0)IllllIlIIll.Size = UDim2.new(0, 30, 0, 30)IllllIlIIll.ZIndex = 12 IIlllIIl1II:SetIconMode(IllllIlIIll, "minus")IllllIlIIll.ImageColor3 = Color3.fromRGB(223, 223, 223)IllllIlIIll.ImageTransparency = 0.45 IllllIlIIll.ScaleType = Enum.ScaleType.Fit IllllII1IIl.Name = Neverlose.RandomString()
    IllllII1IIl.Parent = llIIII1lII1 IllllII1IIl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)IllllII1IIl.BackgroundTransparency = 1.000 IllllII1IIl.BorderColor3 = Color3.fromRGB(0, 0, 0)IllllII1IIl.BorderSizePixel = 0 IllllII1IIl.ClipsDescendants = true IllllII1IIl.Position = UDim2.new(0, 0, 0, 50)IllllII1IIl.Size = UDim2.new(1, 0, 1, - 50)IllllII1IIl.ZIndex = 5 if I1IlIl1l1I1.SearchEnabled then
        I1IlIl1l1I1.Searching = false
        local lII11II1II1 = Neverlose:CreateInput(l111111lIIl, ( function ()
            I1IlIl1l1I1.Searching = not I1IlIl1l1I1.Searching
            if I1IlIl1l1I1.Searching then
                Neverlose.PlayAnimate(IIIIIIIII11, TweenInfoQuint, {
                    Size = UDim2.new(0, 220, 0, 30)
                })Neverlose.PlayAnimate(l111111lIIl, TweenInfo0175, {
                    TextTransparency = 0.25
                })Neverlose.PlayAnimate(l1I11lllI1I, TweenInfoQuint, {
                    TextTransparency = 0.350
                })
            else
                Neverlose.PlayAnimate(IIIIIIIII11, TweenInfoQuint, {
                    Size = UDim2.new(0, 30, 0, 30)
                })Neverlose.PlayAnimate(l111111lIIl, TweenInfo0175, {
                    TextTransparency = 0.45
                })Neverlose.PlayAnimate(l1I11lllI1I, TweenInfo0175, {
                    TextTransparency = 1
                })l1I11lllI1I.Text = ""
            end
        end
        ))
        local I1II1III1Il = tick()
        local IIIIlIlll11
        local I1lII1IlIl1 = 0.2
        Neverlose:AddSignal(l1I11lllI1I:GetPropertyChangedSignal("Text"):Connect(( function ()
            if not l1I11lllI1I.Text:byte() then
                for I1IIl1IIIlI, l11I111IlIl in next, Neverlose.NameRegisitry do
                    l11I111IlIl.Root.Visible = true
                end
                return
            end
            I1II1III1Il = tick()
            if IIIIlIlll11 then
                task.cancel(IIIIlIlll11)
                IIIIlIlll11 = nil
            end
            IIIIlIlll11 = task.delay(I1lII1IlIl1, function ()
                if l1I11lllI1I.Text:byte() and (tick() - I1II1III1Il) > I1lII1IlIl1 then
                    local l11II1I1l11 = false
                    for lII1lll11Il, I1llll111II in next, Neverlose.NameRegisitry do
                        if string.find(string.lower(I1llll111II.Idx), string.lower(l1I11lllI1I.Text), 1, true ) then
                            I1llll111II.Root.Visible = true
                            if not l11II1I1l11 then
                                l11II1I1l11 = true
                                Neverlose:RevealQueryItem(I1llll111II)
                            end
                        else
                            I1llll111II.Root.Visible = false
                        end
                    end
                end
            end
            )
        end
        )))
        Neverlose:AddSignal(lII11II1II1.MouseEnter:Connect(( function ()
            Neverlose.PlayAnimate(l111111lIIl, TweenInfo0175, {
                TextTransparency = 0.25
            })
        end
        )))Neverlose:AddSignal(lII11II1II1.MouseLeave:Connect(( function ()
            if I1IlIl1l1I1.Searching then
                Neverlose.PlayAnimate(l111111lIIl, TweenInfo0175, {
                    TextTransparency = 0.25
                })
            else
                Neverlose.PlayAnimate(l111111lIIl, TweenInfo0175, {
                    TextTransparency = 0.45
                })
            end
        end
        )))
    else
        IIIIIIIII11.Visible = false
    end
    I1IlIl1l1I1.Minimized = false
    I1IlIl1l1I1.Minimizing = false
    function I1IlIl1l1I1:GetCurrentSize()
        return I1IlIl1l1I1.Size
    end
    function I1IlIl1l1I1:Minimize()
        if I1IlIl1l1I1.Destroyed or I1IlIl1l1I1.Minimizing or not I1IlIl1l1I1.Signal:GetValue() then
            return I1IlIl1l1I1
        end
        local II1IlIllIll = Neverlose.ScreenGui
        local I11lI1ll1Il = I1IlIl1l1I1._MenuIcon and I1IlIl1l1I1._MenuIcon.Root
        local IlIIII1l1ll = UDim2.new(0, 40, 0.5, 0)
        if I1IlIl1l1I1._MenuIcon and I1IlIl1l1I1._MenuIcon.GetCenter then
            local lIl1I1lIlll = I1IlIl1l1I1._MenuIcon:GetCenter()
            IlIIII1l1ll = UDim2.fromOffset(math.max(lIl1I1lIlll.X, 0), lIl1I1lIlll.Y)
        elseif I11lI1ll1Il and I11lI1ll1Il.Parent then
            local II1IlllIIlI = I11lI1ll1Il.AbsolutePosition + (I11lI1ll1Il.AbsoluteSize / 2) - II1IlIllIll.AbsolutePosition
            IlIIII1l1ll = UDim2.fromOffset(math.max(II1IlllIIlI.X, 0), II1IlllIIlI.Y)
        end
        I1IlIl1l1I1.Minimizing = true
        I1IlIl1l1I1._PendingToggle = false
        local Il1Il11IIl1 = os.clock()
        I1IlIl1l1I1._MinimizeStart = Il1Il11IIl1
        I1IlIl1l1I1.MinimizeRestore = Il1III11I1I.Position
        local IIIlIl11IlI = TweenInfo.new(0.55, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut)
        Neverlose.PlayAnimate(Il1III11I1I, IIIlIl11IlI, {
            Position = IlIIII1l1ll, Rotation = 0,
        })
        local l11lI11l1ll = Neverlose.PlayAnimate(l1IlI1lIIl1, IIIlIl11IlI, {
            Value = 0.04,
        })
        task.delay(0.18, function ()
            if I1IlIl1l1I1.Destroyed or I1IlIl1l1I1._MinimizeStart ~= Il1Il11IIl1 or not I1IlIl1l1I1.Minimizing then
                return
            end
            I1IlIl1l1I1.Shadow:Render( false )
            Neverlose.PlayAnimate(llIlI11ll1I, TweenInfo0175, {
                Transparency = 1,
            })
            Neverlose.PlayAnimate(Il1III11I1I, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                GroupTransparency = 1,
            })
        end
        )
        task.delay(0.36, function ()
            if I1IlIl1l1I1.Destroyed or I1IlIl1l1I1._MinimizeStart ~= Il1Il11IIl1 or not I1IlIl1l1I1.Minimizing then
                return
            end
            if I1IlIl1l1I1._MenuIcon then
                I1IlIl1l1I1._MenuIcon:SetVisible( true )
            end
        end
        )
        local I1IIl11111I = false
        local function I1I1II1IlI1()
            if I1IIl11111I or I1IlIl1l1I1._MinimizeStart ~= Il1Il11IIl1 then
                return
            end
            I1IIl11111I = true
            I1IlIl1l1I1.Minimizing = false
            if I1IlIl1l1I1.Destroyed then
                return
            end
            I1IlIl1l1I1.Minimized = true
            I1IlIl1l1I1._MinimizeEnd = os.clock()
            l1IlI1lIIl1.Value = 0.04
            Il1III11I1I.GroupTransparency = 1
            llIlI11ll1I.Transparency = 1
            I1IlIl1l1I1.Signal:SetValue( false )
            if I1IlIl1l1I1._MenuIcon then
                I1IlIl1l1I1._MenuIcon:SetVisible( true )
            end
            task.delay(0.3, function ()
                if I1IlIl1l1I1.Destroyed or not I1IlIl1l1I1.Minimized or I1IlIl1l1I1.Signal:GetValue() then
                    return
                end
                Il1III11I1I.GroupTransparency = 1
                llIlI11ll1I.Transparency = 1
                if not I1IlIl1l1I1.__3DRender then
                    Il1III11I1I.Visible = false
                end
            end
            )
            if I1IlIl1l1I1._PendingToggle then
                I1IlIl1l1I1._PendingToggle = false
                task.defer( function ()
                    if not I1IlIl1l1I1.Destroyed and I1IlIl1l1I1.Minimized and not I1IlIl1l1I1.Signal:GetValue() then
                        I1IlIl1l1I1:Restore()
                    end
                end
                )
            end
        end
        l11lI11l1ll.Completed:Once( function (lI111I1III1)
            if lI111I1III1 == Enum.PlaybackState.Completed then
                I1I1II1IlI1()
            end
        end
        )
        task.delay(0.9, I1I1II1IlI1)
        return I1IlIl1l1I1
    end
    function I1IlIl1l1I1:Restore()
        if I1IlIl1l1I1.Destroyed or I1IlIl1l1I1.Minimizing or I1IlIl1l1I1.Signal:GetValue() then
            return I1IlIl1l1I1
        end
        I1IlIl1l1I1.Minimized = false
        I1IlIl1l1I1:ToggleInterface()
        return I1IlIl1l1I1
    end
    function I1IlIl1l1I1:_IsShrunk()
        return l1IlI1lIIl1.Value < 0.5
    end
    function I1IlIl1l1I1:_ForceRestore()
        if I1IlIl1l1I1.Destroyed then
            return I1IlIl1l1I1
        end
        I1IlIl1l1I1.Minimizing = false
        I1IlIl1l1I1.Minimized = false
        I1IlIl1l1I1._PendingToggle = false
        if not I1IlIl1l1I1.Signal:GetValue() then
            I1IlIl1l1I1.Signal:SetValue( true )
        end
        I1IlIl1l1I1:SetRender( true )
        if I1IlIl1l1I1._MenuIcon then
            pcall( function ()
                I1IlIl1l1I1._MenuIcon:OnWindowToggle( true )
            end
            )
        end
        return I1IlIl1l1I1
    end
    function I1IlIl1l1I1:_SyncMinimizeState()
        if I1IlIl1l1I1.Destroyed or I1IlIl1l1I1.Minimizing or I1IlIl1l1I1.__3DRender or I1IlIl1l1I1.KeyGateActive then
            return
        end
        local lIl1IlllllI = os.clock()
        local Il1l1IIIIII = I1IlIl1l1I1.Signal:GetValue()
        if not Il1l1IIIIII then
            local I1II1lll1II = l1IlI1lIIl1.Value < 0.999
            if I1IlIl1l1I1.Minimized or I1II1lll1II then
                if lIl1IlllllI - (I1IlIl1l1I1._MinimizeEnd or 0) < 0.45 then
                    return
                end
                I1IlIl1l1I1.Minimized = true
                if Il1III11I1I.GroupTransparency < 1 then
                    Il1III11I1I.GroupTransparency = 1
                end
                if llIlI11ll1I.Transparency < 1 then
                    llIlI11ll1I.Transparency = 1
                end
                if Il1III11I1I.Visible then
                    Il1III11I1I.Visible = false
                end
                if I1IlIl1l1I1._MenuIcon and I1IlIl1l1I1._MenuIcon.Visible == false then
                    I1IlIl1l1I1._MenuIcon:SetVisible( true )
                end
            end
        else
            if I1IlIl1l1I1.Minimized then
                I1IlIl1l1I1:_ForceRestore()
                return
            end
            if lIl1IlllllI - (I1IlIl1l1I1._RestoreStart or 0) > 1.3 and lIl1IlllllI - (I1IlIl1l1I1._CreatedAt or 0) > 2 then
                if l1IlI1lIIl1.Value < 0.999 then
                    I1IlIl1l1I1:_ForceRestore()
                elseif Il1III11I1I.GroupTransparency > 0.01 and Il1III11I1I.BackgroundTransparency <= 0.9 then
                    Il1III11I1I.GroupTransparency = 0
                end
            end
        end
    end
    task.spawn( function ()
        while not I1IlIl1l1I1.Destroyed do
            task.wait(0.25)
            pcall( function ()
                I1IlIl1l1I1:_SyncMinimizeState()
            end
            )
        end
    end
    )
    function I1IlIl1l1I1:ToggleMinimize()
        if I1IlIl1l1I1.Signal:GetValue() then
            return I1IlIl1l1I1:Minimize()
        end
        return I1IlIl1l1I1:Restore()
    end
    do
        local Il1I11I1III = Neverlose:CreateInput(IllllIlIIll, ( function ()
            I1IlIl1l1I1:Minimize()
        end
        ))
        Neverlose:AddSignal(Il1I11I1III.MouseEnter:Connect(( function ()
            Neverlose.PlayAnimate(IllllIlIIll, TweenInfo0175, {
                TextTransparency = 0.150
            })
        end
        )))Neverlose:AddSignal(Il1I11I1III.MouseLeave:Connect(( function ()
            Neverlose.PlayAnimate(IllllIlIIll, TweenInfo0175, {
                TextTransparency = I1IlIl1l1I1.Signal:GetValue() and 0.450 or 1
            })
        end
        )))
    end
    do
        local I1lIIllIlI1 = Neverlose:CreateInput(I1llII1I1ll, ( function ()
            I1IlIl1l1I1:Dialog({
                Title = "Destroy Window?", Content = "Are you sure you want to destroy this window?", Buttons = {
                    {
                        Text = "Cancel", ReturnValue = false ,
                    }, {
                        Text = "Yes", Primary = true , ReturnValue = true ,
                    },
                }, Callback = function (IIll1111lI1)
                    if IIll1111lI1 == true then
                        I1IlIl1l1I1:Destroy()
                    end
                end
                ,
            })
        end
        ))
        Neverlose:AddSignal(I1lIIllIlI1.MouseEnter:Connect(( function ()
            Neverlose.PlayAnimate(I1llII1I1ll, TweenInfo0175, {
                TextTransparency = 0.150
            })
        end
        )))Neverlose:AddSignal(I1lIIllIlI1.MouseLeave:Connect(( function ()
            Neverlose.PlayAnimate(I1llII1I1ll, TweenInfo0175, {
                TextTransparency = I1IlIl1l1I1.Signal:GetValue() and 0.450 or 1
            })
        end
        )))
    end
    if I1IlIl1l1I1.Enable3DRenderer then
        local l111lllIllI = Instance.new("Part")
        l111lllIllI.Name = Neverlose.RandomString()
        l111lllIllI.Anchored = true
        l111lllIllI.Transparency = 1
        l111lllIllI.CanCollide = false
        l111lllIllI.CanTouch = false
        l111lllIllI.AudioCanCollide = false
        l111lllIllI.CollisionGroup = Neverlose.RandomString()
        l111lllIllI.CFrame = CFrame.new(0, 0, 0)
        l111lllIllI.Size = Vector3.zero
        local ll11I11Il1I = Instance.new("SurfaceGui")ll11I11Il1I.Parent = Neverlose.ScreenGui
        ll11I11Il1I.Adornee = l111lllIllI
        ll11I11Il1I.ZIndexBehavior = Enum.ZIndexBehavior.Sibling ll11I11Il1I.AlwaysOnTop = true ll11I11Il1I.LightInfluence = 1.000 ll11I11Il1I.ZIndexBehavior = Enum.ZIndexBehavior.Global
        ll11I11Il1I.SizingMode = Enum.SurfaceGuiSizingMode.FixedSize
        ll11I11Il1I.PixelsPerStud = 40
        I1IlIl1l1I1.SurfaceGui = ll11I11Il1I
        Neverlose.GlobalSurfaceGui = ll11I11Il1I
        local IIl111I11I1 = Vector2.new(1920, 1080 + 300)I1IlIl1l1I1.Load3DBlock = ( function ()
            if not I1IlIl1l1I1.Signal:GetValue() then
                local l1llIIl1IlI, llI1I11lll1 = Camera:WorldToViewportPoint(l111lllIllI.Position)
                if llI1I11lll1 then
                    Neverlose.PlayAnimate(l111lllIllI, TweenInfoQuint, {
                        CFrame = Camera.CFrame * CFrame.new(0, 0, - 15) * CFrame.Angles(0, math.rad180, 0)
                    })
                end
                return
            end
            local ll111II1lII = 50
            local IllIl1Ill1l = Vector2.new(IIl111I11I1.X + 5, IIl111I11I1.Y * 1.35) / (ll111II1lII / 2)
            local llII1l1111l = IllIl1Ill1l.Magnitude
            local lI1lIlI1lI1 = llII1l1111l / 1.35
            l111lllIllI.Parent = Neverlose.BlurModuleParent or workspace
            Neverlose.PlayAnimate(l111lllIllI, TweenInfoQuint, {
                CFrame = (Camera.CFrame * CFrame.new(0, 0, - 25)) * CFrame.Angles(0, math.rad180, 0)
            })
            l111lllIllI.Size = Vector3.new(IIl111I11I1.X / lI1lIlI1lI1, IIl111I11I1.Y / lI1lIlI1lI1, 0)
        end
        )
        function I1IlIl1l1I1:Set3DRender(II111IIIl11)
            I1IlIl1l1I1.__3DRender = II111IIIl11
            Neverlose.Global3DRenderMode = II111IIIl11
            if II111IIIl11 then
                I1IlIl1l1I1.Load3DBlock()
            else
                l111lllIllI.Parent = nil
            end
            I111lllllll()
        end
    end
    function I1IlIl1l1I1:AddTabLabel(Illl1Il1llI)
        local l11II1l1IIl = Instance.new("TextLabel")l11II1l1IIl.Name = Neverlose.RandomString()l11II1l1IIl.Parent = I11I11I11II l11II1l1IIl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l11II1l1IIl.BackgroundTransparency = 1.000 l11II1l1IIl.BorderColor3 = Color3.fromRGB(0, 0, 0)l11II1l1IIl.BorderSizePixel = 0 l11II1l1IIl.Size = UDim2.new(1, - 7, 0, 15)l11II1l1IIl.ZIndex = 8 l11II1l1IIl.Font = Enum.Font.GothamMedium l11II1l1IIl.Text = Illl1Il1llI l11II1l1IIl.TextColor3 = Color3.fromRGB(255, 255, 255)l11II1l1IIl.TextSize = 11.000 l11II1l1IIl.TextTransparency = 0.500 l11II1l1IIl.TextXAlignment = Enum.TextXAlignment.Left local lIIIIll1ll1 = ( function (llIlIl1IIll)
            if llIlIl1IIll then
                Neverlose.PlayAnimate(l11II1l1IIl, TweenInfo0175, {
                    TextTransparency = 0.500
                })
            else
                Neverlose.PlayAnimate(l11II1l1IIl, TweenInfo0175, {
                    TextTransparency = 1
                })
            end
        end
        )lIIIIll1ll1(I1IlIl1l1I1.Signal:GetValue())
        return I1IlIl1l1I1.Signal:Connect(lIIIIll1ll1)
    end
    function I1IlIl1l1I1:AddCategory(I1llIllI1II)
        if typeof(I1llIllI1II) ~= "table" then
            I1llIllI1II = {
                Name = tostring(I1llIllI1II or "Category"),
            }
        end
        I1llIllI1II = Neverlose:ProcessParams(I1llIllI1II, {
            Name = "Category", Icon = "", Open = true ,
        })
        local IIII11Il111 = {
            Tabs ={}, Open = I1llIllI1II.Open ~= false ,
        }
        local I1IIIllI1lI = Instance.new("Frame") local lI1IIl1lllI = Instance.new("UIListLayout") local IIIIll1111I = Instance.new("Frame") local l11l111I1ll = Instance.new("UICorner") local IllI1ll11II = Instance.new("UIStroke") local llllIIl1Il1 = Instance.new("ImageLabel") local lI11IIl1l1I = Instance.new("TextLabel") local I1ll1lIlllI = Instance.new("ImageLabel") local l111l1IIIIl = Instance.new("Frame") local l1IIII1ll11 = Instance.new("UIListLayout")I1IIIllI1lI.Name = Neverlose.RandomString()
        I1IIIllI1lI.Parent = I11I11I11II I1IIIllI1lI.BackgroundTransparency = 1 I1IIIllI1lI.BorderSizePixel = 0 I1IIIllI1lI.ClipsDescendants = true I1IIIllI1lI.Size = UDim2.new(1, - 1, 0, 30)I1IIIllI1lI.ZIndex = 8 lI1IIl1lllI.Parent = I1IIIllI1lI lI1IIl1lllI.SortOrder = Enum.SortOrder.LayoutOrder lI1IIl1lllI.Padding = UDim.new(0, 5)IIIIll1111I.Name = Neverlose.RandomString()
        IIIIll1111I.Parent = I1IIIllI1lI IIIIll1111I.BackgroundColor3 = Color3.fromRGB(20, 22, 27)IIIIll1111I.BackgroundTransparency = 0.250 IIIIll1111I.BorderSizePixel = 0 IIIIll1111I.ClipsDescendants = true IIIIll1111I.Size = UDim2.new(1, 0, 0, 30)IIIIll1111I.ZIndex = 8 l11l111I1ll.CornerRadius = UDim.new(0, 6)l11l111I1ll.Parent = IIIIll1111I IllI1ll11II.Color = Color3.fromRGB(45, 48, 58)IllI1ll11II.Transparency = 0.700 IllI1ll11II.Parent = IIIIll1111I llllIIl1Il1.Name = Neverlose.RandomString()
        llllIIl1Il1.Parent = IIIIll1111I llllIIl1Il1.AnchorPoint = Vector2.new(0, 0.5)llllIIl1Il1.BackgroundTransparency = 1 llllIIl1Il1.BorderSizePixel = 0 llllIIl1Il1.Position = UDim2.new(0, 8, 0.5, 0)llllIIl1Il1.Size = UDim2.new(0, 16, 0, 16)llllIIl1Il1.ZIndex = 9 llllIIl1Il1.ImageColor3 = Neverlose.IconColor llllIIl1Il1.ScaleType = Enum.ScaleType.Fit Neverlose:SetIconMode(llllIIl1Il1, I1llIllI1II.Icon)llllIIl1Il1.Visible = tostring(I1llIllI1II.Icon or "") ~= ""lI11IIl1l1I.Name = Neverlose.RandomString()
        lI11IIl1l1I.Parent = IIIIll1111I lI11IIl1l1I.AnchorPoint = Vector2.new(0, 0.5)lI11IIl1l1I.BackgroundTransparency = 1 lI11IIl1l1I.BorderSizePixel = 0 lI11IIl1l1I.Position = llllIIl1Il1.Visible and UDim2.new(0, 30, 0.5, 0) or UDim2.new(0, 10, 0.5, 0)lI11IIl1l1I.Size = llllIIl1Il1.Visible and UDim2.new(1, - 58, 0, 16) or UDim2.new(1, - 38, 0, 16)lI11IIl1l1I.ZIndex = 9 lI11IIl1l1I.Font = Enum.Font.GothamMedium lI11IIl1l1I.Text = I1llIllI1II.Name lI11IIl1l1I.TextColor3 = Color3.fromRGB(255, 255, 255)lI11IIl1l1I.TextSize = 12.000 lI11IIl1l1I.TextTransparency = 0.080 lI11IIl1l1I.TextTruncate = Enum.TextTruncate.AtEnd lI11IIl1l1I.TextXAlignment = Enum.TextXAlignment.Left I1ll1lIlllI.Name = Neverlose.RandomString()
        I1ll1lIlllI.Parent = IIIIll1111I I1ll1lIlllI.AnchorPoint = Vector2.new(1, 0.5)I1ll1lIlllI.BackgroundTransparency = 1 I1ll1lIlllI.BorderSizePixel = 0 I1ll1lIlllI.Position = UDim2.new(1, - 7, 0.5, 0)I1ll1lIlllI.Size = UDim2.new(0, 16, 0, 16)I1ll1lIlllI.ZIndex = 9 I1ll1lIlllI.ImageColor3 = Color3.fromRGB(223, 223, 223)I1ll1lIlllI.ImageTransparency = 0.350 I1ll1lIlllI.ScaleType = Enum.ScaleType.Fit Neverlose:SetIconMode(I1ll1lIlllI, "chevron-small-down")l111l1IIIIl.Name = Neverlose.RandomString()
        l111l1IIIIl.Parent = I1IIIllI1lI l111l1IIIIl.BackgroundTransparency = 1 l111l1IIIIl.BorderSizePixel = 0 l111l1IIIIl.ClipsDescendants = true l111l1IIIIl.Size = UDim2.new(1, 0, 0, 0)l111l1IIIIl.ZIndex = 8 l1IIII1ll11.Parent = l111l1IIIIl l1IIII1ll11.HorizontalAlignment = Enum.HorizontalAlignment.Center l1IIII1ll11.SortOrder = Enum.SortOrder.LayoutOrder l1IIII1ll11.Padding = UDim.new(0, 5) local function I1l1I1I1IlI()
            local I11I1l1l1l1 = IIII11Il111.Open and (l1IIII1ll11.AbsoluteContentSize.Y + (#IIII11Il111.Tabs > 0 and1 or 0)) or 0
            local l1I1IIl1I1l = 30 + (IIII11Il111.Open and 5 or0) + I11I1l1l1l1
            if IIII11Il111.Open then
                l111l1IIIIl.Visible = true
            end
            Neverlose.PlayAnimate(l111l1IIIIl, TweenInfoQuint, {
                Size = UDim2.new(1, 0, 0, I11I1l1l1l1)
            })
            Neverlose.PlayAnimate(I1IIIllI1lI, TweenInfoQuint, {
                Size = UDim2.new(1, - 1, 0, l1I1IIl1I1l)
            })
            Neverlose.PlayAnimate(I1ll1lIlllI, TweenInfo0175, {
                Rotation = IIII11Il111.Open and 0 or - 90
            })
            if not IIII11Il111.Open then
                task.delay(0.2, function ()
                    if not IIII11Il111.Open then
                        l111l1IIIIl.Visible = false
                    end
                end
                )
            end
        end
        function IIII11Il111:SetOpen(ll111IIl1lI)
            IIII11Il111.Open = ll111IIl1lI == true
            I1l1I1I1IlI()
            return IIII11Il111
        end
        function IIII11Il111:Toggle()
            return IIII11Il111:SetOpen( not IIII11Il111.Open)
        end
        function IIII11Il111:GetOpen()
            return IIII11Il111.Open
        end
        function IIII11Il111:SetName(IlII1IlI11l)
            I1llIllI1II.Name = tostring(IlII1IlI11l or "")
            lI11IIl1l1I.Text = I1llIllI1II.Name
            return IIII11Il111
        end
        function IIII11Il111:SetIcon(lI111l11lI1)
            I1llIllI1II.Icon = lI111l11lI1 or ""
            Neverlose:SetIconMode(llllIIl1Il1, I1llIllI1II.Icon)
            llllIIl1Il1.Visible = tostring(I1llIllI1II.Icon or "") ~= ""
            lI11IIl1l1I.Position = llllIIl1Il1.Visible and UDim2.new(0, 30, 0.5, 0) or UDim2.new(0, 10, 0.5, 0)
            lI11IIl1l1I.Size = llllIIl1Il1.Visible and UDim2.new(1, - 58, 0, 16) or UDim2.new(1, - 38, 0, 16)
            return IIII11Il111
        end
        function IIII11Il111:AddTab(lI1II111III)
            local Il11I1l1I1I = I1IlIl1l1I1.__NextTabParent
            I1IlIl1l1I1.__NextTabParent = l111l1IIIIl
            local lI11l1l11lI = I1IlIl1l1I1:AddTab(lI1II111III)
            I1IlIl1l1I1.__NextTabParent = Il11I1l1I1I
            table.insert(IIII11Il111.Tabs, lI11l1l11lI)
            I1l1I1I1IlI()
            return lI11l1l11lI
        end
        Neverlose:AddSignal(l1IIII1ll11:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(I1l1I1I1IlI)) local III1Il11111 = Neverlose:CreateInput(IIIIll1111I, function ()
            IIII11Il111:Toggle()
        end
        )
        Neverlose:AddSignal(III1Il11111.MouseEnter:Connect( function ()
            Neverlose.PlayAnimate(IIIIll1111I, TweenInfo0175, {
                BackgroundTransparency = 0.150
            })
        end
        ))Neverlose:AddSignal(III1Il11111.MouseLeave:Connect( function ()
            Neverlose.PlayAnimate(IIIIll1111I, TweenInfo0175, {
                BackgroundTransparency = 0.250
            })
        end
        ))Neverlose:AddSignal(I1IlIl1l1I1.Signal:Connect( function (ll11IIIlI1l)
            if ll11IIIlI1l then
                Neverlose.PlayAnimate(IIIIll1111I, TweenInfo0175, {
                    BackgroundTransparency = 0.250
                })Neverlose.PlayAnimate(IllI1ll11II, TweenInfo0175, {
                    Transparency = 0.700
                })Neverlose.PlayAnimate(llllIIl1Il1, TweenInfo0175, {
                    TextTransparency = 0.250
                })Neverlose.PlayAnimate(lI11IIl1l1I, TweenInfo0175, {
                    TextTransparency = 0.080
                })Neverlose.PlayAnimate(I1ll1lIlllI, TweenInfo0175, {
                    TextTransparency = 0.350
                })
            else
                Neverlose.PlayAnimate(IIIIll1111I, TweenInfo0175, {
                    BackgroundTransparency = 1
                })Neverlose.PlayAnimate(IllI1ll11II, TweenInfo0175, {
                    Transparency = 1
                })Neverlose.PlayAnimate(llllIIl1Il1, TweenInfo0175, {
                    TextTransparency = 1
                })Neverlose.PlayAnimate(lI11IIl1l1I, TweenInfo0175, {
                    TextTransparency = 1
                })Neverlose.PlayAnimate(I1ll1lIlllI, TweenInfo0175, {
                    TextTransparency = 1
                })
            end
        end
        ))I1l1I1I1IlI()
        return wrapCaseInsensitive(IIII11Il111)
    end
    function I1IlIl1l1I1:CreateHomeTab(Il1Il11ll1l)
        Il1Il11ll1l = Neverlose:ProcessParams(Il1Il11ll1l or {}, {
            Name = "Dashboard", Title = nil , Icon = "lucide:layout-dashboard", Content = "", SectionName = nil , Type = "Double", AutoSetup = true , DiscordInvite = "", SupportedExecutors ={}, UnsupportedExecutors ={}, Changelog ={}, Segments = nil , Locked = false , TextLocked = "Locked",
        })
        local lI11llII11l = I1IlIl1l1I1:AddTab({
            Name = Il1Il11ll1l.Title or Il1Il11ll1l.Name, Icon = Il1Il11ll1l.Icon, Type = Il1Il11ll1l.Type, Locked = Il1Il11ll1l.Locked, TextLocked = Il1Il11ll1l.TextLocked,
        })
        if Il1Il11ll1l.AutoSetup ~= false then
            if not lI11llII11l.CustomRoot and lI11llII11l.Root then
                lI11llII11l.CustomRoot = Instance.new("Frame")
                lI11llII11l.CustomRoot.Name = Neverlose.RandomString()
                lI11llII11l.CustomRoot.Parent = lI11llII11l.Root
                lI11llII11l.CustomRoot.BackgroundTransparency = 1
                lI11llII11l.CustomRoot.BorderSizePixel = 0
                lI11llII11l.CustomRoot.Position = UDim2.fromOffset(0, 0)
                lI11llII11l.CustomRoot.Size = UDim2.fromScale(1, 1)
                lI11llII11l.CustomRoot.ZIndex = 10
            end
            if not lI11llII11l.CustomRoot then
                return wrapCaseInsensitive(lI11llII11l)
            end
            local Il11II1IIII = LocalPlayer
            local llI1ll1ll1l = "Roblox Studio"
            local l1II1I1llIl = "Unknown Place"
            local IlIl1III11I = "Unknown"
            local Ill1lII111I = RunService:IsRunning() and time or os.clock
            local I111lII1lll ={}
            local l1II111I1I1 = Ill1lII111I()
            local I11l1I11lIl = "Details"
            pcall( function ()
                if identifyexecutor then
                    llI1ll1ll1l = tostring(select(1, identifyexecutor()))
                end
            end
            )
            pcall( function ()
                l1II1I1llIl = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
            end
            )
            pcall( function ()
                IlIl1III11I = game:GetService("LocalizationService"):GetCountryRegionForPlayerAsync(Il11II1IIII)
            end
            )
            local function lI111l11l1I(IIII1Ill1l1, l1III1ll1l1)
                if IIII1Ill1l1 and IIII1Ill1l1.Parent then
                    IIII1Ill1l1.Text = tostring(l1III1ll1l1 or "")
                end
            end
            local function l1l1lIII1lI(IIIIll1lll1, IlI1I111II1)
                local II11I11Illl = Instance.new("UICorner")
                II11I11Illl.CornerRadius = UDim.new(0, IlI1I111II1 or 8)
                II11I11Illl.Parent = IIIIll1lll1
                return II11I11Illl
            end
            local function IlIIIll1I1I(IIl1IlII1lI, IIl1IllIllI, lIIl1I11Ill)
                local III1l1l1Il1 = Instance.new("UIStroke")
                III1l1l1Il1.Color = IIl1IllIllI or Color3.fromRGB(45, 48, 58)
                III1l1l1Il1.Transparency = lIIl1I11Ill or 0.650
                III1l1l1Il1.Parent = IIl1IlII1lI
                return III1l1l1Il1
            end
            local function III11l1llI1(II1l1IIllIl, I1l11lllIll, l1IllI1IIlI, Illl11I1I1I, IIl11Il1Ill)
                local I11Il1ll1ll = Instance.new("TextLabel")
                I11Il1ll1ll.Name = Neverlose.RandomString()
                I11Il1ll1ll.Parent = II1l1IIllIl
                I11Il1ll1ll.BackgroundTransparency = 1
                I11Il1ll1ll.BorderSizePixel = 0
                I11Il1ll1ll.Font = Illl11I1I1I and Enum.Font.GothamBold or Enum.Font.GothamMedium
                I11Il1ll1ll.Text = tostring(I1l11lllIll or "")
                I11Il1ll1ll.TextColor3 = Color3.fromRGB(255, 255, 255)
                I11Il1ll1ll.TextSize = l1IllI1IIlI or 12
                I11Il1ll1ll.TextTransparency = IIl11Il1Ill or 0
                I11Il1ll1ll.TextXAlignment = Enum.TextXAlignment.Left
                I11Il1ll1ll.TextYAlignment = Enum.TextYAlignment.Center
                I11Il1ll1ll.TextTruncate = Enum.TextTruncate.AtEnd
                I11Il1ll1ll.ZIndex = 14
                return I11Il1ll1ll
            end
            local function l1I11I1llll(l1Il1III1l1, II1lIIl1l1I, l1I11IllIlI, l1lIIIlIll1)
                II1lIIl1l1I = II1lIIl1l1I or l1Il1III1l1.TextSize
                l1I11IllIlI = l1I11IllIlI or 8
                l1Il1III1l1.TextSize = II1lIIl1l1I
                task.defer( function ()
                    if not l1Il1III1l1 or not l1Il1III1l1.Parent then
                        return
                    end
                    local II1IlI1Il1l = math.max(1, l1Il1III1l1.AbsoluteSize.X)
                    local I11I1I11ll1 = math.max(1, l1Il1III1l1.AbsoluteSize.Y)
                    local lllllIl111I = II1lIIl1l1I
                    while lllllIl111I > l1I11IllIlI do
                        local l1Ill1IIll1 = TextService:GetTextSize(l1Il1III1l1.Text, lllllIl111I, l1Il1III1l1.Font, l1lIIIlIll1 and Vector2.new(II1IlI1Il1l, math.huge) or Vector2.new(math.huge, I11I1I11ll1))
                        if l1Ill1IIll1.X <= II1IlI1Il1l and ( not l1lIIIlIll1 or l1Ill1IIll1.Y <= I11I1I11ll1) then
                            break
                        end
                        lllllIl111I -= 1
                    end
                    l1Il1III1l1.TextSize = lllllIl111I
                end
                )
            end
            local function IlI1lIlIIl1(ll1II1llIIl, lIlllIlIIlI, ll1l1III1lI)
                local II1Ill1111I = Instance.new("Frame")
                II1Ill1111I.Name = Neverlose.RandomString()
                II1Ill1111I.Parent = ll1II1llIIl
                II1Ill1111I.BackgroundColor3 = Color3.fromRGB(13, 17, 22)
                II1Ill1111I.BackgroundTransparency = 0.100
                II1Ill1111I.BorderSizePixel = 0
                II1Ill1111I.ClipsDescendants = true
                II1Ill1111I.Size = lIlllIlIIlI
                II1Ill1111I.Position = ll1l1III1lI or UDim2.fromOffset(0, 0)
                II1Ill1111I.ZIndex = 12
                l1l1lIII1lI(II1Ill1111I, 8)
                IlIIIll1I1I(II1Ill1111I, Color3.fromRGB(45, 48, 58), 0.680)
                return II1Ill1111I
            end
            local function III1l1l1IIl(I1III1Il11I, II1111lIIl1, lllI1l1Il1l, lI1Ill11l1l)
                local lIIl111I1I1 = Instance.new("ImageLabel")
                lIIl111I1I1.Name = Neverlose.RandomString()
                lIIl111I1I1.Parent = I1III1Il11I
                lIIl111I1I1.BackgroundTransparency = 1
                lIIl111I1I1.BorderSizePixel = 0
                lIIl111I1I1.Size = UDim2.fromOffset(lllI1l1Il1l or 18, lllI1l1Il1l or 18)
                lIIl111I1I1.ScaleType = Enum.ScaleType.Fit
                lIIl111I1I1.ImageColor3 = lI1Ill11l1l or Color3.fromRGB(255, 255, 255)
                lIIl111I1I1.ZIndex = 15
                Neverlose:SetIconMode(lIIl111I1I1, II1111lIIl1 or "")
                return lIIl111I1I1
            end
            local function l1I1lI1I1lI(II1lIll11II, ll1l1llIllI, IlIlIII1lI1, l11IIIIl1I1)
                local lllll1I1l11 = IlI1lIlIIl1(II1lIll11II, UDim2.fromOffset(0, 34))
                lllll1I1l11.BackgroundTransparency = 0.250
                lllll1I1l11.Size = UDim2.new(1, 0, 0, 34)
                local IllIlIIIl1I = III1l1l1IIl(lllll1I1l11, IlIlIII1lI1, 16, Neverlose.AccentColor)
                IllIlIIIl1I.Position = UDim2.new(0, 12, 0.5, - 8)
                local lIl1l1ll11l = III11l1llI1(lllll1I1l11, ll1l1llIllI, 12, true , 0.050)
                lIl1l1ll11l.Position = UDim2.new(0, 36, 0, 0)
                lIl1l1ll11l.Size = UDim2.new(1, - 44, 1, 0)
                local ll1IlllII11 = Neverlose:CreateInput(lllll1I1l11, l11IIIIl1I1 or lIIlIlII11I)
                Neverlose:AddSignal(ll1IlllII11.MouseEnter:Connect( function ()
                    Neverlose.PlayAnimate(lllll1I1l11, TweenInfo0175, {
                        BackgroundTransparency = 0.080
                    })
                end
                ))
                Neverlose:AddSignal(ll1IlllII11.MouseLeave:Connect( function ()
                    Neverlose.PlayAnimate(lllll1I1l11, TweenInfo0175, {
                        BackgroundTransparency = 0.250
                    })
                end
                ))
                return lllll1I1l11
            end
            local function lIlI1II11I1()
                local lIl1lIll1Il = os.date("*t").hour
                if lIl1lIll1Il >= 4 and lIl1lIll1Il < 12 then
                    return "Good Morning"
                elseif lIl1lIll1Il >= 12 and lIl1lIll1Il < 19 then
                    return "How's Your Day Going?"
                elseif lIl1lIll1Il >= 19 and lIl1lIll1Il <= 23 then
                    return "Sweet Dreams"
                end
                return "You should be asleep"
            end
            local function IlIlI1l1l11()
                local lllI1lIllI1 = math.max(0, Ill1lII111I() - l1II111I1I1)
                if lllI1lIllI1 < 60 then
                    return tostring(math.floor(lllI1lIllI1)) .. "s"
                elseif lllI1lIllI1 < 3600 then
                    return tostring(math.floor(lllI1lIllI1 / 60)) .. "m"
                end
                return tostring(math.floor(lllI1lIllI1 / 3600)) .. "h"
            end
            local l1llII11111 = Instance.new("Frame")
            l1llII11111.Name = Neverlose.RandomString()
            l1llII11111.Parent = lI11llII11l.CustomRoot
            l1llII11111.BackgroundTransparency = 1
            l1llII11111.BorderSizePixel = 0
            l1llII11111.Size = UDim2.new(1, - 12, 0, 450)
            l1llII11111.ZIndex = 11
            lI11llII11l.HomeRoot = l1llII11111
            local Il11lIlIl1l = IlI1lIlIIl1(l1llII11111, UDim2.new(1, 0, 0, 74), UDim2.fromOffset(0, 4))
            local l11ll1I1l1I = IlI1lIlIIl1(Il11lIlIl1l, UDim2.fromOffset(58, 58), UDim2.fromOffset(10, 8))
            l11ll1I1l1I.BackgroundTransparency = 0.200
            local IIl11II1I11 = Instance.new("ImageLabel")
            IIl11II1I11.Name = Neverlose.RandomString()
            IIl11II1I11.Parent = l11ll1I1l1I
            IIl11II1I11.BackgroundTransparency = 1
            IIl11II1I11.BorderSizePixel = 0
            IIl11II1I11.Size = UDim2.fromScale(1, 1)
            IIl11II1I11.Image = Neverlose.UserProfile or ""
            IIl11II1I11.ZIndex = 15
            l1l1lIII1lI(IIl11II1I11, 8)
            local l11l1IIl1I1 = III11l1llI1(Il11lIlIl1l, "Hello, " .. tostring(Il11II1IIII.DisplayName), 18, true , 0)
            l11l1IIl1I1.Position = UDim2.new(0, 82, 0, 17)
            l11l1IIl1I1.Size = UDim2.new(1, - 98, 0, 24)
            Neverlose:AddTextGradient(l11l1IIl1I1)
            local I1IIIlllIl1 = III11l1llI1(Il11lIlIl1l, "@" .. tostring(Il11II1IIII.Name), 12, false , 0.350)
            I1IIIlllIl1.Position = UDim2.new(0, 82, 0, 41)
            I1IIIlllIl1.Size = UDim2.new(1, - 98, 0, 18)
            local IlllI1l1llI = IlI1lIlIIl1(l1llII11111, UDim2.new(1, 0, 0, 48), UDim2.fromOffset(0, 86))
            local Il11I1IIllI = Instance.new("UIListLayout")
            Il11I1IIllI.Parent = IlllI1l1llI
            Il11I1IIllI.FillDirection = Enum.FillDirection.Horizontal
            Il11I1IIllI.HorizontalAlignment = Enum.HorizontalAlignment.Center
            Il11I1IIllI.VerticalAlignment = Enum.VerticalAlignment.Center
            Il11I1IIllI.SortOrder = Enum.SortOrder.LayoutOrder
            Il11I1IIllI.Padding = UDim.new(0, 8)
            local Il1llIIllIl = Instance.new("Frame")
            Il1llIIllIl.Name = Neverlose.RandomString()
            Il1llIIllIl.Parent = l1llII11111
            Il1llIIllIl.BackgroundTransparency = 1
            Il1llIIllIl.BorderSizePixel = 0
            Il1llIIllIl.Position = UDim2.fromOffset(0, 144)
            Il1llIIllIl.Size = UDim2.new(1, 0, 1, - 144)
            Il1llIIllIl.ZIndex = 11
            local l1lll1I1llI = Instance.new("Frame")
            l1lll1I1llI.Name = Neverlose.RandomString()
            l1lll1I1llI.Parent = Il1llIIllIl
            l1lll1I1llI.BackgroundTransparency = 1
            l1lll1I1llI.BorderSizePixel = 0
            l1lll1I1llI.Size = UDim2.fromScale(1, 1)
            l1lll1I1llI.ZIndex = 11
            local IIlIl11ll1I = Instance.new("Frame")
            IIlIl11ll1I.Name = Neverlose.RandomString()
            IIlIl11ll1I.Parent = Il1llIIllIl
            IIlIl11ll1I.BackgroundTransparency = 1
            IIlIl11ll1I.BorderSizePixel = 0
            IIlIl11ll1I.Size = UDim2.fromScale(1, 1)
            IIlIl11ll1I.Visible = false
            IIlIl11ll1I.ZIndex = 11
            local lIIIIIlI1lI = Instance.new("Frame")
            lIIIIIlI1lI.Name = Neverlose.RandomString()
            lIIIIIlI1lI.Parent = Il1llIIllIl
            lIIIIIlI1lI.BackgroundTransparency = 1
            lIIIIIlI1lI.BorderSizePixel = 0
            lIIIIIlI1lI.Size = UDim2.fromScale(1, 1)
            lIIIIIlI1lI.Visible = false
            lIIIIIlI1lI.ZIndex = 11
            local lII11l11l1l ={}
            local l1II11IlI1I = 0
            local lII11ll1lI1 = {
                Details = l1lll1I1llI, Script = IIlIl11ll1I, UI = lIIIIIlI1lI,
            }
            local function Il11llIlllI(lIll111I1ll)
                I11l1I11lIl = lIll111I1ll
                for IlllIllIIl1, I1I1IlI1Ill in next, lII11ll1lI1 do
                    I1I1IlI1Ill.Visible = IlllIllIIl1 == lIll111I1ll
                end
                for IIl1lII111l, llI11ll11II in next, lII11l11l1l do
                    Neverlose.PlayAnimate(llI11ll11II.Root, TweenInfo0175, {
                        BackgroundTransparency = IIl1lII111l == lIll111I1ll and 0.080 or 0.550
                    })
                    llI11ll11II.Icon.ImageColor3 = IIl1lII111l == lIll111I1ll and Neverlose.AccentColor or Color3.fromRGB(210, 210, 220)
                    llI11ll11II.Label.TextTransparency = IIl1lII111l == lIll111I1ll and 0 or 0.250
                end
            end
            local l11l11I1lIl = 3
            local function IIllIl1l1lI(I1lI1IlI11I, l1I1l1lIl11, lI1lI1Ill1l)
                local IIIIl1llIII = 1 / math.max(l11l11I1lIl, 1)
                local I1IIIII11ll = IlI1lIlIIl1(IlllI1l1llI, UDim2.new(IIIIl1llIII, - 10, 0, 34))
                I1IIIII11ll.BackgroundTransparency = 0.550
                l1II11IlI1I += 1
                I1IIIII11ll.LayoutOrder = l1II11IlI1I
                local IIlIl1lIl1l = Instance.new("Frame")
                local l1I1l11III1 = Instance.new("UIListLayout")
                IIlIl1lIl1l.Name = Neverlose.RandomString()
                IIlIl1lIl1l.Parent = I1IIIII11ll
                IIlIl1lIl1l.AnchorPoint = Vector2.new(0.5, 0.5)
                IIlIl1lIl1l.BackgroundTransparency = 1
                IIlIl1lIl1l.BorderSizePixel = 0
                IIlIl1lIl1l.Position = UDim2.fromScale(0.5, 0.5)
                IIlIl1lIl1l.Size = UDim2.new(1, - 18, 1, 0)
                IIlIl1lIl1l.ZIndex = 14
                l1I1l11III1.Parent = IIlIl1lIl1l
                l1I1l11III1.FillDirection = Enum.FillDirection.Horizontal
                l1I1l11III1.HorizontalAlignment = Enum.HorizontalAlignment.Center
                l1I1l11III1.VerticalAlignment = Enum.VerticalAlignment.Center
                l1I1l11III1.SortOrder = Enum.SortOrder.LayoutOrder
                l1I1l11III1.Padding = UDim.new(0, 7)
                local II11Illl1II = III1l1l1IIl(I1IIIII11ll, lI1lI1Ill1l, 17, Color3.fromRGB(210, 210, 220))
                II11Illl1II.Parent = IIlIl1lIl1l
                II11Illl1II.LayoutOrder = 1
                local I1IIlIlIlI1 = III11l1llI1(I1IIIII11ll, l1I1l1lIl11, 13, true , 0.250)
                I1IIlIlIlI1.Parent = IIlIl1lIl1l
                I1IIlIlIlI1.LayoutOrder = 2
                I1IIlIlIlI1.Size = UDim2.new(0, math.max(24, TextService:GetTextSize(tostring(l1I1l1lIl11), 13, Enum.Font.GothamBold, Vector2.new(math.huge, math.huge)).X + 2), 0, 18)
                I1IIlIlIlI1.TextXAlignment = Enum.TextXAlignment.Left
                I1IIlIlIlI1.TextTruncate = Enum.TextTruncate.None
                lII11l11l1l[I1lI1IlI11I] = {
                    Root = I1IIIII11ll, Icon = II11Illl1II, Label = I1IIlIlIlI1,
                }
                Neverlose:CreateInput(I1IIIII11ll, function ()
                    Il11llIlllI(I1lI1IlI11I)
                end
                )
                local function l1ll11l11lI()
                    local llI1IIl11ll = math.max(20, IIlIl1lIl1l.AbsoluteSize.X - II11Illl1II.AbsoluteSize.X - l1I1l11III1.Padding.Offset)
                    local ll1l1II1lII = TextService:GetTextSize(I1IIlIlIlI1.Text, I1IIlIlIlI1.TextSize, I1IIlIlIlI1.Font, Vector2.new(math.huge, math.huge)).X + 4
                    I1IIlIlIlI1.Size = UDim2.new(0, math.min(ll1l1II1lII, llI1IIl11ll), 0, 18)
                    I1IIlIlIlI1.TextTruncate = ll1l1II1lII > llI1IIl11ll and Enum.TextTruncate.AtEnd or Enum.TextTruncate.None
                end
                Neverlose:AddSignal(IIlIl1lIl1l:GetPropertyChangedSignal("AbsoluteSize"):Connect(l1ll11l11lI))task.defer(l1ll11l11lI)
            end
            local ll1II11lllI = typeof(Il1Il11ll1l.Segments) == "table" and Il1Il11ll1l.Segments or {}
            local lIll1I1l11l = ll1II11lllI.Details or ll1II11lllI[1] or {}
            local IIl1IIIIIIl = ll1II11lllI.Script or ll1II11lllI[2] or {}
            local IlII1lIl1lI = ll1II11lllI.UI or ll1II11lllI.Ui or ll1II11lllI[3] or {}
            local Ill1l111lIl = lIll1I1l11l.Show ~= false and Il1Il11ll1l.ShowDetailsSegment ~= false
            local ll1I1llIIll = IIl1IIIIIIl.Show ~= false and Il1Il11ll1l.ShowScriptSegment ~= false
            local Il11I1I11II = IlII1lIl1lI.Show ~= false and Il1Il11ll1l.ShowUISegment ~= false
            l11l11I1lIl = (Ill1l111lIl and 1 or0) + (ll1I1llIIll and 1 or0) + (Il11I1I11II and 1 or 0)
            if l11l11I1lIl <= 0 then
                Ill1l111lIl = true
                l11l11I1lIl = 1
            end
            if Ill1l111lIl then
                IIllIl1l1lI("Details", lIll1I1l11l.Text or lIll1I1l11l.Name or Il1Il11ll1l.DetailsText or "Details And Info", lIll1I1l11l.Icon or Il1Il11ll1l.DetailsIcon or "lucide:layout-grid")
            end
            if ll1I1llIIll then
                IIllIl1l1lI("Script", IIl1IIIIIIl.Text or IIl1IIIIIIl.Name or Il1Il11ll1l.ScriptText or "Script Changelog", IIl1IIIIIIl.Icon or Il1Il11ll1l.ScriptIcon or "lucide:code-2")
            end
            if Il11I1I11II then
                IIllIl1l1lI("UI", IlII1lIl1lI.Text or IlII1lIl1lI.Name or Il1Il11ll1l.UIText or Il1Il11ll1l.UiText or "UI Changelog", IlII1lIl1lI.Icon or Il1Il11ll1l.UIIcon or Il1Il11ll1l.UiIcon or "lucide:file-text")
            end
            local ll11lIIllI1 = Instance.new("Frame")
            ll11lIIllI1.Name = Neverlose.RandomString()
            ll11lIIllI1.Parent = l1lll1I1llI
            ll11lIIllI1.BackgroundTransparency = 1
            ll11lIIllI1.BorderSizePixel = 0
            ll11lIIllI1.Size = UDim2.new(0.52, - 5, 1, 0)
            ll11lIIllI1.ZIndex = 11
            local I1II11IIII1 = Instance.new("Frame")
            I1II11IIII1.Name = Neverlose.RandomString()
            I1II11IIII1.Parent = l1lll1I1llI
            I1II11IIII1.BackgroundTransparency = 1
            I1II11IIII1.BorderSizePixel = 0
            I1II11IIII1.Position = UDim2.new(0.52, 5, 0, 0)
            I1II11IIII1.Size = UDim2.new(0.48, - 5, 1, 0)
            I1II11IIII1.ZIndex = 11
            local l1Ill1lI1I1 = IlI1lIlIIl1(ll11lIIllI1, UDim2.new(1, 0, 0, 154), UDim2.fromOffset(0, 0))
            local lI111IlllII = III11l1llI1(l1Ill1lI1I1, "Server", 15, true , 0)
            lI111IlllII.Position = UDim2.fromOffset(16, 14)
            lI111IlllII.Size = UDim2.new(1, - 32, 0, 18)
            local ll1lI11l1l1 = III11l1llI1(l1Ill1lI1I1, "Information on the session you're currently in", 10, false , 0.480)
            ll1lI11l1l1.Position = UDim2.fromOffset(16, 32)
            ll1lI11l1l1.Size = UDim2.new(1, - 32, 0, 14)
            local llIllll1llI ={}
            local function l1I1lI11l1l(Ill1Ill1l11, llll111l111, l1l1llIl1ll, l1II1lll11l, lI11llIll1I, l1lIl1I1lIl)
                local IIIIIl1I1ll = IlI1lIlIIl1(Ill1Ill1l11, UDim2.new(l1lIl1I1lIl, - 6, 0, 42), UDim2.new(l1II1lll11l, 3, 0, lI11llIll1I))
                IIIIIl1I1ll.BackgroundTransparency = 0.250
                local lIlllIl1ll1 = III11l1llI1(IIIIIl1I1ll, llll111l111, 10, true , 0.130)
                lIlllIl1ll1.Position = UDim2.fromOffset(10, 7)
                lIlllIl1ll1.Size = UDim2.new(1, - 20, 0, 13)
                local l1lIl1lI111 = III11l1llI1(IIIIIl1I1ll, l1l1llIl1ll, 10, false , 0.350)
                l1lIl1lI111.Position = UDim2.fromOffset(10, 21)
                l1lIl1lI111.Size = UDim2.new(1, - 20, 0, 13)
                return l1lIl1lI111
            end
            llIllll1llI.Players = l1I1lI11l1l(l1Ill1lI1I1, "Players", "0 playing", 0, 58, 0.5)
            llIllll1llI.Capacity = l1I1lI11l1l(l1Ill1lI1I1, "Maximum Players", tostring(Players.MaxPlayers) .. " can join", 0.5, 58, 0.5)
            llIllll1llI.Latency = l1I1lI11l1l(l1Ill1lI1I1, "Latency", "...", 0, 104, 0.33)
            llIllll1llI.Region = l1I1lI11l1l(l1Ill1lI1I1, "Server Region", tostring(IlIl1III11I), 0.33, 104, 0.34)
            llIllll1llI.Runtime = l1I1lI11l1l(l1Ill1lI1I1, "In server for", "0s", 0.67, 104, 0.33)
            local Il11IlIIlll = IlI1lIlIIl1(ll11lIIllI1, UDim2.new(1, 0, 0, 68), UDim2.fromOffset(0, 164))
            Il11IlIIlll.BackgroundColor3 = Neverlose.AccentColor
            Il11IlIIlll.BackgroundTransparency = 0.180
            local lllll1lll1l = Instance.new("UIGradient")
            lllll1lll1l.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Neverlose.AccentColor), ColorSequenceKeypoint.new(1, Color3.fromRGB(13, 17, 22)),
            })
            lllll1lll1l.Parent = Il11IlIIlll
            local l111ll11II1 = III11l1llI1(Il11IlIIlll, "Discord", 20, true , 0)
            l111ll11II1.Position = UDim2.fromOffset(18, 12)
            l111ll11II1.Size = UDim2.new(1, - 36, 0, 25)
            local II11llIIllI = III11l1llI1(Il11IlIIlll, tostring(Il1Il11ll1l.DiscordInvite or "") ~= "" and "Tap to copy Discord invite" or "No Discord invite configured", 12, false , 0.250)
            II11llIIllI.Position = UDim2.fromOffset(18, 38)
            II11llIIllI.Size = UDim2.new(1, - 36, 0, 18)
            Neverlose:CreateInput(Il11IlIIlll, function ()
                if tostring(Il1Il11ll1l.DiscordInvite or "") == "" then
                    return
                end
                local lllllIlIIIl = "https://discord.gg/" .. tostring(Il1Il11ll1l.DiscordInvite)
                if setclipboard then
                    setclipboard(lllllIlIIIl)
                elseif toclipboard then
                    toclipboard(lllllIlIIIl)
                elseif set_clipboard then
                    set_clipboard(lllllIlIIIl)
                end
                I1IlIl1l1I1:Notify({
                    Title = "Copied", Content = lllllIlIIIl, Duration = 2, Icon = "lucide:check"
                })
            end
            )
            local l1ll1IlI1ll = IlI1lIlIIl1(I1II11IIII1, UDim2.new(1, 0, 0, 92), UDim2.fromOffset(0, 0))
            local Il1lIIlIIlI = "Unknown"
            local III11Il1ll1 = Neverlose.AccentColor
            if table.find(Il1Il11ll1l.SupportedExecutors, llI1ll1ll1l) then
                Il1lIIlIIlI = "Your executor seems to support this script."
                III11Il1ll1 = Color3.fromRGB(45, 180, 115)
            elseif table.find(Il1Il11ll1l.UnsupportedExecutors, llI1ll1ll1l) then
                Il1lIIlIIlI = "Your executor may not support this script."
                III11Il1ll1 = Color3.fromRGB(220, 70, 70)
            end
            l1ll1IlI1ll.BackgroundColor3 = III11Il1ll1
            l1ll1IlI1ll.BackgroundTransparency = 0.180
            local lllIllIII1l = Instance.new("UIGradient")
            lllIllIII1l.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, III11Il1ll1), ColorSequenceKeypoint.new(0.58, Color3.fromRGB(13, 17, 22)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
            })
            lllIllIII1l.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.080), NumberSequenceKeypoint.new(0.55, 0), NumberSequenceKeypoint.new(1, 0),
            })
            lllIllIII1l.Parent = l1ll1IlI1ll
            local l11lll11I1l = III11l1llI1(l1ll1IlI1ll, llI1ll1ll1l, 17, true , 0)
            l11lll11I1l.Position = UDim2.fromOffset(18, 18)
            l11lll11I1l.Size = UDim2.new(1, - 36, 0, 22)
            local lIllI111lll = III11l1llI1(l1ll1IlI1ll, Il1lIIlIIlI, 12, false , 0.150)
            lIllI111lll.Position = UDim2.fromOffset(18, 43)
            lIllI111lll.Size = UDim2.new(1, - 36, 0, 34)
            lIllI111lll.TextWrapped = true
            lIllI111lll.TextTruncate = Enum.TextTruncate.None
            lIllI111lll.TextYAlignment = Enum.TextYAlignment.Top
            l1I11I1llll(lIllI111lll, 12, 8, true )
            local IIl1IlIII1l = IlI1lIlIIl1(I1II11IIII1, UDim2.new(1, 0, 0, 166), UDim2.fromOffset(0, 102))
            local IlllIIl11lI = III11l1llI1(IIl1IlIII1l, "Friends", 16, true , 0)
            IlllIIl11lI.Position = UDim2.fromOffset(16, 12)
            IlllIIl11lI.Size = UDim2.new(1, - 32, 0, 20)
            local lI1IIllI1l1 = III11l1llI1(IIl1IlIII1l, "Find out what your friends are currently doing", 10, false , 0.480)
            lI1IIllI1l1.Position = UDim2.fromOffset(16, 32)
            lI1IIllI1l1.Size = UDim2.new(1, - 32, 0, 14)
            local Il1lI1l1I1I ={}
            Il1lI1l1I1I.InServer = l1I1lI11l1l(IIl1IlIII1l, "In Server", "...", 0, 58, 0.5)
            Il1lI1l1I1I.Offline = l1I1lI11l1l(IIl1IlIII1l, "Offline", "...", 0.5, 58, 0.5)
            Il1lI1l1I1I.Online = l1I1lI11l1l(IIl1IlIII1l, "Online", "...", 0, 104, 0.5)
            Il1lI1l1I1I.All = l1I1lI11l1l(IIl1IlIII1l, "All", "...", 0.5, 104, 0.5)
            local function II1I11IIIlI(l1l1lllII11, l1IllIIlll1, II11I1l1l11)
                local lIIII1ll111 = IlI1lIlIIl1(l1l1lllII11, UDim2.new(1, 0, 1, 0), UDim2.fromOffset(0, 0))
                local IllI1lllIII = Instance.new("UIListLayout")
                IllI1lllIII.Parent = lIIII1ll111
                IllI1lllIII.SortOrder = Enum.SortOrder.LayoutOrder
                IllI1lllIII.Padding = UDim.new(0, 8)
                local llll1IIl1ll = Instance.new("UIPadding")
                llll1IIl1ll.Parent = lIIII1ll111
                llll1IIl1ll.PaddingTop = UDim.new(0, 12)
                llll1IIl1ll.PaddingLeft = UDim.new(0, 12)
                llll1IIl1ll.PaddingRight = UDim.new(0, 12)
                if typeof(l1IllIIlll1) ~= "table" or #l1IllIIlll1 <= 0 then
                    local l111lI11l1I = III11l1llI1(lIIII1ll111, II11I1l1l11, 13, false , 0.250)
                    l111lI11l1I.Size = UDim2.new(1, 0, 0, 26)
                    return
                end
                for Il1llll1llI, lI1lI1II1ll in ipairs(l1IllIIlll1) do
                    local lllI1lIII1I = IlI1lIlIIl1(lIIII1ll111, UDim2.new(1, 0, 0, 64))
                    lllI1lIII1I.LayoutOrder = Il1llll1llI
                    local IlI1Il1l111 = III11l1llI1(lllI1lIII1I, tostring(lI1lI1II1ll.Title or lI1lI1II1ll.Name or ("Update " .. Il1llll1llI)), 14, true , 0)
                    IlI1Il1l111.Position = UDim2.fromOffset(14, 10)
                    IlI1Il1l111.Size = UDim2.new(1, - 28, 0, 18)
                    local IIll1II1IIl = III11l1llI1(lllI1lIII1I, tostring(lI1lI1II1ll.Description or lI1lI1II1ll.Content or lI1lI1II1ll.Date or ""), 11, false , 0.300)
                    IIll1II1IIl.Position = UDim2.fromOffset(14, 31)
                    IIll1II1IIl.Size = UDim2.new(1, - 28, 0, 20)
                end
            end
            II1I11IIIlI(IIlIl11ll1I, Il1Il11ll1l.ScriptChangelog or Il1Il11ll1l.Changelog, "No script changelog.")
            II1I11IIIlI(lIIIIIlI1lI, Il1Il11ll1l.UIChangelog or Il1Il11ll1l.UiChangelog, "No UI changelog.")
            local lIl1lIII1l1 = {
                All = "...", Online = "...", Offline = "...", InServer = "...", Cooldown = 0,
            }
            local function I1II1l1lI1I()
                if lIl1lIII1l1.Cooldown > 0 then
                    lIl1lIII1l1.Cooldown -= 1
                    return
                end
                lIl1lIII1l1.Cooldown = 30
                task.spawn( function ()
                    local ll11lI1ll11 = 0
                    local lIllIllI1Il = 0
                    local I1lIlI1IIII = 0
                    pcall( function ()
                        ll11lI1ll11 = #Il11II1IIII:GetFriendsOnline()
                    end
                    )
                    pcall( function ()
                        local l111I11ll11 = Players:GetFriendsAsync(Il11II1IIII.UserId)
                        while true do
                            for IlIIl1IIll1, lIlI1lI111l in ipairs(l111I11ll11:GetCurrentPage()) do
                                lIllIllI1Il += 1
                                if Players:FindFirstChild(lIlI1lI111l.Username) then
                                    I1lIlI1IIII += 1
                                end
                            end
                            if l111I11ll11.IsFinished then
                                break
                            end
                            l111I11ll11:AdvanceToNextPageAsync()
                        end
                    end
                    )
                    lIl1lIII1l1.All = tostring(lIllIllI1Il) .. " friends"
                    lIl1lIII1l1.Online = tostring(ll11lI1ll11) .. " friends"
                    lIl1lIII1l1.Offline = tostring(math.max(lIllIllI1Il - ll11lI1ll11, 0)) .. " friends"
                    lIl1lIII1l1.InServer = I1lIlI1IIII > 0 and tostring(I1lIlI1IIII) .. " friends" or "no friends"
                end
                )
            end
            local IllI1lIl1I1 = 0
            local function l1lIIl1IlI1(l1I1lII1III)
                local I1I1III11lI = Ill1lII111I()
                for I1I11l11111 = #I111lII1lll, 1, - 1 do
                    if I111lII1lll[I1I11l11111] < I1I1III11lI - 1 then
                        table.remove(I111lII1lll, I1I11l11111)
                    end
                end
                table.insert(I111lII1lll, I1I1III11lI)
                IllI1lIl1I1 += l1I1lII1III or 0
                if IllI1lIl1I1 < 0.5 then
                    return
                end
                IllI1lIl1I1 = 0
                local lII11l1l1lI = "..."
                pcall( function ()
                    lII11l1l1lI = tostring(math.floor((Il11II1IIII:GetNetworkPing() * 1000) + 0.5)) .. "ms"
                end
                )
                lI111l11l1I(l11l1IIl1I1, "Hello, " .. tostring(Il11II1IIII.DisplayName))
                lI111l11l1I(I1IIIlllIl1, lIlI1II11I1() .. " | @" .. tostring(Il11II1IIII.Name))
                lI111l11l1I(llIllll1llI.Players, tostring(#Players:GetPlayers()) .. " playing")
                lI111l11l1I(llIllll1llI.Capacity, tostring(Players.MaxPlayers) .. " can join")
                lI111l11l1I(llIllll1llI.Latency, lII11l1l1lI)
                lI111l11l1I(llIllll1llI.Runtime, IlIlI1l1l11())
                lI111l11l1I(Il1lI1l1I1I.InServer, lIl1lIII1l1.InServer)
                lI111l11l1I(Il1lI1l1I1I.Offline, lIl1lIII1l1.Offline)
                lI111l11l1I(Il1lI1l1I1I.Online, lIl1lIII1l1.Online)
                lI111l11l1I(Il1lI1l1I1I.All, lIl1lIII1l1.All)
                I1II1l1lI1I()
            end
            Il11llIlllI("Details")
            local I111lIIl1I1 = Neverlose:AddSignal(RunService.RenderStepped:Connect(l1lIIl1IlI1))
            table.insert(I1IlIl1l1I1.OnDestroyCallbacks, function ()
                if I111lIIl1I1 then
                    I111lIIl1I1:Disconnect()
                end
            end
            )
            function lI11llII11l:GetHomeSection()
                return lI11llII11l.HomeRoot
            end
            return wrapCaseInsensitive(lI11llII11l)
        end
        local Il11Ill1I1I = lI11llII11l:AddSection({
            Name = Il1Il11ll1l.SectionName or Il1Il11ll1l.Title or Il1Il11ll1l.Name, Position = Il1Il11ll1l.AutoSetup ~= false and "Left" or "Center", Collapsible = Il1Il11ll1l.Collapsible == true , Box = Il1Il11ll1l.Box == true , Icon = Il1Il11ll1l.SectionIcon,
        })
        lI11llII11l.HomeSection = Il11Ill1I1I
        if Il1Il11ll1l.AutoSetup ~= false then
            local lIllIl11Ill = LocalPlayer
            local l11Ill11l1l = "Roblox Studio"
            local IIIIl11Ill1 = "Unknown Place"
            local IlII1IlIll1 = "Unknown"
            local II11lllIlI1 = RunService:IsRunning() and time or os.clock
            local IlIIIIl1Ill ={}
            local II1I11l111l = II11lllIlI1()
            pcall( function ()
                if identifyexecutor then
                    l11Ill11l1l = tostring(select(1, identifyexecutor()))
                end
            end
            )
            pcall( function ()
                IIIIl11Ill1 = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
            end
            )
            pcall( function ()
                IlII1IlIll1 = game:GetService("LocalizationService"):GetCountryRegionForPlayerAsync(lIllIl11Ill)
            end
            )
            local function llIl111IIIl()
                local Il11lll11I1 = os.date("*t").hour
                if Il11lll11I1 >= 4 and Il11lll11I1 < 12 then
                    return "Good Morning"
                elseif Il11lll11I1 >= 12 and Il11lll11I1 < 19 then
                    return "How's Your Day Going?"
                elseif Il11lll11I1 >= 19 and Il11lll11I1 <= 23 then
                    return "Sweet Dreams"
                end
                return "You should be asleep"
            end
            local function IIll1lIl111()
                local IlIlI11lIIl = math.max(0, II11lllIlI1() - II1I11l111l)
                if IlIlI11lIIl < 60 then
                    return tostring(math.floor(IlIlI11lIIl)) .. "s"
                elseif IlIlI11lIIl < 3600 then
                    return tostring(math.floor(IlIlI11lIIl / 60)) .. "m"
                end
                return tostring(math.floor(IlIlI11lIIl / 3600)) .. "h"
            end
            Il11Ill1I1I:AddParagraph({
                Name = "Welcome, " .. tostring(lIllIl11Ill.DisplayName), Content = tostring(Il1Il11ll1l.Content ~= "" and Il1Il11ll1l.Content or (llIl111IIIl() .. " | @" .. lIllIl11Ill.Name)),
            })
            local IIllI1Il1I1 = lI11llII11l:AddSection({
                Name = "Status", Position = "Right", Icon = "lucide:activity",
            })
            local IlllII11lI1 = lI11llII11l:AddSection({
                Name = "Server", Position = "Left", Icon = "lucide:server",
            })
            local llIl1llIIlI = IIllI1Il1I1:AddLabel({
                Text = "Players: " .. tostring(#Players:GetPlayers()) .. "/" .. tostring(Players.MaxPlayers),
            })
            local llIl11l1I1I = IIllI1Il1I1:AddLabel({
                Text = "Runtime: 0s",
            })
            local Il11I1l111l = IIllI1Il1I1:AddLabel({
                Text = "FPS: ... | Ping: ...",
            })
            local IIlI11lII11 = "Unknown"
            if table.find(Il1Il11ll1l.SupportedExecutors, l11Ill11l1l) then
                IIlI11lII11 = "Supported"
            elseif table.find(Il1Il11ll1l.UnsupportedExecutors, l11Ill11l1l) then
                IIlI11lII11 = "Unsupported"
            end
            IIllI1Il1I1:AddParagraph({
                Name = l11Ill11l1l, Content = "Executor: " .. IIlI11lII11,
            })
            IlllII11lI1:AddParagraph({
                Name = IIIIl11Ill1, Content = "PlaceId: " .. tostring(game.PlaceId) .. "\nJobId: " .. tostring(game.JobId) .. "\nRegion: " .. tostring(IlII1IlIll1),
            })
            IlllII11lI1:AddButton({
                Name = "Copy Join Script", Icon = "lucide:copy", Callback = function ()
                    local IIII1111I11 = ("game:GetService(\"TeleportService\"):TeleportToPlaceInstance(%s, \"%s\", game:GetService(\"Players\").LocalPlayer)"):format(tostring(game.PlaceId), tostring(game.JobId))
                    if setclipboard then
                        setclipboard(IIII1111I11)
                    elseif toclipboard then
                        toclipboard(IIII1111I11)
                    elseif set_clipboard then
                        set_clipboard(IIII1111I11)
                    end
                    I1IlIl1l1I1:Notify({
                        Title = "Copied", Content = "Join script copied.", Duration = 2, Icon = "lucide:check",
                    })
                end
                ,
            })
            if tostring(Il1Il11ll1l.DiscordInvite or "") ~= "" then
                IlllII11lI1:AddButton({
                    Name = "Copy Discord", Icon = "lucide:message-circle", Callback = function ()
                        local lII1II1lI1I = "https://discord.gg/" .. tostring(Il1Il11ll1l.DiscordInvite)
                        if setclipboard then
                            setclipboard(lII1II1lI1I)
                        elseif toclipboard then
                            toclipboard(lII1II1lI1I)
                        elseif set_clipboard then
                            set_clipboard(lII1II1lI1I)
                        end
                        I1IlIl1l1I1:Notify({
                            Title = "Copied", Content = lII1II1lI1I, Duration = 2, Icon = "lucide:check",
                        })
                    end
                    ,
                })
            end
            if typeof(Il1Il11ll1l.Changelog) == "table" and #Il1Il11ll1l.Changelog > 0 then
                local IlI11ll11Il = lI11llII11l:AddSection({
                    Name = "Changelog", Position = "Right", Icon = "lucide:list-checks", Collapsible = true ,
                })
                for Illll1lI111, I111111IlI1 in ipairs(Il1Il11ll1l.Changelog) do
                    if Illll1lI111 > 4 then
                        break
                    end
                    if typeof(I111111IlI1) == "table" then
                        IlI11ll11Il:AddParagraph({
                            Name = tostring(I111111IlI1.Title or I111111IlI1.Name or ("Update " .. Illll1lI111)), Content = tostring(I111111IlI1.Date and (I111111IlI1.Date .. "\n") or "") .. tostring(I111111IlI1.Description or I111111IlI1.Content or ""),
                        })
                    else
                        IlI11ll11Il:AddLabel({
                            Text = tostring(I111111IlI1),
                        })
                    end
                end
            end
            local I1IllIl1lI1 = 0
            local function ll1lIII1IlI(lIIlIl11I1I)
                I1IllIl1lI1 = I1IllIl1lI1 + (lIIlIl11I1I or 0)
                local I1llIll1ll1 = II11lllIlI1()
                for lllllIlI1II = #IlIIIIl1Ill, 1, - 1 do
                    if IlIIIIl1Ill[lllllIlI1II] < I1llIll1ll1 - 1 then
                        table.remove(IlIIIIl1Ill, lllllIlI1II)
                    end
                end
                table.insert(IlIIIIl1Ill, I1llIll1ll1)
                if I1IllIl1lI1 < 0.5 then
                    return
                end
                I1IllIl1lI1 = 0
                local l1l1Il1IIlI = "..."
                pcall( function ()
                    l1l1Il1IIlI = tostring(math.floor((lIllIl11Ill:GetNetworkPing() * 1000) + 0.5)) .. "ms"
                end
                )
                if llIl1llIIlI.SetText then
                    llIl1llIIlI:SetText("Players: " .. tostring(#Players:GetPlayers()) .. "/" .. tostring(Players.MaxPlayers))
                end
                if llIl11l1I1I.SetText then
                    llIl11l1I1I:SetText("Runtime: " .. IIll1lIl111())
                end
                if Il11I1l111l.SetText then
                    Il11I1l111l:SetText("FPS: " .. tostring(#IlIIIIl1Ill) .. " | Ping: " .. l1l1Il1IIlI)
                end
            end
            local lI1l1IIll1l = Neverlose:AddSignal(RunService.RenderStepped:Connect(ll1lIII1IlI))
            table.insert(I1IlIl1l1I1.OnDestroyCallbacks, function ()
                if lI1l1IIll1l then
                    lI1l1IIll1l:Disconnect()
                end
            end
            )
        elseif tostring(Il1Il11ll1l.Content or "") ~= "" then
            Il11Ill1I1I:AddParagraph({
                Name = Il1Il11ll1l.ParagraphName or Il1Il11ll1l.Title or Il1Il11ll1l.Name, Content = Il1Il11ll1l.Content,
            })
        end
        if typeof(Il1Il11ll1l.Buttons) == "table" then
            for l1l11IIlII1, ll1lIl1lII1 in ipairs(Il1Il11ll1l.Buttons) do
                Il11Ill1I1I:AddButton(ll1lIl1lII1)
            end
        end
        function lI11llII11l:GetHomeSection()
            return Il11Ill1I1I
        end
        return wrapCaseInsensitive(lI11llII11l)
    end
    function I1IlIl1l1I1:AddTab(lIl1l1l1lll)
        lIl1l1l1lll = Neverlose:ProcessParams(lIl1l1l1lll, {
            Icon = "crosshairs", Name = "Tab", Type = "Double", Locked = false , TextLocked = "Locked", Internal = false , LayoutOrder = 0,
        })
        local lll1I1IlI1l = {
            Signal = Neverlose:CreateSignal( false )
            Internal = lIl1l1l1lll.Internal == true
        }
        local I1III11IlI1 = Instance.new("Frame") local IlIlllllIlI = Instance.new("UICorner") local I1l1Il11I1I = Instance.new("ImageLabel") local IllIIl1I1II = Instance.new("TextLabel")lll1I1IlI1l.Idx = I1III11IlI1
        I1III11IlI1.Name = Neverlose.RandomString()
        I1III11IlI1.Parent = I1IlIl1l1I1.__NextTabParent or I11I11I11II I1III11IlI1.BackgroundColor3 = Color3.fromRGB(41, 45, 49)I1III11IlI1.BackgroundTransparency = 0.500 I1III11IlI1.BorderColor3 = Color3.fromRGB(0, 0, 0)I1III11IlI1.BorderSizePixel = 0 I1III11IlI1.ClipsDescendants = true I1III11IlI1.Size = UDim2.new(1, - 1, 0, 30)I1III11IlI1.ZIndex = 8 I1III11IlI1.LayoutOrder = tonumber(lIl1l1l1lll.LayoutOrder) or 0 IIlllIIl1II:AttachLockMethods(lll1I1IlI1l, I1III11IlI1, lIl1l1l1lll)
        IlIlllllIlI.CornerRadius = UDim.new(0, 6)IlIlllllIlI.Parent = I1III11IlI1 I1l1Il11I1I.Name = Neverlose.RandomString()
        I1l1Il11I1I.Parent = I1III11IlI1 I1l1Il11I1I.AnchorPoint = Vector2.new(0, 0.5)I1l1Il11I1I.BackgroundColor3 = Color3.fromRGB(255, 255, 255)I1l1Il11I1I.BackgroundTransparency = 1.000 I1l1Il11I1I.BorderColor3 = Color3.fromRGB(0, 0, 0)I1l1Il11I1I.BorderSizePixel = 0 I1l1Il11I1I.Position = UDim2.new(0, 2, 0.5, 0)I1l1Il11I1I.Size = UDim2.new(0, 25, 0, 25)I1l1Il11I1I.ZIndex = 9 IIlllIIl1II:SetIconMode(I1l1Il11I1I, lIl1l1l1lll.Icon)
        I1l1Il11I1I.ImageColor3 = Neverlose.AccentColor I1l1Il11I1I.ScaleType = Enum.ScaleType.Fit IllIIl1I1II.Name = Neverlose.RandomString()
        IllIIl1I1II.Parent = I1III11IlI1 IllIIl1I1II.AnchorPoint = Vector2.new(0, 0.5)IllIIl1I1II.BackgroundColor3 = Color3.fromRGB(255, 255, 255)IllIIl1I1II.BackgroundTransparency = 1.000 IllIIl1I1II.BorderColor3 = Color3.fromRGB(0, 0, 0)IllIIl1I1II.BorderSizePixel = 0 IllIIl1I1II.Position = UDim2.new(0, 30, 0.5, 0)IllIIl1I1II.Size = UDim2.new(1, - 7, 0, 15)IllIIl1I1II.ZIndex = 9 IllIIl1I1II.Font = Enum.Font.GothamMedium IllIIl1I1II.Text = lIl1l1l1lll.Name IllIIl1I1II.TextColor3 = Color3.fromRGB(255, 255, 255)IllIIl1I1II.TextSize = 12.000 IllIIl1I1II.TextXAlignment = Enum.TextXAlignment.Left Neverlose:AddTextGradient(IllIIl1I1II)
        local IlI1llIIl1I = Instance.new("Frame") local Il11l11I1l1 = Instance.new("ScrollingFrame") local l1IIIlIIlII = Instance.new("UIListLayout") local ll1111lIIII = Instance.new("ScrollingFrame") local IlIl1l11I11 = Instance.new("UIListLayout") local ll1I111IIIl = Instance.new("ScrollingFrame") local ll1llIIllI1 = Instance.new("UIListLayout") local l1IlIlI1I1I = Instance.new("ScrollingFrame") local lI1lllIlIII = Instance.new("UIListLayout")IlI1llIIl1I.Name = Neverlose.RandomString()
        IlI1llIIl1I.Parent = IllllII1IIl IlI1llIIl1I.AnchorPoint = Vector2.new(0.5, 0.5)IlI1llIIl1I.BackgroundColor3 = Color3.fromRGB(255, 255, 255)IlI1llIIl1I.BackgroundTransparency = 1.000 IlI1llIIl1I.BorderColor3 = Color3.fromRGB(0, 0, 0)IlI1llIIl1I.BorderSizePixel = 0 IlI1llIIl1I.ClipsDescendants = true IlI1llIIl1I.Position = UDim2.new(0.5, 0, 0.5, 0)IlI1llIIl1I.Size = UDim2.new(1, 0, 1, 0)IlI1llIIl1I.Visible = true
        Il11l11I1l1.Name = Neverlose.RandomString()
        Il11l11I1l1.Parent = IlI1llIIl1I Il11l11I1l1.Active = true Il11l11I1l1.AnchorPoint = Vector2.new(0.5, 0.5)Il11l11I1l1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)Il11l11I1l1.BackgroundTransparency = 1.000 Il11l11I1l1.BorderColor3 = Color3.fromRGB(0, 0, 0)Il11l11I1l1.BorderSizePixel = 0 Il11l11I1l1.ClipsDescendants = false Il11l11I1l1.Position = UDim2.new(0.25, 0, 0.5, 0)Il11l11I1l1.Size = UDim2.new(0.5, 0, 1, - 5)Il11l11I1l1.ScrollBarThickness = 0 l1IIIlIIlII.Parent = Il11l11I1l1 l1IIIlIIlII.HorizontalAlignment = Enum.HorizontalAlignment.Right l1IIIlIIlII.SortOrder = Enum.SortOrder.LayoutOrder l1IIIlIIlII.Padding = UDim.new(0, 5)Neverlose:AddSignal(l1IIIlIIlII:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(( function ()
            Il11l11I1l1.CanvasSize = UDim2.fromOffset(0, l1IIIlIIlII.AbsoluteContentSize.Y + 1)
        end
        )))ll1111lIIII.Name = Neverlose.RandomString()
        ll1111lIIII.Parent = IlI1llIIl1I ll1111lIIII.Active = true ll1111lIIII.AnchorPoint = Vector2.new(0.5, 0.5)ll1111lIIII.BackgroundColor3 = Color3.fromRGB(255, 255, 255)ll1111lIIII.BackgroundTransparency = 1.000 ll1111lIIII.BorderColor3 = Color3.fromRGB(0, 0, 0)ll1111lIIII.BorderSizePixel = 0 ll1111lIIII.ClipsDescendants = false ll1111lIIII.Position = UDim2.new(0.75, 0, 0.5, 0)ll1111lIIII.Size = UDim2.new(0.5, 0, 1, - 5)ll1111lIIII.ScrollBarThickness = 0 IlIl1l11I11.Parent = ll1111lIIII IlIl1l11I11.SortOrder = Enum.SortOrder.LayoutOrder IlIl1l11I11.Padding = UDim.new(0, 5)ll1I111IIIl.Name = Neverlose.RandomString()
        ll1I111IIIl.Parent = IlI1llIIl1I ll1I111IIIl.Active = true ll1I111IIIl.AnchorPoint = Vector2.new(0.5, 0.5)ll1I111IIIl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)ll1I111IIIl.BackgroundTransparency = 1.000 ll1I111IIIl.BorderColor3 = Color3.fromRGB(0, 0, 0)ll1I111IIIl.BorderSizePixel = 0 ll1I111IIIl.ClipsDescendants = false ll1I111IIIl.Position = UDim2.new(0.5, 0, 0.5, 0)ll1I111IIIl.Size = UDim2.new(1, 0, 1, - 5)ll1I111IIIl.ScrollBarThickness = 0 ll1I111IIIl.ZIndex = 6 ll1I111IIIl.Visible = false ll1llIIllI1.Parent = ll1I111IIIl ll1llIIllI1.HorizontalAlignment = Enum.HorizontalAlignment.Center ll1llIIllI1.SortOrder = Enum.SortOrder.LayoutOrder ll1llIIllI1.Padding = UDim.new(0, 5) local III11lIll1I = string.lower(tostring(lIl1l1l1lll.Type)) == "single"
        local l1lIIlIIIlI
        l1lIIlIIIlI = ( function ()
            if not ll1I111IIIl.Visible then
                ll1I111IIIl.AnchorPoint = Vector2.new(0.5, 0.5)ll1I111IIIl.Position = UDim2.new(0.5, 0, 0.5, 0)ll1I111IIIl.Size = UDim2.new(1, 0, 1, - 5)Il11l11I1l1.AnchorPoint = Vector2.new(0.5, 0.5)Il11l11I1l1.Position = III11lIll1I and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.25, 0, 0.5, 0)Il11l11I1l1.Size = III11lIll1I and UDim2.new(1, 0, 1, - 5) or UDim2.new(0.5, 0, 1, - 5) if ll1111lIIII and ll1111lIIII.Parent then
                    ll1111lIIII.AnchorPoint = Vector2.new(0.5, 0.5)ll1111lIIII.Position = UDim2.new(0.75, 0, 0.5, 0)ll1111lIIII.Size = UDim2.new(0.5, 0, 1, - 5)
                end
                return
            end
            local ll1llI1IIlI = math.max(80, IlI1llIIl1I.AbsoluteSize.Y * 0.45)
            local l11I1I1I1lI = math.clamp(ll1llIIllI1.AbsoluteContentSize.Y + 1, 0, ll1llI1IIlI)
            local lllll1l1l11 = l11I1I1I1lI + 5
            ll1I111IIIl.AnchorPoint = Vector2.new(0.5, 0)ll1I111IIIl.Position = UDim2.new(0.5, 0, 0, 0)ll1I111IIIl.Size = UDim2.new(1, 0, 0, l11I1I1I1lI)Il11l11I1l1.AnchorPoint = Vector2.new(0.5, 0)Il11l11I1l1.Position = III11lIll1I and UDim2.new(0.5, 0, 0, lllll1l1l11) or UDim2.new(0.25, 0, 0, lllll1l1l11)Il11l11I1l1.Size = III11lIll1I and UDim2.new(1, 0, 1, - lllll1l1l11 - 5) or UDim2.new(0.5, 0, 1, - lllll1l1l11 - 5) if ll1111lIIII and ll1111lIIII.Parent then
                ll1111lIIII.AnchorPoint = Vector2.new(0.5, 0)ll1111lIIII.Position = UDim2.new(0.75, 0, 0, lllll1l1l11)ll1111lIIII.Size = UDim2.new(0.5, 0, 1, - lllll1l1l11 - 5)
            end
        end
        )
        Neverlose:AddSignal(ll1llIIllI1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(( function ()
            ll1I111IIIl.CanvasSize = UDim2.fromOffset(0, ll1llIIllI1.AbsoluteContentSize.Y + 1)l1lIIlIIIlI()
        end
        )))Neverlose:AddSignal(IlI1llIIl1I:GetPropertyChangedSignal("AbsoluteSize"):Connect(( function ()
            l1lIIlIIIlI()
        end
        )))l1IlIlI1I1I.Name = Neverlose.RandomString()
        l1IlIlI1I1I.Parent = IlI1llIIl1I l1IlIlI1I1I.Active = true l1IlIlI1I1I.AnchorPoint = Vector2.new(0.5, 0.5)l1IlIlI1I1I.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l1IlIlI1I1I.BackgroundTransparency = 1.000 l1IlIlI1I1I.BorderColor3 = Color3.fromRGB(0, 0, 0)l1IlIlI1I1I.BorderSizePixel = 0 l1IlIlI1I1I.ClipsDescendants = false l1IlIlI1I1I.Position = UDim2.new(0.5, 0, 0.5, 0)l1IlIlI1I1I.Size = UDim2.new(1, 0, 1, - 5)l1IlIlI1I1I.ScrollBarThickness = 0 l1IlIlI1I1I.ZIndex = 7 lI1lllIlIII.Parent = l1IlIlI1I1I lI1lllIlIII.HorizontalAlignment = Enum.HorizontalAlignment.Center lI1lllIlIII.SortOrder = Enum.SortOrder.LayoutOrder lI1lllIlIII.Padding = UDim.new(0, 5)lll1I1IlI1l.Root = IlI1llIIl1I
        lll1I1IlI1l.LeftScroll = Il11l11I1l1
        lll1I1IlI1l.RightScroll = ll1111lIIII
        lll1I1IlI1l.CenterScroll = ll1I111IIIl
        lll1I1IlI1l.CustomRoot = l1IlIlI1I1I
        Il11l11I1l1.Visible = false ll1111lIIII.Visible = false ll1I111IIIl.Visible = false Neverlose:AddSignal(lI1lllIlIII:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(( function ()
            l1IlIlI1I1I.CanvasSize = UDim2.fromOffset(0, lI1lllIlIII.AbsoluteContentSize.Y + 1)
        end
        ))) local l1I1llll1I1 = 0
        local IIII1I11III = nil
        local function llIIl1l11II(I1II1l11l11)
            l1I1llll1I1 = l1I1llll1I1 + 1
            local l11II1l1l1l = Instance.new("Frame") local IllllI1lll1 = Instance.new("UIListLayout")l11II1l1l1l.Name = Neverlose.RandomString()
            l11II1l1l1l.Parent = l1IlIlI1I1I l11II1l1l1l.BackgroundTransparency = 1 l11II1l1l1l.BorderSizePixel = 0 l11II1l1l1l.ClipsDescendants = false l11II1l1l1l.Size = UDim2.new(1, 0, 0, 0)l11II1l1l1l.ZIndex = 8 l11II1l1l1l.LayoutOrder = l1I1llll1I1 IllllI1lll1.Parent = l11II1l1l1l IllllI1lll1.FillDirection = Enum.FillDirection.Horizontal IllllI1lll1.HorizontalAlignment = Enum.HorizontalAlignment.Center IllllI1lll1.SortOrder = Enum.SortOrder.LayoutOrder IllllI1lll1.Padding = UDim.new(0, 0) local Il1111lIl11 = Instance.new("Frame") local l1l11l11IlI = Instance.new("UIListLayout") local I11ll1lll1I = Instance.new("Frame") local l1I1111I1ll = Instance.new("UIListLayout")Il1111lIl11.Name = Neverlose.RandomString()
            Il1111lIl11.Parent = l11II1l1l1l Il1111lIl11.BackgroundTransparency = 1 Il1111lIl11.BorderSizePixel = 0 Il1111lIl11.ClipsDescendants = false Il1111lIl11.LayoutOrder = 1 Il1111lIl11.Size = I1II1l11l11 == "center" and UDim2.new(1, 0, 0, 0) or UDim2.new(0.5, 0, 0, 0)Il1111lIl11.ZIndex = 8 l1l11l11IlI.Parent = Il1111lIl11 l1l11l11IlI.HorizontalAlignment = Enum.HorizontalAlignment.Center l1l11l11IlI.SortOrder = Enum.SortOrder.LayoutOrder l1l11l11IlI.Padding = UDim.new(0, 5)I11ll1lll1I.Name = Neverlose.RandomString()
            I11ll1lll1I.Parent = l11II1l1l1l I11ll1lll1I.BackgroundTransparency = 1 I11ll1lll1I.BorderSizePixel = 0 I11ll1lll1I.ClipsDescendants = false I11ll1lll1I.LayoutOrder = 2 I11ll1lll1I.Size = UDim2.new(0.5, 0, 0, 0)I11ll1lll1I.Visible = I1II1l11l11 ~= "center"I11ll1lll1I.ZIndex = 8 l1I1111I1ll.Parent = I11ll1lll1I l1I1111I1ll.HorizontalAlignment = Enum.HorizontalAlignment.Center l1I1111I1ll.SortOrder = Enum.SortOrder.LayoutOrder l1I1111I1ll.Padding = UDim.new(0, 5) local function IIIlIIl1Ill()
                local llll111I1I1 = l1l11l11IlI.AbsoluteContentSize.Y
                local llIIIIII1l1 = I11ll1lll1I.Visible and l1I1111I1ll.AbsoluteContentSize.Y or 0
                local III11lII1I1 = math.max(llll111I1I1, llIIIIII1l1)
                l11II1l1l1l.Size = UDim2.new(1, 0, 0, III11lII1I1)
                Il1111lIl11.Size = UDim2.new(Il1111lIl11.Size.X.Scale, 0, 0, III11lII1I1)
                I11ll1lll1I.Size = UDim2.new(I11ll1lll1I.Size.X.Scale, 0, 0, III11lII1I1)
                l1IlIlI1I1I.CanvasSize = UDim2.fromOffset(0, lI1lllIlIII.AbsoluteContentSize.Y + 1)
            end
            Neverlose:AddSignal(l1l11l11IlI:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(IIIlIIl1Ill))Neverlose:AddSignal(l1I1111I1ll:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(IIIlIIl1Ill)) return {
                Root = l11II1l1l1l, Left = Il1111lIl11, Right = I11ll1lll1I, Kind = I1II1l11l11, HasLeft = false , HasRight = false , Update = IIIlIIl1Ill,
            }
        end
        local function lI1IIl1I11l(III1IlIII1I)
            local llI1l1Il1Il = string.lower(tostring(III1IlIII1I or "left"))
            if llI1l1Il1Il == "center" then
                IIII1I11III = nil
                return llIIl1l11II("center").Left
            end
            if III11lIll1I then
                IIII1I11III = nil
                return llIIl1l11II("center").Left
            end
            if llI1l1Il1Il ~= "right" then
                llI1l1Il1Il = "left"
            end
            if IIII1I11III and IIII1I11III.Kind == "pair" then
                if llI1l1Il1Il == "right" then
                    IIII1I11III.HasRight = true
                    return IIII1I11III.Right
                end
                IIII1I11III.HasLeft = true
                return IIII1I11III.Left
            end
            local Il1lIlllllI = llIIl1l11II("pair")
            IIII1I11III = Il1lIlllllI
            if llI1l1Il1Il == "right" then
                Il1lIlllllI.HasRight = true
                return Il1lIlllllI.Right
            end
            Il1lIlllllI.HasLeft = true
            return Il1lIlllllI.Left
        end
        if III11lIll1I then
            IlIl1l11I11:Destroy()
            ll1111lIIII:Destroy()
            ll1111lIIII = Il11l11I1l1
            IlIl1l11I11 = l1IIIlIIlII
            Il11l11I1l1.Size = UDim2.new(1, 0, 1, - 5)
            Il11l11I1l1.Position = UDim2.new(0.5, 0, 0.5, 0)
        else
            Neverlose:AddSignal(IlIl1l11I11:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(( function ()
                ll1111lIIII.CanvasSize = UDim2.fromOffset(0, IlIl1l11I11.AbsoluteContentSize.Y + 1)
            end
            )))
        end
        l1lIIlIIIlI()
        Neverlose:AddSignal(I1l1Il11I1I:GetPropertyChangedSignal("ImageTransparency"):Connect(( function ()
            if I1l1Il11I1I.ImageTransparency > 0.4 then
                l1IIIlIIlII.Parent = nil
                IlIl1l11I11.Parent = nil
                ll1llIIllI1.Parent = nil
                lI1lllIlIII.Parent = nil
                IlI1llIIl1I.Visible = false
                IlI1llIIl1I.Parent = nil
            else
                l1IIIlIIlII.Parent = Il11l11I1l1
                IlIl1l11I11.Parent = ll1111lIIII
                ll1llIIllI1.Parent = ll1I111IIIl
                lI1lllIlIII.Parent = l1IlIlI1I1I
                IlI1llIIl1I.Visible = true
                IlI1llIIl1I.Parent = IllllII1IIl
            end
        end
        )))
        lll1I1IlI1l.SetValue = ( function (Il1l1l111lI)
            if Il1l1l111lI and lll1I1IlI1l.GetLocked and lll1I1IlI1l:GetLocked() then
                Il1l1l111lI = false
            end
            lll1I1IlI1l.Signal:SetValue(Il1l1l111lI)
            if Il1l1l111lI then
                Neverlose.PlayAnimate(I1III11IlI1, TweenInfo0175, {
                    BackgroundTransparency = 0.500
                })Neverlose.PlayAnimate(I1l1Il11I1I, TweenInfo0175, {
                    TextTransparency = 0, TextColor3 = Neverlose.AccentColor
                })Neverlose.PlayAnimate(IllIIl1I1II, TweenInfo0175, {
                    TextTransparency = 0
                })
            else
                Neverlose.PlayAnimate(I1III11IlI1, TweenInfo0175, {
                    BackgroundTransparency = 1
                })Neverlose.PlayAnimate(I1l1Il11I1I, TweenInfo0175, {
                    TextTransparency = 0.5, TextColor3 = Color3.fromRGB(252, 252, 252)
                })Neverlose.PlayAnimate(IllIIl1I1II, TweenInfo0175, {
                    TextTransparency = 0.5
                })
            end
        end
        )
        local l1l1I1l1l11 = lll1I1IlI1l.SetLocked
        function lll1I1IlI1l:SetLocked(Il1II11I111)
            if l1l1I1l1l11 then
                l1l1I1l1l11(lll1I1IlI1l, Il1II11I111)
            end
            if Il1II11I111 == true and I1IlIl1l1I1.Tabs[I1IlIl1l1I1.CurrentTab] == lll1I1IlI1l then
                lll1I1IlI1l.SetValue( false )
                for Ill1Il1111I, I1lI1111Ill in ipairs(I1IlIl1l1I1.Tabs) do
                    if I1lI1111Ill ~= lll1I1IlI1l and ( not I1lI1111Ill.GetLocked or not I1lI1111Ill:GetLocked()) then
                        I1IlIl1l1I1.CurrentTab = Ill1Il1111I
                        I1lI1111Ill.SetValue( true )
                        break
                    end
                end
            end
            return lll1I1IlI1l
        end
        function lll1I1IlI1l:Select()
            if lll1I1IlI1l.GetLocked and lll1I1IlI1l:GetLocked() then
                return lll1I1IlI1l
            end
            for lI1llIIII1l, llI11lll111 in next, I1IlIl1l1I1.Tabs do
                if llI11lll111 == lll1I1IlI1l then
                    llI11lll111.SetValue( true )
                    I1IlIl1l1I1.CurrentTab = lI1llIIII1l
                else
                    llI11lll111.SetValue( false )
                end
            end
            return lll1I1IlI1l
        end
        table.insert(I1IlIl1l1I1.Tabs, lll1I1IlI1l)
        if lll1I1IlI1l.Internal then
            if I1IlIl1l1I1.Tabs[I1IlIl1l1I1.CurrentTab] == lll1I1IlI1l then
                I1IlIl1l1I1.CurrentTab = 0
            end
        elseif not I1IlIl1l1I1.Tabs[I1IlIl1l1I1.CurrentTab] or I1IlIl1l1I1.Tabs[I1IlIl1l1I1.CurrentTab].Internal then
            I1IlIl1l1I1.CurrentTab = #I1IlIl1l1I1.Tabs
        end
        if I1IlIl1l1I1.Tabs[I1IlIl1l1I1.CurrentTab] and I1IlIl1l1I1.Tabs[I1IlIl1l1I1.CurrentTab].GetLocked and I1IlIl1l1I1.Tabs[I1IlIl1l1I1.CurrentTab]:GetLocked() and ( not lll1I1IlI1l.GetLocked or not lll1I1IlI1l:GetLocked()) then
            I1IlIl1l1I1.CurrentTab = #I1IlIl1l1I1.Tabs
        end
        if I1IlIl1l1I1.Tabs[I1IlIl1l1I1.CurrentTab] == lll1I1IlI1l then
            lll1I1IlI1l.SetValue( true )
        else
            lll1I1IlI1l.SetValue( false )
        end
        local II1IIIlI11I = Neverlose:CreateInput(I1III11IlI1, ( function ()
            if lll1I1IlI1l.GetLocked and lll1I1IlI1l:GetLocked() then
                return
            end
            for I1IIlll1l1I, IIl1111IIII in next, I1IlIl1l1I1.Tabs do
                if IIl1111IIII.Idx == I1III11IlI1 then
                    IIl1111IIII.SetValue( true )
                    I1IlIl1l1I1.CurrentTab = I1IIlll1l1I
                else
                    IIl1111IIII.SetValue( false )
                end
            end
        end
        ))
        Neverlose:AddSignal(II1IIIlI11I.MouseEnter:Connect(( function ()
            if I1IlIl1l1I1.Tabs[I1IlIl1l1I1.CurrentTab] == lll1I1IlI1l then
                Neverlose.PlayAnimate(I1III11IlI1, TweenInfo0175, {
                    BackgroundTransparency = 0.500
                })
            else
                Neverlose.PlayAnimate(I1III11IlI1, TweenInfo0175, {
                    BackgroundTransparency = 0.8
                })
            end
        end
        )))Neverlose:AddSignal(II1IIIlI11I.MouseLeave:Connect(( function ()
            if I1IlIl1l1I1.Tabs[I1IlIl1l1I1.CurrentTab] == lll1I1IlI1l then
                Neverlose.PlayAnimate(I1III11IlI1, TweenInfo0175, {
                    BackgroundTransparency = 0.500
                })
            else
                Neverlose.PlayAnimate(I1III11IlI1, TweenInfo0175, {
                    BackgroundTransparency = 1
                })
            end
        end
        )))I1IlIl1l1I1.Signal:Connect(( function (I1IIIll111l)
            if I1IIIll111l then
                if I1IlIl1l1I1.Tabs[I1IlIl1l1I1.CurrentTab] == lll1I1IlI1l then
                    lll1I1IlI1l.SetValue( true )
                else
                    lll1I1IlI1l.SetValue( false )
                end
            else
                lll1I1IlI1l.SetValue( false )
                Neverlose.PlayAnimate(I1III11IlI1, TweenInfo0175, {
                    BackgroundTransparency = 1
                })Neverlose.PlayAnimate(I1l1Il11I1I, TweenInfo0175, {
                    TextTransparency = 1,
                })Neverlose.PlayAnimate(IllIIl1I1II, TweenInfo0175, {
                    TextTransparency = 1
                })
            end
        end
        ))
        function lll1I1IlI1l:AddSection(lIIlI11IIlI)
            lIIlI11IIlI = Neverlose:ProcessParams(lIIlI11IIlI, {
                Name = "SECTION", Position = "left", Collapsible = false , Collapsed = false , Box = false , Icon = nil , IconColor = Color3.fromRGB(223, 223, 223), TextSize = 11, TextXAlignment = "Left", Locked = false , TextLocked = "Locked",
            })
            local lll1l1111Il = lIIlI11IIlI.Collapsible == true and lIIlI11IIlI.Box == true
            local function IllIl1lIIII(II1111l1I1I)
                local IlII1IllIll = string.lower(tostring(II1111l1I1I or "left"))
                if IlII1IllIll == "center" then
                    return Enum.TextXAlignment.Center
                elseif IlII1IllIll == "right" then
                    return Enum.TextXAlignment.Right
                end
                return Enum.TextXAlignment.Left
            end
            local function l1ll11ll1l1()
                local llll1I11lll = (tonumber(lIIlI11IIlI.TextSize) or 11) + 9
                local ll1Ill11lI1 = (lIIlI11IIlI.Icon and tostring(lIIlI11IIlI.Icon) ~= "") and 25 or20
                return math.max(20, llll1I11lll, ll1Ill11lI1)
            end
            local Il1IlIl1111 = Instance.new("Frame") local lll1III1llI = Instance.new("ImageLabel") local IlIlIll1Il1 = Instance.new("TextLabel") local I1ll1Ill1l1 = Instance.new("ImageLabel") local lI1lIIl11l1 = Instance.new("Frame") local IIIIIIlllll = Instance.new("Frame") local l1l1II1l1II = Instance.new("UIStroke") local l1IIl111III = Instance.new("UICorner") local lIIIllIII11 = Instance.new("UIListLayout")Il1IlIl1111.Name = Neverlose.RandomString()
            local I1lIll1I1lI = string.lower(tostring(lIIlI11IIlI.Position))
            Il1IlIl1111.Parent = lI1IIl1I11l(I1lIll1I1lI)Il1IlIl1111.BackgroundColor3 = Color3.fromRGB(255, 255, 255)Il1IlIl1111.BackgroundTransparency = 1.000 Il1IlIl1111.BorderColor3 = Color3.fromRGB(0, 0, 0)Il1IlIl1111.BorderSizePixel = 0 Il1IlIl1111.ClipsDescendants = true Il1IlIl1111.Size = UDim2.new(1, - 5, 0, 0)Il1IlIl1111.ZIndex = 9 lll1III1llI.Name = Neverlose.RandomString()
            lll1III1llI.Parent = Il1IlIl1111 lll1III1llI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)lll1III1llI.BackgroundTransparency = 1.000 lll1III1llI.BorderColor3 = Color3.fromRGB(0, 0, 0)lll1III1llI.BorderSizePixel = 0 lll1III1llI.Size = UDim2.new(0, 15, 0, 15)lll1III1llI.ZIndex = 11 lll1III1llI.ImageColor3 = lIIlI11IIlI.IconColor lll1III1llI.ImageTransparency = lIIlI11IIlI.Icon and 0.500 or 1 lll1III1llI.ScaleType = Enum.ScaleType.Fit if lIIlI11IIlI.Icon then
                Neverlose:SetIconMode(lll1III1llI, lIIlI11IIlI.Icon)
            end
            IlIlIll1Il1.Name = Neverlose.RandomString()
            IlIlIll1Il1.Parent = Il1IlIl1111 IlIlIll1Il1.AnchorPoint = Vector2.new(0, 0)IlIlIll1Il1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)IlIlIll1Il1.BackgroundTransparency = 1.000 IlIlIll1Il1.BorderColor3 = Color3.fromRGB(0, 0, 0)IlIlIll1Il1.BorderSizePixel = 0 IlIlIll1Il1.Position = UDim2.new(0, 11, 0, 0)IlIlIll1Il1.Size = UDim2.new(1, - 46, 0, 15)IlIlIll1Il1.ZIndex = 11 IlIlIll1Il1.Font = Enum.Font.GothamMedium IlIlIll1Il1.Text = lIIlI11IIlI.Name IlIlIll1Il1.TextColor3 = Color3.fromRGB(255, 255, 255)IlIlIll1Il1.TextSize = tonumber(lIIlI11IIlI.TextSize) or 11 IlIlIll1Il1.TextTransparency = 0.500 IlIlIll1Il1.TextXAlignment = IllIl1lIIII(lIIlI11IIlI.TextXAlignment)Neverlose:AddTextGradient(IlIlIll1Il1)
            I1ll1Ill1l1.Name = Neverlose.RandomString()
            I1ll1Ill1l1.Parent = Il1IlIl1111 I1ll1Ill1l1.AnchorPoint = Vector2.new(1, 0)I1ll1Ill1l1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)I1ll1Ill1l1.BackgroundTransparency = 1.000 I1ll1Ill1l1.BorderColor3 = Color3.fromRGB(0, 0, 0)I1ll1Ill1l1.BorderSizePixel = 0 I1ll1Ill1l1.Position = lll1l1111Il and UDim2.new(1, - 8, 0, 1) or UDim2.new(1, - 8, 0, - 4)I1ll1Ill1l1.Size = UDim2.new(0, 24, 0, 24)I1ll1Ill1l1.Visible = lIIlI11IIlI.Collapsible == true I1ll1Ill1l1.ZIndex = 12 IIlllIIl1II:SetIconMode(I1ll1Ill1l1, "chevron-small-down")I1ll1Ill1l1.ImageColor3 = Color3.fromRGB(223, 223, 223)I1ll1Ill1l1.ImageTransparency = 0.500 I1ll1Ill1l1.ScaleType = Enum.ScaleType.Fit lI1lIIl11l1.Name = Neverlose.RandomString()
            lI1lIIl11l1.Parent = Il1IlIl1111 lI1lIIl11l1.AnchorPoint = Vector2.new(0.5, 0)lI1lIIl11l1.BackgroundColor3 = Color3.fromRGB(20, 22, 27)lI1lIIl11l1.BackgroundTransparency = 0.500 lI1lIIl11l1.BorderColor3 = Color3.fromRGB(0, 0, 0)lI1lIIl11l1.BorderSizePixel = 0 lI1lIIl11l1.ClipsDescendants = true lI1lIIl11l1.Position = lll1l1111Il and UDim2.new(0.5, 0, 0, 0) or UDim2.new(0.5, 0, 0, l1ll11ll1l1())lI1lIIl11l1.Size = lll1l1111Il and UDim2.new(1, - 10, 1, 0) or UDim2.new(1, - 10, 1, - l1ll11ll1l1() - 1)lI1lIIl11l1.ZIndex = 9 IIIIIIlllll.Name = Neverlose.RandomString()
            IIIIIIlllll.Parent = lI1lIIl11l1 IIIIIIlllll.BackgroundTransparency = 1.000 IIIIIIlllll.BorderSizePixel = 0 IIIIIIlllll.LayoutOrder = - 100000 IIIIIIlllll.Size = UDim2.new(1, 0, 0, l1ll11ll1l1() + 4)IIIIIIlllll.Visible = lll1l1111Il IIIIIIlllll.ZIndex = 9 l1l1II1l1II.Transparency = 0.650 l1l1II1l1II.Color = Color3.fromRGB(45, 48, 58)l1l1II1l1II.Parent = lI1lIIl11l1 l1IIl111III.CornerRadius = UDim.new(0, 10)l1IIl111III.Parent = lI1lIIl11l1 lIIIllIII11.Parent = lI1lIIl11l1 lIIIllIII11.HorizontalAlignment = Enum.HorizontalAlignment.Center lIIIllIII11.SortOrder = Enum.SortOrder.LayoutOrder local lIl1Il1l11I
            local function llIlll1II1l()
                local IlII1lIIIl1 = lIIlI11IIlI.Icon ~= nil and tostring(lIIlI11IIlI.Icon) ~= ""
                local II11111111I = l1ll11ll1l1()
                local II1III1lIII = tonumber(lIIlI11IIlI.TextSize) or 11
                local Ill1lI1II1l = math.max(15, II1III1lIII + 4)
                local l1l11I1II1l = math.clamp(II1III1lIII + 2, 14, 20)
                local Ill1IIII1l1 = math.max(0, math.floor((II11111111I - Ill1lI1II1l) / 2))
                local IIIlllIl11I = math.max(0, math.floor((II11111111I - l1l11I1II1l) / 2))
                local IlI111lIII1 = math.floor((II11111111I - 24) / 2)
                local IIIlIIl1lI1 = 11
                local llII1ll11lI = IlII1lIIIl1 and 32 or11
                local lII1l1Ill1I = lIIlI11IIlI.Collapsible == true and 38 or11
                lll1III1llI.Visible = IlII1lIIIl1
                lll1III1llI.Position = UDim2.new(0, IIIlIIl1lI1, 0, IIIlllIl11I)
                lll1III1llI.Size = UDim2.new(0, l1l11I1II1l, 0, l1l11I1II1l)
                lll1III1llI.ImageColor3 = lIIlI11IIlI.IconColor
                lll1III1llI.ImageTransparency = IlII1lIIIl1 and 0.500 or 1
                IlIlIll1Il1.TextSize = II1III1lIII
                IlIlIll1Il1.Position = UDim2.new(0, llII1ll11lI, 0, Ill1IIII1l1)
                IlIlIll1Il1.Size = UDim2.new(1, - (llII1ll11lI + lII1l1Ill1I), 0, Ill1lI1II1l)
                IlIlIll1Il1.TextXAlignment = IllIl1lIIII(lIIlI11IIlI.TextXAlignment)
                I1ll1Ill1l1.Position = UDim2.new(1, - 8, 0, IlI111lIII1)
                IIIIIIlllll.Size = UDim2.new(1, 0, 0, l1ll11ll1l1() + 4)
                lI1lIIl11l1.Position = lll1l1111Il and UDim2.new(0.5, 0, 0, 0) or UDim2.new(0.5, 0, 0, l1ll11ll1l1())
                lI1lIIl11l1.Size = lll1l1111Il and UDim2.new(1, - 10, 1, 0) or UDim2.new(1, - 10, 1, - l1ll11ll1l1() - 1)
                if lIl1Il1l11I then
                    lIl1Il1l11I.Size = UDim2.new(1, 0, 0, l1ll11ll1l1())
                end
            end
            llIlll1II1l()
            local II11IlIlIlI = Neverlose:RegisiterItem(lI1lIIl11l1, lll1I1IlI1l.Signal)
            II11IlIlIlI.Collapsible = lIIlI11IIlI.Collapsible == true
            II11IlIlIlI.Collapsed = lIIlI11IIlI.Collapsed == true
            II11IlIlIlI.Root = Il1IlIl1111
            Neverlose:AttachLockMethods(II11IlIlIlI, Il1IlIl1111, lIIlI11IIlI)
            Neverlose.SectionOwners[lI1lIIl11l1] = II11IlIlIlI
            local IIll1IIllIl = lll1I1IlI1l.Signal:GetValue()
            local function lIII1I1lI1I()
                if not IIll1IIllIl then
                    Il1IlIl1111.Size = UDim2.new(1, - 5, 0, 0)
                    return
                end
                local IIl1ll11II1 = lIIIllIII11.AbsoluteContentSize.Y
                local ll1l1l1ll1l = l1ll11ll1l1()
                local I1IlI1IIIIl = lll1l1111Il and (ll1l1l1ll1l + 4) or 0
                local I1ll1Il1l1l = 0
                local Ill1IlIIll1 = math.max(0, IIl1ll11II1 - I1IlI1IIIIl)
                local l1I1IlI11lI = lll1l1111Il and (I1IlI1IIIIl + I1ll1Il1l1l) or ll1l1l1ll1l
                if not II11IlIlIlI.Collapsed and Ill1IlIIll1 > 1 then
                    l1I1IlI11lI = lll1l1111Il and (I1IlI1IIIIl + Ill1IlIIll1 + I1ll1Il1l1l) or (IIl1ll11II1 + ll1l1l1ll1l - 0.5)
                end
                Neverlose.PlayAnimate(Il1IlIl1111, TweenInfoQuint, {
                    Size = UDim2.new(1, - 5, 0, l1I1IlI11lI)
                })
            end
            local function l1I111II1ll()
                local llllllIlIlI = IIll1IIllIl and not II11IlIlIlI.Collapsed
                lI1lIIl11l1.Visible = lll1l1111Il and IIll1IIllIl or llllllIlIlI
                lIIIllIII11.Parent = lI1lIIl11l1
                if II11IlIlIlI.Collapsible then
                    Neverlose.PlayAnimate(I1ll1Ill1l1, TweenInfo0175, {
                        Rotation = II11IlIlIlI.Collapsed and - 90 or0, ImageTransparency = IIll1IIllIl and 0.500 or 1
                    })
                end
                lIII1I1lI1I()
            end
            Neverlose:AddSignal(lIIIllIII11:GetPropertyChangedSignal("AbsoluteContentSize"):Connect((lIII1I1lI1I)))
            function II11IlIlIlI:SetCollapsed(lIIll1lII1I)
                if not II11IlIlIlI.Collapsible then
                    II11IlIlIlI.Collapsible = true
                    lIIlI11IIlI.Collapsible = true
                    I1ll1Ill1l1.Visible = true
                end
                II11IlIlIlI.Collapsed = lIIll1lII1I == true
                lIIlI11IIlI.Collapsed = II11IlIlIlI.Collapsed
                l1I111II1ll()
                return II11IlIlIlI
            end
            function II11IlIlIlI:ToggleCollapsed()
                return II11IlIlIlI:SetCollapsed( not II11IlIlIlI.Collapsed)
            end
            function II11IlIlIlI:GetCollapsed()
                return II11IlIlIlI.Collapsed
            end
            function II11IlIlIlI:SetCollapsible(IIl1lll1llI)
                II11IlIlIlI.Collapsible = IIl1lll1llI == true
                lIIlI11IIlI.Collapsible = II11IlIlIlI.Collapsible
                lll1l1111Il = II11IlIlIlI.Collapsible and lIIlI11IIlI.Box == true
                I1ll1Ill1l1.Visible = II11IlIlIlI.Collapsible
                IIIIIIlllll.Visible = lll1l1111Il
                llIlll1II1l()
                if not II11IlIlIlI.Collapsible then
                    II11IlIlIlI.Collapsed = false
                    lIIlI11IIlI.Collapsed = false
                end
                l1I111II1ll()
                return II11IlIlIlI
            end
            function II11IlIlIlI:SetBox(I1IlIlIIllI)
                lIIlI11IIlI.Box = I1IlIlIIllI == true
                lll1l1111Il = II11IlIlIlI.Collapsible and lIIlI11IIlI.Box == true
                IIIIIIlllll.Visible = lll1l1111Il
                llIlll1II1l()
                l1I111II1ll()
                return II11IlIlIlI
            end
            function II11IlIlIlI:GetBox()
                return lll1l1111Il
            end
            function II11IlIlIlI:SetIcon(II1Ill11I11)
                lIIlI11IIlI.Icon = II1Ill11I11
                if lIIlI11IIlI.Icon and tostring(lIIlI11IIlI.Icon) ~= "" then
                    Neverlose:SetIconMode(lll1III1llI, lIIlI11IIlI.Icon)
                end
                llIlll1II1l()
                l1I111II1ll()
                return II11IlIlIlI
            end
            function II11IlIlIlI:SetIconColor(l1Il1111lIl)
                lIIlI11IIlI.IconColor = l1Il1111lIl or lIIlI11IIlI.IconColor
                llIlll1II1l()
                return II11IlIlIlI
            end
            function II11IlIlIlI:SetTextSize(IlIIl1llIlI)
                lIIlI11IIlI.TextSize = tonumber(IlIIl1llIlI) or lIIlI11IIlI.TextSize
                llIlll1II1l()
                l1I111II1ll()
                return II11IlIlIlI
            end
            function II11IlIlIlI:SetTextXAlignment(llII1llIlI1)
                lIIlI11IIlI.TextXAlignment = llII1llIlI1 or lIIlI11IIlI.TextXAlignment
                llIlll1II1l()
                return II11IlIlIlI
            end
            if lIIlI11IIlI.Collapsible then
                lIl1Il1l11I = Neverlose:CreateInput(Il1IlIl1111, ( function ()
                    II11IlIlIlI:ToggleCollapsed()
                end
                ))
                lIl1Il1l11I.ZIndex = 12
                lIl1Il1l11I.Size = UDim2.new(1, 0, 0, l1ll11ll1l1())
            end
            II11IlIlIlI.SetRender = ( function (I1111I1111l)
                IIll1IIllIl = I1111I1111l == true
                if I1111I1111l then
                    Neverlose.PlayAnimate(lll1III1llI, TweenInfo0175, {
                        ImageTransparency = (lIIlI11IIlI.Icon and tostring(lIIlI11IIlI.Icon) ~= "") and 0.500 or 1
                    })Neverlose.PlayAnimate(IlIlIll1Il1, TweenInfo0175, {
                        TextTransparency = 0.500
                    })Neverlose.PlayAnimate(lI1lIIl11l1, TweenInfo0175, {
                        BackgroundTransparency = 0.500
                    })Neverlose.PlayAnimate(l1l1II1l1II, TweenInfo0175, {
                        Transparency = 0.650
                    })
                else
                    Neverlose.PlayAnimate(lll1III1llI, TweenInfo0175, {
                        ImageTransparency = 1
                    })Neverlose.PlayAnimate(IlIlIll1Il1, TweenInfo0175, {
                        TextTransparency = 1
                    })Neverlose.PlayAnimate(lI1lIIl11l1, TweenInfo0175, {
                        BackgroundTransparency = 1
                    })Neverlose.PlayAnimate(l1l1II1l1II, TweenInfo0175, {
                        Transparency = 1
                    })
                end
                l1I111II1ll()
            end
            )
            II11IlIlIlI.SetRender(lll1I1IlI1l.Signal:GetValue())
            lll1I1IlI1l.Signal:Connect(II11IlIlIlI.SetRender)
            return wrapCaseInsensitive(II11IlIlIlI)
        end
        function lll1I1IlI1l:AddCustom(llIlII1I1I1)
            if typeof(llIlII1I1I1) == "function" then
                llIlII1I1I1 = {
                    Build = llIlII1I1I1,
                }
            end
            llIlII1I1I1 = Neverlose:ProcessParams(llIlII1I1I1, {
                Name = "Custom", Position = "center", Height = 120, Build = nil , Background = true , Title = true , Collapsible = false , FullPage = false , Scrolling = true , HideParentBackground = true , ScrollBarThickness = 3, Locked = false , TextLocked = "Locked", OnShow = nil , OnHide = nil ,
            })
            if llIlII1I1I1.FullPage == true then
                local lIIl11lI1lI ={}
                local lI1lll1111I = 10
                local l1I11lI11Il = Instance.new("Frame")
                l1I11lI11Il.Name = Neverlose.RandomString()
                l1I11lI11Il.Parent = IlI1llIIl1I
                l1I11lI11Il.BackgroundTransparency = 1
                l1I11lI11Il.BorderSizePixel = 0
                l1I11lI11Il.ClipsDescendants = true
                l1I11lI11Il.Position = UDim2.new(0, 0, 0, 0)
                l1I11lI11Il.Size = UDim2.new(1, 0, 1, 0)
                l1I11lI11Il.ZIndex = lI1lll1111I - 1
                local III1Ill1I1I
                if llIlII1I1I1.Scrolling ~= false then
                    III1Ill1I1I = Instance.new("ScrollingFrame")
                    III1Ill1I1I.Active = true
                    III1Ill1I1I.AutomaticCanvasSize = Enum.AutomaticSize.Y
                    III1Ill1I1I.CanvasSize = UDim2.new(0, 0, 0, 0)
                    III1Ill1I1I.ScrollingDirection = Enum.ScrollingDirection.Y
                    III1Ill1I1I.ScrollBarThickness = tonumber(llIlII1I1I1.ScrollBarThickness) or 3
                    III1Ill1I1I.ScrollBarImageColor3 = Color3.fromRGB(120, 125, 140)
                    III1Ill1I1I.ScrollBarImageTransparency = 0.4
                else
                    III1Ill1I1I = Instance.new("Frame")
                end
                III1Ill1I1I.Name = Neverlose.RandomString()
                III1Ill1I1I.Parent = l1I11lI11Il
                III1Ill1I1I.BackgroundTransparency = 1
                III1Ill1I1I.BorderSizePixel = 0
                III1Ill1I1I.ClipsDescendants = true
                III1Ill1I1I.Position = UDim2.new(0, 0, 0, 0)
                III1Ill1I1I.Size = UDim2.new(1, 0, 1, 0)
                III1Ill1I1I.ZIndex = lI1lll1111I - 1
                Neverlose:AttachLockMethods(lIIl11lI1lI, l1I11lI11Il, llIlII1I1I1)
                if l1IlIlI1I1I then
                    local III11Il1lll = false
                    for l1I1lII1l1I, IlI1III1l11 in next, l1IlIlI1I1I:GetChildren() do
                        if IlI1III1l11:IsA("GuiObject") then
                            III11Il1lll = true
                            break
                        end
                    end
                    if not III11Il1lll then
                        l1IlIlI1I1I.Visible = false
                    end
                end
                lll1I1IlI1l.FullPage = lIIl11lI1lI
                lIIl11lI1lI.FullPage = true
                lIIl11lI1lI.Root = l1I11lI11Il
                lIIl11lI1lI.Container = III1Ill1I1I
                lIIl11lI1lI.Tab = lll1I1IlI1l
                lIIl11lI1lI.ZIndex = lI1lll1111I
                local I1I1IlIIlI1 = setmetatable({}, {
                    __mode = "k"
                })
                local lI11Il11Ill = math.max(1, tonumber(llIlII1I1I1.MaxZIndex) or 20)
                local function I111111I111(IlllII111I1)
                    if not IlllII111I1:IsA("GuiObject") or I1I1IlIIlI1[IlllII111I1] then
                        return
                    end
                    local lIIIlIIllII = IlllII111I1.ZIndex
                    local Il1lIIlIl1I = false
                    local function lI111Il1l11()
                        Il1lIIlIl1I = true
                        IlllII111I1.ZIndex = math.min(lIIIlIIllII, lI11Il11Ill) + lI1lll1111I - 1
                        Il1lIIlIl1I = false
                    end
                    local lII11l1111I = IlllII111I1:GetPropertyChangedSignal("ZIndex"):Connect( function ()
                        if Il1lIIlIl1I then
                            return
                        end
                        lIIIlIIllII = IlllII111I1.ZIndex
                        lI111Il1l11()
                    end
                    )
                    I1I1IlIIlI1[IlllII111I1] = {
                        Conn = lII11l1111I, Raw = function ()
                            return lIIIlIIllII
                        end
                        , Apply = lI111Il1l11
                    }
                    lI111Il1l11()
                end
                Neverlose:AddSignal(III1Ill1I1I.DescendantAdded:Connect(I111111I111))
                Neverlose:AddSignal(III1Ill1I1I.DescendantRemoving:Connect( function (I11IllI1l11)
                    local lII1IIl1Il1 = I1I1IlIIlI1[I11IllI1l11]
                    if lII1IIl1Il1 then
                        I1I1IlIIlI1[I11IllI1l11] = nil
                        lII1IIl1Il1.Conn:Disconnect()
                        pcall( function ()
                            I11IllI1l11.ZIndex = lII1IIl1Il1.Raw()
                        end
                        )
                    end
                end
                ))
                for ll1IIIIIl1l, l111IIl1lII in next, III1Ill1I1I:GetDescendants() do
                    I111111I111(l111IIl1lII)
                end
                function lIIl11lI1lI:GetTheme()
                    return Neverlose:GetTheme()
                end
                function lIIl11lI1lI:BindTheme(IIl11l11I1l, lIl1II1IIIl)
                    return Neverlose:BindTheme(IIl11l11I1l, lIl1II1IIIl)
                end
                function lIIl11lI1lI:SetMaxZIndex(I1IlI11llI1)
                    lI11Il11Ill = math.max(1, tonumber(I1IlI11llI1) or 20)
                    for l111I1l1111, lIIIl1II1I1 in next, I1I1IlIIlI1 do
                        pcall(lIIIl1II1I1.Apply)
                    end
                    return lIIl11lI1lI
                end
                function lIIl11lI1lI:Create(llII1lllIlI, l1lI11I1lII, lIIlI1ll11l)
                    local IIl11I1I1I1 = Instance.new(llII1lllIlI)
                    for I1111I1IIIl, Ill11IIIll1 in next, l1lI11I1lII or {} do
                        IIl11I1I1I1[I1111I1IIIl] = Ill11IIIll1
                    end
                    IIl11I1I1I1.Parent = lIIlI1ll11l or III1Ill1I1I
                    return IIl11I1I1I1
                end
                function lIIl11lI1lI:SetHeight()
                    return lIIl11lI1lI
                end
                function lIIl11lI1lI:GetHeight()
                    return III1Ill1I1I.AbsoluteSize.Y
                end
                function lIIl11lI1lI:Clear()
                    for III1111ll11, llII1llI1I1 in next, III1Ill1I1I:GetChildren() do
                        llII1llI1I1:Destroy()
                    end
                    return lIIl11lI1lI
                end
                function lIIl11lI1lI:SetVisible(l1l1Il1lllI)
                    l1I11lI11Il.Visible = l1l1Il1lllI ~= false
                    return lIIl11lI1lI
                end
                function lIIl11lI1lI:ShowError(II1IIIl1111)
                    local lIlIlI11lll = III1Ill1I1I:FindFirstChild("NeverloseCustomError")
                    if lIlIlI11lll then
                        lIlIlI11lll:Destroy()
                    end
                    local II111IlI111 = Instance.new("TextLabel")
                    II111IlI111.Name = "NeverloseCustomError"
                    II111IlI111.BackgroundTransparency = 1
                    II111IlI111.Position = UDim2.new(0, 6, 0, 6)
                    II111IlI111.Size = UDim2.new(1, - 12, 1, - 12)
                    II111IlI111.Font = Enum.Font.Code
                    II111IlI111.TextSize = 11
                    II111IlI111.TextColor3 = Color3.fromRGB(255, 90, 90)
                    II111IlI111.TextWrapped = true
                    II111IlI111.TextXAlignment = Enum.TextXAlignment.Left
                    II111IlI111.TextYAlignment = Enum.TextYAlignment.Top
                    II111IlI111.Text = "Custom build error:\n" .. string.sub(tostring(II1IIIl1111), 1, 400)
                    II111IlI111.Parent = III1Ill1I1I
                    return lIIl11lI1lI
                end
                lIIl11lI1lI.IsReady = false
                local llIl1I1I111 ={}
                local function Il1I1IlIlI1()
                    if lIIl11lI1lI.IsReady then
                        return
                    end
                    local llI11lIl111 = III1Ill1I1I.AbsoluteSize
                    if llI11lIl111.X > 0 and llI11lIl111.Y > 0 then
                        lIIl11lI1lI.IsReady = true
                        local IIIIIII1111 = llIl1I1I111
                        llIl1I1I111 ={}
                        for l11ll1IlII1, ll11lII1l1l in ipairs(IIIIIII1111) do
                            task.spawn(ll11lII1l1l)
                        end
                    end
                end
                Neverlose:AddSignal(III1Ill1I1I:GetPropertyChangedSignal("AbsoluteSize"):Connect(Il1I1IlIlI1))
                function lIIl11lI1lI:OnReady(I1l1111llIl)
                    if lIIl11lI1lI.IsReady then
                        task.spawn(I1l1111llIl, III1Ill1I1I, lIIl11lI1lI)
                    else
                        table.insert(llIl1I1I111, function ()
                            I1l1111llIl(III1Ill1I1I, lIIl11lI1lI)
                        end
                        )
                    end
                    return lIIl11lI1lI
                end
                Il1I1IlIlI1()
                local function lIlIlllll11(lII1Il1I1lI)
                    local IlllIl1111I, l1IIll1lIII = Neverlose:FireCallback(lII1Il1I1lI, llIlII1I1I1.Name, III1Ill1I1I, lIIl11lI1lI)
                    if IlllIl1111I == false then
                        lIIl11lI1lI:ShowError(l1IIll1lIII)
                    end
                    return IlllIl1111I
                end
                function lIIl11lI1lI:Rebuild(IlII11I1l1l)
                    lIIl11lI1lI:Clear()
                    lIlIlllll11(IlII11I1l1l or llIlII1I1I1.Build)
                    return lIIl11lI1lI
                end
                local function Il11II1l1Il()
                    local IIlI1I11Il1 = I1IlIl1l1I1.Signal:GetValue()
                    local l1l1llIllI1 = (I1IlIl1l1I1.FullPageHideCount or 0) > 0 and IIlI1I11Il1
                    local l1I1l1III1l = llIIII1lII1:FindFirstChildOfClass("UIStroke")
                    Neverlose.PlayAnimate(llIIII1lII1, TweenInfo0175, {
                        BackgroundTransparency = (IIlI1I11Il1 and not l1l1llIllI1) and 0.600 or 1
                    })
                    if l1I1l1III1l then
                        Neverlose.PlayAnimate(l1I1l1III1l, TweenInfo0175, {
                            Transparency = (IIlI1I11Il1 and not l1l1llIllI1) and 0.650 or 1
                        })
                    end
                end
                if not I1IlIl1l1I1.FullPageDecorInit then
                    I1IlIl1l1I1.FullPageDecorInit = true
                    I1IlIl1l1I1.FullPageHideCount = 0
                    I1IlIl1l1I1.Signal:Connect( function ()
                        if I1IlIl1l1I1.FullPageHideCount > 0 then
                            task.defer( function ()
                                if I1IlIl1l1I1.FullPageHideCount > 0 then
                                    local Il1Il1l1I11 = I1IlIl1l1I1.Signal:GetValue()
                                    local lIlIII11III = llIIII1lII1:FindFirstChildOfClass("UIStroke")
                                    Neverlose.PlayAnimate(llIIII1lII1, TweenInfo0175, {
                                        BackgroundTransparency = 1
                                    })
                                    if lIlIII11III and Il1Il1l1I11 then
                                        Neverlose.PlayAnimate(lIlIII11III, TweenInfo0175, {
                                            Transparency = 1
                                        })
                                    end
                                end
                            end
                            )
                        end
                    end
                    )
                end
                local lI1lllIll1I = false
                local function IIlllllIl11(Il1III11III)
                    Il1III11III = Il1III11III == true
                    if Il1III11III == lI1lllIll1I then
                        return
                    end
                    lI1lllIll1I = Il1III11III
                    if llIlII1I1I1.HideParentBackground ~= false then
                        I1IlIl1l1I1.FullPageHideCount = math.max(0, (I1IlIl1l1I1.FullPageHideCount or 0) + (Il1III11III and 1 or - 1))
                        Il11II1l1Il()
                    end
                    if Il1III11III then
                        Neverlose:FireCallback(llIlII1I1I1.OnShow, llIlII1I1I1.Name, III1Ill1I1I, lIIl11lI1lI)
                    else
                        Neverlose:FireCallback(llIlII1I1I1.OnHide, llIlII1I1I1.Name, III1Ill1I1I, lIIl11lI1lI)
                    end
                end
                lll1I1IlI1l.Signal:Connect(IIlllllIl11)
                IIlllllIl11(lll1I1IlI1l.Signal:GetValue())
                if type(llIlII1I1I1.Build) == "function" then
                    local I11llIIlIll = lIlIlllll11(llIlII1I1I1.Build)
                    if I11llIIlIll == false and not lIIl11lI1lI.IsReady then
                        lIIl11lI1lI:OnReady( function ()
                            lIIl11lI1lI:Clear()
                            lIlIlllll11(llIlII1I1I1.Build)
                        end
                        )
                    end
                end
                return wrapCaseInsensitive(lIIl11lI1lI)
            end
            local IlllI1Il11l = lll1I1IlI1l:AddSection({
                Name = llIlII1I1I1.Title and tostring(llIlII1I1I1.Name) or "", Position = llIlII1I1I1.Position, Collapsible = llIlII1I1I1.Collapsible,
            })
            return IlllI1Il11l:AddCustom(llIlII1I1I1)
        end
        function lll1I1IlI1l:AddTabbox(lIl1II1I111)
            if typeof(lIl1II1I111) ~= "table" then
                lIl1II1I111 = {
                    Name = lIl1II1I111,
                }
            end
            lIl1II1I111 = Neverlose:ProcessParams(lIl1II1I111, {
                Name = "TABBOX", Position = "left", Side = nil , Locked = false , TextLocked = "Locked", Style = "Accordion", Open = false , OpenFirst = false ,
            })
            local l1llllI1llI = Instance.new("Frame") local I1I1III1lI1 = Instance.new("TextLabel") local ll1l1lI1llI = Instance.new("Frame") local lI1II11llI1 = Instance.new("UIStroke") local IIIIl111111 = Instance.new("UICorner") local I11I1lI1I11 = Instance.new("Frame") local l1l11111lIl = Instance.new("UIListLayout") local I1111llIII1 = {
                Tabs ={}, ActiveTab = nil ,
            }
            local lI111lll1Il = string.lower(tostring(lIl1II1I111.Style or "Accordion")) ~= "tabs"
            I1111llIII1.Accordion = lI111lll1Il
            l1llllI1llI.Name = Neverlose.RandomString()
            local ll1l1llIl11 = (lIl1II1I111.Side == 1 and "left") or (lIl1II1I111.Side == 2 and "right") or string.lower(lIl1II1I111.Position)
            l1llllI1llI.Parent = lI1IIl1I11l(ll1l1llIl11)l1llllI1llI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l1llllI1llI.BackgroundTransparency = 1.000 l1llllI1llI.BorderColor3 = Color3.fromRGB(0, 0, 0)l1llllI1llI.BorderSizePixel = 0 l1llllI1llI.ClipsDescendants = true l1llllI1llI.Size = UDim2.new(1, - 5, 0, 55)l1llllI1llI.ZIndex = 9 IIlllIIl1II:AttachLockMethods(I1111llIII1, l1llllI1llI, lIl1II1I111)
            I1I1III1lI1.Name = Neverlose.RandomString()
            I1I1III1lI1.Parent = l1llllI1llI I1I1III1lI1.AnchorPoint = Vector2.new(0.5, 0)I1I1III1lI1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)I1I1III1lI1.BackgroundTransparency = 1.000 I1I1III1lI1.BorderColor3 = Color3.fromRGB(0, 0, 0)I1I1III1lI1.BorderSizePixel = 0 I1I1III1lI1.Position = UDim2.new(0.5, 0, 0, 0)I1I1III1lI1.Size = UDim2.new(1, - 35, 0, 15)I1I1III1lI1.ZIndex = 9 I1I1III1lI1.Font = Enum.Font.GothamMedium I1I1III1lI1.Text = lIl1II1I111.Name I1I1III1lI1.TextColor3 = Color3.fromRGB(255, 255, 255)I1I1III1lI1.TextSize = 11.000 I1I1III1lI1.TextTransparency = 0.500 I1I1III1lI1.TextXAlignment = Enum.TextXAlignment.Left Neverlose:AddTextGradient(I1I1III1lI1)
            ll1l1lI1llI.Name = Neverlose.RandomString()
            ll1l1lI1llI.Parent = l1llllI1llI ll1l1lI1llI.AnchorPoint = Vector2.new(0.5, 0)ll1l1lI1llI.BackgroundColor3 = Color3.fromRGB(20, 22, 27)ll1l1lI1llI.BackgroundTransparency = 0.500 ll1l1lI1llI.BorderColor3 = Color3.fromRGB(0, 0, 0)ll1l1lI1llI.BorderSizePixel = 0 ll1l1lI1llI.ClipsDescendants = true ll1l1lI1llI.Position = UDim2.new(0.5, 0, 0, 20)ll1l1lI1llI.Size = UDim2.new(1, - 10, 1, - 21)ll1l1lI1llI.ZIndex = 9 lI1II11llI1.Transparency = 0.650 lI1II11llI1.Color = Color3.fromRGB(45, 48, 58)lI1II11llI1.Parent = ll1l1lI1llI IIIIl111111.CornerRadius = UDim.new(0, 10)IIIIl111111.Parent = ll1l1lI1llI I11I1lI1I11.Name = Neverlose.RandomString()
            I11I1lI1I11.Parent = ll1l1lI1llI I11I1lI1I11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)I11I1lI1I11.BackgroundTransparency = 1.000 I11I1lI1I11.BorderColor3 = Color3.fromRGB(0, 0, 0)I11I1lI1I11.BorderSizePixel = 0 I11I1lI1I11.Position = UDim2.new(0, 5, 0, 5)I11I1lI1I11.Size = UDim2.new(1, - 10, 0, 28)I11I1lI1I11.ZIndex = 10 l1l11111lIl.Parent = I11I1lI1I11 l1l11111lIl.FillDirection = Enum.FillDirection.Horizontal l1l11111lIl.SortOrder = Enum.SortOrder.LayoutOrder l1l11111lIl.Padding = UDim.new(0, 5) if lI111lll1Il then
                l1l11111lIl.FillDirection = Enum.FillDirection.Vertical l1l11111lIl.Padding = UDim.new(0, 4)I11I1lI1I11.Size = UDim2.new(1, - 10, 1, - 10)I11I1lI1I11.ClipsDescendants = true
            end
            local I1l111111Il = ( function ()
                if lI111lll1Il then
                    local I11l11l1ll1 = 0
                    for I1IlIl1Illl, l11lIll1llI in ipairs(I1111llIII1.Tabs) do
                        I11l11l1ll1 += 32
                        if l11lIll1llI.Expanded then
                            I11l11l1ll1 += l11lIll1llI.Layout.AbsoluteContentSize.Y + 8
                        end
                        if I1IlIl1Illl > 1 then
                            I11l11l1ll1 += 4
                        end
                    end
                    if I11l11l1ll1 <= 0 then
                        I11l11l1ll1 = 32
                    end
                    Neverlose.PlayAnimate(l1llllI1llI, TweenInfoQuint, {
                        Size = UDim2.new(1, - 5, 0, I11l11l1ll1 + 32)
                    })
                    return
                end
                local lIllIII1l11 = I1111llIII1.ActiveTab
                local IlIIIII1lI1 = 41
                if lIllIII1l11 and lIllIII1l11.Layout then
                    IlIIIII1lI1 = lIllIII1l11.Layout.AbsoluteContentSize.Y + 41
                end
                if IlIIIII1lI1 <= 41 then
                    IlIIIII1lI1 = 55
                end
                Neverlose.PlayAnimate(l1llllI1llI, TweenInfoQuint, {
                    Size = UDim2.new(1, - 5, 0, IlIIIII1lI1 + 19.5)
                })
            end
            )
            local I111I1I1II1 = ( function (I1I1llI111l)
                if I1I1llI111l then
                    Neverlose.PlayAnimate(I1I1III1lI1, TweenInfo0175, {
                        TextTransparency = 0.500
                    })Neverlose.PlayAnimate(ll1l1lI1llI, TweenInfo0175, {
                        BackgroundTransparency = 0.500
                    })Neverlose.PlayAnimate(lI1II11llI1, TweenInfo0175, {
                        Transparency = 0.650
                    })
                else
                    Neverlose.PlayAnimate(I1I1III1lI1, TweenInfo0175, {
                        TextTransparency = 1
                    })Neverlose.PlayAnimate(ll1l1lI1llI, TweenInfo0175, {
                        BackgroundTransparency = 1
                    })Neverlose.PlayAnimate(lI1II11llI1, TweenInfo0175, {
                        Transparency = 1
                    })
                end
                for I1l1ll1II1l, lIl1lIII1ll in ipairs(I1111llIII1.Tabs) do
                    local ll111I11lIl = (lI111lll1Il and lIl1lIII1ll.Expanded == true ) or ( not lI111lll1Il and I1111llIII1.ActiveTab == lIl1lIII1ll)
                    lIl1lIII1ll.Signal:SetValue(I1I1llI111l and ll111I11lIl)
                    lIl1lIII1ll.Root.Visible = ll111I11lIl
                    lIl1lIII1ll.RenderButton(I1I1llI111l and ll111I11lIl)
                end
            end
            )
            function I1111llIII1:AddTab(I111I11l1l1, I1l1l1IlI11)
                local l11IIl11II1 ={}
                if typeof(I111I11l1l1) == "table" then
                    l11IIl11II1 = I111I11l1l1
                    I1l1l1IlI11 = l11IIl11II1.Icon or l11IIl11II1.IconName or I1l1l1IlI11
                    I111I11l1l1 = l11IIl11II1.Name or l11IIl11II1.Title or "Tab"
                end
                local Ill1IlIlIl1 = {
                    Name = I111I11l1l1 or "Tab", Icon = I1l1l1IlI11 or "folder", Signal = Neverlose:CreateSignal( false ),
                }
                l11IIl11II1.Locked = l11IIl11II1.Locked == true
                l11IIl11II1.TextLocked = l11IIl11II1.TextLocked or "Locked"
                local III11Il1Il1 = Instance.new("Frame") local II111lIlIIl = Instance.new("UICorner") local I1lIIII1I11 = Instance.new("UIStroke") local IIllI1II1II = Instance.new("ImageLabel") local I1lI1IIl1l1 = Instance.new("TextLabel") local IIIl111111l = Instance.new("Frame") local IIIIlIll111 = Instance.new("UIListLayout")III11Il1Il1.Name = Neverlose.RandomString()
                III11Il1Il1.Parent = I11I1lI1I11 III11Il1Il1.BackgroundColor3 = Color3.fromRGB(26, 28, 36)III11Il1Il1.BackgroundTransparency = 1.000 III11Il1Il1.BorderColor3 = Color3.fromRGB(0, 0, 0)III11Il1Il1.BorderSizePixel = 0 III11Il1Il1.ClipsDescendants = true III11Il1Il1.Size = UDim2.new(0, 0, 1, 0)III11Il1Il1.ZIndex = 11 IIlllIIl1II:AttachLockMethods(Ill1IlIlIl1, III11Il1Il1, l11IIl11II1)
                II111lIlIIl.CornerRadius = UDim.new(0, 5)II111lIlIIl.Parent = III11Il1Il1 I1lIIII1I11.Transparency = 1 I1lIIII1I11.Color = Color3.fromRGB(45, 48, 58)I1lIIII1I11.Parent = III11Il1Il1 IIllI1II1II.Name = Neverlose.RandomString()
                IIllI1II1II.Parent = III11Il1Il1 IIllI1II1II.AnchorPoint = Vector2.new(0, 0.5)IIllI1II1II.BackgroundColor3 = Color3.fromRGB(255, 255, 255)IIllI1II1II.BackgroundTransparency = 1.000 IIllI1II1II.BorderColor3 = Color3.fromRGB(0, 0, 0)IIllI1II1II.BorderSizePixel = 0 IIllI1II1II.Position = UDim2.new(0, 7, 0.5, 0)IIllI1II1II.Size = UDim2.new(0, 18, 0, 18)IIllI1II1II.ZIndex = 12 IIlllIIl1II:SetIconMode(IIllI1II1II, Ill1IlIlIl1.Icon)IIllI1II1II.ImageColor3 = Color3.fromRGB(223, 223, 223)IIllI1II1II.ImageTransparency = 0.500 IIllI1II1II.ScaleType = Enum.ScaleType.Fit I1lI1IIl1l1.Name = Neverlose.RandomString()
                I1lI1IIl1l1.Parent = III11Il1Il1 I1lI1IIl1l1.AnchorPoint = Vector2.new(0, 0.5)I1lI1IIl1l1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)I1lI1IIl1l1.BackgroundTransparency = 1.000 I1lI1IIl1l1.BorderColor3 = Color3.fromRGB(0, 0, 0)I1lI1IIl1l1.BorderSizePixel = 0 I1lI1IIl1l1.Position = UDim2.new(0, 29, 0.5, 0)I1lI1IIl1l1.Size = UDim2.new(1, - 34, 0, 15)I1lI1IIl1l1.ZIndex = 12 I1lI1IIl1l1.Font = Enum.Font.GothamMedium I1lI1IIl1l1.Text = Ill1IlIlIl1.Name I1lI1IIl1l1.TextColor3 = Color3.fromRGB(255, 255, 255)I1lI1IIl1l1.TextSize = 11.000 I1lI1IIl1l1.TextTransparency = 0.500 I1lI1IIl1l1.TextXAlignment = Enum.TextXAlignment.Left I1lI1IIl1l1.TextTruncate = Enum.TextTruncate.AtEnd Neverlose:AddTextGradient(I1lI1IIl1l1)
                IIIl111111l.Name = Neverlose.RandomString()
                IIIl111111l.Parent = ll1l1lI1llI IIIl111111l.BackgroundColor3 = Color3.fromRGB(255, 255, 255)IIIl111111l.BackgroundTransparency = 1.000 IIIl111111l.BorderColor3 = Color3.fromRGB(0, 0, 0)IIIl111111l.BorderSizePixel = 0 IIIl111111l.ClipsDescendants = true IIIl111111l.Position = UDim2.new(0, 5, 0, 36)IIIl111111l.Size = UDim2.new(1, - 10, 1, - 39)IIIl111111l.Visible = false IIIl111111l.ZIndex = 10 IIIIlIll111.Parent = IIIl111111l IIIIlIll111.HorizontalAlignment = Enum.HorizontalAlignment.Center IIIIlIll111.SortOrder = Enum.SortOrder.LayoutOrder Ill1IlIlIl1.Root = IIIl111111l
                Ill1IlIlIl1.Layout = IIIIlIll111
                Ill1IlIlIl1.Button = III11Il1Il1
                Ill1IlIlIl1.Expanded = false
                local Il1Il1I1lI1 = nil
                local l1llII1Il1l = nil
                if lI111lll1Il then
                    Il1Il1I1lI1 = Instance.new("Frame")
                    Il1Il1I1lI1.Name = Neverlose.RandomString()
                    Il1Il1I1lI1.Parent = I11I1lI1I11
                    Il1Il1I1lI1.BackgroundTransparency = 1
                    Il1Il1I1lI1.BorderSizePixel = 0
                    Il1Il1I1lI1.ClipsDescendants = true
                    Il1Il1I1lI1.Size = UDim2.new(1, 0, 0, 32)
                    Il1Il1I1lI1.ZIndex = 10
                    Il1Il1I1lI1.LayoutOrder = #I1111llIII1.Tabs + 1
                    III11Il1Il1.Parent = Il1Il1I1lI1
                    III11Il1Il1.Position = UDim2.new(0, 0, 0, 0)
                    III11Il1Il1.Size = UDim2.new(1, 0, 0, 32)
                    III11Il1Il1.BackgroundTransparency = 0.5
                    I1lIIII1I11.Transparency = 0.65
                    IIIl111111l.Parent = Il1Il1I1lI1
                    IIIl111111l.Position = UDim2.new(0, 0, 0, 36)
                    IIIl111111l.Size = UDim2.new(1, 0, 0, 0)
                    I1lI1IIl1l1.Size = UDim2.new(1, - 60, 0, 15)
                    l1llII1Il1l = Instance.new("ImageLabel")
                    l1llII1Il1l.Name = Neverlose.RandomString()
                    l1llII1Il1l.Parent = III11Il1Il1
                    l1llII1Il1l.AnchorPoint = Vector2.new(1, 0.5)
                    l1llII1Il1l.BackgroundTransparency = 1
                    l1llII1Il1l.BorderSizePixel = 0
                    l1llII1Il1l.Position = UDim2.new(1, - 9, 0.5, 0)
                    l1llII1Il1l.Size = UDim2.new(0, 14, 0, 14)
                    l1llII1Il1l.ZIndex = 12
                    l1llII1Il1l.ImageColor3 = Color3.fromRGB(223, 223, 223)
                    l1llII1Il1l.ImageTransparency = 0.3
                    Neverlose:SetIconMode(l1llII1Il1l, "chevron-large-right")
                else
                    local llIlI11lll1 = 1 / math.max(#I1111llIII1.Tabs + 1, 1)
                    for l1IlI1llI11, ll111l11l11 in ipairs(I1111llIII1.Tabs) do
                        ll111l11l11.Button.Size = UDim2.new(llIlI11lll1, - 4, 1, 0)
                    end
                    III11Il1Il1.Size = UDim2.new(llIlI11lll1, - 4, 1, 0)
                end
                local l1Il1IIIl11 = ( function (II111l1l1II)
                    if lI111lll1Il then
                        local I1lIll1lllI = lll1I1IlI1l.Signal:GetValue()
                        local I1llIIlI1I1 = Ill1IlIlIl1.Expanded == true
                        Neverlose.PlayAnimate(III11Il1Il1, TweenInfo0175, {
                            BackgroundTransparency = I1lIll1lllI and (I1llIIlI1I1 and 0.15 or 0.5) or 1
                        })
                        Neverlose.PlayAnimate(I1lIIII1I11, TweenInfo0175, {
                            Transparency = I1lIll1lllI and 0.65 or 1
                        })
                        Neverlose.PlayAnimate(IIllI1II1II, TweenInfo0175, {
                            ImageTransparency = I1lIll1lllI and (I1llIIlI1I1 and 0 or 0.35) or 1, ImageColor3 = I1llIIlI1I1 and Neverlose.AccentColor or Color3.fromRGB(223, 223, 223)
                        })
                        Neverlose.PlayAnimate(I1lI1IIl1l1, TweenInfo0175, {
                            TextTransparency = I1lIll1lllI and (I1llIIlI1I1 and 0 or 0.2) or 1
                        })
                        if l1llII1Il1l then
                            Neverlose.PlayAnimate(l1llII1Il1l, TweenInfo0175, {
                                ImageTransparency = I1lIll1lllI and 0.3 or 1, Rotation = I1llIIlI1I1 and 90 or0
                            })
                        end
                        return
                    end
                    if II111l1l1II then
                        Neverlose.PlayAnimate(III11Il1Il1, TweenInfo0175, {
                            BackgroundTransparency = 0.150
                        })Neverlose.PlayAnimate(I1lIIII1I11, TweenInfo0175, {
                            Transparency = 0.650
                        })Neverlose.PlayAnimate(IIllI1II1II, TweenInfo0175, {
                            TextTransparency = 0, TextColor3 = Neverlose.AccentColor
                        })Neverlose.PlayAnimate(I1lI1IIl1l1, TweenInfo0175, {
                            TextTransparency = 0
                        })
                    else
                        Neverlose.PlayAnimate(III11Il1Il1, TweenInfo0175, {
                            BackgroundTransparency = 1
                        })Neverlose.PlayAnimate(I1lIIII1I11, TweenInfo0175, {
                            Transparency = 1
                        })Neverlose.PlayAnimate(IIllI1II1II, TweenInfo0175, {
                            TextTransparency = lll1I1IlI1l.Signal:GetValue() and 0.500 or 1, TextColor3 = Color3.fromRGB(223, 223, 223)
                        })Neverlose.PlayAnimate(I1lI1IIl1l1, TweenInfo0175, {
                            TextTransparency = lll1I1IlI1l.Signal:GetValue() and 0.500 or 1
                        })
                    end
                end
                )
                local I1I1IllI1II = function ()
                    if not lI111lll1Il then
                        return
                    end
                    local I1Il1IllI11 = IIIIlIll111.AbsoluteContentSize.Y
                    local I11IlllIlII = Ill1IlIlIl1.Expanded == true
                    Neverlose.PlayAnimate(IIIl111111l, TweenInfoQuint, {
                        Size = UDim2.new(1, 0, 0, I11IlllIlII and I1Il1IllI11 or 0)
                    })
                    Neverlose.PlayAnimate(Il1Il1I1lI1, TweenInfoQuint, {
                        Size = UDim2.new(1, 0, 0, I11IlllIlII and (I1Il1IllI11 + 40) or 32)
                    })
                end
                function Ill1IlIlIl1:Show()
                    if I1111llIII1.GetLocked and I1111llIII1:GetLocked() then
                        return Ill1IlIlIl1
                    end
                    if Ill1IlIlIl1.GetLocked and Ill1IlIlIl1:GetLocked() then
                        return Ill1IlIlIl1
                    end
                    I1111llIII1.ActiveTab = Ill1IlIlIl1
                    if lI111lll1Il then
                        Ill1IlIlIl1.Expanded = true
                        IIIl111111l.Visible = true
                        Ill1IlIlIl1.Signal:SetValue(lll1I1IlI1l.Signal:GetValue())
                        l1Il1IIIl11( true )
                        I1I1IllI1II()
                        I1l111111Il()
                        return Ill1IlIlIl1
                    end
                    for l1Il1Il1III, lllll111II1 in ipairs(I1111llIII1.Tabs) do
                        local l111Il1lll1 = lllll111II1 == Ill1IlIlIl1 and lll1I1IlI1l.Signal:GetValue()
                        lllll111II1.Root.Visible = lllll111II1 == Ill1IlIlIl1
                        lllll111II1.Signal:SetValue(l111Il1lll1)
                        lllll111II1.RenderButton(lllll111II1 == Ill1IlIlIl1 and lll1I1IlI1l.Signal:GetValue())
                    end
                    I1l111111Il()
                end
                function Ill1IlIlIl1:Hide()
                    if lI111lll1Il then
                        Ill1IlIlIl1.Expanded = false
                        if I1111llIII1.ActiveTab == Ill1IlIlIl1 then
                            I1111llIII1.ActiveTab = nil
                        end
                        Ill1IlIlIl1.Signal:SetValue( false )
                        l1Il1IIIl11( false )
                        I1I1IllI1II()
                        I1l111111Il()
                        task.delay(0.55, function ()
                            if not Ill1IlIlIl1.Expanded then
                                IIIl111111l.Visible = false
                            end
                        end
                        )
                        return
                    end
                    IIIl111111l.Visible = false
                    Ill1IlIlIl1.Signal:SetValue( false )
                    l1Il1IIIl11( false )
                end
                function Ill1IlIlIl1:Toggle()
                    if Ill1IlIlIl1.Expanded then
                        Ill1IlIlIl1:Hide()
                    else
                        Ill1IlIlIl1:Show()
                    end
                    return Ill1IlIlIl1
                end
                Ill1IlIlIl1.RenderButton = l1Il1IIIl11
                Neverlose:AddSignal(IIIIlIll111:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(( function ()
                    if lI111lll1Il then
                        if Ill1IlIlIl1.Expanded then
                            I1I1IllI1II()
                            I1l111111Il()
                        end
                    elseif I1111llIII1.ActiveTab == Ill1IlIlIl1 then
                        I1l111111Il()
                    end
                end
                ))) local ll111l11I1I = Neverlose:CreateInput(III11Il1Il1, ( function ()
                    if I1111llIII1.GetLocked and I1111llIII1:GetLocked() then
                        return
                    end
                    if Ill1IlIlIl1.GetLocked and Ill1IlIlIl1:GetLocked() then
                        return
                    end
                    if lI111lll1Il then
                        Ill1IlIlIl1:Toggle()
                    else
                        Ill1IlIlIl1:Show()
                    end
                end
                ))
                Neverlose:AddSignal(ll111l11I1I.MouseEnter:Connect(( function ()
                    if lI111lll1Il then
                        if not Ill1IlIlIl1.Expanded and lll1I1IlI1l.Signal:GetValue() then
                            Neverlose.PlayAnimate(III11Il1Il1, TweenInfo0175, {
                                BackgroundTransparency = 0.3
                            })
                        end
                    elseif I1111llIII1.ActiveTab ~= Ill1IlIlIl1 and lll1I1IlI1l.Signal:GetValue() then
                        Neverlose.PlayAnimate(III11Il1Il1, TweenInfo0175, {
                            BackgroundTransparency = 0.650
                        })
                    end
                end
                )))Neverlose:AddSignal(ll111l11I1I.MouseLeave:Connect(( function ()
                    if lI111lll1Il then
                        l1Il1IIIl11(Ill1IlIlIl1.Expanded)
                    elseif I1111llIII1.ActiveTab ~= Ill1IlIlIl1 then
                        l1Il1IIIl11( false )
                    end
                end
                ))) local llIlIIlll11 = Neverlose:RegisiterItem(IIIl111111l, Ill1IlIlIl1.Signal)
                Ill1IlIlIl1.Handler = llIlIIlll11
                function llIlIIlll11:Select()
                    if Ill1IlIlIl1.GetLocked and Ill1IlIlIl1:GetLocked() then
                        return llIlIIlll11
                    end
                    Ill1IlIlIl1:Show()
                    return llIlIIlll11
                end
                function llIlIIlll11:SetLocked(l1I1Il11111)
                    if Ill1IlIlIl1.SetLocked then
                        Ill1IlIlIl1:SetLocked(l1I1Il11111)
                    end
                    if l1I1Il11111 == true and ((lI111lll1Il and Ill1IlIlIl1.Expanded) or I1111llIII1.ActiveTab == Ill1IlIlIl1) then
                        Ill1IlIlIl1:Hide()
                        if not lI111lll1Il then
                            for l1ll1lII1II, IIIII11llll in ipairs(I1111llIII1.Tabs) do
                                if IIIII11llll ~= Ill1IlIlIl1 and ( not IIIII11llll.GetLocked or not IIIII11llll:GetLocked()) then
                                    IIIII11llll:Show()
                                    break
                                end
                            end
                        end
                    end
                    return llIlIIlll11
                end
                function llIlIIlll11:GetLocked()
                    return Ill1IlIlIl1.GetLocked and Ill1IlIlIl1:GetLocked() or false
                end
                function llIlIIlll11:SetTextLocked(l1llIl11I1I)
                    if Ill1IlIlIl1.SetTextLocked then
                        Ill1IlIlIl1:SetTextLocked(l1llIl11I1I)
                    end
                    return llIlIIlll11
                end
                function llIlIIlll11:SetIcon(IIllIllI1ll)
                    Ill1IlIlIl1.Icon = IIllIllI1ll or Ill1IlIlIl1.Icon
                    Neverlose:SetIconMode(IIllI1II1II, Ill1IlIlIl1.Icon)
                    return llIlIIlll11
                end
                function llIlIIlll11:SetText(llIlII1I11I)
                    I1111llIII1.Tabs[Ill1IlIlIl1.Name] = nil
                    Ill1IlIlIl1.Name = llIlII1I11I or Ill1IlIlIl1.Name
                    I1111llIII1.Tabs[Ill1IlIlIl1.Name] = Ill1IlIlIl1
                    I1lI1IIl1l1.Text = Ill1IlIlIl1.Name
                    return llIlIIlll11
                end
                table.insert(I1111llIII1.Tabs, Ill1IlIlIl1)
                I1111llIII1.Tabs[Ill1IlIlIl1.Name] = Ill1IlIlIl1
                if lI111lll1Il then
                    if l11IIl11II1.Open == true or lIl1II1I111.Open == true or (lIl1II1I111.OpenFirst == true and #I1111llIII1.Tabs == 1) then
                        Ill1IlIlIl1:Show()
                    else
                        Ill1IlIlIl1:Hide()
                    end
                elseif not I1111llIII1.ActiveTab then
                    Ill1IlIlIl1:Show()
                else
                    Ill1IlIlIl1:Hide()
                end
                I1l111111Il()
                return wrapCaseInsensitive(llIlIIlll11)
            end
            function I1111llIII1:Select(lIII11IIlll)
                local I1111IIl1ll = I1111llIII1.Tabs[lIII11IIlll]
                if I1111IIl1ll then
                    I1111IIl1ll:Show()
                end
                return I1111llIII1
            end
            function I1111llIII1:SetVisible(I11IlI1lIIl)
                l1llllI1llI.Visible = I11IlI1lIIl
            end
            I111I1I1II1(lll1I1IlI1l.Signal:GetValue())
            lll1I1IlI1l.Signal:Connect(I111I1I1II1)
            I1l111111Il()
            return wrapCaseInsensitive(I1111llIII1)
        end
        function lll1I1IlI1l:AddLeftTabbox(lIIll1l1III)
            return lll1I1IlI1l:AddTabbox({
                Name = lIIll1l1III, Position = "left",
            })
        end
        function lll1I1IlI1l:AddRightTabbox(Il11I1lllI1)
            return lll1I1IlI1l:AddTabbox({
                Name = Il11I1lllI1, Position = "right",
            })
        end
        function lll1I1IlI1l:AddCenterTabbox(Il1lI11llIl)
            return lll1I1IlI1l:AddTabbox({
                Name = Il1lI11llIl, Position = "center",
            })
        end
        return wrapCaseInsensitive(lll1I1IlI1l)
    end
    function I1IlIl1l1I1:_InitConfig()
        local llIIll1Ill1 = Neverlose:CreateSignal( false )
        local lIII111lll1 = {
            Signals ={},
        }
        local lIll1l1lIII = Instance.new("Frame") local lIllII11I11 = Instance.new("UICorner") local Illl1IIl1I1 = Instance.new("UIListLayout") local I1lIIlIIIII = Instance.new("UIStroke") local I11II1Ill1l = Instance.new("Frame") local lI111l1l1Il = Instance.new("TextLabel") local I1lIll1IlI1 = Instance.new("Frame") local II1Ill11ll1 = Instance.new("Frame") local I1lIIIll1ll = Instance.new("UIListLayout") local II11lIII111 = Instance.new("Frame") local IIIIl1111lI = Instance.new("UICorner") local II11l1111ll = Instance.new("UIStroke") local l111Il1I1lI = Instance.new("TextBox") local IIll11IIlI1 = Instance.new("Frame") local I1ll11111Il = Instance.new("ImageLabel") local I11I1IlIl1l = Instance.new("UICorner") local I1II1l1I1I1 = Instance.new("UICorner") local llllIIIlI1I = Neverlose:CreateShadow(lIll1l1lIII)
        lIII111lll1.SetRender = ( function (l1Ill1l11ll)
            if l1Ill1l11ll then
                lIll1l1lIII.Position = UDim2.fromOffset(II11IIIll11.AbsolutePosition.X + 110, II11IIIll11.AbsolutePosition.Y + 96)Neverlose.PlayAnimate(lIll1l1lIII, TweenInfo0175, {
                    BackgroundTransparency = 0.035, Position = UDim2.fromOffset(II11IIIll11.AbsolutePosition.X + 110, II11IIIll11.AbsolutePosition.Y + 95)
                })Neverlose.PlayAnimate(I1lIIlIIIII, TweenInfo0175, {
                    Transparency = 0.650
                })Neverlose.PlayAnimate(lI111l1l1Il, TweenInfo0175, {
                    TextTransparency = 0.200
                })Neverlose.PlayAnimate(II11l1111ll, TweenInfo0175, {
                    Transparency = 0.65
                })Neverlose.PlayAnimate(I1lIll1IlI1, TweenInfo0175, {
                    BackgroundTransparency = 0.650
                })Neverlose.PlayAnimate(II11lIII111, TweenInfo0175, {
                    BackgroundTransparency = 0
                })Neverlose.PlayAnimate(l111Il1I1lI, TweenInfo0175, {
                    TextTransparency = 0.350
                })Neverlose.PlayAnimate(I1ll11111Il, TweenInfo0175, {
                    TextTransparency = 0.350
                })Neverlose.PlayAnimate(lIlllllll11, TweenInfo0175, {
                    Rotation = 180
                })llllIIIlI1I:Render( true )
            else
                Neverlose.PlayAnimate(lIlllllll11, TweenInfo0175, {
                    Rotation = 0
                })Neverlose.PlayAnimate(lIll1l1lIII, TweenInfo0175, {
                    BackgroundTransparency = 1, Position = UDim2.fromOffset(II11IIIll11.AbsolutePosition.X + 110, II11IIIll11.AbsolutePosition.Y + 96)
                })Neverlose.PlayAnimate(II11l1111ll, TweenInfo0175, {
                    Transparency = 1
                })Neverlose.PlayAnimate(I1lIIlIIIII, TweenInfo0175, {
                    Transparency = 1
                })Neverlose.PlayAnimate(lI111l1l1Il, TweenInfo0175, {
                    TextTransparency = 1
                })Neverlose.PlayAnimate(I1lIll1IlI1, TweenInfo0175, {
                    BackgroundTransparency = 1
                })Neverlose.PlayAnimate(II11lIII111, TweenInfo0175, {
                    BackgroundTransparency = 1
                })Neverlose.PlayAnimate(l111Il1I1lI, TweenInfo0175, {
                    TextTransparency = 1
                })Neverlose.PlayAnimate(I1ll11111Il, TweenInfo0175, {
                    TextTransparency = 1
                })llllIIIlI1I:Render( false )
            end
        end
        )
        Neverlose:AddSignal(lIll1l1lIII:GetPropertyChangedSignal("BackgroundTransparency"):Connect(( function ()
            if lIll1l1lIII.BackgroundTransparency > 0.9 then
                lIll1l1lIII.Visible = false
                Illl1IIl1I1.Parent = nil
                lIll1l1lIII.Parent = nil
            else
                lIll1l1lIII.Visible = true
                Illl1IIl1I1.Parent = lIll1l1lIII if Neverlose.Global3DRenderMode then
                    lIll1l1lIII.Parent = Neverlose.GlobalSurfaceGui
                else
                    lIll1l1lIII.Parent = Neverlose.ScreenGui
                end
            end
        end
        )))lIll1l1lIII.Name = Neverlose.RandomString()
        lIll1l1lIII.Parent = Neverlose.ScreenGui
        lIll1l1lIII.AnchorPoint = Vector2.new(0.5, 0)lIll1l1lIII.BackgroundColor3 = Color3.fromRGB(20, 22, 27)lIll1l1lIII.BackgroundTransparency = 0.035 lIll1l1lIII.BorderColor3 = Color3.fromRGB(0, 0, 0)lIll1l1lIII.BorderSizePixel = 0 lIll1l1lIII.ClipsDescendants = true lIll1l1lIII.Position = UDim2.new(255, 255, 255, 255)lIll1l1lIII.Size = UDim2.new(0, 220, 0, 110)lIll1l1lIII.ZIndex = 151 lIllII11I11.CornerRadius = UDim.new(0, 10)lIllII11I11.Parent = lIll1l1lIII Illl1IIl1I1.Parent = lIll1l1lIII Illl1IIl1I1.HorizontalAlignment = Enum.HorizontalAlignment.Center Illl1IIl1I1.SortOrder = Enum.SortOrder.LayoutOrder Illl1IIl1I1.Padding = UDim.new(0, 4)I1lIIlIIIII.Transparency = 0.650 I1lIIlIIIII.Color = Color3.fromRGB(45, 48, 58)I1lIIlIIIII.Parent = lIll1l1lIII I11II1Ill1l.Name = Neverlose.RandomString()
        I11II1Ill1l.Parent = lIll1l1lIII I11II1Ill1l.BackgroundColor3 = Color3.fromRGB(25, 27, 33)I11II1Ill1l.BackgroundTransparency = 1.000 I11II1Ill1l.BorderColor3 = Color3.fromRGB(0, 0, 0)I11II1Ill1l.BorderSizePixel = 0 I11II1Ill1l.Size = UDim2.new(1, 0, 0, 30)I11II1Ill1l.ZIndex = 154 lI111l1l1Il.Name = Neverlose.RandomString()
        lI111l1l1Il.Parent = I11II1Ill1l lI111l1l1Il.BackgroundColor3 = Color3.fromRGB(255, 255, 255)lI111l1l1Il.BackgroundTransparency = 1.000 lI111l1l1Il.BorderColor3 = Color3.fromRGB(0, 0, 0)lI111l1l1Il.BorderSizePixel = 0 lI111l1l1Il.Position = UDim2.new(0, 11, 0, 6)lI111l1l1Il.Size = UDim2.new(0, 1, 0, 15)lI111l1l1Il.ZIndex = 154 lI111l1l1Il.Font = Enum.Font.GothamMedium lI111l1l1Il.Text = "Config"lI111l1l1Il.TextColor3 = Color3.fromRGB(255, 255, 255)lI111l1l1Il.TextSize = 13.000 lI111l1l1Il.TextTransparency = 0.200 lI111l1l1Il.TextXAlignment = Enum.TextXAlignment.Left I1lIll1IlI1.Name = Neverlose.RandomString()
        I1lIll1IlI1.Parent = I11II1Ill1l I1lIll1IlI1.AnchorPoint = Vector2.new(0.5, 1)I1lIll1IlI1.BackgroundColor3 = Color3.fromRGB(45, 48, 58)I1lIll1IlI1.BackgroundTransparency = 0.650 I1lIll1IlI1.BorderColor3 = Color3.fromRGB(0, 0, 0)I1lIll1IlI1.BorderSizePixel = 0 I1lIll1IlI1.Position = UDim2.new(0.5, 0, 1, 0)I1lIll1IlI1.Size = UDim2.new(1, - 20, 0, 1)I1lIll1IlI1.ZIndex = 154 II1Ill11ll1.Name = Neverlose.RandomString()
        II1Ill11ll1.Parent = I11II1Ill1l II1Ill11ll1.AnchorPoint = Vector2.new(1, 0)II1Ill11ll1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)II1Ill11ll1.BackgroundTransparency = 1.000 II1Ill11ll1.BorderColor3 = Color3.fromRGB(0, 0, 0)II1Ill11ll1.BorderSizePixel = 0 II1Ill11ll1.Position = UDim2.new(1, - 11, 0, 2)II1Ill11ll1.Size = UDim2.new(1, - 20, 0, 25)II1Ill11ll1.ZIndex = 154 I1lIIIll1ll.Parent = II1Ill11ll1 I1lIIIll1ll.FillDirection = Enum.FillDirection.Horizontal I1lIIIll1ll.HorizontalAlignment = Enum.HorizontalAlignment.Right I1lIIIll1ll.SortOrder = Enum.SortOrder.LayoutOrder I1lIIIll1ll.VerticalAlignment = Enum.VerticalAlignment.Center I1lIIIll1ll.Padding = UDim.new(0, 5)Neverlose:AddSignal(Illl1IIl1I1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(( function ()
            if #lIII111lll1.Signals <= 0 then
                Neverlose.PlayAnimate(lIll1l1lIII, TweenInfo0175, {
                    Size = UDim2.new(0, 220, 0, Illl1IIl1I1.AbsoluteContentSize.Y + 0)
                })
            else
                Neverlose.PlayAnimate(lIll1l1lIII, TweenInfo0175, {
                    Size = UDim2.new(0, 220, 0, Illl1IIl1I1.AbsoluteContentSize.Y + 5)
                })
            end
        end
        )))
        II11lIII111.Name = Neverlose.RandomString()
        II11lIII111.Parent = II1Ill11ll1 II11lIII111.BackgroundColor3 = Color3.fromRGB(26, 28, 36)II11lIII111.BorderColor3 = Color3.fromRGB(0, 0, 0)II11lIII111.BorderSizePixel = 0 II11lIII111.ClipsDescendants = true II11lIII111.Size = UDim2.new(0, 100, 0, 18)II11lIII111.ZIndex = 154 IIIIl1111lI.CornerRadius = UDim.new(0, 4)IIIIl1111lI.Parent = II11lIII111 II11l1111ll.Transparency = 0.650 II11l1111ll.Color = Color3.fromRGB(45, 48, 58)II11l1111ll.Parent = II11lIII111 l111Il1I1lI.Parent = II11lIII111 l111Il1I1lI.AnchorPoint = Vector2.new(0, 0.5)l111Il1I1lI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l111Il1I1lI.BackgroundTransparency = 1.000 l111Il1I1lI.BorderColor3 = Color3.fromRGB(0, 0, 0)l111Il1I1lI.BorderSizePixel = 0 l111Il1I1lI.Position = UDim2.new(0, 5, 0.5, 0)l111Il1I1lI.Size = UDim2.new(1, - 5, 0, 17)l111Il1I1lI.ZIndex = 154 l111Il1I1lI.ClearTextOnFocus = false l111Il1I1lI.Font = Enum.Font.GothamMedium l111Il1I1lI.PlaceholderText = "Config Name ..."l111Il1I1lI.Text = ""l111Il1I1lI.TextColor3 = Color3.fromRGB(255, 255, 255)l111Il1I1lI.TextSize = 11.000 l111Il1I1lI.TextTransparency = 0.350 l111Il1I1lI.TextXAlignment = Enum.TextXAlignment.Left IIll11IIlI1.Name = Neverlose.RandomString()
        IIll11IIlI1.Parent = II1Ill11ll1 IIll11IIlI1.BackgroundColor3 = Color3.fromRGB(39, 40, 49)IIll11IIlI1.BackgroundTransparency = 1.000 IIll11IIlI1.BorderColor3 = Color3.fromRGB(0, 0, 0)IIll11IIlI1.BorderSizePixel = 0 IIll11IIlI1.ClipsDescendants = true IIll11IIlI1.Size = UDim2.new(0, 20, 0, 18)IIll11IIlI1.ZIndex = 153 I1ll11111Il.Name = Neverlose.RandomString()
        I1ll11111Il.Parent = IIll11IIlI1 I1ll11111Il.AnchorPoint = Vector2.new(0.5, 0.5)I1ll11111Il.BackgroundColor3 = Color3.fromRGB(255, 255, 255)I1ll11111Il.BackgroundTransparency = 1.000 I1ll11111Il.BorderColor3 = Color3.fromRGB(0, 0, 0)I1ll11111Il.BorderSizePixel = 0 I1ll11111Il.Position = UDim2.new(0.5, 0, 0.5, 0)I1ll11111Il.Size = UDim2.new(1, 0, 1, 0)I1ll11111Il.ZIndex = 153 Neverlose:SetIconMode(I1ll11111Il, "plus-large")I1ll11111Il.ImageColor3 = Color3.fromRGB(223, 223, 223)I1ll11111Il.ImageTransparency = 0.350 I1ll11111Il.ScaleType = Enum.ScaleType.Fit I11I1IlIl1l.CornerRadius = UDim.new(0, 4)I11I1IlIl1l.Parent = IIll11IIlI1 I1II1l1I1I1.CornerRadius = UDim.new(0, 10)I1II1l1I1I1.Parent = I11II1Ill1l local ll1l1Il1ll1 = Instance.new("TextButton") local lll1llI1I1l = Instance.new("UICorner")ll1l1Il1ll1.Name = Neverlose.RandomString()
        ll1l1Il1ll1.Parent = II11IIIll11 ll1l1Il1ll1.AnchorPoint = Vector2.new(0, 0.5)ll1l1Il1ll1.BackgroundColor3 = Color3.fromRGB(20, 22, 27)ll1l1Il1ll1.BackgroundTransparency = 1.000 ll1l1Il1ll1.BorderColor3 = Color3.fromRGB(0, 0, 0)ll1l1Il1ll1.BorderSizePixel = 0 ll1l1Il1ll1.Position = UDim2.new(0, 31, 0.5, 0)ll1l1Il1ll1.Size = UDim2.new(1, - 31, 1, 0)ll1l1Il1ll1.ZIndex = 10 ll1l1Il1ll1.Font = Enum.Font.SourceSans ll1l1Il1ll1.Text = ""ll1l1Il1ll1.TextColor3 = Color3.fromRGB(0, 0, 0)ll1l1Il1ll1.TextSize = 14.000 lll1llI1I1l.CornerRadius = UDim.new(0, 4)lll1llI1I1l.Parent = ll1l1Il1ll1 lIII111lll1.SetRender( false )
        llIIll1Ill1:Connect(lIII111lll1.SetRender)
        lIII111lll1.UnsafeThread = nil
        lIII111lll1.SelectedConfig = I1IlIl1l1I1.ConfigAutoSaveFile or "Default"
        l1lIlII1ll1.Text = lIII111lll1.SelectedConfig
        local l1l1IllllII = ( function ()
            local IIl1ll11lIl = TextService:GetTextSize(l1lIlII1ll1.Text, l1lIlII1ll1.TextSize, l1lIlII1ll1.Font, Vector2.new(math.huge, math.huge))
            Neverlose.PlayAnimate(II11IIIll11, TweenInfo0175, {
                Size = UDim2.fromOffset(IIl1ll11lIl.X + 75, 30)
            })
        end
        )
        l1l1IllllII()
        function lIII111lll1:GetData(IlIIIlI11lI)
            local IlI1l111Ill ={}
            local lIlIIII1l1l = 0
            for lIII1IlII1I, l1llIllI11l in next, Neverlose.Flags do
                if l1llIllI11l and l1llIllI11l.GetValue then
                    local I11llllIllI = l1llIllI11l:GetValue()
                    if typeof(I11llllIllI) == "Color3" then
                        table.insert(IlI1l111Ill, {
                            Idx = lIII1IlII1I, Value = I11llllIllI:ToHex(),
                        })
                    else
                        table.insert(IlI1l111Ill, {
                            Idx = lIII1IlII1I, Value = I11llllIllI
                        })
                    end
                end
                if IlIIIlI11lI then
                    if lIlIIII1l1l % 35 == 1 then
                        task.wait()
                    end
                end
                lIlIIII1l1l += 1
            end
            local llIIIlll1Il = HttpService:JSONEncode(IlI1l111Ill)
            if I1IlIl1l1I1.ConfigEncrypted then
                return Neverlose.Base64Encode(Cipher.new(llIIIlll1Il))
            end
            return llIIIlll1Il
        end
        function lIII111lll1:WriteConfig(I1l11llIIl1, IlI1IlIll1l, l1I1lI11III)
            I1l11llIIl1 = tostring(I1l11llIIl1 or lIII111lll1.SelectedConfig or I1IlIl1l1I1.ConfigAutoSaveFile or "Default")
            I1l11llIIl1 = string.sub(I1l11llIIl1, 1, 24)
            if not I1l11llIIl1:byte() or I1l11llIIl1:find("/", 1, true ) or I1l11llIIl1:find("\\", 1, true ) then
                llIll1ll1lI.new("folder", "Invalid config name!", 3.5)
                return false
            end
            if not isfolder(I1IlIl1l1I1.ConfigFolder) then
                makefolder(I1IlIl1l1I1.ConfigFolder)
            end
            local I1lI111Il1I = I1IlIl1l1I1.ConfigFolder .. "/" .. I1l11llIIl1
            local l11Il1lIIIl = isfile(I1lI111Il1I)
            local ll1ll1l1IlI = IlI1IlIll1l
            if ll1ll1l1IlI == nil then
                ll1ll1l1IlI = I1IlIl1l1I1.ConfigOverwrite
            end
            if l11Il1lIIIl and not ll1ll1l1IlI then
                llIll1ll1lI.new("folder", "Config " .. tostring(I1l11llIIl1) .. " already exists!", 3.5)
                return false
            end
            writefile(I1lI111Il1I, lIII111lll1:GetData(l1I1lI11III))
            lIII111lll1.SelectedConfig = I1l11llIIl1
            l1lIlII1ll1.Text = I1l11llIIl1
            l1l1IllllII()
            llIll1ll1lI.new("folder", (l11Il1lIIIl and "Overwritten " or "Created ") .. tostring(I1l11llIIl1), 3.5)
            return true
        end
        function lIII111lll1:RewriteSelectedAsJson()
            local IlI1lI1IIIl = I1IlIl1l1I1.ConfigEncrypted
            I1IlIl1l1I1.ConfigEncrypted = false
            local lIIllIll11I = lIII111lll1:WriteConfig(lIII111lll1.SelectedConfig or I1IlIl1l1I1.ConfigAutoSaveFile or "Default", true )
            I1IlIl1l1I1.ConfigEncrypted = IlI1lI1IIIl
            return lIIllIll11I
        end
        function lIII111lll1:DecodeData(l11IIIlIIlI)
            local II1l1l111II, II1l111II1l = pcall( function ()
                return HttpService:JSONDecode(l11IIIlIIlI)
            end
            )
            if II1l1l111II and typeof(II1l111II1l) == "table" then
                return II1l111II1l
            end
            II1l1l111II, II1l111II1l = pcall( function ()
                return HttpService:JSONDecode(Cipher.reverse(Neverlose.Base64Decode(l11IIIlIIlI)))
            end
            )
            if II1l1l111II and typeof(II1l111II1l) == "table" then
                return II1l111II1l
            end
            return {}
        end
        function lIII111lll1:LoadData(IIl1IIl11II)
            local lIlllIIl1II = lIII111lll1:DecodeData(IIl1IIl11II)
            for l1I11I1Ill1, IllII1ll1II in next, lIlllIIl1II do
                if IllII1ll1II.Idx then
                    if Neverlose.Flags[IllII1ll1II.Idx] then
                        task.spawn( function ()
                            Neverlose.Flags[IllII1ll1II.Idx]:SetValue(IllII1ll1II.Value)
                        end
                        )
                    else
                        Neverlose.PendingFlagValues[IllII1ll1II.Idx] = IllII1ll1II.Value
                    end
                end
            end
        end
        function lIII111lll1:RefreshConfig()
            if not isfolder(I1IlIl1l1I1.ConfigFolder) then
                makefolder(I1IlIl1l1I1.ConfigFolder)
            end
            if not isfile(I1IlIl1l1I1.ConfigFolder .. "/" .. lIII111lll1.SelectedConfig) then
                writefile(I1IlIl1l1I1.ConfigFolder .. "/" .. lIII111lll1.SelectedConfig, lIII111lll1:GetData())
            end
            for II11IlIIIIl, lIIII1l1I1I in next, lIll1l1lIII:GetChildren() do
                if lIIII1l1I1I:GetAttribute("ConfigItem") then
                    lIIII1l1I1I:Destroy()
                end
            end
            for I1lIl1Illll, II1I1Illlll in next, lIII111lll1.Signals do
                II1I1Illlll:Disconnect()
            end
            table.clear(lIII111lll1.Signals)
            local IlIIl1IllIl ={}
            for IIlllII1Il1, I1l11l1Il1I in next, listfiles(I1IlIl1l1I1.ConfigFolder) do
                local llI1ll1l11I = string.sub(I1l11l1Il1I, #I1IlIl1l1I1.ConfigFolder + 2)
                table.insert(IlIIl1IllIl, llI1ll1l11I)
            end
            for llI1Il11lI1, lllIlIl1lI1 in next, IlIIl1IllIl do
                local Il11I1lIll1 = Instance.new("Frame") local l1I1l11II1l = Instance.new("Frame") local l1Ill1llIlI = Instance.new("UIListLayout") local IlIIII11lI1 = Instance.new("Frame") local l11lI1I1I1I = Instance.new("ImageLabel") local lIIIllll1I1 = Instance.new("UICorner") local l11I11IIIll = Instance.new("Frame") local llIlI1l111I = Instance.new("ImageLabel") local lIlll11llII = Instance.new("UICorner") local IlllI1IIIl1 = Instance.new("Frame") local I1ll1IIll1I = Instance.new("ImageLabel") local I1111lll1l1 = Instance.new("UICorner") local lI1l1llll1l = Instance.new("UICorner") local llIII1Il11l = Instance.new("TextLabel") local IIl11Ill1lI = Instance.new("UIStroke")Il11I1lIll1.Name = Neverlose.RandomString()
                Il11I1lIll1.Parent = lIll1l1lIII Il11I1lIll1.BackgroundColor3 = Color3.fromRGB(21, 20, 27)Il11I1lIll1.BorderColor3 = Color3.fromRGB(0, 0, 0)Il11I1lIll1.BorderSizePixel = 0 Il11I1lIll1.Size = UDim2.new(1, - 10, 0, 30)Il11I1lIll1.ZIndex = 153 Il11I1lIll1:SetAttribute("ConfigItem", true )
                l1I1l11II1l.Name = Neverlose.RandomString()
                l1I1l11II1l.Parent = Il11I1lIll1 l1I1l11II1l.AnchorPoint = Vector2.new(1, 0)l1I1l11II1l.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l1I1l11II1l.BackgroundTransparency = 1.000 l1I1l11II1l.BorderColor3 = Color3.fromRGB(0, 0, 0)l1I1l11II1l.BorderSizePixel = 0 l1I1l11II1l.Position = UDim2.new(1, - 11, 0, 2)l1I1l11II1l.Size = UDim2.new(1, - 20, 0, 25)l1I1l11II1l.ZIndex = 153 l1Ill1llIlI.Parent = l1I1l11II1l l1Ill1llIlI.FillDirection = Enum.FillDirection.Horizontal l1Ill1llIlI.HorizontalAlignment = Enum.HorizontalAlignment.Right l1Ill1llIlI.SortOrder = Enum.SortOrder.LayoutOrder l1Ill1llIlI.VerticalAlignment = Enum.VerticalAlignment.Center l1Ill1llIlI.Padding = UDim.new(0, 5)IlIIII11lI1.Name = Neverlose.RandomString()
                IlIIII11lI1.Parent = l1I1l11II1l IlIIII11lI1.BackgroundColor3 = Color3.fromRGB(39, 40, 49)IlIIII11lI1.BackgroundTransparency = 1.000 IlIIII11lI1.BorderColor3 = Color3.fromRGB(0, 0, 0)IlIIII11lI1.BorderSizePixel = 0 IlIIII11lI1.ClipsDescendants = true IlIIII11lI1.Size = UDim2.new(0, 20, 0, 18)IlIIII11lI1.ZIndex = 153 l11lI1I1I1I.Name = Neverlose.RandomString()
                l11lI1I1I1I.Parent = IlIIII11lI1 l11lI1I1I1I.AnchorPoint = Vector2.new(0.5, 0.5)l11lI1I1I1I.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l11lI1I1I1I.BackgroundTransparency = 1.000 l11lI1I1I1I.BorderColor3 = Color3.fromRGB(0, 0, 0)l11lI1I1I1I.BorderSizePixel = 0 l11lI1I1I1I.Position = UDim2.new(0.5, 0, 0.5, 0)l11lI1I1I1I.Size = UDim2.new(1, 0, 1, 0)l11lI1I1I1I.ZIndex = 153 IIlllIIl1II:SetIconMode(l11lI1I1I1I, "trash-can")l11lI1I1I1I.ImageColor3 = Color3.fromRGB(223, 223, 223)l11lI1I1I1I.ImageTransparency = 0.400 l11lI1I1I1I.ScaleType = Enum.ScaleType.Fit lIIIllll1I1.CornerRadius = UDim.new(0, 4)lIIIllll1I1.Parent = IlIIII11lI1 l11I11IIIll.Name = Neverlose.RandomString()
                l11I11IIIll.Parent = l1I1l11II1l l11I11IIIll.BackgroundColor3 = Color3.fromRGB(39, 40, 49)l11I11IIIll.BackgroundTransparency = 1.000 l11I11IIIll.BorderColor3 = Color3.fromRGB(0, 0, 0)l11I11IIIll.BorderSizePixel = 0 l11I11IIIll.ClipsDescendants = true l11I11IIIll.Size = UDim2.new(0, 20, 0, 18)l11I11IIIll.ZIndex = 153 llIlI1l111I.Name = Neverlose.RandomString()
                llIlI1l111I.Parent = l11I11IIIll llIlI1l111I.AnchorPoint = Vector2.new(0.5, 0.5)llIlI1l111I.BackgroundColor3 = Color3.fromRGB(255, 255, 255)llIlI1l111I.BackgroundTransparency = 1.000 llIlI1l111I.BorderColor3 = Color3.fromRGB(0, 0, 0)llIlI1l111I.BorderSizePixel = 0 llIlI1l111I.Position = UDim2.new(0.5, 0, 0.5, 0)llIlI1l111I.Size = UDim2.new(1, 0, 1, 0)llIlI1l111I.ZIndex = 153 IIlllIIl1II:SetIconMode(llIlI1l111I, "pencil-square")llIlI1l111I.ImageColor3 = Color3.fromRGB(223, 223, 223)llIlI1l111I.ImageTransparency = 0.400 llIlI1l111I.ScaleType = Enum.ScaleType.Fit lIlll11llII.CornerRadius = UDim.new(0, 4)lIlll11llII.Parent = l11I11IIIll IlllI1IIIl1.Name = Neverlose.RandomString()
                IlllI1IIIl1.Parent = l1I1l11II1l IlllI1IIIl1.BackgroundColor3 = Color3.fromRGB(39, 40, 49)IlllI1IIIl1.BackgroundTransparency = 1.000 IlllI1IIIl1.BorderColor3 = Color3.fromRGB(0, 0, 0)IlllI1IIIl1.BorderSizePixel = 0 IlllI1IIIl1.ClipsDescendants = true IlllI1IIIl1.Size = UDim2.new(0, 20, 0, 18)IlllI1IIIl1.ZIndex = 153 I1ll1IIll1I.Name = Neverlose.RandomString()
                I1ll1IIll1I.Parent = IlllI1IIIl1 I1ll1IIll1I.AnchorPoint = Vector2.new(0.5, 0.5)I1ll1IIll1I.BackgroundColor3 = Color3.fromRGB(255, 255, 255)I1ll1IIll1I.BackgroundTransparency = 1.000 I1ll1IIll1I.BorderColor3 = Color3.fromRGB(0, 0, 0)I1ll1IIll1I.BorderSizePixel = 0 I1ll1IIll1I.Position = UDim2.new(0.5, 0, 0.5, 0)I1ll1IIll1I.Size = UDim2.new(1, 0, 1, 0)I1ll1IIll1I.ZIndex = 153 IIlllIIl1II:SetIconMode(I1ll1IIll1I, "arrow-right-from-portrait-rectangle")I1ll1IIll1I.ImageColor3 = Color3.fromRGB(223, 223, 223)I1ll1IIll1I.ImageTransparency = 0.400 I1ll1IIll1I.ScaleType = Enum.ScaleType.Fit I1111lll1l1.CornerRadius = UDim.new(0, 4)I1111lll1l1.Parent = IlllI1IIIl1 lI1l1llll1l.CornerRadius = UDim.new(0, 5)lI1l1llll1l.Parent = Il11I1lIll1 llIII1Il11l.Name = Neverlose.RandomString()
                llIII1Il11l.Parent = Il11I1lIll1 llIII1Il11l.BackgroundColor3 = Color3.fromRGB(255, 255, 255)llIII1Il11l.BackgroundTransparency = 1.000 llIII1Il11l.BorderColor3 = Color3.fromRGB(0, 0, 0)llIII1Il11l.BorderSizePixel = 0 llIII1Il11l.Position = UDim2.new(0, 11, 0, 7)llIII1Il11l.Size = UDim2.new(0, 1, 0, 15)llIII1Il11l.ZIndex = 153 llIII1Il11l.Font = Enum.Font.GothamMedium llIII1Il11l.Text = lllIlIl1lI1 llIII1Il11l.TextColor3 = Color3.fromRGB(255, 255, 255)llIII1Il11l.TextSize = 13.000 llIII1Il11l.TextTransparency = 0.200 llIII1Il11l.TextXAlignment = Enum.TextXAlignment.Left IIl11Ill1lI.Transparency = 0.500 IIl11Ill1lI.Color = Color3.fromRGB(45, 48, 58)IIl11Ill1lI.Parent = Il11I1lIll1 local III1lIIIIIl = ( function (l11Il1IlII1)
                    if l11Il1IlII1 then
                        Neverlose.PlayAnimate(Il11I1lIll1, TweenInfo0175, {
                            BackgroundTransparency = 0
                        })Neverlose.PlayAnimate(l11lI1I1I1I, TweenInfo0175, {
                            TextTransparency = 0.400
                        })Neverlose.PlayAnimate(llIlI1l111I, TweenInfo0175, {
                            TextTransparency = 0.400
                        })Neverlose.PlayAnimate(I1ll1IIll1I, TweenInfo0175, {
                            TextTransparency = 0.400
                        })Neverlose.PlayAnimate(llIII1Il11l, TweenInfo0175, {
                            TextTransparency = 0.200
                        })Neverlose.PlayAnimate(IIl11Ill1lI, TweenInfo0175, {
                            Transparency = 0.500
                        })
                    else
                        Neverlose.PlayAnimate(Il11I1lIll1, TweenInfo0175, {
                            BackgroundTransparency = 1
                        })Neverlose.PlayAnimate(l11lI1I1I1I, TweenInfo0175, {
                            TextTransparency = 1
                        })Neverlose.PlayAnimate(llIlI1l111I, TweenInfo0175, {
                            TextTransparency = 1
                        })Neverlose.PlayAnimate(I1ll1IIll1I, TweenInfo0175, {
                            TextTransparency = 1
                        })Neverlose.PlayAnimate(llIII1Il11l, TweenInfo0175, {
                            TextTransparency = 1
                        })Neverlose.PlayAnimate(IIl11Ill1lI, TweenInfo0175, {
                            Transparency = 1
                        })
                    end
                end
                )III1lIIIIIl(llIIll1Ill1:GetValue())
                table.insert(lIII111lll1.Signals, llIIll1Ill1:Connect(III1lIIIIIl))
                table.insert(lIII111lll1.Signals, Il11I1lIll1.MouseEnter:Connect(( function ()
                    Neverlose.PlayAnimate(IIl11Ill1lI, TweenInfo0175, {
                        Transparency = 0.25
                    })
                end
                )))
                table.insert(lIII111lll1.Signals, Il11I1lIll1.MouseLeave:Connect(( function ()
                    Neverlose.PlayAnimate(IIl11Ill1lI, TweenInfo0175, {
                        Transparency = 0.500
                    })
                end
                )))
                local Il1lII11Il1, IIlllII1lI1 = Neverlose:CreateInput(IlIIII11lI1, function ()
                    if lllIlIl1lI1 == "Default" or lllIlIl1lI1 == I1IlIl1l1I1.ConfigAutoSaveFile then
                        llIll1ll1lI.new("trash-can", "You can't delete default config!", 3.5) return
                    end
                    delfile(I1IlIl1l1I1.ConfigFolder .. "/" .. lllIlIl1lI1)
                    l1l1IllllII()
                    lIII111lll1:RefreshConfig()
                    llIll1ll1lI.new("trash-can", "Deleted " .. tostring(lllIlIl1lI1), 3.5)
                end
                )
                local Il1I1I1III1, I1IIllllIlI = Neverlose:CreateInput(l11I11IIIll, function ()
                    if lIII111lll1:WriteConfig(lllIlIl1lI1, true ) then
                        lIII111lll1.SelectedConfig = lllIlIl1lI1
                        l1lIlII1ll1.Text = lllIlIl1lI1
                        l1l1IllllII()
                        lIII111lll1:RefreshConfig()
                    end
                end
                )
                local l1llIIlI1l1, IlIl1II11ll = Neverlose:CreateInput(IlllI1IIIl1, function ()
                    local llll1II1I1l = I1IlIl1l1I1.ConfigFolder .. "/" .. lllIlIl1lI1
                    if isfile(llll1II1I1l) then
                        local llII1IIl1Il = readfile(llll1II1I1l)
                        lIII111lll1:LoadData(llII1IIl1Il)
                        lIII111lll1.SelectedConfig = lllIlIl1lI1
                        l1lIlII1ll1.Text = lllIlIl1lI1
                        l1l1IllllII()
                        lIII111lll1:RefreshConfig()
                        llIll1ll1lI.new("folder", "Loaded " .. tostring(lllIlIl1lI1), 3.5)
                    end
                end
                )
                table.insert(lIII111lll1.Signals, IIlllII1lI1)
                table.insert(lIII111lll1.Signals, I1IIllllIlI)
                table.insert(lIII111lll1.Signals, IlIl1II11ll)
                table.insert(lIII111lll1.Signals, Il1lII11Il1.MouseEnter:Connect(( function ()
                    Neverlose.PlayAnimate(l11lI1I1I1I, TweenInfo0175, {
                        TextTransparency = 0.2, TextColor3 = Color3.fromRGB(223, 125, 125)
                    })
                end
                )))table.insert(lIII111lll1.Signals, Il1lII11Il1.MouseLeave:Connect(( function ()
                    Neverlose.PlayAnimate(l11lI1I1I1I, TweenInfo0175, {
                        TextTransparency = 0.400, TextColor3 = Color3.fromRGB(223, 223, 223)
                    })
                end
                )))table.insert(lIII111lll1.Signals, l11I11IIIll.MouseEnter:Connect(( function ()
                    Neverlose.PlayAnimate(llIlI1l111I, TweenInfo0175, {
                        TextTransparency = 0.2, TextColor3 = Neverlose.AccentColor
                    })
                end
                )))table.insert(lIII111lll1.Signals, l11I11IIIll.MouseLeave:Connect(( function ()
                    Neverlose.PlayAnimate(llIlI1l111I, TweenInfo0175, {
                        TextTransparency = 0.400, TextColor3 = Color3.fromRGB(223, 223, 223)
                    })
                end
                )))table.insert(lIII111lll1.Signals, IlllI1IIIl1.MouseEnter:Connect(( function ()
                    Neverlose.PlayAnimate(I1ll1IIll1I, TweenInfo0175, {
                        TextTransparency = 0.2, TextColor3 = Neverlose.AccentColor
                    })
                end
                )))table.insert(lIII111lll1.Signals, IlllI1IIIl1.MouseLeave:Connect(( function ()
                    Neverlose.PlayAnimate(I1ll1IIll1I, TweenInfo0175, {
                        TextTransparency = 0.400, TextColor3 = Color3.fromRGB(223, 223, 223)
                    })
                end
                )))
            end
            table.clear(IlIIl1IllIl)
        end
        task.delay(1, function ()
            local llIIIllII1I = lIII111lll1.SelectedConfig or I1IlIl1l1I1.ConfigAutoSaveFile or "Default"
            local lll11IIl111 = I1IlIl1l1I1.ConfigFolder .. "/" .. llIIIllII1I
            if I1IlIl1l1I1.ConfigAutoLoad then
                local llllIl1IIII = Neverlose:ReadAutoSave(I1IlIl1l1I1.AutoSaveKey)
                if llllIl1IIII then
                    lIII111lll1:LoadData(llllIl1IIII)
                    llIll1ll1lI.new("folder", "Auto loaded " .. tostring(I1IlIl1l1I1.AutoSaveKey), 3.5)
                elseif isfile(lll11IIl111) then
                    local l1lllI1I1ll = readfile(lll11IIl111)
                    lIII111lll1:LoadData(l1lllI1I1ll)
                    lIII111lll1.SelectedConfig = llIIIllII1I
                    l1lIlII1ll1.Text = llIIIllII1I
                    l1l1IllllII()
                    lIII111lll1:RefreshConfig()
                    llIll1ll1lI.new("folder", "Loaded " .. tostring(llIIIllII1I), 3.5)
                end
            end
            if not I1IlIl1l1I1.ConfigSaveWindowState and not I1IlIl1l1I1.Destroyed and not I1IlIl1l1I1.Minimizing and not I1IlIl1l1I1.Minimized then
                I1IlIl1l1I1.Signal:SetValue( true )
                I1IlIl1l1I1:SetRender( true )
                if I1IlIl1l1I1._MenuIcon then
                    I1IlIl1l1I1._MenuIcon:OnWindowToggle( true )
                end
            end
            task.spawn( function ()
                local l1lll1l1II1 = nil
                while not I1IlIl1l1I1.Destroyed do
                    task.wait(5.75)
                    if I1IlIl1l1I1.ConfigAutoSave then
                        local l1I11I11Ill = lIII111lll1:GetData( true )
                        if l1I11I11Ill ~= l1lll1l1II1 and Neverlose:WriteAutoSave(I1IlIl1l1I1.AutoSaveKey, l1I11I11Ill) then
                            l1lll1l1II1 = l1I11I11Ill
                        end
                    end
                end
            end
            )
        end
        )
        local llIII111IIl = Neverlose:CreateInput(IIIlI1I111I, function ()
            if lIII111lll1:WriteConfig(lIII111lll1.SelectedConfig or I1IlIl1l1I1.ConfigAutoSaveFile or "Default", true ) then
                lIII111lll1:RefreshConfig()
            end
        end
        )
        Neverlose:AddSignal(llIII111IIl.MouseEnter:Connect(( function ()
            Neverlose.PlayAnimate(IIIlI1I111I, TweenInfo0175, {
                TextTransparency = 0.1
            })
        end
        )))
        Neverlose:AddSignal(llIII111IIl.MouseLeave:Connect(( function ()
            Neverlose.PlayAnimate(IIIlI1I111I, TweenInfo0175, {
                TextTransparency = 0.25
            })
        end
        )))
        local lIl1II1IlI1 = Neverlose:CreateInput(IIll11IIlI1, function ()
            local I11III11Ill = l111Il1I1lI.Text
            if I11III11Ill and I11III11Ill:byte() and not I11III11Ill:find("/", 1, true ) and not I11III11Ill:find("\\", 1, true ) then
                I11III11Ill = string.sub(I11III11Ill, 1, 24)
                if lIII111lll1:WriteConfig(I11III11Ill, I1IlIl1l1I1.ConfigOverwrite) then
                    l111Il1I1lI.Text = ""
                    lIII111lll1:RefreshConfig()
                end
            end
        end
        )
        Neverlose:AddSignal(lIl1II1IlI1.MouseEnter:Connect( function ()
            Neverlose.PlayAnimate(I1ll11111Il, TweenInfo0175, {
                TextTransparency = 0.1
            })
        end
        ))Neverlose:AddSignal(lIl1II1IlI1.MouseLeave:Connect( function ()
            Neverlose.PlayAnimate(I1ll11111Il, TweenInfo0175, {
                TextTransparency = 0.35
            })
        end
        ))lIII111lll1:RefreshConfig()
        ll1l1Il1ll1.MouseButton1Click:Connect(( function ()
            if lIII111lll1.UnsafeThread then
                lIII111lll1.UnsafeThread:Disconnect()
                lIII111lll1.UnsafeThread = nil
            end
            llIIll1Ill1:SetValue( true )
            lIII111lll1.UnsafeThread = UserInputService.InputBegan:Connect( function (IIIIl1l11lI)
                if IIIIl1l11lI.UserInputType == Enum.UserInputType.MouseButton1 or IIIIl1l11lI.UserInputType == Enum.UserInputType.Touch then
                    if not Neverlose:IsMouseOverFrame(lIll1l1lIII) then
                        if lIII111lll1.UnsafeThread then
                            lIII111lll1.UnsafeThread:Disconnect()
                            lIII111lll1.UnsafeThread = nil
                        end
                        llIIll1Ill1:SetValue( false )
                    end
                end
            end
            )
        end
        ))
        return lIII111lll1
    end
    if I1IlIl1l1I1.ConfigEnabled then
        I1IlIl1l1I1.ConfigManager = I1IlIl1l1I1:_InitConfig()
    else
        II11IIIll11.Visible = false
    end
    local ll111I1lllI = I1IlIl1l1I1:AddTab({
        Name = "Settings", Icon = "gear", Type = "Double", Internal = true , LayoutOrder = 10000,
    })
    I1IlIl1l1I1.SettingsTab = ll111I1lllI
    Neverlose:ApplyUISettings(I1IlIl1l1I1)
    local IlIll1II1lI = ll111I1lllI:AddSection({
        Name = "Interface", Position = "Right", Icon = "paint-brush",
    })
    local Il1IIlII1Il = ll111I1lllI:AddSection({
        Name = "Window", Position = "Left", Icon = "frame-corners",
    })
    local I1II1lIl1l1 = IlIll1II1lI
    I1IlIl1l1I1.UserSettings = I1II1lIl1l1
    if I1IlIl1l1I1.ConfigEnabled then
        Il1IIlII1Il:AddLabel("Auto Save"):AddToggle({
            Default = I1IlIl1l1I1.ConfigAutoSave, Callback = function (ll1l11llI1I)
                I1IlIl1l1I1.ConfigAutoSave = ll1l11llI1I
                Neverlose:SetUISetting("AutoSave", ll1l11llI1I == true )
            end
            ,
        })
    end
    Il1IIlII1Il:AddLabel("Menu Scale"):AddDropdown({
        Default = Neverlose:GetUISetting("MenuScale", "Mobile"), Values = {
            "Large", "Default", "Mobile", "Small", "Compact"
        }, Callback = function (Ill11111lIl)
            if Neverlose.Scales[Ill11111lIl] then
                I1IlIl1l1I1:SetSize(Neverlose.Scales[Ill11111lIl])
                Neverlose:SetUISetting("MenuScale", Ill11111lIl)
                llIll1ll1lI.new("crop", "Scale changed to " .. tostring(Ill11111lIl), 5)
            end
        end
        ,
    })
    Il1IIlII1Il:AddLabel("Notification Position")
    Il1IIlII1Il:AddCustom({
        Name = "Notification Position", Height = 112, Background = true , Build = function (IlII111I1ll, lIlIIlII1II)
            Neverlose:BuildNotificationPicker(IlII111I1ll, lIlIIlII1II, I1IlIl1l1I1)
        end
        ,
    })
    Il1IIlII1Il:AddLabel("Menu Keybind"):AddKeybind({
        Default = tostring(I1IlIl1l1I1.Keybind or "RightControl"), Callback = lIIlIlII11I, ChangedCallback = function (Il11I1I1l1I, IIIll1lllIl)
            I1IlIl1l1I1.Keybind = tostring(IIIll1lllIl)
            Neverlose:SetUISetting("Keybind", tostring(IIIll1lllIl))
        end
        ,
    })
    Il1IIlII1Il:AddLabel("Background Image"):AddTextInput({
        Default = I1IlIl1l1I1.BackgroundImage or "", Placeholder = "Roblox Asset ID", Callback = function (...)
            local lI1IllIII11 = (select(select("#", ...), ...))
            I1IlIl1l1I1:SetBackground(lI1IllIII11)
            Neverlose:SetUISetting("BackgroundImage", tostring(lI1IllIII11 or ""))
        end
        ,
    })
    Il1IIlII1Il:AddLabel("Background Opacity"):AddSlider({
        Default = math.floor((I1IlIl1l1I1.BackgroundImageOpacity or 0.5) * 100), Min = 5, Max = 100, Rounding = 0, Type = "%", Size = 100, Callback = function (...)
            local lI1llll11I1 = (select(select("#", ...), ...)) / 100
            I1IlIl1l1I1:SetBackgroundOpacity(lI1llll11I1)
            Neverlose:SetUISetting("BackgroundOpacity", lI1llll11I1)
        end
        ,
    })
    Il1IIlII1Il:AddLabel("Drag Smoothness"):AddSlider({
        Default = math.floor(tonumber(Neverlose.DragSmoothness) or 0), Min = 0, Max = 100, Rounding = 0, Type = "%", Size = 100, Callback = function (...)
            local lIlII1lll1l = (select(select("#", ...), ...))
            Neverlose.DragSmoothness = math.clamp(tonumber(lIlII1lll1l) or 0, 0, 100)
            Neverlose:SetUISetting("DragSmoothness", Neverlose.DragSmoothness)
        end
        ,
    })
    if Neverlose:IsSmallScreen() then
        Il1IIlII1Il:AddLabel("Mobile UI Size"):AddSlider({
            Default = math.floor((tonumber(Neverlose.MobileScale) or 0.72) * 100), Min = 40, Max = 100, Rounding = 0, Type = "%", Size = 100, Callback = function (...)
                local l1ll1lII1lI = (select(select("#", ...), ...)) / 100
                Neverlose.MobileScale = math.clamp(l1ll1lII1lI, 0.4, 1)
                Neverlose:SetUISetting("MobileScale", Neverlose.MobileScale)
                I1IlIl1l1I1:UpdateFitScale( true )
            end
            ,
        })
    end
    Il1IIlII1Il:AddButton({
        Name = "Minimize Window", Icon = "minus", Callback = function ()
            I1IlIl1l1I1:Minimize()
        end
        ,
    })
    function I1IlIl1l1I1:SetInterface(III1I1I11Il)
        Neverlose:SetInterface(III1I1I11Il)
        return I1IlIl1l1I1
    end
    function I1IlIl1l1I1:SetTilt(II1llII111I)
        Neverlose:SetTilt(II1llII111I)
        return I1IlIl1l1I1
    end
    function I1IlIl1l1I1:SetBorder(llIIIl1lI1I)
        Neverlose:SetBorder(llIIIl1lI1I)
        return I1IlIl1l1I1
    end
    function I1IlIl1l1I1:SetDragSmoothness(l1lIllll1Il)
        Neverlose.DragSmoothness = math.clamp(tonumber(l1lIllll1Il) or 0, 0, 100)
        Neverlose:SetUISetting("DragSmoothness", Neverlose.DragSmoothness)
        return I1IlIl1l1I1
    end
    function I1IlIl1l1I1:SetMobileScale(Il1I1I11lI1)
        Neverlose.MobileScale = math.clamp(tonumber(Il1I1I11lI1) or 0.72, 0.4, 1)
        Neverlose:SetUISetting("MobileScale", Neverlose.MobileScale)
        I1IlIl1l1I1:UpdateFitScale( true )
        return I1IlIl1l1I1
    end
    do
        local IIIlII11I11 = (type(I1l1ll11l1l.Interface) == "table" and I1l1ll11l1l.Interface) or {}
        if I1l1ll11l1l.AccentColor ~= nil and IIIlII11I11.AccentColor == nil then
            IIIlII11I11.AccentColor = I1l1ll11l1l.AccentColor
        end
        Neverlose:SetInterface(IIIlII11I11)
        do
            local IIIIII111II = Neverlose:GetUISetting("NotifyPosition")
            local I1I1l11l1l1 = I1l1ll11l1l.NotifyPosition or I1l1ll11l1l.NotificationPosition
            if IIIIII111II ~= nil then
                Neverlose.Notifier.SetPosition(IIIIII111II, false )
            elseif I1I1l11l1l1 ~= nil then
                Neverlose.Notifier.SetPosition(I1I1l11l1l1, false )
            end
        end
        if I1l1ll11l1l.Border ~= nil then
            Neverlose:SetBorder(type(I1l1ll11l1l.Border) == "table" and I1l1ll11l1l.Border or {
                Enabled = I1l1ll11l1l.Border == true
            })
        end
        if I1l1ll11l1l.Tilt ~= nil then
            Neverlose:SetTilt(I1l1ll11l1l.Tilt)
        end
        if I1l1ll11l1l.DragSmoothness ~= nil and Neverlose:GetUISetting("DragSmoothness") == nil then
            Neverlose.DragSmoothness = math.clamp(tonumber(I1l1ll11l1l.DragSmoothness) or 0, 0, 100)
        end
        if I1l1ll11l1l.MobileScale ~= nil and Neverlose:GetUISetting("MobileScale") == nil then
            Neverlose.MobileScale = math.clamp(tonumber(I1l1ll11l1l.MobileScale) or 0.72, 0.4, 1)
            I1IlIl1l1I1:UpdateFitScale( false )
        end
    end
    function I1IlIl1l1I1:AddToggle(IlIlIlIl11l)
        IlIlIlIl11l = Neverlose:ProcessParams(IlIlIlIl11l, {
            Name = "Toggle", Default = false , Flag = nil , Callback = lIIlIlII11I,
        })
        return I1IlIl1l1I1.UserSettings:AddLabel(IlIlIlIl11l.Name):AddToggle(IlIlIlIl11l)
    end
    function I1IlIl1l1I1:AddButton(l1Il111I1II)
        l1Il111I1II = Neverlose:ProcessParams(l1Il111I1II, {
            Name = "Button", Icon = "chevron-large-left", Callback = lIIlIlII11I, ToolTip = nil ,
        })
        return I1IlIl1l1I1.UserSettings:AddButton(l1Il111I1II)
    end
    function I1IlIl1l1I1:SetAccount(I1I1IllIII1)
        I1I1IllIII1 = Neverlose:ProcessParams(I1I1IllIII1, {
            Profile = Neverlose.UserProfile, Username = LocalPlayer.Name, DisplayName = LocalPlayer.DisplayName,
        })
        I1IlIl1l1I1.Username = I1I1IllIII1.Username
        I1IlIl1l1I1.DisplayName = I1I1IllIII1.DisplayName
        I1IlIl1l1I1.Profile = I1I1IllIII1.Profile
        llll1I1IIIl.Text = tostring(I1I1IllIII1.DisplayName)
        lllllIlI1Il.Text = "@" .. tostring(I1I1IllIII1.Username)
        llIlIIIlI1l.Image = I1I1IllIII1.Profile or ""
    end
    function I1IlIl1l1I1:SetSize(II111Il111I)
        I1IlIl1l1I1.Size = II111Il111I
        I1IlIl1l1I1:UpdateFitScale( true )
        if I1IlIl1l1I1.Signal:GetValue() then
            Neverlose.PlayAnimate(Il1III11I1I, TweenInfoQuint, {
                Size = I1IlIl1l1I1:GetCurrentSize()
            })
        end
    end
    function I1IlIl1l1I1:SetConfigOverwrite(Illl1lIIIIl)
        I1IlIl1l1I1.ConfigOverwrite = Illl1lIIIIl == true
        return I1IlIl1l1I1
    end
    function I1IlIl1l1I1:SaveConfig(l1llIIlIll1, IIIIllIIllI)
        if not I1IlIl1l1I1.ConfigManager or not I1IlIl1l1I1.ConfigManager.WriteConfig then
            return false
        end
        return I1IlIl1l1I1.ConfigManager:WriteConfig(l1llIIlIll1 or I1IlIl1l1I1.ConfigManager.SelectedConfig or I1IlIl1l1I1.ConfigAutoSaveFile or "Default", IIIIllIIllI)
    end
    function I1IlIl1l1I1:LoadConfig(l1ll1II111I)
        if not I1IlIl1l1I1.ConfigManager then
            return false
        end
        l1ll1II111I = tostring(l1ll1II111I or I1IlIl1l1I1.ConfigManager.SelectedConfig or I1IlIl1l1I1.ConfigAutoSaveFile or "Default")
        local I1IlIl11IlI = I1IlIl1l1I1.ConfigFolder .. "/" .. l1ll1II111I
        if not isfile(I1IlIl11IlI) then
            return false
        end
        I1IlIl1l1I1.ConfigManager:LoadData(readfile(I1IlIl11IlI))
        I1IlIl1l1I1.ConfigManager.SelectedConfig = l1ll1II111I
        l1lIlII1ll1.Text = l1ll1II111I
        return true
    end
    function I1IlIl1l1I1:RewriteConfigAsJson()
        if not I1IlIl1l1I1.ConfigManager or not I1IlIl1l1I1.ConfigManager.RewriteSelectedAsJson then
            return false
        end
        return I1IlIl1l1I1.ConfigManager:RewriteSelectedAsJson()
    end
    function I1IlIl1l1I1:OnDestroy(llI1I1I1ll1)
        if type(llI1I1I1ll1) == "function" then
            table.insert(I1IlIl1l1I1.OnDestroyCallbacks, llI1I1I1ll1)
        end
        return I1IlIl1l1I1
    end
    function I1IlIl1l1I1:SafeCallback(IlIlIlI1llI, l111I1l1II1, ...)
        return Neverlose:FireCallback(IlIlIlI1llI, l111I1l1II1, ...)
    end
    function I1IlIl1l1I1:InputDialog(lII1lIllI1l)
        lII1lIllI1l = Neverlose:ProcessParams(lII1lIllI1l, {
            Title = "Input", Content = "", Name = "Value", Placeholder = "", Default = "", Inputs = nil , ConfirmText = "Confirm", CancelText = "Cancel", Callback = lIIlIlII11I,
        })
        local I1I1l1111ll = lII1lIllI1l.Inputs
        if typeof(I1I1l1111ll) ~= "table" then
            I1I1l1111ll = {
                {
                    Name = lII1lIllI1l.Name, Placeholder = lII1lIllI1l.Placeholder, Default = lII1lIllI1l.Default, Numeric = lII1lIllI1l.Numeric,
                },
            }
        end
        local llII11IllIl = {
            Closed = false , Values ={}, Boxes ={},
        }
        local ll11lII1lIl = Instance.new("Frame") local IIl1l1IllI1 = Instance.new("Frame") local llI1lllIIll = Instance.new("UICorner") local lllII11IIll = Instance.new("UIStroke") local I1IIlIIIIll = Instance.new("TextLabel") local lI1lll1l11l = Instance.new("TextLabel") local II111I1I1lI = Instance.new("Frame") local I1lllIIlI1I = Instance.new("UIListLayout") local lII111IIll1 = Instance.new("Frame") local IllIll11II1 = Instance.new("UIListLayout") local Ill1Illl1I1 = Neverlose:CreateShadow(IIl1l1IllI1)
        local lIIll1III1I = 148 + (#I1I1l1111ll * 42)
        ll11lII1lIl.Name = Neverlose.RandomString()
        ll11lII1lIl.Parent = Il1III11I1I ll11lII1lIl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)ll11lII1lIl.BackgroundTransparency = 1 ll11lII1lIl.BorderSizePixel = 0 ll11lII1lIl.Size = UDim2.fromScale(1, 1)ll11lII1lIl.ZIndex = 190 ll11lII1lIl.Active = true IIl1l1IllI1.Name = Neverlose.RandomString()
        IIl1l1IllI1.Parent = ll11lII1lIl IIl1l1IllI1.AnchorPoint = Vector2.new(0.5, 0.5)IIl1l1IllI1.BackgroundColor3 = Color3.fromRGB(20, 22, 27)IIl1l1IllI1.BackgroundTransparency = 1 IIl1l1IllI1.BorderSizePixel = 0 IIl1l1IllI1.ClipsDescendants = true IIl1l1IllI1.Position = UDim2.fromScale(0.5, 0.5)IIl1l1IllI1.Size = UDim2.new(0, 345, 0, lIIll1III1I - 15)IIl1l1IllI1.ZIndex = 191 llI1lllIIll.CornerRadius = UDim.new(0, 10)llI1lllIIll.Parent = IIl1l1IllI1 lllII11IIll.Transparency = 1 lllII11IIll.Color = Color3.fromRGB(45, 48, 58)lllII11IIll.Parent = IIl1l1IllI1 I1IIlIIIIll.Name = Neverlose.RandomString()
        I1IIlIIIIll.Parent = IIl1l1IllI1 I1IIlIIIIll.BackgroundTransparency = 1 I1IIlIIIIll.BorderSizePixel = 0 I1IIlIIIIll.Position = UDim2.new(0, 18, 0, 15)I1IIlIIIIll.Size = UDim2.new(1, - 36, 0, 20)I1IIlIIIIll.ZIndex = 192 I1IIlIIIIll.Font = Enum.Font.GothamBold I1IIlIIIIll.Text = lII1lIllI1l.Title I1IIlIIIIll.TextColor3 = Color3.fromRGB(255, 255, 255)I1IIlIIIIll.TextSize = 15 I1IIlIIIIll.TextTransparency = 1 I1IIlIIIIll.TextXAlignment = Enum.TextXAlignment.Left Neverlose:AddTextGradient(I1IIlIIIIll)
        lI1lll1l11l.Name = Neverlose.RandomString()
        lI1lll1l11l.Parent = IIl1l1IllI1 lI1lll1l11l.BackgroundTransparency = 1 lI1lll1l11l.BorderSizePixel = 0 lI1lll1l11l.Position = UDim2.new(0, 18, 0, 43)lI1lll1l11l.Size = UDim2.new(1, - 36, 0, lII1lIllI1l.Content == "" and 0 or34)lI1lll1l11l.ZIndex = 192 lI1lll1l11l.Font = Enum.Font.GothamMedium lI1lll1l11l.Text = lII1lIllI1l.Content lI1lll1l11l.TextColor3 = Color3.fromRGB(255, 255, 255)lI1lll1l11l.TextSize = 13 lI1lll1l11l.TextTransparency = 1 lI1lll1l11l.TextWrapped = true lI1lll1l11l.TextXAlignment = Enum.TextXAlignment.Left lI1lll1l11l.TextYAlignment = Enum.TextYAlignment.Top II111I1I1lI.Name = Neverlose.RandomString()
        II111I1I1lI.Parent = IIl1l1IllI1 II111I1I1lI.BackgroundTransparency = 1 II111I1I1lI.BorderSizePixel = 0 II111I1I1lI.Position = UDim2.new(0, 18, 0, lII1lIllI1l.Content == "" and 48 or 82)II111I1I1lI.Size = UDim2.new(1, - 36, 0, #I1I1l1111ll * 42)II111I1I1lI.ZIndex = 192 I1lllIIlI1I.Parent = II111I1I1lI I1lllIIlI1I.SortOrder = Enum.SortOrder.LayoutOrder I1lllIIlI1I.Padding = UDim.new(0, 8) local function IlI1II1ll1l()
            local l1IlIIIlIlI ={}
            for llI1Il1l1Il, l1I111IIlI1 in ipairs(llII11IllIl.Boxes) do
                local IIlI11IIIlI = I1I1l1111ll[llI1Il1l1Il] or {}
                local ll1Il1IIIl1 = IIlI11IIIlI.Flag or IIlI11IIIlI.Key or IIlI11IIIlI.Name or tostring(llI1Il1l1Il)
                l1IlIIIlIlI[ll1Il1IIIl1] = l1I111IIlI1.Text
            end
            llII11IllIl.Values = l1IlIIIlIlI
            if #llII11IllIl.Boxes == 1 then
                return llII11IllIl.Boxes[1].Text, l1IlIIIlIlI
            end
            return l1IlIIIlIlI
        end
        for IIlIIIIlIIl, I1llII11I1I in ipairs(I1I1l1111ll) do
            if typeof(I1llII11I1I) ~= "table" then
                I1llII11I1I = {
                    Name = tostring(I1llII11I1I or "Value"),
                }
                I1I1l1111ll[IIlIIIIlIIl] = I1llII11I1I
            end
            I1llII11I1I = Neverlose:ProcessParams(I1llII11I1I, {
                Name = "Value", Placeholder = "", Default = "", Numeric = false ,
            })
            local ll1IIl11IIl = Instance.new("Frame") local lI1lllIII1I = Instance.new("TextLabel") local I111l1Il1lI = Instance.new("Frame") local I1111IIlI11 = Instance.new("UICorner") local lllI1Il1ll1 = Instance.new("UIStroke") local Ill1llIl1II = Instance.new("TextBox")ll1IIl11IIl.Name = Neverlose.RandomString()
            ll1IIl11IIl.Parent = II111I1I1lI ll1IIl11IIl.BackgroundTransparency = 1 ll1IIl11IIl.BorderSizePixel = 0 ll1IIl11IIl.Size = UDim2.new(1, 0, 0, 34)ll1IIl11IIl.ZIndex = 192 ll1IIl11IIl.LayoutOrder = IIlIIIIlIIl lI1lllIII1I.Name = Neverlose.RandomString()
            lI1lllIII1I.Parent = ll1IIl11IIl lI1lllIII1I.BackgroundTransparency = 1 lI1lllIII1I.BorderSizePixel = 0 lI1lllIII1I.Position = UDim2.new(0, 0, 0, 0)lI1lllIII1I.Size = UDim2.new(0.42, - 6, 1, 0)lI1lllIII1I.ZIndex = 193 lI1lllIII1I.Font = Enum.Font.GothamMedium lI1lllIII1I.Text = tostring(I1llII11I1I.Name)lI1lllIII1I.TextColor3 = Color3.fromRGB(255, 255, 255)lI1lllIII1I.TextSize = 12 lI1lllIII1I.TextTransparency = 1 lI1lllIII1I.TextXAlignment = Enum.TextXAlignment.Left lI1lllIII1I.TextTruncate = Enum.TextTruncate.AtEnd I111l1Il1lI.Name = Neverlose.RandomString()
            I111l1Il1lI.Parent = ll1IIl11IIl I111l1Il1lI.AnchorPoint = Vector2.new(1, 0.5)I111l1Il1lI.BackgroundColor3 = Color3.fromRGB(13, 17, 22)I111l1Il1lI.BackgroundTransparency = 1 I111l1Il1lI.BorderSizePixel = 0 I111l1Il1lI.Position = UDim2.new(1, 0, 0.5, 0)I111l1Il1lI.Size = UDim2.new(0.58, 0, 0, 30)I111l1Il1lI.ZIndex = 193 I1111IIlI11.CornerRadius = UDim.new(0, 5)I1111IIlI11.Parent = I111l1Il1lI lllI1Il1ll1.Color = Color3.fromRGB(45, 48, 58)lllI1Il1ll1.Transparency = 1 lllI1Il1ll1.Parent = I111l1Il1lI Ill1llIl1II.Name = Neverlose.RandomString()
            Ill1llIl1II.Parent = I111l1Il1lI Ill1llIl1II.BackgroundTransparency = 1 Ill1llIl1II.BorderSizePixel = 0 Ill1llIl1II.ClearTextOnFocus = false Ill1llIl1II.Position = UDim2.new(0, 8, 0, 0)Ill1llIl1II.Size = UDim2.new(1, - 16, 1, 0)Ill1llIl1II.ZIndex = 194 Ill1llIl1II.Font = Enum.Font.GothamMedium Ill1llIl1II.Text = tostring(I1llII11I1I.Default or "")Ill1llIl1II.PlaceholderText = tostring(I1llII11I1I.Placeholder or "")Ill1llIl1II.TextColor3 = Color3.fromRGB(255, 255, 255)Ill1llIl1II.PlaceholderColor3 = Color3.fromRGB(140, 140, 155)Ill1llIl1II.TextSize = 12 Ill1llIl1II.TextTransparency = 1 Ill1llIl1II.TextXAlignment = Enum.TextXAlignment.Left if I1llII11I1I.Numeric then
                Neverlose:AddSignal(Ill1llIl1II:GetPropertyChangedSignal("Text"):Connect( function ()
                    Ill1llIl1II.Text = Ill1llIl1II.Text:gsub("[^%d%.%-]", "")
                end
                ))
            end
            table.insert(llII11IllIl.Boxes, Ill1llIl1II)
            Neverlose.PlayAnimate(lI1lllIII1I, TweenInfo0175, {
                TextTransparency = 0.250
            })Neverlose.PlayAnimate(I111l1Il1lI, TweenInfo0175, {
                BackgroundTransparency = 0.150
            })Neverlose.PlayAnimate(lllI1Il1ll1, TweenInfo0175, {
                Transparency = 0.700
            })Neverlose.PlayAnimate(Ill1llIl1II, TweenInfo0175, {
                TextTransparency = 0.150
            })
        end
        lII111IIll1.Name = Neverlose.RandomString()
        lII111IIll1.Parent = IIl1l1IllI1 lII111IIll1.AnchorPoint = Vector2.new(1, 1)lII111IIll1.BackgroundTransparency = 1 lII111IIll1.BorderSizePixel = 0 lII111IIll1.Position = UDim2.new(1, - 14, 1, - 14)lII111IIll1.Size = UDim2.new(1, - 28, 0, 30)lII111IIll1.ZIndex = 192 IllIll11II1.Parent = lII111IIll1 IllIll11II1.FillDirection = Enum.FillDirection.Horizontal IllIll11II1.HorizontalAlignment = Enum.HorizontalAlignment.Right IllIll11II1.SortOrder = Enum.SortOrder.LayoutOrder IllIll11II1.Padding = UDim.new(0, 8) function llII11IllIl:Close(I11lIlll11l)
            if llII11IllIl.Closed then
                return I11lIlll11l
            end
            llII11IllIl.Closed = true
            Neverlose.PlayAnimate(ll11lII1lIl, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(IIl1l1IllI1, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(lllII11IIll, TweenInfo0175, {
                Transparency = 1
            })Neverlose.PlayAnimate(I1IIlIIIIll, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(lI1lll1l11l, TweenInfo0175, {
                TextTransparency = 1
            })Ill1Illl1I1:Render( false )
            task.delay(0.18, function ()
                if ll11lII1lIl.Parent then
                    ll11lII1lIl:Destroy()
                end
            end
            )
            Neverlose:FireCallback(lII1lIllI1l.Callback, lII1lIllI1l.Title, I11lIlll11l, llII11IllIl.Values)
            return I11lIlll11l
        end
        local function IllllIll1l1(lIlllIIl1lI, l1llIl1lIll, llll1I1IIl1)
            local I1lllI1IlIl = Instance.new("Frame") local llI1llI11Il = Instance.new("UICorner") local IlI11111III = Instance.new("UIStroke") local l11Il1I1I11 = Instance.new("TextLabel")I1lllI1IlIl.Name = Neverlose.RandomString()
            I1lllI1IlIl.Parent = lII111IIll1 I1lllI1IlIl.BackgroundColor3 = l1llIl1lIll and Neverlose.AccentColor or Color3.fromRGB(26, 28, 36)I1lllI1IlIl.BackgroundTransparency = 1 I1lllI1IlIl.BorderSizePixel = 0 I1lllI1IlIl.ClipsDescendants = true I1lllI1IlIl.Size = UDim2.new(0, math.max(78, TextService:GetTextSize(tostring(lIlllIIl1lI), 12, Enum.Font.GothamMedium, Vector2.new(math.huge, math.huge)).X + 28), 0, 28)I1lllI1IlIl.ZIndex = 193 llI1llI11Il.CornerRadius = UDim.new(0, 5)llI1llI11Il.Parent = I1lllI1IlIl IlI11111III.Transparency = 1 IlI11111III.Color = l1llIl1lIll and Neverlose.AccentColor or Color3.fromRGB(45, 48, 58)IlI11111III.Parent = I1lllI1IlIl l11Il1I1I11.Name = Neverlose.RandomString()
            l11Il1I1I11.Parent = I1lllI1IlIl l11Il1I1I11.BackgroundTransparency = 1 l11Il1I1I11.BorderSizePixel = 0 l11Il1I1I11.Size = UDim2.fromScale(1, 1)l11Il1I1I11.ZIndex = 194 l11Il1I1I11.Font = Enum.Font.GothamMedium l11Il1I1I11.Text = lIlllIIl1lI l11Il1I1I11.TextColor3 = Color3.fromRGB(255, 255, 255)l11Il1I1I11.TextSize = 12 l11Il1I1I11.TextTransparency = 1 local IlIlI1I1IlI = Neverlose:CreateInput(I1lllI1IlIl, llll1I1IIl1)
            Neverlose:AddSignal(IlIlI1I1IlI.MouseEnter:Connect( function ()
                Neverlose.PlayAnimate(I1lllI1IlIl, TweenInfo0175, {
                    BackgroundTransparency = l1llIl1lIll and 0 or 0.100
                })
            end
            ))Neverlose:AddSignal(IlIlI1I1IlI.MouseLeave:Connect( function ()
                Neverlose.PlayAnimate(I1lllI1IlIl, TweenInfo0175, {
                    BackgroundTransparency = l1llIl1lIll and 0.100 or 0.250
                })
            end
            ))Neverlose.PlayAnimate(I1lllI1IlIl, TweenInfo0175, {
                BackgroundTransparency = l1llIl1lIll and 0.100 or 0.250
            })Neverlose.PlayAnimate(IlI11111III, TweenInfo0175, {
                Transparency = l1llIl1lIll and 1 or 0.650
            })Neverlose.PlayAnimate(l11Il1I1I11, TweenInfo0175, {
                TextTransparency = 0
            })
        end
        IllllIll1l1(lII1lIllI1l.CancelText, false , function ()
            llII11IllIl:Close( nil )
        end
        )
        IllllIll1l1(lII1lIllI1l.ConfirmText, true , function ()
            llII11IllIl:Close(IlI1II1ll1l())
        end
        )
        Neverlose.PlayAnimate(ll11lII1lIl, TweenInfo0175, {
            BackgroundTransparency = 0.350
        })Neverlose.PlayAnimate(IIl1l1IllI1, TweenInfoQuint, {
            BackgroundTransparency = 0.035, Size = UDim2.new(0, 360, 0, lIIll1III1I)
        })Neverlose.PlayAnimate(lllII11IIll, TweenInfo0175, {
            Transparency = 0.650
        })Neverlose.PlayAnimate(I1IIlIIIIll, TweenInfo0175, {
            TextTransparency = 0
        })Neverlose.PlayAnimate(lI1lll1l11l, TweenInfo0175, {
            TextTransparency = 0.250
        })Ill1Illl1I1:Render( true )
        task.defer( function ()
            if llII11IllIl.Boxes[1] then
                llII11IllIl.Boxes[1]:CaptureFocus()
            end
        end
        )
        function llII11IllIl:GetValue()
            return IlI1II1ll1l()
        end
        function llII11IllIl:SetValue(IIlIlI1Ill1, III1I1Ill1l)
            if III1I1Ill1l == nil and llII11IllIl.Boxes[1] then
                llII11IllIl.Boxes[1].Text = tostring(IIlIlI1Ill1 or "")
                return llII11IllIl
            end
            for I1l111lll1I, IlI11lIIIl1 in ipairs(I1I1l1111ll) do
                local Il11llIIIll = IlI11lIIIl1.Flag or IlI11lIIIl1.Key or IlI11lIIIl1.Name or tostring(I1l111lll1I)
                if tostring(Il11llIIIll) == tostring(III1I1Ill1l) and llII11IllIl.Boxes[I1l111lll1I] then
                    llII11IllIl.Boxes[I1l111lll1I].Text = tostring(IIlIlI1Ill1 or "")
                end
            end
            return llII11IllIl
        end
        return wrapCaseInsensitive(llII11IllIl)
    end
    function I1IlIl1l1I1:Dialog(l1IIIll1Ill)
        l1IIIll1Ill = Neverlose:ProcessParams(l1IIIll1Ill, {
            Title = "Dialog", Content = "", Icon = "lucide:message-square", Buttons ={}, Callback = lIIlIlII11I,
        })
        local lllllll1I11 = {
            Closed = false ,
        }
        local IIl11IIIlll = Instance.new("Frame") local Ill1ll1l11I = Instance.new("Frame") local Il1lIllI1lI = Instance.new("UICorner") local ll1lIIIlll1 = Instance.new("UIStroke") local ll1l1I111Il = Instance.new("Frame") local I1l11III1II = Instance.new("UICorner") local lll11I1lI11 = Instance.new("Frame") local IIII11lIIIl = Instance.new("UICorner") local lII1ll11III = Instance.new("UIStroke") local l1l1Il11II1 = Instance.new("ImageLabel") local IIIl1l1IIl1 = Instance.new("TextLabel") local Ill1l1lI1lI = Instance.new("TextLabel") local II1lI1l1Il1 = Instance.new("Frame") local l11IIl1Illl = Instance.new("Frame") local lIllIIIl11I = Instance.new("UIListLayout") local l1IIl1I1lIl = math.clamp(TextService:GetTextSize(tostring(l1IIIll1Ill.Content or ""), 13, Enum.Font.GothamMedium, Vector2.new(310, math.huge)).Y + 4, 38, 76)
        local II1ll1lIllI = math.max(188, 132 + l1IIl1I1lIl)
        local I1I1lllIlII = UDim2.new(0, 365, 0, II1ll1lIllI - 18)
        local l1I1IlIIll1 = UDim2.new(0, 392, 0, II1ll1lIllI)
        IIl11IIIlll.Name = Neverlose.RandomString()
        IIl11IIIlll.Parent = Il1III11I1I IIl11IIIlll.BackgroundColor3 = Color3.fromRGB(0, 0, 0)IIl11IIIlll.BackgroundTransparency = 1 IIl11IIIlll.BorderColor3 = Color3.fromRGB(0, 0, 0)IIl11IIIlll.BorderSizePixel = 0 IIl11IIIlll.Size = UDim2.fromScale(1, 1)IIl11IIIlll.ZIndex = 180 IIl11IIIlll.Active = true Ill1ll1l11I.Name = Neverlose.RandomString()
        Ill1ll1l11I.Parent = IIl11IIIlll Ill1ll1l11I.AnchorPoint = Vector2.new(0.5, 0.5)Ill1ll1l11I.BackgroundColor3 = Color3.fromRGB(13, 17, 22)Ill1ll1l11I.BackgroundTransparency = 1 Ill1ll1l11I.BorderColor3 = Color3.fromRGB(0, 0, 0)Ill1ll1l11I.BorderSizePixel = 0 Ill1ll1l11I.ClipsDescendants = true Ill1ll1l11I.Position = UDim2.fromScale(0.5, 0.5)Ill1ll1l11I.Size = I1I1lllIlII Ill1ll1l11I.ZIndex = 181 Il1lIllI1lI.CornerRadius = UDim.new(0, 12)Il1lIllI1lI.Parent = Ill1ll1l11I ll1lIIIlll1.Transparency = 1 ll1lIIIlll1.Color = Color3.fromRGB(45, 48, 58)ll1lIIIlll1.Parent = Ill1ll1l11I local Ill1llIlllI = Neverlose:CreateShadow(Ill1ll1l11I)
        ll1l1I111Il.Name = Neverlose.RandomString()
        ll1l1I111Il.Parent = Ill1ll1l11I ll1l1I111Il.BackgroundColor3 = Neverlose.AccentColor ll1l1I111Il.BackgroundTransparency = 1 ll1l1I111Il.BorderSizePixel = 0 ll1l1I111Il.Position = UDim2.fromOffset(0, 0)ll1l1I111Il.Size = UDim2.new(1, 0, 0, 3)ll1l1I111Il.ZIndex = 182 I1l11III1II.CornerRadius = UDim.new(0, 12)I1l11III1II.Parent = ll1l1I111Il lll11I1lI11.Name = Neverlose.RandomString()
        lll11I1lI11.Parent = Ill1ll1l11I lll11I1lI11.BackgroundColor3 = Neverlose.AccentColor lll11I1lI11.BackgroundTransparency = 1 lll11I1lI11.BorderSizePixel = 0 lll11I1lI11.Position = UDim2.fromOffset(18, 18)lll11I1lI11.Size = UDim2.fromOffset(34, 34)lll11I1lI11.ZIndex = 182 IIII11lIIIl.CornerRadius = UDim.new(0, 8)IIII11lIIIl.Parent = lll11I1lI11 lII1ll11III.Color = Neverlose.AccentColor lII1ll11III.Transparency = 1 lII1ll11III.Parent = lll11I1lI11 l1l1Il11II1.Name = Neverlose.RandomString()
        l1l1Il11II1.Parent = lll11I1lI11 l1l1Il11II1.AnchorPoint = Vector2.new(0.5, 0.5)l1l1Il11II1.BackgroundTransparency = 1 l1l1Il11II1.BorderSizePixel = 0 l1l1Il11II1.Position = UDim2.fromScale(0.5, 0.5)l1l1Il11II1.Size = UDim2.fromOffset(18, 18)l1l1Il11II1.ZIndex = 183 l1l1Il11II1.ImageColor3 = Color3.fromRGB(255, 255, 255)l1l1Il11II1.ImageTransparency = 1 IIlllIIl1II:SetIconMode(l1l1Il11II1, l1IIIll1Ill.Icon)IIIl1l1IIl1.Name = Neverlose.RandomString()
        IIIl1l1IIl1.Parent = Ill1ll1l11I IIIl1l1IIl1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)IIIl1l1IIl1.BackgroundTransparency = 1 IIIl1l1IIl1.BorderColor3 = Color3.fromRGB(0, 0, 0)IIIl1l1IIl1.BorderSizePixel = 0 IIIl1l1IIl1.Position = UDim2.new(0, 64, 0, 18)IIIl1l1IIl1.Size = UDim2.new(1, - 82, 0, 21)IIIl1l1IIl1.ZIndex = 183 IIIl1l1IIl1.Font = Enum.Font.GothamBold IIIl1l1IIl1.Text = l1IIIll1Ill.Title IIIl1l1IIl1.TextColor3 = Color3.fromRGB(255, 255, 255)IIIl1l1IIl1.TextSize = 16 IIIl1l1IIl1.TextTransparency = 1 IIIl1l1IIl1.TextXAlignment = Enum.TextXAlignment.Left Neverlose:AddTextGradient(IIIl1l1IIl1)
        Ill1l1lI1lI.Name = Neverlose.RandomString()
        Ill1l1lI1lI.Parent = Ill1ll1l11I Ill1l1lI1lI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)Ill1l1lI1lI.BackgroundTransparency = 1 Ill1l1lI1lI.BorderColor3 = Color3.fromRGB(0, 0, 0)Ill1l1lI1lI.BorderSizePixel = 0 Ill1l1lI1lI.Position = UDim2.new(0, 64, 0, 43)Ill1l1lI1lI.Size = UDim2.new(1, - 82, 0, l1IIl1I1lIl)Ill1l1lI1lI.ZIndex = 183 Ill1l1lI1lI.Font = Enum.Font.GothamMedium Ill1l1lI1lI.Text = l1IIIll1Ill.Content Ill1l1lI1lI.TextColor3 = Color3.fromRGB(255, 255, 255)Ill1l1lI1lI.TextSize = 13 Ill1l1lI1lI.TextTransparency = 1 Ill1l1lI1lI.TextWrapped = true Ill1l1lI1lI.TextXAlignment = Enum.TextXAlignment.Left Ill1l1lI1lI.TextYAlignment = Enum.TextYAlignment.Top II1lI1l1Il1.Name = Neverlose.RandomString()
        II1lI1l1Il1.Parent = Ill1ll1l11I II1lI1l1Il1.BackgroundColor3 = Color3.fromRGB(45, 48, 58)II1lI1l1Il1.BackgroundTransparency = 1 II1lI1l1Il1.BorderSizePixel = 0 II1lI1l1Il1.Position = UDim2.new(0, 14, 1, - 54)II1lI1l1Il1.Size = UDim2.new(1, - 28, 0, 1)II1lI1l1Il1.ZIndex = 182 l11IIl1Illl.Name = Neverlose.RandomString()
        l11IIl1Illl.Parent = Ill1ll1l11I l11IIl1Illl.AnchorPoint = Vector2.new(1, 1)l11IIl1Illl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l11IIl1Illl.BackgroundTransparency = 1 l11IIl1Illl.BorderColor3 = Color3.fromRGB(0, 0, 0)l11IIl1Illl.BorderSizePixel = 0 l11IIl1Illl.Position = UDim2.new(1, - 16, 1, - 14)l11IIl1Illl.Size = UDim2.new(1, - 32, 0, 32)l11IIl1Illl.ZIndex = 182 lIllIIIl11I.Parent = l11IIl1Illl lIllIIIl11I.FillDirection = Enum.FillDirection.Horizontal lIllIIIl11I.HorizontalAlignment = Enum.HorizontalAlignment.Right lIllIIIl11I.SortOrder = Enum.SortOrder.LayoutOrder lIllIIIl11I.Padding = UDim.new(0, 8) function lllllll1I11:Close(I1l1II1ll1I)
            if lllllll1I11.Closed then
                return I1l1II1ll1I
            end
            lllllll1I11.Closed = true
            Neverlose.PlayAnimate(IIl11IIIlll, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(Ill1ll1l11I, TweenInfo0175, {
                BackgroundTransparency = 1, Size = I1I1lllIlII
            })Neverlose.PlayAnimate(ll1lIIIlll1, TweenInfo0175, {
                Transparency = 1
            })Neverlose.PlayAnimate(ll1l1I111Il, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(lll11I1lI11, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(lII1ll11III, TweenInfo0175, {
                Transparency = 1
            })Neverlose.PlayAnimate(l1l1Il11II1, TweenInfo0175, {
                ImageTransparency = 1
            })Neverlose.PlayAnimate(IIIl1l1IIl1, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(Ill1l1lI1lI, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(II1lI1l1Il1, TweenInfo0175, {
                BackgroundTransparency = 1
            })Ill1llIlllI:Render( false )
            task.delay(0.18, function ()
                IIl11IIIlll:Destroy()
            end
            )
            Neverlose:FireCallback(l1IIIll1Ill.Callback, l1IIIll1Ill.Title, I1l1II1ll1I)
            return I1l1II1ll1I
        end
        if #l1IIIll1Ill.Buttons <= 0 then
            l1IIIll1Ill.Buttons = {
                {
                    Text = "OK", Primary = true ,
                },
            }
        end
        for l1lI1Il1Il1, lIllllIlI1I in ipairs(l1IIIll1Ill.Buttons) do
            lIllllIlI1I = Neverlose:ProcessParams(lIllllIlI1I, {
                Text = "Button", Primary = false , Callback = lIIlIlII11I,
            })
            local llIIl11lI1I = Instance.new("Frame") local ll1ll11l1I1 = Instance.new("UICorner") local llIIlIIll1I = Instance.new("UIStroke") local l1l1I1III1l = Instance.new("TextLabel")llIIl11lI1I.Name = Neverlose.RandomString()
            llIIl11lI1I.Parent = l11IIl1Illl llIIl11lI1I.BackgroundColor3 = lIllllIlI1I.Primary and Neverlose.AccentColor or Color3.fromRGB(26, 28, 36)llIIl11lI1I.BackgroundTransparency = 1 llIIl11lI1I.BorderColor3 = Color3.fromRGB(0, 0, 0)llIIl11lI1I.BorderSizePixel = 0 llIIl11lI1I.ClipsDescendants = true llIIl11lI1I.Size = UDim2.new(0, math.max(78, TextService:GetTextSize(tostring(lIllllIlI1I.Text), 12, Enum.Font.GothamBold, Vector2.new(math.huge, math.huge)).X + 32), 0, 32)llIIl11lI1I.ZIndex = 183 llIIl11lI1I.LayoutOrder = l1lI1Il1Il1 ll1ll11l1I1.CornerRadius = UDim.new(0, 7)ll1ll11l1I1.Parent = llIIl11lI1I llIIlIIll1I.Transparency = 1 llIIlIIll1I.Color = lIllllIlI1I.Primary and Neverlose.AccentColor or Color3.fromRGB(45, 48, 58)llIIlIIll1I.Parent = llIIl11lI1I l1l1I1III1l.Name = Neverlose.RandomString()
            l1l1I1III1l.Parent = llIIl11lI1I l1l1I1III1l.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l1l1I1III1l.BackgroundTransparency = 1 l1l1I1III1l.BorderColor3 = Color3.fromRGB(0, 0, 0)l1l1I1III1l.BorderSizePixel = 0 l1l1I1III1l.Size = UDim2.fromScale(1, 1)l1l1I1III1l.ZIndex = 184 l1l1I1III1l.Font = lIllllIlI1I.Primary and Enum.Font.GothamBold or Enum.Font.GothamMedium l1l1I1III1l.Text = lIllllIlI1I.Text l1l1I1III1l.TextColor3 = Color3.fromRGB(255, 255, 255)l1l1I1III1l.TextSize = 12 l1l1I1III1l.TextTransparency = 1 local lIll1Ill1Il = Neverlose:CreateInput(llIIl11lI1I, ( function ()
                local l11I1111ll1 = lIllllIlI1I.ReturnValue
                if l11I1111ll1 == nil then
                    l11I1111ll1 = lIllllIlI1I.Text
                end
                Neverlose:FireCallback(lIllllIlI1I.Callback, lIllllIlI1I.Text, l11I1111ll1)
                lllllll1I11:Close(l11I1111ll1)
            end
            ))
            Neverlose:AddSignal(lIll1Ill1Il.MouseEnter:Connect(( function ()
                Neverlose.PlayAnimate(llIIl11lI1I, TweenInfo0175, {
                    BackgroundTransparency = lIllllIlI1I.Primary and 0 or 0.080
                })
            end
            )))Neverlose:AddSignal(lIll1Ill1Il.MouseLeave:Connect(( function ()
                Neverlose.PlayAnimate(llIIl11lI1I, TweenInfo0175, {
                    BackgroundTransparency = lIllllIlI1I.Primary and 0.100 or 0.250
                })
            end
            )))Neverlose.PlayAnimate(llIIl11lI1I, TweenInfo0175, {
                BackgroundTransparency = lIllllIlI1I.Primary and 0.100 or 0.250
            })Neverlose.PlayAnimate(llIIlIIll1I, TweenInfo0175, {
                Transparency = lIllllIlI1I.Primary and 1 or 0.650
            })Neverlose.PlayAnimate(l1l1I1III1l, TweenInfo0175, {
                TextTransparency = 0
            })
        end
        Neverlose.PlayAnimate(IIl11IIIlll, TweenInfo0175, {
            BackgroundTransparency = 0.280
        })Neverlose.PlayAnimate(Ill1ll1l11I, TweenInfoQuint, {
            BackgroundTransparency = 0.025, Size = l1I1IlIIll1
        })Neverlose.PlayAnimate(ll1lIIIlll1, TweenInfo0175, {
            Transparency = 0.650
        })Neverlose.PlayAnimate(ll1l1I111Il, TweenInfo0175, {
            BackgroundTransparency = 0
        })Neverlose.PlayAnimate(lll11I1lI11, TweenInfo0175, {
            BackgroundTransparency = 0.820
        })Neverlose.PlayAnimate(lII1ll11III, TweenInfo0175, {
            Transparency = 0.350
        })Neverlose.PlayAnimate(l1l1Il11II1, TweenInfo0175, {
            ImageTransparency = 0
        })Neverlose.PlayAnimate(IIIl1l1IIl1, TweenInfo0175, {
            TextTransparency = 0
        })Neverlose.PlayAnimate(Ill1l1lI1lI, TweenInfo0175, {
            TextTransparency = 0.250
        })Neverlose.PlayAnimate(II1lI1l1Il1, TweenInfo0175, {
            BackgroundTransparency = 0.720
        })Ill1llIlllI:Render( true )
        return wrapCaseInsensitive(lllllll1I11)
    end
    function I1IlIl1l1I1:ProgressDialog(IIIlI1I11I1)
        IIIlI1I11I1 = Neverlose:ProcessParams(IIIlI1I11I1, {
            Title = "Progress", Content = "", Value = 0, Max = 100, Type = "%", Cancelable = false , CancelText = "Cancel", AutoClose = false , Callback = lIIlIlII11I,
        })
        local lllIIl1IllI = {
            Closed = false ,
        }
        local lll1Illll1I = Instance.new("Frame") local lllIIl1lIl1 = Instance.new("Frame") local lI111I11I1I = Instance.new("UICorner") local IlI1II1l11l = Instance.new("UIStroke") local IlIll1I111l = Instance.new("TextLabel") local IIlIIIll111 = Instance.new("TextLabel") local Il11I1lIIl1 = Instance.new("TextLabel") local lIlI1lIIlIl = Instance.new("Frame") local II1I11I1lll = Instance.new("UICorner") local II1Illl11l1 = Instance.new("Frame") local l11Ill1Il1I = Instance.new("UICorner") local IlIII1l11l1 = Instance.new("Frame") local Il1I11lII1l = Instance.new("UICorner") local Illll111lI1 = Instance.new("UIStroke") local lI1II11l1Il = Instance.new("TextLabel")lll1Illll1I.Name = Neverlose.RandomString()
        lll1Illll1I.Parent = Il1III11I1I lll1Illll1I.BackgroundColor3 = Color3.fromRGB(0, 0, 0)lll1Illll1I.BackgroundTransparency = 1 lll1Illll1I.BorderSizePixel = 0 lll1Illll1I.Size = UDim2.fromScale(1, 1)lll1Illll1I.ZIndex = 180 lll1Illll1I.Active = true lllIIl1lIl1.Name = Neverlose.RandomString()
        lllIIl1lIl1.Parent = lll1Illll1I lllIIl1lIl1.AnchorPoint = Vector2.new(0.5, 0.5)lllIIl1lIl1.BackgroundColor3 = Color3.fromRGB(20, 22, 27)lllIIl1lIl1.BackgroundTransparency = 1 lllIIl1lIl1.BorderSizePixel = 0 lllIIl1lIl1.ClipsDescendants = true lllIIl1lIl1.Position = UDim2.fromScale(0.5, 0.5)lllIIl1lIl1.Size = UDim2.new(0, 335, 0, IIIlI1I11I1.Cancelable and 150 or125)lllIIl1lIl1.ZIndex = 181 lI111I11I1I.CornerRadius = UDim.new(0, 10)lI111I11I1I.Parent = lllIIl1lIl1 IlI1II1l11l.Transparency = 1 IlI1II1l11l.Color = Color3.fromRGB(45, 48, 58)IlI1II1l11l.Parent = lllIIl1lIl1 local I111lI1III1 = Neverlose:CreateShadow(lllIIl1lIl1)
        IlIll1I111l.Name = Neverlose.RandomString()
        IlIll1I111l.Parent = lllIIl1lIl1 IlIll1I111l.BackgroundTransparency = 1 IlIll1I111l.BorderSizePixel = 0 IlIll1I111l.Position = UDim2.new(0, 18, 0, 15)IlIll1I111l.Size = UDim2.new(1, - 36, 0, 20)IlIll1I111l.ZIndex = 182 IlIll1I111l.Font = Enum.Font.GothamBold IlIll1I111l.Text = tostring(IIIlI1I11I1.Title)IlIll1I111l.TextColor3 = Color3.fromRGB(255, 255, 255)IlIll1I111l.TextSize = 15 IlIll1I111l.TextTransparency = 1 IlIll1I111l.TextXAlignment = Enum.TextXAlignment.Left Neverlose:AddTextGradient(IlIll1I111l)
        IIlIIIll111.Name = Neverlose.RandomString()
        IIlIIIll111.Parent = lllIIl1lIl1 IIlIIIll111.BackgroundTransparency = 1 IIlIIIll111.BorderSizePixel = 0 IIlIIIll111.Position = UDim2.new(0, 18, 0, 43)IIlIIIll111.Size = UDim2.new(1, - 36, 0, 32)IIlIIIll111.ZIndex = 182 IIlIIIll111.Font = Enum.Font.GothamMedium IIlIIIll111.Text = tostring(IIIlI1I11I1.Content)IIlIIIll111.TextColor3 = Color3.fromRGB(255, 255, 255)IIlIIIll111.TextSize = 13 IIlIIIll111.TextTransparency = 1 IIlIIIll111.TextWrapped = true IIlIIIll111.TextXAlignment = Enum.TextXAlignment.Left IIlIIIll111.TextYAlignment = Enum.TextYAlignment.Top Il11I1lIIl1.Name = Neverlose.RandomString()
        Il11I1lIIl1.Parent = lllIIl1lIl1 Il11I1lIIl1.BackgroundTransparency = 1 Il11I1lIIl1.BorderSizePixel = 0 Il11I1lIIl1.Position = UDim2.new(1, - 88, 0, 80)Il11I1lIIl1.Size = UDim2.new(0, 70, 0, 16)Il11I1lIIl1.ZIndex = 182 Il11I1lIIl1.Font = Enum.Font.GothamMedium Il11I1lIIl1.TextColor3 = Color3.fromRGB(255, 255, 255)Il11I1lIIl1.TextSize = 12 Il11I1lIIl1.TextTransparency = 1 Il11I1lIIl1.TextXAlignment = Enum.TextXAlignment.Right lIlI1lIIlIl.Name = Neverlose.RandomString()
        lIlI1lIIlIl.Parent = lllIIl1lIl1 lIlI1lIIlIl.BackgroundColor3 = Color3.fromRGB(26, 28, 36)lIlI1lIIlIl.BackgroundTransparency = 1 lIlI1lIIlIl.BorderSizePixel = 0 lIlI1lIIlIl.Position = UDim2.new(0, 18, 0, 84)lIlI1lIIlIl.Size = UDim2.new(1, - 112, 0, 9)lIlI1lIIlIl.ZIndex = 182 II1I11I1lll.CornerRadius = UDim.new(1, 0)II1I11I1lll.Parent = lIlI1lIIlIl II1Illl11l1.Name = Neverlose.RandomString()
        II1Illl11l1.Parent = lIlI1lIIlIl II1Illl11l1.BackgroundColor3 = Neverlose.AccentColor II1Illl11l1.BackgroundTransparency = 1 II1Illl11l1.BorderSizePixel = 0 II1Illl11l1.Size = UDim2.fromScale(0, 1)II1Illl11l1.ZIndex = 183 l11Ill1Il1I.CornerRadius = UDim.new(1, 0)l11Ill1Il1I.Parent = II1Illl11l1 IlIII1l11l1.Name = Neverlose.RandomString()
        IlIII1l11l1.Parent = lllIIl1lIl1 IlIII1l11l1.AnchorPoint = Vector2.new(1, 1)IlIII1l11l1.BackgroundColor3 = Color3.fromRGB(26, 28, 36)IlIII1l11l1.BackgroundTransparency = 1 IlIII1l11l1.BorderSizePixel = 0 IlIII1l11l1.ClipsDescendants = true IlIII1l11l1.Position = UDim2.new(1, - 14, 1, - 14)IlIII1l11l1.Size = UDim2.new(0, 86, 0, 28)IlIII1l11l1.Visible = IIIlI1I11I1.Cancelable == true IlIII1l11l1.ZIndex = 182 Il1I11lII1l.CornerRadius = UDim.new(0, 5)Il1I11lII1l.Parent = IlIII1l11l1 Illll111lI1.Transparency = 1 Illll111lI1.Color = Color3.fromRGB(45, 48, 58)Illll111lI1.Parent = IlIII1l11l1 lI1II11l1Il.Name = Neverlose.RandomString()
        lI1II11l1Il.Parent = IlIII1l11l1 lI1II11l1Il.BackgroundTransparency = 1 lI1II11l1Il.BorderSizePixel = 0 lI1II11l1Il.Size = UDim2.fromScale(1, 1)lI1II11l1Il.ZIndex = 183 lI1II11l1Il.Font = Enum.Font.GothamMedium lI1II11l1Il.Text = tostring(IIIlI1I11I1.CancelText)lI1II11l1Il.TextColor3 = Color3.fromRGB(255, 255, 255)lI1II11l1Il.TextSize = 12 lI1II11l1Il.TextTransparency = 1 local function I11I1l1lIl1()
            local ll11llIl1II = math.max(tonumber(IIIlI1I11I1.Max) or 1, 0.0001)
            local l1IIllI1l11 = math.clamp(tonumber(IIIlI1I11I1.Value) or 0, 0, ll11llIl1II)
            local l11I1I1I11I = l1IIllI1l11 / ll11llIl1II
            if IIIlI1I11I1.Type == "%" then
                Il11I1lIIl1.Text = tostring(Neverlose.Rounding(l11I1I1I11I * 100, 0)) .. "%"
            else
                Il11I1lIIl1.Text = tostring(Neverlose.Rounding(l1IIllI1l11, 2)) .. "/" .. tostring(Neverlose.Rounding(ll11llIl1II, 2)) .. tostring(IIIlI1I11I1.Type or "")
            end
            Neverlose.PlayAnimate(II1Illl11l1, TweenInfo0175, {
                Size = UDim2.fromScale(l11I1I1I11I, 1), BackgroundColor3 = Neverlose.AccentColor
            })
        end
        function lllIIl1IllI:Close(II1I1I1lIII)
            if lllIIl1IllI.Closed then
                return II1I1I1lIII
            end
            lllIIl1IllI.Closed = true
            Neverlose.PlayAnimate(lll1Illll1I, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(lllIIl1lIl1, TweenInfo0175, {
                BackgroundTransparency = 1, Size = UDim2.new(0, 335, 0, IIIlI1I11I1.Cancelable and 150 or 125)
            })Neverlose.PlayAnimate(IlI1II1l11l, TweenInfo0175, {
                Transparency = 1
            })Neverlose.PlayAnimate(IlIll1I111l, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(IIlIIIll111, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(Il11I1lIIl1, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(lIlI1lIIlIl, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(II1Illl11l1, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(IlIII1l11l1, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(Illll111lI1, TweenInfo0175, {
                Transparency = 1
            })Neverlose.PlayAnimate(lI1II11l1Il, TweenInfo0175, {
                TextTransparency = 1
            })I111lI1III1:Render( false )
            task.delay(0.18, function ()
                lll1Illll1I:Destroy()
            end
            )
            Neverlose:FireCallback(IIIlI1I11I1.Callback, IIIlI1I11I1.Title, II1I1I1lIII)
            return II1I1I1lIII
        end
        function lllIIl1IllI:SetValue(IIlIlIIIIl1)
            IIIlI1I11I1.Value = tonumber(IIlIlIIIIl1) or IIIlI1I11I1.Value
            I11I1l1lIl1()
            if IIIlI1I11I1.AutoClose == true and (tonumber(IIIlI1I11I1.Value) or 0) >= (tonumber(IIIlI1I11I1.Max) or 100) then
                lllIIl1IllI:Close( true )
            end
            return lllIIl1IllI
        end
        function lllIIl1IllI:SetMax(ll1II11111I)
            IIIlI1I11I1.Max = tonumber(ll1II11111I) or IIIlI1I11I1.Max
            I11I1l1lIl1()
            return lllIIl1IllI
        end
        function lllIIl1IllI:SetContent(II1lIIlI1ll)
            IIIlI1I11I1.Content = tostring(II1lIIlI1ll or "")
            IIlIIIll111.Text = IIIlI1I11I1.Content
            return lllIIl1IllI
        end
        function lllIIl1IllI:SetTitle(lII1IIlll11)
            IIIlI1I11I1.Title = tostring(lII1IIlll11 or "")
            IlIll1I111l.Text = IIIlI1I11I1.Title
            return lllIIl1IllI
        end
        function lllIIl1IllI:SetType(I111lI1l1l1)
            IIIlI1I11I1.Type = tostring(I111lI1l1l1 or "")
            I11I1l1lIl1()
            return lllIIl1IllI
        end
        function lllIIl1IllI:GetValue()
            return IIIlI1I11I1.Value
        end
        if IIIlI1I11I1.Cancelable then
            local lI1lIIIIlll = Neverlose:CreateInput(IlIII1l11l1, ( function ()
                lllIIl1IllI:Close( false )
            end
            ))
            Neverlose:AddSignal(lI1lIIIIlll.MouseEnter:Connect(( function ()
                Neverlose.PlayAnimate(IlIII1l11l1, TweenInfo0175, {
                    BackgroundTransparency = 0.100
                })
            end
            )))Neverlose:AddSignal(lI1lIIIIlll.MouseLeave:Connect(( function ()
                Neverlose.PlayAnimate(IlIII1l11l1, TweenInfo0175, {
                    BackgroundTransparency = 0.250
                })
            end
            )))
        end
        I11I1l1lIl1()
        Neverlose.PlayAnimate(lll1Illll1I, TweenInfo0175, {
            BackgroundTransparency = 0.350
        })Neverlose.PlayAnimate(lllIIl1lIl1, TweenInfoQuint, {
            BackgroundTransparency = 0.035, Size = UDim2.new(0, 350, 0, IIIlI1I11I1.Cancelable and 165 or140)
        })Neverlose.PlayAnimate(IlI1II1l11l, TweenInfo0175, {
            Transparency = 0.650
        })Neverlose.PlayAnimate(IlIll1I111l, TweenInfo0175, {
            TextTransparency = 0
        })Neverlose.PlayAnimate(IIlIIIll111, TweenInfo0175, {
            TextTransparency = 0.250
        })Neverlose.PlayAnimate(Il11I1lIIl1, TweenInfo0175, {
            TextTransparency = 0.500
        })Neverlose.PlayAnimate(lIlI1lIIlIl, TweenInfo0175, {
            BackgroundTransparency = 0
        })Neverlose.PlayAnimate(II1Illl11l1, TweenInfo0175, {
            BackgroundTransparency = 0
        }) if IIIlI1I11I1.Cancelable then
            Neverlose.PlayAnimate(IlIII1l11l1, TweenInfo0175, {
                BackgroundTransparency = 0.250
            })Neverlose.PlayAnimate(Illll111lI1, TweenInfo0175, {
                Transparency = 0.650
            })Neverlose.PlayAnimate(lI1II11l1Il, TweenInfo0175, {
                TextTransparency = 0
            })
        end
        I111lI1III1:Render( true )
        return wrapCaseInsensitive(lllIIl1IllI)
    end
    I1IlIl1l1I1:SetAccount()
    Neverlose:AddSignal(UserInputService.InputBegan:Connect(( function (IIlI11l1llI, I1l11ll1lll)
        if IIlI11l1llI.KeyCode == I1IlIl1l1I1.Keybind or IIlI11l1llI.KeyCode.Name == I1IlIl1l1I1.Keybind then
            if not I1l11ll1lll then
                I1IlIl1l1I1:ToggleInterface()
            end
        end
    end
    )))
    function I1IlIl1l1I1:ToggleInterface()
        if I1IlIl1l1I1.Destroyed or I1IlIl1l1I1.Minimizing then
            return
        end
        I1IlIl1l1I1.Signal:SetValue( not I1IlIl1l1I1.Signal:GetValue())
        if I1IlIl1l1I1.__3DRender then
            I1IlIl1l1I1.Load3DBlock()
        end
    end
    function I1IlIl1l1I1:SetFont(IIllIlIlll1)
        I1IlIl1l1I1.Font = IIllIlIlll1
        return Neverlose:SetFont(IIllIlIlll1)
    end
    function I1IlIl1l1I1:Destroy()
        if I1IlIl1l1I1.Destroyed then
            return
        end
        I1IlIl1l1I1.Destroyed = true
        I1IlIl1l1I1.Signal:SetValue( false )
        for II1IllI1Ill, II1lllI1Ill in ipairs(I1IlIl1l1I1.OnDestroyCallbacks) do
            Neverlose:FireCallback(II1lllI1Ill, "OnDestroy", I1IlIl1l1I1)
        end
        if Neverlose.ActiveWindow == I1IlIl1l1I1 then
            Neverlose.ActiveWindow = nil
        end
        task.delay(0.2, function ()
            if I1IlIl1l1I1._MenuIcon and I1IlIl1l1I1._MenuIcon.Root then
                I1IlIl1l1I1._MenuIcon.Root:Destroy()
            end
            if I1IlIl1l1I1.SurfaceGui then
                I1IlIl1l1I1.SurfaceGui:Destroy()
            end
            Il1III11I1I:Destroy()
        end
        )
    end
    Neverlose.ActiveWindow = I1IlIl1l1I1
    function I1IlIl1l1I1:Watermark(Il1lIl1IIlI)
        if typeof(Il1lIl1IIlI) == "table" then
            local ll1Il1l1111 = Neverlose.__WatermarkCache or I1IlIl1l1I1:Watermark()
            return ll1Il1l1111:AddBlock(Il1lIl1IIlI.Icon or Il1lIl1IIlI.IconName or "", Il1lIl1IIlI.Name or Il1lIl1IIlI.Title or "Watermark")
        end
        if Neverlose.__WatermarkCache then
            return Neverlose.__WatermarkCache
        end
        local lIIII1IlIlI ={}
        local IlI1I1llIll = Instance.new("Frame") local l11lIIl1ll1 = Instance.new("UICorner") local llIIl1111Il = Instance.new("UIListLayout") local I1lIIl1lIII = Neverlose:CreateShadow(IlI1I1llIll)
        IlI1I1llIll.Name = Neverlose.RandomString()
        IlI1I1llIll.Parent = Neverlose.ScreenGui IlI1I1llIll.AnchorPoint = Vector2.new(1, 0)IlI1I1llIll.BackgroundColor3 = Color3.fromRGB(8, 8, 13)IlI1I1llIll.BackgroundTransparency = 0.200 IlI1I1llIll.BorderColor3 = Color3.fromRGB(0, 0, 0)IlI1I1llIll.BorderSizePixel = 0 IlI1I1llIll.ClipsDescendants = true IlI1I1llIll.Active = true IlI1I1llIll.Position = UDim2.new(1, - 10, 0, 10)IlI1I1llIll.Size = UDim2.new(0, 120, 0, 30)IlI1I1llIll.ZIndex = 16 l11lIIl1ll1.CornerRadius = UDim.new(0, 25)l11lIIl1ll1.Parent = IlI1I1llIll llIIl1111Il.Parent = IlI1I1llIll llIIl1111Il.FillDirection = Enum.FillDirection.Horizontal llIIl1111Il.SortOrder = Enum.SortOrder.LayoutOrder llIIl1111Il.HorizontalAlignment = Enum.HorizontalAlignment.Right local ll11I1llIII = Instance.new("Frame")
        ll11I1llIII.Size = UDim2.fromOffset(15, 0)
        ll11I1llIII.BackgroundTransparency = 1
        ll11I1llIII.Parent = IlI1I1llIll
        ll11I1llIII.LayoutOrder = 5
        IlI1I1llIll:GetPropertyChangedSignal("BackgroundTransparency"):Connect(( function ()
            if IlI1I1llIll.BackgroundTransparency > 0.9 then
                IlI1I1llIll.Visible = false
                IlI1I1llIll.Parent = nil
            else
                IlI1I1llIll.Parent = Neverlose.ScreenGui IlI1I1llIll.Visible = true
            end
        end
        ))
        llIIl1111Il:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(( function ()
            Neverlose.PlayAnimate(IlI1I1llIll, TweenInfo0175, {
                Size = UDim2.new(0, llIIl1111Il.AbsoluteContentSize.X + 5, 0, 30)
            })
        end
        ))
        Neverlose.__WatermarkCache = lIIII1IlIlI
        I1lIIl1lIII:Render( true )
        lIIII1IlIlI.Renders ={}
        lIIII1IlIlI.Status = true
        function lIIII1IlIlI:SetRender(lll1llIll1l)
            lIIII1IlIlI.Status = lll1llIll1l
            if lll1llIll1l then
                Neverlose.PlayAnimate(IlI1I1llIll, TweenInfo0175, {
                    BackgroundTransparency = 0.200
                })I1lIIl1lIII:Render( true )
                for l11IllIl1ll, IIIllll111I in next, lIIII1IlIlI.Renders do
                    pcall(IIIllll111I, true )
                end
            else
                Neverlose.PlayAnimate(IlI1I1llIll, TweenInfo0175, {
                    BackgroundTransparency = 1
                })I1lIIl1lIII:Render( false )
                for ll1l1l1l1Il, lllIl111lIl in next, lIIII1IlIlI.Renders do
                    pcall(lllIl111lIl, false )
                end
            end
        end
        function lIIII1IlIlI:AddBlock(llIl1ll1l1I, ll1IIIllII1)
            local l11IIIllIlI ={}
            local lll1llI11l1 = Instance.new("Frame") local l11l1Illl11 = Instance.new("TextLabel") local lllll1l1IIl = Instance.new("ImageLabel")lll1llI11l1.Parent = IlI1I1llIll lll1llI11l1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)lll1llI11l1.BackgroundTransparency = 1.000 lll1llI11l1.BorderColor3 = Color3.fromRGB(0, 0, 0)lll1llI11l1.BorderSizePixel = 0 lll1llI11l1.Active = true lll1llI11l1.Size = UDim2.new(0, 50, 0, 30)lll1llI11l1.ZIndex = 17 l11l1Illl11.Name = Neverlose.RandomString()
            l11l1Illl11.Parent = lll1llI11l1 l11l1Illl11.AnchorPoint = Vector2.new(0, 0.5)l11l1Illl11.BackgroundColor3 = Color3.fromRGB(186, 186, 186)l11l1Illl11.BackgroundTransparency = 1.000 l11l1Illl11.BorderColor3 = Color3.fromRGB(0, 0, 0)l11l1Illl11.BorderSizePixel = 0 l11l1Illl11.Position = UDim2.new(0, 35, 0.5, 0)l11l1Illl11.Size = UDim2.new(0, 1, 0, 25)l11l1Illl11.ZIndex = 17 l11l1Illl11.Font = Enum.Font.GothamBold l11l1Illl11.Text = ll1IIIllII1 l11l1Illl11.TextColor3 = Color3.fromRGB(186, 186, 186)l11l1Illl11.TextSize = 15.000 l11l1Illl11.TextTransparency = 0.200 l11l1Illl11.TextXAlignment = Enum.TextXAlignment.Left Neverlose:AddTextGradient(l11l1Illl11)
            lllll1l1IIl.Name = Neverlose.RandomString()
            lllll1l1IIl.Parent = lll1llI11l1 lllll1l1IIl.AnchorPoint = Vector2.new(0, 0.5)lllll1l1IIl.BackgroundColor3 = Color3.fromRGB(186, 186, 186)lllll1l1IIl.BackgroundTransparency = 1.000 lllll1l1IIl.BorderColor3 = Color3.fromRGB(0, 0, 0)lllll1l1IIl.BorderSizePixel = 0 lllll1l1IIl.Position = UDim2.new(0, 10, 0.5, 0)lllll1l1IIl.Size = UDim2.new(0, 20, 0, 20)lllll1l1IIl.ZIndex = 17 Neverlose:SetIconMode(lllll1l1IIl, llIl1ll1l1I)lllll1l1IIl.ImageColor3 = Neverlose.AccentColor lllll1l1IIl.ImageTransparency = 0.250 lllll1l1IIl.ScaleType = Enum.ScaleType.Fit l11IIIllIlI.Update = ( function (l1111l11III)
                local I1lII1lll1l = TextService:GetTextSize(l11l1Illl11.Text, l11l1Illl11.TextSize, l11l1Illl11.Font, Vector2.new(math.huge, math.huge)) if l11IIIllIlI.Visible then
                    Neverlose.PlayAnimate(lll1llI11l1, TweenInfoQuint, {
                        Size = UDim2.new(0, I1lII1lll1l.X + 35, 0, 30)
                    })
                else
                    Neverlose.PlayAnimate(lll1llI11l1, TweenInfoQuint, {
                        Size = UDim2.new(0, 0, 0, 30)
                    })
                end
            end
            )
            l11IIIllIlI.Visible = true
            l11IIIllIlI.Update()
            function l11IIIllIlI:SetVisible(I1Illl111lI)
                l11IIIllIlI.Visible = I1Illl111lI
                if lIIII1IlIlI.Status then
                    l11IIIllIlI.SetRender(I1Illl111lI)
                end
                l11IIIllIlI.Update()
            end
            l11IIIllIlI.SetRender = ( function (Il11IIlIll1)
                if Il11IIlIll1 and l11IIIllIlI.Visible then
                    Neverlose.PlayAnimate(l11l1Illl11, TweenInfo0175, {
                        TextTransparency = 0.200
                    })Neverlose.PlayAnimate(lllll1l1IIl, TweenInfo0175, {
                        TextTransparency = 0.250
                    })
                else
                    Neverlose.PlayAnimate(l11l1Illl11, TweenInfo0175, {
                        TextTransparency = 1
                    })Neverlose.PlayAnimate(lllll1l1IIl, TweenInfo0175, {
                        TextTransparency = 1
                    })
                end
            end
            )
            table.insert(lIIII1IlIlI.Renders, l11IIIllIlI.SetRender)
            function l11IIIllIlI:SetText(lIIlIl1ll11)
                l11l1Illl11.Text = lIIlIl1ll11
                l11IIIllIlI.Update()
            end
            function l11IIIllIlI:Input(llI1Il1III1)
                local ll1lI111IIl = llI1Il1III1 or function ()
                    Neverlose:FireKeybind()
                end
                local lIIIIIIlIll, llI1I1I1I1I = Neverlose:CreateInput(lll1llI11l1, ll1lI111IIl)
                lIIIIIIlIll.Active = true
                lIIIIIIlIll.ZIndex = lll1llI11l1.ZIndex + 10
                return llI1I1I1I1I
            end
            return wrapCaseInsensitive(l11IIIllIlI)
        end
        return wrapCaseInsensitive(lIIII1IlIlI)
    end
    I1IlIl1l1I1:SetRender( false )
    function I1IlIl1l1I1:_RegisterMenuIconSettings(llI11lI1II1)
        if not llI11lI1II1 or I1IlIl1l1I1._MenuIconSettingsRegistered then
            return
        end
        I1IlIl1l1I1._MenuIconSettingsRegistered = true
        I1IlIl1l1I1.UserSettings:AddLabel("Icon Size"):AddSlider({
            Min = 32, Max = 96, Default = llI11lI1II1._size, Rounding = 0, Type = "px", Size = 100, Callback = function (llllI11llll)
                if I1IlIl1l1I1._MenuIcon then
                    I1IlIl1l1I1._MenuIcon:SetSize(llllI11llll)
                end
            end
            ,
        })
        I1IlIl1l1I1.UserSettings:AddLabel("Icon Draggable"):AddToggle({
            Default = llI11lI1II1._draggable, Callback = function (lll11lll111)
                if I1IlIl1l1I1._MenuIcon then
                    I1IlIl1l1I1._MenuIcon:SetDraggable(lll11lll111)
                end
            end
            ,
        })
    end
    local I11lIIIlIIl = I1IlIl1l1I1.ToggleInterface
    function I1IlIl1l1I1:ToggleInterface()
        if I1IlIl1l1I1.Destroyed or I1IlIl1l1I1.KeyGateActive then
            return
        end
        if I1IlIl1l1I1.Minimizing then
            if os.clock() - (I1IlIl1l1I1._MinimizeStart or 0) < 1.2 then
                I1IlIl1l1I1._PendingToggle = true
                return
            end
            I1IlIl1l1I1.Minimizing = false
        end
        pcall( function ()
            I1IlIl1l1I1:_SyncMinimizeState()
        end
        )
        if I1IlIl1l1I1.Signal:GetValue() and I1IlIl1l1I1:_IsShrunk() then
            I1IlIl1l1I1:_ForceRestore()
            return
        end
        if I1IlIl1l1I1.Signal:GetValue() and I1IlIl1l1I1._MenuIcon and I1IlIl1l1I1._MenuIcon.Root and I1IlIl1l1I1._MenuIcon.Root.Parent and not I1IlIl1l1I1.__3DRender then
            I1IlIl1l1I1:Minimize()
            return
        end
        if not I1IlIl1l1I1.Signal:GetValue() then
            I1IlIl1l1I1.Minimized = false
        end
        I11lIIIlIIl(self)
        if I1IlIl1l1I1.Signal:GetValue() then
            I1IlIl1l1I1.Minimized = false
            task.delay(0.15, function ()
                if not I1IlIl1l1I1.Destroyed and I1IlIl1l1I1.Signal:GetValue() and not I1IlIl1l1I1.__3DRender and not I1IlIl1l1I1.Minimizing and I1IlIl1l1I1.Root and I1IlIl1l1I1.Root.BackgroundTransparency > 0.9 then
                    I1IlIl1l1I1:SetRender( true )
                end
            end
            )
        end
        if I1IlIl1l1I1._MenuIcon then
            I1IlIl1l1I1._MenuIcon:OnWindowToggle(I1IlIl1l1I1.Signal:GetValue())
        end
    end
    function I1IlIl1l1I1:AttachMenuIcon(lIl11II11l1)
        if I1IlIl1l1I1._AutoMenuIcon and I1IlIl1l1I1._AutoMenuIcon ~= lIl11II11l1 then
            local l11Il11lIl1 = I1IlIl1l1I1._AutoMenuIcon
            I1IlIl1l1I1._AutoMenuIcon = nil
            pcall( function ()
                l11Il11lIl1:Destroy()
            end
            )
        end
        I1IlIl1l1I1._MenuIcon = lIl11II11l1
        lIl11II11l1._Owner = I1IlIl1l1I1
        I1IlIl1l1I1:_RegisterMenuIconSettings(lIl11II11l1)
        if I1IlIl1l1I1._MenuIconSignal then
            pcall( function ()
                I1IlIl1l1I1._MenuIconSignal:Disconnect()
            end
            )
            I1IlIl1l1I1._MenuIconSignal = nil
        end
        if lIl11II11l1.AutoHide then
            local lIl11I1IIII = I1IlIl1l1I1.Signal:GetValue() or ( not I1IlIl1l1I1.KeyGateActive and not I1IlIl1l1I1.ConfigSaveWindowState and (os.clock() - (I1IlIl1l1I1._CreatedAt or 0)) < 3)
            lIl11II11l1:SetVisible( not lIl11I1IIII)
            I1IlIl1l1I1._MenuIconSignal = I1IlIl1l1I1.Signal:Connect( function (I1111l1IlIl)
                if I1IlIl1l1I1.Destroyed or not I1IlIl1l1I1._MenuIcon then
                    return
                end
                I1IlIl1l1I1._MenuIcon:SetVisible( not I1111l1IlIl)
            end
            )
        else
            lIl11II11l1:SetVisible( true )
        end
    end
    function I1IlIl1l1I1:Notify(ll1IlII11l1)
        ll1IlII11l1 = ll1IlII11l1 or {}
        if ll1IlII11l1.Window == nil then
            ll1IlII11l1.Window = I1IlIl1l1I1
        end
        return Neverlose.Notifier.new(ll1IlII11l1)
    end
    function I1IlIl1l1I1:SetNotificationPosition(I1llI11IlII)
        return Neverlose.Notifier.SetPosition(I1llI11IlII)
    end
    function I1IlIl1l1I1:GetNotificationPosition()
        return Neverlose.Notifier.GetPosition()
    end
    function I1IlIl1l1I1:Request(IIIl1I1l1Il, lI11l1llIl1)
        return Neverlose.Http.Request(IIIl1I1l1Il, lI11l1llIl1)
    end
    function I1IlIl1l1I1:Webhook(lIllI1l11ll, IIIIlI1I11I, lII11IlII1I)
        return Neverlose.Http.Webhook(lIllI1l11ll, IIIIlI1I11I, lII11IlII1I)
    end
    I1IlIl1l1I1.Indicators = ( function (lI111Il11l1)
        local IIII1IIlI11 = Neverlose.Indicators.new(lI111Il11l1)
        IIII1IIlI11:SetRender( true )
        return IIII1IIlI11
    end
    )
    function I1IlIl1l1I1:Indicator(ll1IIllIl11)
        return I1IlIl1l1I1.Indicators(ll1IIllIl11)
    end
    if I1l1ll11l1l.ToggleButton ~= false and not I1IlIl1l1I1._MenuIcon then
        local lIlllIlIII1 ={}
        if type(I1l1ll11l1l.ToggleButton) == "table" then
            for II111II1l1l, l11IIllIIII in next, I1l1ll11l1l.ToggleButton do
                lIlllIlIII1[II111II1l1l] = l11IIllIIII
            end
        end
        if lIlllIlIII1.Image == nil then
            lIlllIlIII1.Image = I1l1ll11l1l.ToggleIcon or I1IlIl1l1I1.Icon or I1IlIl1l1I1.Logo
        end
        lIlllIlIII1.Auto = true
        local I11l1I1lI1l, lIlIl1lIl1l = pcall( function ()
            return Neverlose:CreateMenuIcon(lIlllIlIII1)
        end
        )
        if I11l1I1lI1l and lIlIl1lIl1l then
            I1IlIl1l1I1._AutoMenuIcon = lIlIl1lIl1l
            local III11lIIll1, I1l11Il1111 = pcall( function ()
                I1IlIl1l1I1:AttachMenuIcon(lIlIl1lIl1l)
            end
            )
            if not III11lIIll1 then
                I1IlIl1l1I1._MenuIcon = lIlIl1lIl1l
                warn("[NeverloseUI] Toggle button attach failed: " .. tostring(I1l11Il1111))
            end
        end
    end
    function I1IlIl1l1I1:SetKeySystem(Il1I1II11l1)
        Neverlose:SetKeySystem(Il1I1II11l1)
        return I1IlIl1l1I1
    end
    function I1IlIl1l1I1:VerifyKey(ll11IIl1lll)
        return Neverlose:VerifyKey(ll11IIl1lll)
    end
    function I1IlIl1l1I1:IsKeyVerified()
        return Neverlose:IsKeyVerified()
    end
    function I1IlIl1l1I1:ResetKey()
        Neverlose:ResetKey()
        return I1IlIl1l1I1
    end
    if I1IlIl1l1I1.KeyGateActive then
        if I1IlIl1l1I1._MenuIcon then
            pcall( function ()
                I1IlIl1l1I1._MenuIcon:SetVisible( false )
            end
            )
        end
        I1IlIl1l1I1.KeyGate = Neverlose:RunKeyGate(I1IlIl1l1I1, II1lIl1IIIl)
    end
    return wrapCaseInsensitive(I1IlIl1l1I1)
end

-- ====================================================================
-- [17] Notification Toast System
-- ====================================================================
function Neverlose:CreateNotification()
    if Neverlose.__Notification_Cache then
        return Neverlose.__Notification_Cache
    end
    local lIIl1IIIl1I ={}
    local IlI1IIlII1I = {
        TopRight = {
            Anchor = Vector2.new(1, 0), Position = UDim2.new(1, - 25, 0, 25), Horizontal = Enum.HorizontalAlignment.Right, Vertical = Enum.VerticalAlignment.Top, FrameAnchor = 1, Start = UDim2.new(0, 750, 0, 0),
        }, TopLeft = {
            Anchor = Vector2.new(0, 0), Position = UDim2.new(0, 25, 0, 25), Horizontal = Enum.HorizontalAlignment.Left, Vertical = Enum.VerticalAlignment.Top, FrameAnchor = 0, Start = UDim2.new(0, - 750, 0, 0),
        }, BottomRight = {
            Anchor = Vector2.new(1, 1), Position = UDim2.new(1, - 25, 1, - 25), Horizontal = Enum.HorizontalAlignment.Right, Vertical = Enum.VerticalAlignment.Bottom, FrameAnchor = 1, Start = UDim2.new(0, 750, 0, 0),
        }, BottomLeft = {
            Anchor = Vector2.new(0, 1), Position = UDim2.new(0, 25, 1, - 25), Horizontal = Enum.HorizontalAlignment.Left, Vertical = Enum.VerticalAlignment.Bottom, FrameAnchor = 0, Start = UDim2.new(0, - 750, 0, 0),
        }, TopCenter = {
            Anchor = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 0, 25), Horizontal = Enum.HorizontalAlignment.Center, Vertical = Enum.VerticalAlignment.Top, FrameAnchor = 0.5, Start = UDim2.new(0, 0, 0, - 140),
        },
    }
    local l11lll111II = {
        topright = "TopRight", righttop = "TopRight", topleft = "TopLeft", lefttop = "TopLeft", bottomright = "BottomRight", rightbottom = "BottomRight", bottomleft = "BottomLeft", leftbottom = "BottomLeft", topcenter = "TopCenter", top = "TopCenter", topmiddle = "TopCenter", topmid = "TopCenter", centertop = "TopCenter", middletop = "TopCenter",
    }
    local function I1llllIllIl(l11IlllIIIl)
        if type(l11IlllIIIl) ~= "string" then
            return nil
        end
        local l1I11111l11 = string.lower((string.gsub(l11IlllIIIl, "[^%a]", "")))
        return l11lll111II[l1I11111l11]
    end
    lIIl1IIIl1I.Positions = {
        "TopLeft", "TopCenter", "TopRight", "BottomLeft", "BottomRight"
    }
    lIIl1IIIl1I.NormalizePosition = I1llllIllIl
    lIIl1IIIl1I.Position = I1llllIllIl(Neverlose:GetUISetting("NotifyPosition")) or "TopRight"
    local Il1lII11lI1 ={}
    local lIlIIIlll1I ={}
    local function I1ll1III1I1(II1I1Il1l1I)
        local IIIIIIlII1l = lIlIIIlll1I[II1I1Il1l1I]
        if IIIIIIlII1l and IIIIIIlII1l.Parent then
            return IIIIIIlII1l
        end
        local lIl111I1lII = IlI1IIlII1I[II1I1Il1l1I]
        local IIIlI1lll1l = Instance.new("Frame")
        local l1l1I1IIlIl = Instance.new("UIListLayout")
        IIIlI1lll1l.Name = Neverlose.RandomString()
        IIIlI1lll1l.Parent = Neverlose.ScreenGui
        IIIlI1lll1l.AnchorPoint = lIl111I1lII.Anchor
        IIIlI1lll1l.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        IIIlI1lll1l.BackgroundTransparency = 1.000
        IIIlI1lll1l.BorderColor3 = Color3.fromRGB(0, 0, 0)
        IIIlI1lll1l.BorderSizePixel = 0
        IIIlI1lll1l.Position = lIl111I1lII.Position
        IIIlI1lll1l.Size = UDim2.new(0, 25, 0, 25)
        l1l1I1IIlIl.Parent = IIIlI1lll1l
        l1l1I1IIlIl.HorizontalAlignment = lIl111I1lII.Horizontal
        l1l1I1IIlIl.VerticalAlignment = lIl111I1lII.Vertical
        l1l1I1IIlIl.SortOrder = Enum.SortOrder.LayoutOrder
        l1l1I1IIlIl.Padding = UDim.new(0, 0)
        lIlIIIlll1I[II1I1Il1l1I] = IIIlI1lll1l
        return IIIlI1lll1l
    end
    function lIIl1IIIl1I.GetPosition()
        return lIIl1IIIl1I.Position
    end
    function lIIl1IIIl1I.SetPosition(Il1IlIlIlI1, IllI1l11Ill)
        local IlIII1I1I11 = I1llllIllIl(Il1IlIlIlI1)
        if not IlIII1I1I11 then
            return false
        end
        lIIl1IIIl1I.Position = IlIII1I1I11
        if IllI1l11Ill ~= false then
            Neverlose:SetUISetting("NotifyPosition", IlIII1I1I11)
        end
        for IllllIII1Il, l1Il111I11I in next, Il1lII11lI1 do
            pcall(l1Il111I11I, IlIII1I1I11)
        end
        return true
    end
    function lIIl1IIIl1I.OnPositionChanged(I1IlllIllI1)
        if type(I1IlllIllI1) == "function" then
            table.insert(Il1lII11lI1, I1IlllIllI1)
        end
    end
    Neverlose.__Notification_Cache = lIIl1IIIl1I
    function lIIl1IIIl1I.new(I11lIIl1ll1)
        I11lIIl1ll1 = I11lIIl1ll1 or {}
        local IIl1l11IlIl = I11lIIl1ll1.Icon
        do
            local lIIllIlI111 = I11lIIl1ll1.Window or Neverlose.ActiveWindow
            if I11lIIl1ll1.Logo == nil and I11lIIl1ll1.Image ~= nil then
                I11lIIl1ll1.Logo = I11lIIl1ll1.Image
            end
            if IIl1l11IlIl == nil and I11lIIl1ll1.Logo == nil and type(lIIllIlI111) == "table" then
                local lll1IllIlll = rawget(lIIllIlI111, "Icon")
                local l1llIII1l1l = rawget(lIIllIlI111, "Logo")
                if lll1IllIlll ~= nil and tostring(lll1IllIlll) ~= "" then
                    IIl1l11IlIl = lll1IllIlll
                elseif l1llIII1l1l ~= nil and tostring(l1llIII1l1l) ~= "" then
                    I11lIIl1ll1.Logo = l1llIII1l1l
                end
            end
        end
        I11lIIl1ll1 = Neverlose:ProcessParams(I11lIIl1ll1, {
            Title = "Notification", Content = "Hello World!", Logo = Neverlose.GlobalLogo or "rbxasset://textures/ui/VerifiedBadgeNameIcon.png", Icon = IIl1l11IlIl, Duration = 5,
        })
        local lI111IlIl1I = I11lIIl1ll1.Icon or I11lIIl1ll1.Logo
        local l1111lIIIIl = Neverlose:GetIconId(lI111IlIl1I)
        local III1lIl1l11 = l1111lIIIIl ~= ""
        local I111llI11lI = I1llllIllIl(I11lIIl1ll1.Position) or lIIl1IIIl1I.Position
        local lIIlI1l111I = IlI1IIlII1I[I111llI11lI]
        local lIIll1I1Ill = I1ll1III1I1(I111llI11lI)
        if Neverlose.__WatermarkCache and I111llI11lI == "TopRight" then
            Neverlose.PlayAnimate(lIIll1I1Ill, TweenInfo0175, {
                Position = UDim2.new(1, - 25, 0, 55)
            })
        end
        local lII1II1Il1l = Instance.new("Frame") local II1I1IlIIl1 = Instance.new("Frame") local l1l1lI11l1I = Instance.new("UICorner") local IIl1lI1IlII = Instance.new("UIStroke") local I1lI1I1I1II = Instance.new("ImageLabel") local l1l111lIIll = Instance.new("ImageLabel") local II1IlIl1lIl = Instance.new("UICorner") local I11lIIl1lII = Instance.new("TextLabel") local IlI111111Il = Instance.new("TextLabel")
        local IIIl1I1Il1I = Neverlose:CreateShadow(II1I1IlIIl1, true )
        lII1II1Il1l.Name = Neverlose.RandomString()
        lII1II1Il1l.Parent = lIIll1I1Ill lII1II1Il1l.BackgroundColor3 = Color3.fromRGB(255, 255, 255)lII1II1Il1l.BackgroundTransparency = 1.000 lII1II1Il1l.BorderColor3 = Color3.fromRGB(0, 0, 0)lII1II1Il1l.BorderSizePixel = 0 lII1II1Il1l.Size = UDim2.new(0, 0, 0, 100)II1I1IlIIl1.Name = Neverlose.RandomString()
        II1I1IlIIl1.Parent = lII1II1Il1l II1I1IlIIl1.AnchorPoint = Vector2.new(lIIlI1l111I.FrameAnchor, 0)II1I1IlIIl1.BackgroundColor3 = Color3.fromRGB(20, 22, 27)II1I1IlIIl1.BackgroundTransparency = 0.075 II1I1IlIIl1.BorderColor3 = Color3.fromRGB(0, 0, 0)II1I1IlIIl1.BorderSizePixel = 0 II1I1IlIIl1.ClipsDescendants = true II1I1IlIIl1.Position = lIIlI1l111I.Start II1I1IlIIl1.Size = UDim2.new(0, 220, 0, 55)II1I1IlIIl1.ZIndex = 130 l1l1lI11l1I.CornerRadius = UDim.new(0, 10)l1l1lI11l1I.Parent = II1I1IlIIl1 IIl1lI1IlII.Transparency = 0.650 IIl1lI1IlII.Color = Color3.fromRGB(45, 48, 58)IIl1lI1IlII.Parent = II1I1IlIIl1 I1lI1I1I1II.Name = Neverlose.RandomString()
        I1lI1I1I1II.Parent = II1I1IlIIl1 I1lI1I1I1II.AnchorPoint = Vector2.new(0, 0.5)I1lI1I1I1II.BackgroundColor3 = Color3.fromRGB(255, 255, 255)I1lI1I1I1II.BackgroundTransparency = 1.000 I1lI1I1I1II.BorderColor3 = Color3.fromRGB(0, 0, 0)I1lI1I1I1II.BorderSizePixel = 0 I1lI1I1I1II.Position = UDim2.new(0, 10, 0.5, 0)I1lI1I1I1II.Size = UDim2.new(0, 35, 0, 35)I1lI1I1I1II.ZIndex = 131 I1lI1I1I1II.Image = III1lIl1l11 and l1111lIIIIl or ""I1lI1I1I1II.ImageColor3 = Neverlose.IconColor
        I1lI1I1I1II.ImageTransparency = III1lIl1l11 and 0 or1II1IlIl1lIl.CornerRadius = UDim.new(0, 7)II1IlIl1lIl.Parent = I1lI1I1I1II l1l111lIIll.Name = Neverlose.RandomString()
        l1l111lIIll.Parent = II1I1IlIIl1 l1l111lIIll.AnchorPoint = Vector2.new(0, 0.5)l1l111lIIll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l1l111lIIll.BackgroundTransparency = 1.000 l1l111lIIll.BorderColor3 = Color3.fromRGB(0, 0, 0)l1l111lIIll.BorderSizePixel = 0 l1l111lIIll.Position = UDim2.new(0, 10, 0.5, 0)l1l111lIIll.Size = UDim2.new(0, 35, 0, 35)l1l111lIIll.ZIndex = 131 IIlllIIl1II:SetIconMode(l1l111lIIll, III1lIl1l11 and "" or tostring(lI111IlIl1I or "bell"))l1l111lIIll.ImageColor3 = Neverlose.IconColor l1l111lIIll.ImageTransparency = III1lIl1l11 and 1 or 0.150 l1l111lIIll.ScaleType = Enum.ScaleType.Fit I11lIIl1lII.Name = Neverlose.RandomString()
        I11lIIl1lII.Parent = II1I1IlIIl1 I11lIIl1lII.BackgroundColor3 = Color3.fromRGB(255, 255, 255)I11lIIl1lII.BackgroundTransparency = 1.000 I11lIIl1lII.BorderColor3 = Color3.fromRGB(0, 0, 0)I11lIIl1lII.BorderSizePixel = 0 I11lIIl1lII.Position = UDim2.new(0, 50, 0, 7)I11lIIl1lII.Size = UDim2.new(0, 200, 0, 20)I11lIIl1lII.ZIndex = 132 I11lIIl1lII.Font = Enum.Font.GothamBold I11lIIl1lII.Text = I11lIIl1ll1.Title I11lIIl1lII.TextColor3 = Color3.fromRGB(255, 255, 255)I11lIIl1lII.TextSize = 17.000 I11lIIl1lII.TextXAlignment = Enum.TextXAlignment.Left IlI111111Il.Name = Neverlose.RandomString()
        IlI111111Il.Parent = II1I1IlIIl1 IlI111111Il.BackgroundColor3 = Color3.fromRGB(255, 255, 255)IlI111111Il.BackgroundTransparency = 1.000 IlI111111Il.BorderColor3 = Color3.fromRGB(0, 0, 0)IlI111111Il.BorderSizePixel = 0 IlI111111Il.Position = UDim2.new(0, 50, 0, 28)IlI111111Il.Size = UDim2.new(0, 200, 0, 15)IlI111111Il.ZIndex = 132 IlI111111Il.Font = Enum.Font.GothamBold IlI111111Il.Text = I11lIIl1ll1.Content IlI111111Il.TextColor3 = Color3.fromRGB(255, 255, 255)IlI111111Il.TextSize = 12.000 IlI111111Il.TextTransparency = 0.650 IlI111111Il.TextXAlignment = Enum.TextXAlignment.Left local IlI1I1IIll1 = TextService:GetTextSize(I11lIIl1lII.Text, I11lIIl1lII.TextSize, I11lIIl1lII.Font, Vector2.new(math.huge, math.huge))
        local IIlIIl1l11I = TextService:GetTextSize(IlI111111Il.Text, IlI111111Il.TextSize, IlI111111Il.Font, Vector2.new(math.huge, math.huge))
        local IIlI1l1IIIl = math.max(IlI1I1IIll1.X, IIlIIl1l11I.X)
        II1I1IlIIl1.Size = UDim2.new(0, IIlI1l1IIIl + 65, 0, 55)
        IIIl1I1Il1I:Render( true )Neverlose.PlayAnimate(II1I1IlIIl1, TweenInfoQuint, {
            Position = UDim2.new(0, 0, 0, 0)
        })lII1II1Il1l.Size = UDim2.new(0, 0, 0, 65)task.delay(I11lIIl1ll1.Duration or 5, ( function ()
            if Neverlose.__WatermarkCache and I111llI11lI == "TopRight" then
                Neverlose.PlayAnimate(lIIll1I1Ill, TweenInfo0175, {
                    Position = UDim2.new(1, - 25, 0, 55)
                })
            end
            IIIl1I1Il1I:Render( false )Neverlose.PlayAnimate(II1I1IlIIl1, TweenInfo0175, {
                BackgroundTransparency = 1
            })Neverlose.PlayAnimate(IIl1lI1IlII, TweenInfo0175, {
                Transparency = 1
            })Neverlose.PlayAnimate(I1lI1I1I1II, TweenInfo0175, {
                ImageTransparency = 1
            })Neverlose.PlayAnimate(l1l111lIIll, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(I11lIIl1lII, TweenInfo0175, {
                TextTransparency = 1
            })Neverlose.PlayAnimate(IlI111111Il, TweenInfo0175, {
                TextTransparency = 1
            })task.wait(0.125)
            Neverlose.PlayAnimate(lII1II1Il1l, TweenInfo0175, {
                Size = UDim2.new(0, 0, 0, 0)
            })task.wait(0.125)
            lII1II1Il1l:Destroy()
        end
        ))
    end
    return lIIl1IIIl1I
end
function Neverlose:BuildNotificationPicker(IIIllIlII11, IllIIIlIllI, II11l11l1ll)
    local llllIllIl11 = Neverlose.Notifier
    local I1ll1Il1III = {
        {
            Name = "TopLeft", Label = "Top Left", X = 0.10, Y = 0.20
        }, {
            Name = "TopCenter", Label = "Top Center", X = 0.50, Y = 0.20
        }, {
            Name = "TopRight", Label = "Top Right", X = 0.90, Y = 0.20
        }, {
            Name = "BottomLeft", Label = "Bottom Left", X = 0.10, Y = 0.80
        }, {
            Name = "BottomRight", Label = "Bottom Right", X = 0.90, Y = 0.80
        },
    }
    local I1ll1ll11l1 = Instance.new("Frame")
    I1ll1ll11l1.Name = "NotificationTarget"
    I1ll1ll11l1.AnchorPoint = Vector2.new(0.5, 0)
    I1ll1ll11l1.Position = UDim2.new(0.5, 0, 0, 8)
    I1ll1ll11l1.Size = UDim2.new(0, 176, 0, 78)
    I1ll1ll11l1.BackgroundColor3 = Color3.fromRGB(8, 10, 14)
    I1ll1ll11l1.BorderSizePixel = 0
    I1ll1ll11l1.ZIndex = 2
    I1ll1ll11l1.Parent = IIIllIlII11
    local III11lI11l1 = Instance.new("UICorner")
    III11lI11l1.CornerRadius = UDim.new(0, 6)
    III11lI11l1.Parent = I1ll1ll11l1
    local IIIIIII1lIl = Instance.new("UIStroke")
    IIIIIII1lIl.Color = Color3.fromRGB(45, 48, 58)
    IIIIIII1lIl.Transparency = 0.4
    IIIIIII1lIl.Parent = I1ll1ll11l1
    local IIllIl11llI = Instance.new("Frame")
    IIllIl11llI.Name = "WindowShape"
    IIllIl11llI.AnchorPoint = Vector2.new(0.5, 0.5)
    IIllIl11llI.Position = UDim2.new(0.5, 0, 0.5, 0)
    IIllIl11llI.Size = UDim2.new(0.34, 0, 0.46, 0)
    IIllIl11llI.BackgroundColor3 = Color3.fromRGB(24, 27, 34)
    IIllIl11llI.BorderSizePixel = 0
    IIllIl11llI.ZIndex = 3
    IIllIl11llI.Parent = I1ll1ll11l1
    local I11111lI1lI = Instance.new("UICorner")
    I11111lI1lI.CornerRadius = UDim.new(0, 4)
    I11111lI1lI.Parent = IIllIl11llI
    local l1I1lllI11I = Instance.new("TextLabel")
    l1I1lllI11I.Name = "PositionName"
    l1I1lllI11I.AnchorPoint = Vector2.new(0.5, 0)
    l1I1lllI11I.Position = UDim2.new(0.5, 0, 0, 90)
    l1I1lllI11I.Size = UDim2.new(1, - 20, 0, 16)
    l1I1lllI11I.BackgroundTransparency = 1
    l1I1lllI11I.Font = Enum.Font.GothamBold
    l1I1lllI11I.TextSize = 12
    l1I1lllI11I.TextColor3 = Color3.fromRGB(255, 255, 255)
    l1I1lllI11I.TextTransparency = 0.25
    l1I1lllI11I.ZIndex = 2
    l1I1lllI11I.Parent = IIIllIlII11
    local I1llIl1Il1l ={}
    local function IllIl11III1()
        if not I1ll1ll11l1.Parent then
            return
        end
        local lIlI1lll111 = llllIllIl11.GetPosition()
        local lIIIII1IIll = Neverlose.AccentColor
        for llI11I1lI1l, lI1Il1l1IlI in ipairs(I1ll1Il1III) do
            local l111II11I1l = I1llIl1Il1l[lI1Il1l1IlI.Name]
            local Il1Ill111I1 = lI1Il1l1IlI.Name == lIlI1lll111
            l111II11I1l.BackgroundColor3 = Il1Ill111I1 and lIIIII1IIll or Color3.fromRGB(45, 48, 58)
            l111II11I1l.Size = Il1Ill111I1 and UDim2.fromOffset(20, 20) or UDim2.fromOffset(16, 16)
            l111II11I1l.UIStroke.Color = Il1Ill111I1 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(90, 94, 108)
            l111II11I1l.UIStroke.Transparency = Il1Ill111I1 and 0.1 or 0.5
            if Il1Ill111I1 then
                l1I1lllI11I.Text = lI1Il1l1IlI.Label
            end
        end
    end
    for lIIIIIll11l, IIlIlllIIIl in ipairs(I1ll1Il1III) do
        local II1lI11IlII = Instance.new("TextButton")
        II1lI11IlII.Name = IIlIlllIIIl.Name
        II1lI11IlII.AnchorPoint = Vector2.new(0.5, 0.5)
        II1lI11IlII.Position = UDim2.new(IIlIlllIIIl.X, 0, IIlIlllIIIl.Y, 0)
        II1lI11IlII.Size = UDim2.fromOffset(16, 16)
        II1lI11IlII.Text = ""
        II1lI11IlII.AutoButtonColor = false
        II1lI11IlII.BorderSizePixel = 0
        II1lI11IlII.ZIndex = 5
        II1lI11IlII.Parent = I1ll1ll11l1
        local l1lIlI1ll1I = Instance.new("UICorner")
        l1lIlI1ll1I.CornerRadius = UDim.new(1, 0)
        l1lIlI1ll1I.Parent = II1lI11IlII
        local I1I1IIIl11I = Instance.new("UIStroke")
        I1I1IIIl11I.Thickness = 2
        I1I1IIIl11I.Parent = II1lI11IlII
        I1llIl1Il1l[IIlIlllIIIl.Name] = II1lI11IlII
        II1lI11IlII.MouseButton1Click:Connect( function ()
            llllIllIl11.SetPosition(IIlIlllIIIl.Name)
            IllIl11III1()
            llllIllIl11.new({
                Title = "Notifications", Content = IIlIlllIIIl.Label, Duration = 2.5, Window = II11l11l1ll, Position = IIlIlllIIIl.Name,
            })
        end
        )
    end
    llllIllIl11.OnPositionChanged(IllIl11III1)
    Neverlose:OnThemeChanged(IllIl11III1)
    IllIl11III1()
end

-- ====================================================================
-- [18] On-Screen Event Logger
-- ====================================================================
function Neverlose:CreateLogger()
    if Neverlose.__LogSystem then
        return Neverlose.__LogSystem
    end
    local l1Il1l1I1ll ={}
    local lII1I11IlII = Instance.new("Frame") local IIlIllIl1II = Instance.new("UIListLayout")lII1I11IlII.Name = Neverlose.RandomString()
    lII1I11IlII.Parent = Neverlose.ScreenGui lII1I11IlII.BackgroundColor3 = Color3.fromRGB(255, 255, 255)lII1I11IlII.BackgroundTransparency = 1.000 lII1I11IlII.BorderColor3 = Color3.fromRGB(0, 0, 0)lII1I11IlII.BorderSizePixel = 0 lII1I11IlII.Position = UDim2.new(0, 25, 0, 5 + math.abs(Neverlose.ScreenGui.AbsolutePosition.Y))lII1I11IlII.Size = UDim2.new(0, 25, 0, 25)IIlIllIl1II.Parent = lII1I11IlII IIlIllIl1II.SortOrder = Enum.SortOrder.LayoutOrder IIlIllIl1II.Padding = UDim.new(0, 12)Neverlose.__LogSystem = l1Il1l1I1ll
    function l1Il1l1I1ll.new(lIIIIllI11l, l1I1Ill11lI, lII11Il11II)
        lII11Il11II = lII11Il11II or 3
        l1I1Ill11lI = l1I1Ill11lI or "Log"
        lIIIIllI11l = lIIIIllI11l or "crosshairs"
        local l1lIII11IlI = Instance.new("Frame") local IlIll1Ill1I = Instance.new("UICorner") local I1Il1111II1 = Instance.new("UIStroke") local l11I11lI1l1 = Instance.new("TextLabel") local llII1l1lIII = Instance.new("Frame") local lIIIIl111I1 = Instance.new("UICorner") local ll1l1ll1lll = Instance.new("ImageLabel") local Il1lIlIIII1 = Neverlose:CreateShadow(l1lIII11IlI, true )
        l1lIII11IlI.Name = Neverlose.RandomString()
        l1lIII11IlI.Parent = lII1I11IlII l1lIII11IlI.AnchorPoint = Vector2.new(0.5, 0)l1lIII11IlI.BackgroundColor3 = Color3.fromRGB(20, 22, 27)l1lIII11IlI.BackgroundTransparency = 1 l1lIII11IlI.BorderColor3 = Color3.fromRGB(0, 0, 0)l1lIII11IlI.BorderSizePixel = 0 l1lIII11IlI.ClipsDescendants = true l1lIII11IlI.Position = UDim2.new(0, 0, 0, 0)l1lIII11IlI.Size = UDim2.new(0, 0, 0, 20)l1lIII11IlI.ZIndex = 130 IlIll1Ill1I.CornerRadius = UDim.new(0, 4)IlIll1Ill1I.Parent = l1lIII11IlI I1Il1111II1.Transparency = 1 I1Il1111II1.Color = Color3.fromRGB(45, 48, 58)I1Il1111II1.Parent = l1lIII11IlI l11I11lI1l1.Name = Neverlose.RandomString()
        l11I11lI1l1.Parent = l1lIII11IlI l11I11lI1l1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)l11I11lI1l1.BackgroundTransparency = 1.000 l11I11lI1l1.BorderColor3 = Color3.fromRGB(0, 0, 0)l11I11lI1l1.BorderSizePixel = 0 l11I11lI1l1.Position = UDim2.new(0, 25, 0, 2)l11I11lI1l1.Size = UDim2.new(0, 200, 0, 15)l11I11lI1l1.ZIndex = 132 l11I11lI1l1.Font = Enum.Font.GothamBold l11I11lI1l1.Text = l1I1Ill11lI l11I11lI1l1.TextColor3 = Color3.fromRGB(255, 255, 255)l11I11lI1l1.TextSize = 12.000 l11I11lI1l1.TextTransparency = 1 l11I11lI1l1.TextXAlignment = Enum.TextXAlignment.Left llII1l1lIII.Name = Neverlose.RandomString()
        llII1l1lIII.Parent = l1lIII11IlI llII1l1lIII.AnchorPoint = Vector2.new(0, 0.5)llII1l1lIII.BackgroundColor3 = Neverlose.AccentColor llII1l1lIII.BorderColor3 = Color3.fromRGB(0, 0, 0)llII1l1lIII.BackgroundTransparency = 1 llII1l1lIII.BorderSizePixel = 0 llII1l1lIII.Position = UDim2.new(0, - 2, 0.5, 0)llII1l1lIII.Size = UDim2.new(0, 5, 1, 0)llII1l1lIII.ZIndex = 131 lIIIIl111I1.CornerRadius = UDim.new(0, 4)lIIIIl111I1.Parent = llII1l1lIII ll1l1ll1lll.Name = Neverlose.RandomString()
        ll1l1ll1lll.Parent = l1lIII11IlI ll1l1ll1lll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)ll1l1ll1lll.BackgroundTransparency = 1.000 ll1l1ll1lll.BorderColor3 = Color3.fromRGB(0, 0, 0)ll1l1ll1lll.BorderSizePixel = 0 ll1l1ll1lll.Position = UDim2.new(0, 7, 0, 3)ll1l1ll1lll.Size = UDim2.new(0, 15, 0, 15)ll1l1ll1lll.ZIndex = 133 IIlllIIl1II:SetIconMode(ll1l1ll1lll, lIIIIllI11l)ll1l1ll1lll.ImageColor3 = Color3.fromRGB(223, 223, 223)ll1l1ll1lll.ImageTransparency = 1 ll1l1ll1lll.ScaleType = Enum.ScaleType.Fit local l1I1111ll1l = TextService:GetTextSize(l11I11lI1l1.Text, l11I11lI1l1.TextSize, l11I11lI1l1.Font, Vector2.new(math.huge, math.huge))
        Neverlose.PlayAnimate(l1lIII11IlI, TweenInfo0175, {
            Size = UDim2.new(0, l1I1111ll1l.X + 35, 0, 20), BackgroundTransparency = 0.075
        })
        task.delay(0.15, ( function ()
            Il1lIlIIII1:Render( true )
            Neverlose.PlayAnimate(I1Il1111II1, TweenInfo0175, {
                Transparency = 0.650
            })
            Neverlose.PlayAnimate(l11I11lI1l1, TweenInfo0175, {
                TextTransparency = 0.25
            })
            Neverlose.PlayAnimate(llII1l1lIII, TweenInfo0175, {
                BackgroundTransparency = 0
            })
            Neverlose.PlayAnimate(ll1l1ll1lll, TweenInfo0175, {
                TextTransparency = 0.25
            })
            task.wait(lII11Il11II + 0.1)
            Il1lIlIIII1:Render( false )
            Neverlose.PlayAnimate(l1lIII11IlI, TweenInfo0175, {
                BackgroundTransparency = 1
            })
            Neverlose.PlayAnimate(I1Il1111II1, TweenInfo0175, {
                Transparency = 1
            })
            Neverlose.PlayAnimate(l11I11lI1l1, TweenInfo0175, {
                TextTransparency = 1
            })
            Neverlose.PlayAnimate(llII1l1lIII, TweenInfo0175, {
                BackgroundTransparency = 1
            })
            Neverlose.PlayAnimate(ll1l1ll1lll, TweenInfo0175, {
                TextTransparency = 1
            })
            task.wait(0.25)
            l1lIII11IlI:Destroy()
        end
        ))
    end
    return wrapCaseInsensitive(l1Il1l1I1ll)
end

-- ====================================================================
-- [19] Floating Status Indicators & Watermark
-- ====================================================================
function Neverlose:CreateIndicator()
    local lI1l1l1l1II = Instance.new("Frame") local l11lII1IIIl = Instance.new("UIListLayout")lI1l1l1l1II.Name = Neverlose.RandomString()
    lI1l1l1l1II.Parent = Neverlose.ScreenGui
    lI1l1l1l1II.AnchorPoint = Vector2.new(0, 0.5)lI1l1l1l1II.BackgroundColor3 = Color3.fromRGB(255, 255, 255)lI1l1l1l1II.BackgroundTransparency = 1.000 lI1l1l1l1II.BorderColor3 = Color3.fromRGB(0, 0, 0)lI1l1l1l1II.BorderSizePixel = 0 lI1l1l1l1II.Position = UDim2.new(0, 15, 0.5, 0)lI1l1l1l1II.Size = UDim2.new(0, 100, 0, 100)lI1l1l1l1II.ZIndex = 15 l11lII1IIIl.Parent = lI1l1l1l1II l11lII1IIIl.SortOrder = Enum.SortOrder.LayoutOrder l11lII1IIIl.Padding = UDim.new(0, 10) local I1Il1llI1l1 ={}
    I1Il1llI1l1.Color = {
        Red = Color3.fromRGB(255, 102, 105), Green = Color3.fromRGB(135, 255, 143), White = Color3.fromRGB(186, 186, 186),
    }
    I1Il1llI1l1.Root = lI1l1l1l1II
    function I1Il1llI1l1.new(llIl11lllII)
        llIl11lllII = Neverlose:ProcessParams(llIl11lllII, {
            Name = "Indicator", Icon = "crosshairs", Color = "Red",
        })
        local l11l1l1lIll = {
            CurrentColor = llIl11lllII.Color, Visible = false ,
        }
        local IIIlIIIlIIl = Instance.new("Frame") local III1lI11ll1 = Instance.new("UICorner") local I11llllIl1I = Instance.new("Frame") local IIIl11IIIl1 = Instance.new("UICorner") local Il11l111111 = Instance.new("UIGradient") local Il1l1llI1I1 = Instance.new("ImageLabel") local Ill1Il1111l = Instance.new("TextLabel") local lIll1I1IlI1 = Neverlose:CreateShadow(IIIlIIIlIIl)
        IIIlIIIlIIl.Name = Neverlose.RandomString()
        IIIlIIIlIIl.BackgroundColor3 = Color3.fromRGB(8, 8, 13)IIIlIIIlIIl.BackgroundTransparency = 1 IIIlIIIlIIl.BorderColor3 = Color3.fromRGB(0, 0, 0)IIIlIIIlIIl.BorderSizePixel = 0 IIIlIIIlIIl.ClipsDescendants = true IIIlIIIlIIl.Size = UDim2.new(0, 85, 0, 40)IIIlIIIlIIl.ZIndex = 16 IIIlIIIlIIl.Visible = false
        IIIlIIIlIIl:GetPropertyChangedSignal("BackgroundTransparency"):Connect(( function ()
            if IIIlIIIlIIl.BackgroundTransparency > 0.9 then
                IIIlIIIlIIl.Parent = nil
                IIIlIIIlIIl.Visible = false
            else
                IIIlIIIlIIl.Parent = lI1l1l1l1II
                IIIlIIIlIIl.Visible = true
            end
        end
        ))III1lI11ll1.CornerRadius = UDim.new(0, 25)III1lI11ll1.Parent = IIIlIIIlIIl I11llllIl1I.Name = Neverlose.RandomString()
        I11llllIl1I.Parent = IIIlIIIlIIl I11llllIl1I.AnchorPoint = Vector2.new(0, 0.5)I11llllIl1I.BackgroundColor3 = Color3.fromRGB(186, 186, 186)I11llllIl1I.BorderColor3 = Color3.fromRGB(0, 0, 0)I11llllIl1I.BorderSizePixel = 0 I11llllIl1I.Position = UDim2.new(0, 2, 0.5, 0)I11llllIl1I.BackgroundTransparency = 1
        I11llllIl1I.Size = UDim2.new(0, 3, 0.649999976, 0)I11llllIl1I.ZIndex = 17 IIIl11IIIl1.CornerRadius = UDim.new(0, 25)IIIl11IIIl1.Parent = I11llllIl1I Il11l111111.Rotation = 90 Il11l111111.Transparency = NumberSequence.new {
            NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)
        }
        Il11l111111.Parent = I11llllIl1I Il1l1llI1I1.Name = Neverlose.RandomString()
        Il1l1llI1I1.Parent = IIIlIIIlIIl Il1l1llI1I1.AnchorPoint = Vector2.new(0, 0.5)Il1l1llI1I1.BackgroundColor3 = Color3.fromRGB(186, 186, 186)Il1l1llI1I1.BackgroundTransparency = 1.000 Il1l1llI1I1.BorderColor3 = Color3.fromRGB(0, 0, 0)Il1l1llI1I1.BorderSizePixel = 0 Il1l1llI1I1.Position = UDim2.new(0, 10, 0.5, 0)Il1l1llI1I1.Size = UDim2.new(0, 25, 0, 25)Il1l1llI1I1.ZIndex = 17 IIlllIIl1II:SetIconMode(Il1l1llI1I1, llIl11lllII.Icon)Il1l1llI1I1.ImageColor3 = Color3.fromRGB(186, 186, 186)Il1l1llI1I1.ImageTransparency = 1 Il1l1llI1I1.ScaleType = Enum.ScaleType.Fit Ill1Il1111l.Name = Neverlose.RandomString()
        Ill1Il1111l.Parent = IIIlIIIlIIl Ill1Il1111l.AnchorPoint = Vector2.new(0, 0.5)Ill1Il1111l.BackgroundColor3 = Color3.fromRGB(186, 186, 186)Ill1Il1111l.BackgroundTransparency = 1.000 Ill1Il1111l.BorderColor3 = Color3.fromRGB(0, 0, 0)Ill1Il1111l.BorderSizePixel = 0 Ill1Il1111l.Position = UDim2.new(0, 40, 0.5, 0)Ill1Il1111l.Size = UDim2.new(1, - 40, 0, 25)Ill1Il1111l.ZIndex = 17 Ill1Il1111l.Font = Enum.Font.GothamBold Ill1Il1111l.Text = llIl11lllII.Name Ill1Il1111l.TextColor3 = Color3.fromRGB(186, 186, 186)Ill1Il1111l.TextSize = 20.000 Ill1Il1111l.TextTransparency = 1 Ill1Il1111l.TextXAlignment = Enum.TextXAlignment.Left l11l1l1lIll.Update = ( function ()
            local I1IlIllIIl1 = TextService:GetTextSize(Ill1Il1111l.Text, Ill1Il1111l.TextSize, Ill1Il1111l.Font, Vector2.new(math.huge, math.huge))
            Neverlose.PlayAnimate(IIIlIIIlIIl, TweenInfo0175, {
                Size = UDim2.new(0, I1IlIllIIl1.X + 60, 0, 40)
            })
        end
        )
        l11l1l1lIll.SetRender = ( function (l1Illlll1l1, lIl1IlIIIlI)
            l11l1l1lIll.Visible = lIl1IlIIIlI
            if lIl1IlIIIlI then
                Neverlose.PlayAnimate(IIIlIIIlIIl, TweenInfo0175, {
                    BackgroundTransparency = 0.200
                })
                Neverlose.PlayAnimate(I11llllIl1I, TweenInfo0175, {
                    BackgroundTransparency = 0, BackgroundColor3 = I1Il1llI1l1.Color[l11l1l1lIll.CurrentColor]
                })
                Neverlose.PlayAnimate(Il1l1llI1I1, TweenInfoQuint, {
                    TextTransparency = 0.250, TextColor3 = I1Il1llI1l1.Color[l11l1l1lIll.CurrentColor]
                })
                Neverlose.PlayAnimate(Ill1Il1111l, TweenInfoQuint, {
                    TextTransparency = 0.2, TextColor3 = I1Il1llI1l1.Color[l11l1l1lIll.CurrentColor]
                })
                lIll1I1IlI1:Render( true )
            else
                Neverlose.PlayAnimate(IIIlIIIlIIl, TweenInfo0175, {
                    BackgroundTransparency = 1
                })
                Neverlose.PlayAnimate(I11llllIl1I, TweenInfo0175, {
                    BackgroundTransparency = 1, BackgroundColor3 = I1Il1llI1l1.Color[l11l1l1lIll.CurrentColor]
                })
                Neverlose.PlayAnimate(Il1l1llI1I1, TweenInfoQuint, {
                    TextTransparency = 1, TextColor3 = I1Il1llI1l1.Color[l11l1l1lIll.CurrentColor]
                })
                Neverlose.PlayAnimate(Ill1Il1111l, TweenInfoQuint, {
                    TextTransparency = 1, TextColor3 = I1Il1llI1l1.Color[l11l1l1lIll.CurrentColor]
                })
                lIll1I1IlI1:Render( false )
            end
            l11l1l1lIll.Update()
        end
        )
        l11l1l1lIll.Update()
        l11l1l1lIll:SetRender( false )
        function l11l1l1lIll:SetColor(I1lI1lIllII)
            l11l1l1lIll.CurrentColor = I1lI1lIllII
            if l11l1l1lIll.Visible then
                l11l1l1lIll:SetRender( true )
            end
        end
        function l11l1l1lIll:SetText(IIIlIII11II)
            llIl11lllII.Name = IIIlIII11II
            Ill1Il1111l.Text = llIl11lllII.Name
            l11l1l1lIll.Update()
        end
        return wrapCaseInsensitive(l11l1l1lIll)
    end
    return wrapCaseInsensitive(I1Il1llI1l1)
end
Neverlose.Logging = Neverlose:CreateLogger()
Neverlose.Notifier = Neverlose:CreateNotification()
Neverlose.Indicators = Neverlose:CreateIndicator()
function Neverlose:Unload()
    if not Neverlose.UnloadEnabled then
        return
    end
    Neverlose.ScreenGui:Destroy()
    for IlIlIl1ll1l, Ill1I1II1l1 in next, Neverlose.GlobalSignals do
        pcall(Ill1I1II1l1.Disconnect, Ill1I1II1l1)
    end
end
function Neverlose:Window(IlII11llIll)
    return Neverlose:CreateWindow(IlII11llIll)
end
return wrapCaseInsensitive(Neverlose)