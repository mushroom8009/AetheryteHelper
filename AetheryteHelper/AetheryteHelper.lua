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
-----2021/xx/xx----------
wip

mushroom#8009
]]

AetheryteHelper = {}

local kinokoProject = {
  Addon  = {
      Folder =        "AetheryteHelper",
      Name =          "Aetheryte Helper",
      Version =         "0.9.0",   
      VersionList = { "[0.9.0] - Pre Release", },
      
  },
--  ---------------
  HELP   = {
      entext =       { "wip\ndon't think\nfeel\nby Zodiark", }, 
      jptext =       { "準備中\nとりあえず感覚で使ってください\nサーバーセレクトは作成中なので\nリストが出たら手動で選択してください", },
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
      Name =          "Addon Main Windows",
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

Links = {
      Name = "Minion Discord JP",
      link = [[https://discord.com/channels/127540472812929024/335225564803891210]],
      tooltip = "it's a hobby,\nso i don't know if it's possible,\nbut let me know if you have any requests.\n\n不具合とかあれば教えて下さい",

}



local gRegion = GetGameRegion()
local gstate = MGetGameState()
local language = GetGameLanguage()
--local nowServer = 
---------------------------------------------------------------------------------------------------------------------------------------------------
-- local
local selectins = false
local autooff = true
local isins = 4
local delay = 250
local WVaetheID = 0
local moveSVR = false
local isServer = 0
--local pmap = Player.localmapid
local modechg = nil
--local MoveServer = { 132, 129, 130 }
--local ploc = { 956, 957, 958, 959, 960, 961 }
local Update = kinokoProject.Update
local aetheID = 0
local delay = 200

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


------------------CurrentWorld---------------------------------------------------------------------------------------------------------------------------------
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
--
function AetheryteHelper.SwitchOpen()
  kinokoProject.Windows.MainWindows.Open = not kinokoProject.Windows.MainWindows.Open
end
---------------------------------------------------------------------------------------------------------------------------------------------------
-- main GUI
function AetheryteHelper.Drawinsselect()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Spacing()
--      BStyle.SetStringInCenter("use MobHunt & Rare F.A.T.E")
      GUI:Text("use MobHunt & Rare F.A.T.E")      
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        GUI:SetTooltip("--instance select--\nonly use EW area\n・Labyrinthos\n・Thavnair\n・Garlemald\n・Mare Lamentorum\n・Elpis\n・Ultima Thule\n--move server--\n・Gridania\n・Limsa\n・Uldah")
      end
      GUI:Separator()
      GUI:Spacing()

      GUI:BeginGroup()
      GUI:Text("MAPID: "..tostring(Player.localmapid).." - "..GetMapName(Player.localmapid))
      GUI:EndGroup()
      
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("##select_ins", selectins)
      GUI:SameLine(30)
      GUI:Text("Instance Selector")
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

function AetheryteHelper.DrawaddButton()
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
      GUI:BeginGroup()
      GUI:Text("coming soon...")
      GUI:EndGroup()      
end

function AetheryteHelper.Drawhelp(_entext)
  if GUI:TreeNode("HOW TO USE##AetheryteHelper") then
    for id, e in pairs(_entext) do
      GUI:Text(e)
    end
    BStyle.SetStringInCenter("----------------")
    GUI:TreePop()
  end
end

function AetheryteHelper.Drawhelp(_jptext)
  if GUI:TreeNode("HOW TO USE##AetheryteHelper") then
    for id, e in pairs(_jptext) do
      GUI:Text(e)
    end
    BStyle.SetStringInCenter("----------------")
    GUI:TreePop()
  end
end

function AetheryteHelper.DrawInside()
  if kinokoProject.Windows.MainWindows.Open == false then
    BStyle.SetStringInCenter("-------")
  end 
  ----
if language == 0 then
  AetheryteHelper.Drawhelp(kinokoProject.HELP.jptext)
else
  AetheryteHelper.Drawhelp(kinokoProject.HELP.entext)
  ----  
end
end

-------------------------------------------------------------------------------------------------------------------------------------------
-- call

function AetheryteHelper.DrawCall(event, ticks)
  local Windows = kinokoProject.Windows.MainWindows
  local Addon = kinokoProject.Addon

if (Windows.Open) then
    GUI:SetNextWindowSize(280,350,GUI.SetCond_FirstUseEver)
    Windows.Visible, Windows.Open = GUI:Begin(Addon.Name.." - "..Addon.Version.."##MainWindows_begin", Windows.Open, Windows.Option)
    if (Windows.Visible) then
      
      AetheryteHelper.Drawinsselect()
      AetheryteHelper.DrawChangeServer()
      AetheryteHelper.DrawaddButton()
      AetheryteHelper.DrawInside()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:Spacing(80)
      GUI:Separator()
      if GUI:Button("Close##"..Windows.Name,(GUI:GetWindowSize()), 40, 20) then
        Windows.Open = false
      end
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:SameLine(20)
      GUI:Text("Discord >> ")
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:TextColored( 0.2, 0.8, 0.8,1, "mushroom#8009")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then   
      if GUI:IsItemClicked(0) then
            io.popen([[cmd /c start "" "]]..Links.link..[["]]):close()
      end
      GUI:SetTooltip(Links.tooltip)
      end
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Text(" <<")
      GUI:EndGroup()
      GUI:SameLine()

      --GUI:Image([[\AetheryteHelper\image\love_mushroom.png]], 20, 20) 
    end
    GUI:End()
  end
end





local control = GetControl("SelectString")
if table.valid(control) then
  local data = control:GetData()
  if table.valid(data) then
    if WKT[language] == data[2] then
      control:Action("SelectIndex",2)
    end
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
-- Register
RegisterEventHandler("Module.Initalize",AetheryteHelper.Init) 
RegisterEventHandler("Module.Initalize",AetheryteHelper.ModuleInit)
RegisterEventHandler("Gameloop.Draw", AetheryteHelper.DrawCall)
RegisterEventHandler("Gameloop.Update", AetheryteHelper.Update)
---------------------------------------------------------------------------------------------------------------------------------------------------
-- Debug
--d("[AetheryteHelper]---".."autheStep---"..autheStep.."---modechg---"..modechg.."---".."---isServer:"..isServer) ----debug