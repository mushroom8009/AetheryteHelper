--[[
-----2021/12/20----------
I don't support this module because I made it for myself.
This code is Frankenstein, so I'm sure there is a better code.
Please feel free to modify it.
-----2021/12/24----------
code like spaghetti is Organized 
but it's still tangled
chang whole GUI mechanism
maybe,made it easier to manage
!!!Merry Christmas!!!
-----2021/12/25----------
Add features and change UI
Create an explanation (guide)
-----2021/12/27---------
Added a drop-down list for WorldVisit.
However, it doesn't work because it hasn't been configured yet.
Geted home world and current world.
This information is not for showing, but is necessary for mechanic.
my great thanks to Madao & denvo for their help and advice.

--------------------------

mushroom#8009
]]

AetheryteHelper = {}

local kinokoProject = {
  Addon  = {
      Folder =        "AetheryteHelper",
      Name =          "Aetheryte Helper",
      Version =         "0.9.8",   
      VersionList = { "[0.9.0] - Pre Release",
                      "[0.9.1] - hot fix",
                      "[0.9.5] - Add tool・UIchange",
                      "[0.9.6] - Add tool・UIchange",
                      "[0.9.8] - Add UI",  

                    },
      
  },
--  ---------------
  HELP   = {
      entext =       { "・Auto select of DC\n・Saving settings\n・language switching\n\nlink:", }, 
      jptext =       { "・DCの自動選択\n・設定の保存\n・各項目のローカライズ\n\nlink:", },
      linkjp = [[https://github.com/mushroom8009/AutheryteHelper/wiki/Autheryte-Helper%E3%81%AE%E4%BD%BF%E3%81%84%E6%96%B9]],
      linken = [[https://github.com/mushroom8009/AutheryteHelper/wiki/How-to-use-%22-Autheryte-Helper-%22-in-minion]],
  },
--  ---------------
  Menu = {
    Main = {
      Name =          "kinoko",
      Icon =          "love_mushroom.png",
      Id =            "kinoko",
      Tab =           ffxiv_kinoko_Menu,
    },
    Sub = {
      Name =          "AetheryteHelper",
      Icon =          "AetheryteHelper.png",
      Id =            "AetheryteHelper",
      Tooltip =       "Open AetheryteHelper",
    },
  },
--  ---------------
  Minion = {
      Folder =        "LuaMods",
  },
--  ---------------
  Windows = {
    MainWindows = {
      Name =          "AetheryteHelper Main Windows",
      Open =          true,
      Option =        GUI.WindowFlags_ShowBorders 
                    + GUI.WindowFlags_AlwaysAutoResize
                    + GUI.WindowFlags_NoScrollbar,
      Visible =         false,
    },
  },
--  ---------------
  Update = {
      Pulse =         500,
      Timer =         0,
  },

}
-------------------
Links = {
      Name = "Minion Discord JP",
       link1 = [[https://discord.com/channels/127540472812929024/335225564803891210]],
       link2 = [[https://github.com/mushroom8009/AutheryteHelper/releases]],
      tooltip1 = "it's a hobby,\nso i don't know if it's possible,\nbut let me know if you have any requests.\n\n不具合とかあれば教えて下さい",
      tooltip2 = "Github link,\n\n更新確認はこちら",

}

-------------------------------------------------------------------------------------------------------------------------------------  
--wip
FFXIVDClist = { "------", "Elemental", "Gaia", "Mana", "Aether", "Primal", "Chaos", "Light", "Crystal" }
noDClist = { "sorry" }

FFXIVServerlist = {  
    [1] = { "------" },
    [2] = { "------", "Aegis", "Atomos", "Carbuncle", "Garuda", "Gungnir", "Kujata", "Ramuh", "Tonberry", "Typhon", "Unicorn" },
    [3] = { "------", "Alexander", "Bahamut", "Durandal", "Fenrir", "Ifrit", "Ridill", "Tiamat", "Ultima", "Valefor", "Yojimbo", "Zeromus" },
    [4] = { "------", "Anima", "Asura", "Belias", "Chocobo", "Hades", "Ixion", "Mandragora", "Pandaemonium", "Shinryu", "Titan", "Masamune" },
    [5] = { "------", "Adamantoise", "Cactuar", "Faerie", "Gilgamesh", "Jenova", "Midgardsormr", "Sargatanas", "Siren" },
    [6] = { "------", "Behemoth", "Excalibur", "Exodus", "Famfrit", "Hyperion", "Lamia", "Leviathan", "Ultros" },
    [7] = { "------", "Spriggan", "Cerberus", "Louisoix", "Moogle", "Omega", "Ragnarok" },
    [8] = { "------", "Twintania", "Lich", "Odin", "Phoenix", "Shiva", "Zodiark" },
    [9] = { "------", "Balmung", "Brynhildr", "Coeurl", "Diabolos", "Goblin", "Malboro", "Mateus", "Zalera" },
    [10] = { "not support region" },
  }

--DCID = { 1 = "Elemental", 2 = "Gaia", 3 = "Mana", 4 = "Aether", 5 = "Primal", 6 = "Chaos", 7 = "Light", 8 = "Crystal" }

WorldID = {
{id=1,Name="Unknown",DC="-"},{id=2,Name="Unknown",DC="-"},{id=3,Name="Unknown",DC="-"},{id=4,Name="Unknown",DC="-"},{id=5,Name="Unknown",DC="-"},{id=6,Name="Unknown",DC="-"},{id=7,Name="Unknown",DC="-"},{id=8,Name="Unknown",DC="-"},
{id=9,Name="Unknown",DC="-"},{id=10,Name="Unknown",DC="-"},{id=11,Name="Unknown",DC="-"},{id=12,Name="Unknown",DC="-"},{id=13,Name="Unknown",DC="-"},{id=14,Name="Unknown",DC="-"},{id=15,Name="Unknown",DC="-"},{id=16,Name="Unknown",DC="-"},
{id=17,Name="Unknown",DC="-"},{id=18,Name="Unknown",DC="-"},{id=19,Name="Unknown",DC="-"},{id=20,Name="Unknown",DC="-"},{id=21,Name="Unknown",DC="-"},{id=22,Name="Unknown",DC="-"},{id=23,Name="Asura",DC="Mana"},{id=24,Name="Belias",DC="Mana"},
{id=25,Name="Chaos",DC="-"},{id=26,Name="Hecatoncheir",DC="-"},{id=27,Name="Moomba",DC="-"},{id=28,Name="Pandaemonium",DC="Mana"},{id=29,Name="Shinryu",DC="Mana"},{id=30,Name="Unicorn",DC="Elemental"},{id=31,Name="Yojimbo",DC="Gaia"},
{id=32,Name="Zeromus",DC="Gaia"},{id=33,Name="Twintania",DC="Light"},{id=34,Name="Brynhildr",DC="Crystal"},{id=35,Name="Famfrit",DC="Primal"},{id=36,Name="Lich",DC="Light"},{id=37,Name="Mateus",DC="Crystal"},{id=38,Name="Shemhazai",DC="-"},
{id=39,Name="Omega",DC="Chaos"},{id=40,Name="Jenova",DC="Aether"},{id=41,Name="Zalera",DC="Crystal"},{id=42,Name="Zodiark",DC="Light"},{id=43,Name="Alexander",DC="Gaia"},{id=44,Name="Anima",DC="Mana"},{id=45,Name="Carbuncle",DC="Elemental"},
{id=46,Name="Fenrir",DC="Gaia"},{id=47,Name="Hades",DC="Mana"},{id=48,Name="Ixion",DC="Mana"},{id=49,Name="Kujata",DC="Elemental"},{id=50,Name="Typhon",DC="Elemental"},{id=51,Name="Ultima",DC="Gaia"},{id=52,Name="Valefor",DC="Gaia"},
{id=53,Name="Exodus",DC="Primal"},{id=54,Name="Faerie",DC="Aether"},{id=55,Name="Lamia",DC="Primal"},{id=56,Name="Phoenix",DC="Light"},{id=57,Name="Siren",DC="Aether"},{id=58,Name="Garuda",DC="Elemental"},{id=59,Name="Ifrit",DC="Gaia"},
{id=60,Name="Ramuh",DC="Elemental"},{id=61,Name="Titan",DC="Mana"},{id=62,Name="Diabolos",DC="Crystal"},{id=63,Name="Gilgamesh",DC="Aether"},{id=64,Name="Leviathan",DC="Primal"},{id=65,Name="Midgardsormr",DC="Aether"},
{id=66,Name="Odin",DC="Light"},{id=67,Name="Shiva",DC="Light"},{id=68,Name="Atomos",DC="Elemental"},{id=69,Name="Bahamut",DC="Gaia"},{id=70,Name="Chocobo",DC="Mana"},{id=71,Name="Moogle",DC="Chaos"},{id=72,Name="Tonberry",DC="Elemental"},
{id=73,Name="Adamantoise",DC="Aether"},{id=74,Name="Coeurl",DC="Crystal"},{id=75,Name="Malboro",DC="Crystal"},{id=76,Name="Tiamat",DC="Gaia"},{id=77,Name="Ultros",DC="Primal"},{id=78,Name="Behemoth",DC="Primal"},{id=79,Name="Cactuar",DC="Aether"},
{id=80,Name="Cerberus",DC="Chaos"},{id=81,Name="Goblin",DC="Crystal"},{id=82,Name="Mandragora",DC="Mana"},{id=83,Name="Louisoix",DC="Chaos"},{id=84,Name="Syldra",DC="-"},{id=85,Name="Spriggan",DC="Chaos"},{id=90,Name="Aegis",DC="Elemental"},
{id=91,Name="Balmung",DC="Crystal"},{id=92,Name="Durandal",DC="Gaia"},{id=93,Name="Excalibur",DC="Primal"},{id=94,Name="Gungnir",DC="Elemental"},{id=95,Name="Hyperion",DC="Primal"},{id=96,Name="Masamune",DC="Mana"},{id=97,Name="Ragnarok",DC="Chaos"},
{id=98,Name="Ridill",DC="Gaia"},{id=99,Name="Sargatanas",DC="Aether"}, 
}
-------------------------------------------------------------------------------------------------------------------------------------

-------------------
AetheryteHelper.GUI = {
  name = "AetheryteHelper###AetheryteHelper",
  open = false,
  visible = true,
  tabs = {
    [1] = {
      isselected = true,
      name = "[Main]"
    },
    [2] = {
      isselected = false,
      name = "[tools]"
    },
    [3] = {
      isselected = false,
      name = "[..wip..]"
    },
  },
  tabstyle = {
    selected = {r =.1, g = 1 , b =.1 , a = 1},
        hovered = {r =1, g = 1, b = 0, a = 1 },
        normal = {r = 1, g = 1, b = 1, a = 1},
  },
}


local gRegion = GetGameRegion()
local gstate = MGetGameState()
local language = GetGameLanguage()
--local uuid = GetUUID()

--local nowServer = 
---------------------------------------------------------------------------------------------------------------------------------------------------
-- maintool local
local selectins = false
local autooff = true
local isins = 4
local delay = 250
local WVaetheID = 0
local moveSVR = false
local isServer = 0
--local pmap = Player.localmapid
local modechg = 0
--local MoveServer = { 132, 129, 130 }
--local ploc = { 956, 957, 958, 959, 960, 961 }
local Update = kinokoProject.Update
local aetheID = 0
local delay = 200
----------------------------------------
--subtool local
local isMateriaEnabled = false
local isSalvageEnabled = false
local isPotionEnabled = false
local isManualEnabled = false
local lastUpdatePulse = 0
----------------------------------------
--wip local
local PTadd = false
local selectDC = 1
local selectSVR = 1
--local pldc = Player.homeworld
--local plcw = Player.currentworld
----------------------------------------

---------------------------------------------------------------------------------------------------------------------------------------------------
-- Fonction Menu MMOMinion 
function AetheryteHelper.Init()

  local Addon =     kinokoProject.Addon
  local Main =    kinokoProject.Menu.Main
  local Minion =    kinokoProject.Minion
  local Sub =     kinokoProject.Menu.Sub
  local Windows =   kinokoProject.Windows.MainWindows
  ----
  -- Menu
  if ffxiv_NotRelease_Menu == nil then
    local menuiconpath = GetStartupPath().. "\\"..Minion.Folder.."\\"..Addon.Folder.."\\image\\"..Main.Icon
    if FileExists(menuiconpath) then
      ffxiv_NotRelease_Menu = {
        ml_gui.ui_mgr:AddMember( { id = "FFXIV"..Main.Id.."##HEADER", expanded = false, name = Main.Name, texture = menuiconpath}, "FFXIVMINION##MENU_HEADER")
      }
    else
      d("["..Main.Name.."] - Main Menu - Icon Path Error")
      ffxiv_NotRelease_Menu = {
        ml_gui.ui_mgr:AddMember( { id = "FFXIV"..Main.Id.."##HEADER", expanded = false, name = Main.Name, texture = GetStartupPath().."\\GUI\\UI_Textures\\addon.png"}, "FFXIVMINION##MENU_HEADER")
      }
    end 
  end
  -- Sub Menu
  local iconpath = GetStartupPath().. "\\"..Minion.Folder.."\\"..Addon.Folder.."\\image\\"..Sub.Icon
  if FileExists(iconpath) then
    ml_gui.ui_mgr:AddSubMember( { id = "FFXIV"..Sub.Id.."##SubMenu", name = Sub.Name, onClick = function() Windows.Open = not Windows.Open end, tooltip = Sub.Tooltip, texture = iconpath}, "FFXIVMINION##MENU_HEADER", "FFXIV"..Main.Id.."##HEADER" )
  else
    d("["..Sub.Name.."] - Icon Path Error.")
    ml_gui.ui_mgr:AddSubMember( { id = "FFXIV"..Sub.Id.."##SubMenu", name = Sub.Name, onClick = function() Windows.Open = not Windows.Open end, tooltip = Sub.Tooltip}, "FFXIVMINION##MENU_HEADER", "FFXIV"..Main.Id.."##HEADER")
  end
end


---------------------------------------------------------------------------------------------------------------------------------------------------
-- 
function AetheryteHelper.ModuleInit()
  local Windows = kinokoProject.Windows.MainWindows
  ----
  local menuTab = {
    name = "Aetheryte Helper",
    openWindow = function () Windows.Open = true end,
    isOpen = function () return Windows.Open end
  }
  table.insert(ml_global_information.menu.windows,menutab)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
-- close
function AetheryteHelper.SwitchOpen()
  kinokoProject.Windows.MainWindows.Open = not kinokoProject.Windows.MainWindows.Open
end

---------------------------------------------------------------------------------------------------------------------------------------------------
-- tab
function AetheryteHelper.DrawTabs()
  local tabs = AetheryteHelper.GUI.tabs
  local tabstyle = AetheryteHelper.GUI.tabstyle

    if (ValidTable(tabs)) then
        GUI:PushStyleColor(GUI.Col_Button,0,0,0,0)
        GUI:PushStyleColor(GUI.Col_ButtonHovered,0,0,0,0)
        GUI:PushStyleColor(GUI.Col_ButtonActive,0,0,0,0)
        for i, tab in spairs(tabs) do
          if (i ~= 1) then
              GUI:SameLine()
          else
            GUI:SameLine()
          end
            tab.order = i
           if tab.isselected then
              GUI:PushStyleColor(GUI.Col_Text, tabstyle.selected.r, tabstyle.selected.g, tabstyle.selected.b, tabstyle.selected.a)
              elseif tab.ishovered then
              GUI:PushStyleColor(GUI.Col_Text, tabstyle.hovered.r, tabstyle.hovered.g, tabstyle.hovered.b, tabstyle.hovered.a)
              else
              GUI:PushStyleColor(GUI.Col_Text, tabstyle.normal.r, tabstyle.normal.g, tabstyle.normal.b, tabstyle.normal.a)
              end
              if (GUI:Button(tab.name,nil,70)) then
              for k,v in pairs(tabs) do v.isselected = false end
              tab.isselected = true
              end
              if GUI:IsItemHovered() then 
              tab.ishovered = true
              else
              tab.ishovered = false
              end
                
       GUI:PopStyleColor()
       GUI:SameLine()
       --GUI:Spacing() 
       end
       GUI:PopStyleColor(3)
       GUI:InvisibleButton(" ") -- break SameLine()
    end
end

---------------------------------------------------------------------------------------------------------------------------------------------------
-- main GUI
function AetheryteHelper.Drawinsselect()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Text("use MobHunt & Rare F.A.T.E")      
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        GUI:SetTooltip("--instance select--\nonly use EW area\n・Labyrinthos\n・Thavnair\n・Garlemald\n・Mare Lamentorum\n・Elpis\n・Ultima Thule\n--move server--\n・Gridania\n・Limsa\n・Uldah")
      end
  
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("##select_ins", selectins)
      GUI:SameLine(30)
      GUI:Text("Helper Enable")
      GUI:EndGroup()      
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          selectins = not selectins
          autheStep = 0
          if ( moveSVR == false ) then  modechg = 3 end 
        end       
         GUI:SetTooltip("on/off\nOnly possible in front of Aetheryte")
      end
      
      GUI:Spacing()
      
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("##AutoOffmode", autooff)
      GUI:SameLine(30)
      GUI:Text("option：only once")
      GUI:EndGroup()      
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          autooff = not autooff
          moveSVR = not moveSVR
          modechg = 3  
        end       
        GUI:SetTooltip("Auto off")
        end  
      
      GUI:Separator()    
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      local changed
        delay, changed = GUI:SliderInt("ms",delay,100,1000)
        if (GUI:IsItemHovered()) then
        GUI:SetTooltip("access delay\n100ms-1000ms")
        end
      GUI:EndGroup()
      --GUI:Spacing() 
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button( "Reset",40, 20)
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          delay = 200
          autheStep = 0
        end
        GUI:SetTooltip("delay RESET")
        end
      GUI:EndGroup()
      
      GUI:Separator()
      GUI:Spacing(10)
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button( "ins 1", 55, 20)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          isins = 1
          --if (selectins)then GetControl("SelectString"):Action("SelectIndex",1) end     
       end
      GUI:SetTooltip("go to instance1")
      end
      
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button( "ins 2", 55, 20)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
         isins = 2
        --if (selectins)then GetControl("SelectString"):Action("SelectIndex",2) end
        end
        GUI:SetTooltip("go to instance2")
      end
      
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button( "ins 3", 55, 20)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
         isins = 3
        --if (selectins)then GetControl("SelectString"):Action("SelectIndex",3) end
        end
        GUI:SetTooltip("go to instance3")
      end
      
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()      
      GUI:Button( "free", 55, 20)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
        isins = 0
       --if (selectins)then GetControl("SelectString"):Action("SelectIndex",0) end       
        end
        GUI:SetTooltip("auto select")
      end
end


function AetheryteHelper.DrawChangeServer()
      GUI:Separator()
      GUI:Separator()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()      
      GUI:Checkbox("##move_svr", moveSVR)
      GUI:SameLine()
      GUI:Text( "World Visit assist" )
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          moveSVR = not moveSVR
          autooff = not autooff
          --for i = 0,3,1 do 
          --if (pmap == MoveServer[i] ) then
          --     moveSVR = true
          --     else
          --      moveSVR = false 
          --    end
          --end
          if (moveSVR == true) then
            modechg = 2
            else
            modechg = 3 end
            autheStep = 0            
        end       
        GUI:SetTooltip("on/off\nWorld Visit Aetheryte")
        end       
      GUI:Separator()
      GUI:Spacing(10)
      GUI:BeginGroup()  
      GUI:Button("Gridania",80,20)
      GUI:EndGroup()
            if (GUI:IsItemHovered()) then
            if ((GUI:IsMouseClicked(0)) and ( Player.localmapid ~= 132)) then
              Player:Teleport(2,0)
              moveSVR = true
              autooff = false
              modechg = 2
            end
            GUI:SetTooltip("Teleport to Gridania")
            end
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button("Limsa",80,20)
      GUI:EndGroup()
            if (GUI:IsItemHovered()) then
            if ((GUI:IsMouseClicked(0)) and ( Player.localmapid ~= 129)) then
              Player:Teleport(8,0)
              moveSVR = true
              autooff = false
              modechg = 2
            end
            GUI:SetTooltip("Teleport to Limsa")
            end
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button("Uldah",80,20)
      GUI:EndGroup()
            if (GUI:IsItemHovered()) then
            if ((GUI:IsMouseClicked(0)) and ( Player.localmapid ~= 130)) then
              Player:Teleport(9,0)
              moveSVR = true
              autooff = false
              modechg = 2
            end
            GUI:SetTooltip("Teleport to Uldah")
            end
end

---------------------------------------------------------------------------------------------------------------------------------------------------
-- sub GUI

function AetheryteHelper.DrawadButton()
      GUI:Separator()
      GUI:Spacing(10)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Button("flag",40,20)
      GUI:EndGroup()
            if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
              SendTextCommand("/e <flag>")
              end
              GUI:SetTooltip("Send TextCommand in Game>> /e <flag>")              
            end     
end

function AetheryteHelper.Drawhelp(_entext)
  if GUI:TreeNode("Upcoming Features##AetheryteHelper") then
    for id, e in pairs(_entext) do
      GUI:Text(e)
      GUI:BeginGroup()
      GUI:TextColored( 1,1,0,1,"How to use  Autheryte Helper" )
      GUI:EndGroup()
      if GUI:IsItemClicked(0) then
            io.popen([[cmd /c start "" "]]..kinokoProject.HELP.linken..[["]]):close()
      end
    end
    GUI:Text("--------------------------------")
    GUI:TreePop()
  end
end

function AetheryteHelper.Drawhelp(_jptext)
  if GUI:TreeNode("今後の予定##AetheryteHelper") then
    for id, e in pairs(_jptext) do
      GUI:Text(e)
      GUI:BeginGroup()
      GUI:TextColored( 1,1,0,1,"Autheryte Helperの使い方" )
      GUI:EndGroup()
   if GUI:IsItemClicked(0) then
            io.popen([[cmd /c start "" "]]..kinokoProject.HELP.linkjp..[["]]):close()
      end

    end
    GUI:Text("--------------------------------")
    GUI:TreePop()
  end
end

function AetheryteHelper.DrawInside()
  if kinokoProject.Windows.MainWindows.Open == false then
        GUI:Text("--------------------------------")
  end 
  ----
  if language == 0 then
      AetheryteHelper.Drawhelp(kinokoProject.HELP.jptext)
      
  else
      AetheryteHelper.Drawhelp(kinokoProject.HELP.entext)
 
  ----  
  end
end


---------------------------------------------------------------------------------------------------------------------------------------------------
--materia UI
function AetheryteHelper.DrawSubtool(event, ticks)
      GUI:Spacing()      
      GUI:BeginGroup()
      GUI:Text("Materia Extract & Desynth\npowered by Rhakin#1093 // fix by mushroom")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          isMateriaEnabled = not isMateriaEnabled
        end
        GUI:SetTooltip("Materia Extract & Desynth")
        --GUI:SetTooltip("Automatic materia extraction out of combat of spiritbonded items")
      end

      GUI:Spacing()
      GUI:Separator()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("##Materia", isMateriaEnabled)
      GUI:SameLine()
      GUI:Text("Materia Extract")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          isMateriaEnabled = not isMateriaEnabled
        end
        GUI:SetTooltip("非戦闘状態で装備品からマテリアを錬精します")
        --GUI:SetTooltip("Automatic materia extraction out of combat of spiritbonded items")
      end
      
      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("##Desynth", isSalvageEnabled)
      GUI:SameLine()
      GUI:Text("Desynth equipment in Bag")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          isSalvageEnabled = not isSalvageEnabled
        end
        GUI:SetTooltip("インベントリの中の装備を分解\n警告:オンにするとインベントリ内の装備を全て分解します\nただし、IL1の装備は分解しません")
        --GUI:SetTooltip("Automatic desynthesis of equipment in inventory\nWARNING: once enabled, all items in inventory will be desynthesized, make sure you do not have any items in inventory that you want to keep")
      end
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("##Potion", isPotionEnabled)
      GUI:SameLine()
      GUI:Text("Spiritbond Potion")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          isPotionEnabled = not isPotionEnabled
        end
        GUI:SetTooltip("錬精薬の自動使用")
        --GUI:SetTooltip("Automatic usage of a spiritbond potion whenever it expires")
      end
      
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("##Manual", isManualEnabled)
      GUI:SameLine()      
      GUI:Text("Spiritbond Manual")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          isManualEnabled = not isManualEnabled
        end
        GUI:SetTooltip("スピリットマニュアルの自動使用")
        --分離
      end
 end
-------------------------------------------------------------------------------------------------------------------------------------------
----footer
function AetheryteHelper.Drawafooter()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Text("[")
      GUI:EndGroup()

      GUI:SameLine()
      GUI:BeginGroup()
      GUI:TextColored( 0.8,0.2,0.2,1,"Github")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
      if GUI:IsItemClicked(0) then
            io.popen([[cmd /c start "" "]]..Links.link2..[["]]):close()
      end
      GUI:SetTooltip(Links.tooltip2)
      end

      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Text("]")
      GUI:EndGroup()

      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Text("[")
      GUI:EndGroup()
      
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:TextColored( 0.2,0.8,0.8,1, "Discord")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
      if GUI:IsItemClicked(0) then
            io.popen([[cmd /c start "" "]]..Links.link1..[["]]):close()
      end
      GUI:SetTooltip(Links.tooltip1)
      end
      
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Text("]")
      GUI:EndGroup()
      GUI:SameLine()
  end
      
       
-------------------------------------------------------------------------------------------------------------------------------------------
----now DC
function AetheryteHelper.homeDC()
    GUI:BeginGroup()
    for k,v in pairs(WorldID) do   
       if (k == Player.homeworld) then local homeWorld = v 
          GUI:Text("Home：" ..tostring(homeWorld.Name).."["..tostring(homeWorld.DC).."]")
       end    
    end
    --GUI:SameLine()
    for k,v in pairs(WorldID) do
       if (k == Player.currentworld) then local NowWorld = v 
          GUI:Text("Now：" ..tostring(NowWorld.Name).."["..tostring(NowWorld.DC).."]")     
       end
    end
    GUI:EndGroup()
end
---------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------
-- list
function AetheryteHelper.DCSVselect()
     GUI:BeginGroup()
     GUI:PushItemWidth(180)
     GUI:Text("select server(World Visit)")
     if ( gRegion == 1) then
     selectDC = GUI:Combo( "DC", selectDC,FFXIVDClist,height or 20)
     if (table.valid(FFXIVServerlist[selectDC])) then
     selectSVR = GUI:Combo( "server",selectSVR,FFXIVServerlist[selectDC],height or 20) 
     --d("num:"selectSVR)
     end
     else
     GUI:Combo( "DC",1,noDClist,1)
     GUI:Combo( "server",10,FFXIVServerlist[10],1)
     end
     GUI:EndGroup()
end

-------------------------------------------------------------------------------------------------------------------------------------------
-- header & Drowcall

function AetheryteHelper.DrawCall(event, ticks)
  local Windows = kinokoProject.Windows.MainWindows
  local Addon = kinokoProject.Addon

 if (Windows.Open) then
    GUI:SetNextWindowSize(280,350,GUI.SetCond_FirstUseEver)
    Windows.Visible, Windows.Open = GUI:Begin(Addon.Name.." - "..Addon.Version.."##MainWindows_begin", Windows.Open, Windows.Option)
    if (Windows.Visible) then
      GUI:BeginGroup()
      GUI:Text("WoLdo"..":[")
      GUI:SameLine()
      GUI:TextColored(0.7,0.8,0.1,1,GetMapName(Player.localmapid))
      GUI:SameLine()
      GUI:Text("]:MAPID:"..tostring(Player.localmapid))
      GUI:EndGroup()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()

      GUI:BeginGroup()
      --GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()

      AetheryteHelper.DrawTabs()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()


      if (AetheryteHelper.GUI.tabs[1].isselected) then
      AetheryteHelper.Drawinsselect()
      AetheryteHelper.DrawChangeServer()
      AetheryteHelper.DrawadButton()
      
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()      
          
      AetheryteHelper.DCSVselect()   ---------------wip
      AetheryteHelper.homeDC()

      GUI:Separator()
      GUI:Spacing()
      AetheryteHelper.DrawInside()      

      elseif (AetheryteHelper.GUI.tabs[2].isselected) then
      AetheryteHelper.DrawSubtool()
  
      elseif (AetheryteHelper.GUI.tabs[3].isselected) then
      GUI:BeginGroup()
      GUI:Text("wip\nなんか思いついたらつくるための空き地")
      GUI:Spacing()
      GUI:Separator()
    ---------------------------------------------
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("##PTadd", PTadd)
      GUI:SameLine()
      GUI:Text("test")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          PTadd = not PTadd
        end
      end    
      GUI:EndGroup()
      end
-------------------------------------------------------------------------------------------------------------------------------------------
--close Button
      GUI:AlignFirstTextHeightToWidgets()
      GUI:Spacing(5)
      GUI:Separator()
      if GUI:Button("Close##"..Windows.Name,(GUI:GetWindowSize()), 40, 20) then
        Windows.Open = false
      end
      GUI:SameLine(60)
      GUI:BeginGroup()
      GUI:Text("v."..kinokoProject.Addon.Version)
      GUI:EndGroup()


      AetheryteHelper.Drawafooter()
-------------------------------------------------------------------------------------------------------------------------------------------
    end
    GUI:End()
  end
end


---------------------------------------------------------------------------------------------------------------------------------------------------
-- mein function

function AetheryteHelper.Update(Event, ticks)
  --d("[AetheryteHelper]---".."autheStep---"..autheStep.."---modechg---"..modechg.."---".."---isServer:"..isServer) ----debug
  if autheVar == nil then
    autheVar = true
    autheStep = 0
    isTime = 0
    else
    autheVar = not autheVar
  end

  --[[if (not Update.Timer or ticks - Update.Timer > Update.Pulse) then
    Update.Timer = ticks   
  end]]

  if (selectins) then  
      if autheVar and TimeSince(isTime) > delay then
              aetheID = 0
              local el = EntityList("nearest,type=5")
              if table.valid(el) then
                      for k,v in pairs(el) do
                              aetheID = v.id
                      end
              end
              if autheStep == 0 then
                      Player:SetTarget(aetheID)
                      Player:Interact(aetheID)
                      UseControlAction("Aetheryte") 
                      if IsControlOpen("SelectString") then
                         GetControl("SelectString"):Action("SelectIndex",modechg)
                         if (modechg == 3) then autheStep = 1 else autheStep = 2 end
                      end
              end
              if (autheStep == 1) then                      
                      if IsControlOpen("SelectString") then
                         GetControl("SelectString"):Action("SelectIndex",isins)
                         isTime = Now()
                         isins = 4
                         autheStep = 0
                     elseif IsControlOpen("SelectYesno") then
                            UseControlAction("SelectYesno","No")
                            selectins = not selectins
                     elseif Player:GetTarget() == nil then
                            isTime = Now()
                            autheStep = 0
                      end
                    end
              if (autheStep == 2) then
                         Player:SetTarget(aetheID)
                         Player:Interact(aetheID)
                         UseControlAction("Aetheryte")
                         GetControl("SelectString"):Action("SelectIndex",isServer)
--                         GetControl("WorldTravelSelect"):Action("SelectIndex",isServer) ----wip
                         autheStep = 3
                       
              end
              if autheStep == 3 then
                        UseControlAction("SelectYesno")
                     if IsControlOpen("SelectYesno") then
                        UseControlAction("SelectYesno","Yes")
                           moveSVR = not moveSVR
                           selectins = not selectins
                           autooff = not autooff
                           --autheStep = 0

                           --autheStep = 0
                     elseif Player:GetTarget() == nil then
                           isTime = Now()
                           Player:SetTarget(aetheID)
                           Player:Interact(aetheID)
                           --isServer = 0
                           autheStep = 0                           
                      end
              end
         end
       
      if Player:GetTarget() == nil then
         if( autooff ) then
          selectins = not selectins
        --else
        --autheStep = 0
         end
      end
    end
  end

---------------------------------------------------------------------------------------------------------------------------------------------------
-- sub function
function AetheryteHelper.subUpdate(Event, ticks)
  if (GetGameState() == FFXIV.GAMESTATE.INGAME and TimeSince(lastUpdatePulse) > 3000) then
    lastUpdatePulse = Now()

    if (IsControlOpen("SalvageResult")) then
      UseControlAction("SalvageResult", "Close")
    end

    if (Player.incombat or Busy()) then
      return
    end

    if (isPotionEnabled and MissingBuffs(Player,"49")) then
      local potionid = {7059, 19885, 27960}
      --錬精薬　強錬精薬　極錬精薬
      for i = 0, 3 do
        for _, id in pairs(potionid) do
          local potion = Inventory:Get(i):Get(id)
          if (potion and potion:GetAction():IsReady()) then
            potion:Cast()
            return
          end
        end
      end
    end
    if (isManualEnabled and MissingBuffs(Player,"1083")) then
      local manualid = {14951}
      --スピリットマニュアル
      for i = 0, 3 do
        for _, id in pairs(manualid) do
          local manual = Inventory:Get(i):Get(id)
          if (manual and manual:GetAction():IsReady()) then
            manual:Cast()
            return
          end
        end
      end
    end
    if (isMateriaEnabled) then
      if (IsControlOpen("MaterializeDialog") and GetControlData("MaterializeDialog")) then
        UseControlAction("MaterializeDialog","Yes")
        return
      end
      local bags = {1000, 3200, 3201, 3202, 3203, 3204, 3205, 3206, 3207, 3208, 3209, 3300, 3500}
      for _, e in pairs(bags) do
        local bag = Inventory:Get(e)
        if (table.valid(bag)) then
          local ilist = bag:GetList()
          if (table.valid(ilist)) then
            for _, item in pairs(ilist) do
              if (item.spiritbond == 100 and item:CanCast(5, 14)) then
                item:Convert()
                return
              end
            end
          end
        end
      end
    end

    if (isSalvageEnabled) then
      if (IsControlOpen("SalvageDialog") and GetControlData("SalvageDialog")) then
        UseControlAction("SalvageDialog","Confirm")
        return
      end
      local bags = {0, 1, 2, 3}
      for _, e in pairs(bags) do
        local bag = Inventory:Get(e)
        if (table.valid(bag)) then
          local ilist = bag:GetList()
          if (table.valid(ilist)) then
            for _, item in pairs(ilist) do
              if ((item.equipslot > 0 and item.requiredlevel > 1) or item.searchcategory == 46) then
                item:Salvage()
                return
              end
            end
          end
        end
      end
    end
  end
end
---------------------------------------------------------------------------------------------------------------------------------------------------
-- Register
RegisterEventHandler("Module.Initalize",AetheryteHelper.Init,"AetheryteHelper.Init") 
RegisterEventHandler("Module.Initalize",AetheryteHelper.ModuleInit,"AetheryteHelper.ModuleInit")
RegisterEventHandler("Gameloop.Draw", AetheryteHelper.DrawCall,"AetheryteHelper.DrawCall")
RegisterEventHandler("Gameloop.Update", AetheryteHelper.Update,"AetheryteHelper.Update")
RegisterEventHandler("Gameloop.Update", AetheryteHelper.subUpdate,"AetheryteHelper.subUpdate")
---------------------------------------------------------------------------------------------------------------------------------------------------
-- Debug
--d("[AetheryteHelper]---".."autheStep---"..autheStep.."---modechg---"..modechg.."---".."---isServer:"..isServer) ----debug