// FATE SPIRIT

EXTEND_TOP FATESP %fatesp_state_sandra% #%fatesp_transition_sandra%
+ ~!Dead("BHAALSPW") !InMyArea("BHAALSPW") Global("SBS_Sandra_Summoned","GLOBAL",0)~ + @85 // ~Bring me Sandra, the child of Bhaal paladin.~
 	DO ~CreateVisualEffect("SPPORTAL",[1626.1498])
	Wait(2)
	CreateCreature("bhaalspw",[1626.1498],1)
	SetGlobal("SBS_Sandra_Summoned","GLOBAL",1)~ GOTO 8
END
