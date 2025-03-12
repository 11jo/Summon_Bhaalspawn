/* ============ *
 *  Intro Talk  *
 * ============ */



ADD_STATE_TRIGGER BHALSPW 0 ~!AreaCheck("AR4500")~

ADD_STATE_TRIGGER BHALSPW 1 ~OR(2)
	!AreaCheck("AR4500")
	Global("SBS_Sandra_Summoned_Once","LOCALS",1)~

APPEND BHALSPW

IF ~NumTimesTalkedTo(0) AreaCheck("AR4500")~ THEN BEGIN WhereAmI_AR4500
  SAY @0
  IF ~ReputationLT(LastTalkedToBy,5)~ THEN GOTO Fight_AR4500
  IF ~ReputationGT(LastTalkedToBy,4) 
  OR(2)
  !InParty("Imoen2") !InMyArea("Imoen2")~ THEN REPLY @86 GOTO Explain_AR4500
  IF ~ReputationGT(LastTalkedToBy,4) InParty("Imoen2") InMyArea("Imoen2")~ THEN REPLY @86 GOTO ExplainImoen_AR4500
END

IF ~~ THEN BEGIN Fight_AR4500
  SAY @81
  IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ THEN BEGIN Explain_AR4500
  SAY @82
  IF ~~ THEN REPLY @84 DO ~SetGlobal("SBS_Sandra_Summoned_Once","LOCALS",1)~ GOTO JoinUp_AR4500
  IF ~~ THEN REPLY @87 DO ~SetGlobal("SBS_Sandra_Summoned_Once","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN ExplainImoen_AR4500
  SAY @83
  IF ~~ THEN REPLY @84 DO ~SetGlobal("SBS_Sandra_Summoned_Once","LOCALS",1)~ GOTO JoinUp_AR4500
  IF ~~ THEN REPLY @87 DO ~SetGlobal("SBS_Sandra_Summoned_Once","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN JoinUp_AR4500
  SAY @17
  IF ~~ THEN DO ~SetGlobal("BhaalSpawnJoined","LOCALS",1) JoinParty()~ EXIT
END

	END
