--ref
local Allen_ref     = gui.Reference("settings")
local tab           = gui.Tab(Allen_ref,"tab","Allen")

--ind
local ind           = gui.Groupbox(tab,"指示器",10,10,250,100)
local dmg_check     = gui.Checkbox(ind,"ind_check","最小伤害开关",false)
local fov_check     = gui.Checkbox(ind,"ind_check","FOV开关",false)
local fl_check     = gui.Checkbox(ind,"ind_check","FL开关",false)
local dmg_clrpick   = gui.ColorPicker(ind,"dmg_clrpick","伤害",0,0,0,0)
local fov_clrpick   = gui.ColorPicker(ind,"fov_clrpick","Fov",0,0,0,0)
local fl_clrpick    = gui.ColorPicker(ind,"fl_clrpick","FL",0,0,0,0)

--dmg
local damage        = gui.Groupbox(tab,"最小伤害",310,10,300,100)
local damage_check  = gui.Checkbox(damage,"damage_check","最小伤害开关",false)

local dmg_pistol    = gui.Slider(damage,"dmg_pistol","手枪伤害",0,0,100,1)
local dmg_hpistol   = gui.Slider(damage,"dmg_hpistol","沙鹰/左轮伤害",0,0,100,1)
local dmg_scout     = gui.Slider(damage,"dmg_scout","鸟狙伤害",0,0,100,1)
local dmg_sniper    = gui.Slider(damage,"dmg_sniper","大狙伤害",0,0,100,1)
local dmg_asniper   = gui.Slider(damage,"dmg_asniper","连狙伤害",0,0,100,1)
local dmg_rifle     = gui.Slider(damage,"dmg_rifle","步枪伤害",0,0,100,1)


--weapon settings
local weapons_list = {
    [1] = "hpistol",
    [2] = "pistol",
    [3] = "pistol",
    [4] = "pistol",
    [7] = "rifle",
    [8] = "rifle",
    [9] = "sniper",
    [10] = "rifle",
    [11] = "asniper",
    [13] = "rifle",
    [14] = "lmg",
    [16] = "rifle",
    [17] = "smg",
    [19] = "smg",
    [23] = "smg",
    [24] = "smg",
    [25] = "shotgun",
    [26] = "smg",
    [27] = "shotgun",
    [28] = "lmg",
    [29] = "shotgun",
    [30] = "pistol",
    [32] = "pistol",
    [33] = "smg",
    [34] = "smg",
    [35] = "shotgun",
    [36] = "pistol",
    [38] = "asniper",
    [39] = "rifle",
    [40] = "scout",
    [41] = "knife",
    [42] = "knife",
    [59] = "knife",
    [60] = "rifle",
    [61] = "pistol",
    [63] = "pistol",
    [64] = "hpistol",
    [500] = "knife",
    [503] = "knife",
    [505] = "kinife",
    [506] = "knife",
    [507] = "knife",
    [508] = "knife",
    [509] = "knife",
    [512] = "knife",
    [514] = "knife",
    [515] = "knife",
    [516] = "knife",
    [517] = "knife",
    [518] = "knife",
    [519] = "knife",
    [520] = "knife",
    [521] = "knife",
    [522] = "knife",
    [523] = "knife",
    [525] = "knife",
}


local mindmg_backup_state = 0
local mindmg_original_backup = {
    pistol  = gui.GetValue("rbot.hitscan.accuracy.pistol.mindamage"),
    hpistol = gui.GetValue("rbot.hitscan.accuracy.hpistol.mindamage"),
    scout   = gui.GetValue("rbot.hitscan.accuracy.scout.mindamage"),
    sniper  = gui.GetValue("rbot.hitscan.accuracy.sniper.mindamage"),
    asniper = gui.GetValue("rbot.hitscan.accuracy.asniper.mindamage"),
    rifle   = gui.GetValue("rbot.hitscan.accuracy.rifle.mindamage")

}


function Mindmg()
    if damage_check:GetValue() then   
        if mindmg_backup_state ~= 1 then
        mindmg_original_backup.sniper = gui.GetValue("rbot.hitscan.accuracy.sniper.mindamage")
        mindmg_original_backup.scout = gui.GetValue("rbot.hitscan.accuracy.scout.mindamage")
        mindmg_original_backup.rifle = gui.GetValue("rbot.hitscan.accuracy.rifle.mindamage")
        mindmg_original_backup.pistol = gui.GetValue("rbot.hitscan.accuracy.pistol.mindamage")
        mindmg_original_backup.hpistol = gui.GetValue("rbot.hitscan.accuracy.hpistol.mindamage")
        mindmg_original_backup.asniper = gui.GetValue("rbot.hitscan.accuracy.asniper.mindamage")

        mindmg_backup_state = 1
        end
            gui.SetValue("rbot.hitscan.accuracy.sniper.mindamage", dmg_sniper:GetValue())  
            gui.SetValue("rbot.hitscan.accuracy.scout.mindamage", dmg_scout:GetValue())              
            gui.SetValue("rbot.hitscan.accuracy.rifle.mindamage", dmg_rifle:GetValue())            
            gui.SetValue("rbot.hitscan.accuracy.pistol.mindamage", dmg_pistol:GetValue())                   
            gui.SetValue("rbot.hitscan.accuracy.hpistol.mindamage", dmg_hpistol:GetValue())
            gui.SetValue("rbot.hitscan.accuracy.asniper.mindamage", dmg_asniper:GetValue())
    elseif not damage_check:GetValue() then
        if mindmg_backup_state == 1 then
            mindmg_original_backup.sniper = gui.SetValue("rbot.hitscan.accuracy.sniper.mindamage", mindmg_original_backup.sniper)
            mindmg_original_backup.scout = gui.SetValue("rbot.hitscan.accuracy.scout.mindamage", mindmg_original_backup.scout)
            mindmg_original_backup.rifle = gui.SetValue("rbot.hitscan.accuracy.rifle.mindamage", mindmg_original_backup.rifle)
            mindmg_original_backup.pistol = gui.SetValue("rbot.hitscan.accuracy.pistol.mindamage", mindmg_original_backup.pistol)
            mindmg_original_backup.hpistol = gui.SetValue("rbot.hitscan.accuracy.hpistol.mindamage", mindmg_original_backup.hpistol)
            mindmg_original_backup.asniper = gui.SetValue("rbot.hitscan.accuracy.asniper.mindamage", mindmg_original_backup.asniper)

            mindmg_backup_state = 0
        end
    --print(gui.GetValue( "rbot.hitscan.accuracy.scout.mindamage" ))
    end
end

--指示器

local font = draw.CreateFont("Comic Sans MS",50,50)
local font1 = draw.CreateFont("Comic Sans MS",30,30)
local dx,dy = 50,50


function gaming()
    local lp = entities.GetLocalPlayer()
    if not lp or not lp:IsAlive() then
        return false
    else
        return true
    end
end

function draw_ind()
    --fov绘制
    if not gaming() then return end
    if fov_check:GetValue() then
        local r,g,b,a = fov_clrpick:GetValue()
        local fov = gui.GetValue("rbot.aim.target.fov")
        draw.SetFont(font)
        draw.Color(r,g,b,a)
        draw.Text(20,685,"Fov:"..fov)
    end
    --FL
    if fl_check:GetValue() then
        local r,g,b,a = fl_clrpick:GetValue()
        local fl = gui.GetValue("misc.fakelag.factor")
        draw.SetFont(font)
        draw.Color(r,g,b,a)
        draw.Text(20,785,"FL:"..fl)
    end
    --dmg
    if dmg_check:GetValue() then
        local r,g,b,a = dmg_clrpick:GetValue()
        local weapon_id = entities.GetLocalPlayer():GetWeaponID()
        if weapons_list[weapon_id] == nil or weapons_list[weapon_id] == "knife" then return end
        local dmg_now = gui.GetValue("rbot.hitscan.accuracy." .. weapons_list[weapon_id] .. ".mindamage")
        
        draw.SetFont(font)
        draw.Color(r,g,b,a)
        draw.Text(20,885,"Dmg:"..dmg_now);

        draw.SetFont(font1)
        draw.Color(r,g,b,a)
        draw.Text(1295,736,dmg_now);
    end
end

callbacks.Register("Draw", function() 
    -- ui elements and checks
    Mindmg()
    gaming()
    draw_ind()
end)
