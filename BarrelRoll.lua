local BarrelRoll = CreateFrame("frame", "BarrelRoll")
BarrelRoll:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

BarrelRoll:SetScript("OnEvent", function(self, event, ...)
	if(event == "COMBAT_LOG_EVENT_UNFILTERED") then
        BarrelRoll:COMBAT_LOG_EVENT_UNFILTERED()
	end
end)

function BarrelRoll:COMBAT_LOG_EVENT_UNFILTERED()
    local name, _ = UnitName("player");
    local eventType, _, _, eventSource, _, _, _, targetName = select(2, CombatLogGetCurrentEventInfo())
    if not (eventSource == name) then
        do
            return
        end
    end

    local spellId, spellName, _, amount, _, _, _, _, _, critical, _, _ = select(12,CombatLogGetCurrentEventInfo())
    if (eventType == "SPELL_CAST_SUCCESS" and spellId == 109132) then
        print("BARRELROOOLL!!!!")
        PlaySoundFile("Interface\\AddOns\\BarrelRoll\\barrelroll.ogg")
    end
end



