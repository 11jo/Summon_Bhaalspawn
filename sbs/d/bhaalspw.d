/* ============ *
 *  Intro Talk  *
 * ============ */
BEGIN BHALSPW

IF ~NumTimesTalkedTo(0)~ THEN BEGIN WhereAmI
  SAY @0
  IF ~ReputationLT(LastTalkedToBy,5)~ THEN GOTO Fight
  IF ~ReputationGT(LastTalkedToBy,4)
       InParty("Imoen2") InMyArea("Imoen2")~ THEN REPLY @1 GOTO ExplainImoen
  IF ~ReputationGT(LastTalkedToBy,4) 
  OR(2)
  !InParty("Imoen2") !InMyArea("Imoen2")~ THEN REPLY @1 GOTO Explain
END

IF ~True()~ THEN BEGIN Restart
  SAY @2
  IF ~ReputationLT(LastTalkedToBy,5)~ THEN GOTO Fight
  IF ~ReputationGT(LastTalkedToBy,4)
      Global("BhaalSpawnJoined","LOCALS",0)~ THEN REPLY @3 GOTO JoinUp
  IF ~ReputationGT(LastTalkedToBy,4)~ THEN REPLY @4 GOTO ByeBye
END

IF ~~ THEN BEGIN ByeBye
  SAY @5
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Fight
  SAY @6
  IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ THEN BEGIN Explain
  SAY @7
  IF ~~ THEN REPLY @8 GOTO Explain2
END

IF ~~ THEN BEGIN ExplainImoen
  SAY @9
  IF ~~ THEN REPLY @8 GOTO Explain2
END

IF ~~ THEN BEGIN Explain2
  SAY @10
  IF ~~ THEN GOTO Explain3
END

IF ~~ THEN BEGIN Explain3
  SAY @11
  IF ~~ THEN REPLY @12 GOTO Explain4
END

IF ~~ THEN BEGIN Explain4
  SAY @13
  IF ~~ THEN REPLY @14 GOTO JoinUp
  IF ~~ THEN REPLY @15 GOTO StayAwhile
  IF ~~ THEN REPLY @16 GOTO Leave
END

IF ~~ THEN BEGIN JoinUp
  SAY @17
  IF ~~ THEN DO ~SetGlobal("BhaalSpawnJoined","LOCALS",1) JoinParty()~ EXIT
END

IF ~~ THEN BEGIN StayAwhile
  SAY @18
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Leave
  SAY @19
  IF ~~ THEN DO ~SetGlobal("SBS_WordSendQuest","GLOBAL",1)
		FadeToColor([10.0],0)
		Wait(2) 
		FadeFromColor([20.0],0) MoveBetweenAreas("AR0903",[845.1068],9)~ EXIT
END


/* ============ *
 *  Leave Talk  *
 * ============ */
BEGIN BHALSPWP

IF ~Global("BhaalSpawnJoined","LOCALS",1)
    ReputationLT(LastTalkedToBy,5)~ THEN BEGIN KickoutFight
  SAY @20
  IF ~~ THEN DO ~SetGlobal("BhaalSpawnJoined","LOCALS",0) Enemy()~ EXIT
END

IF ~GlobalLT("BSBalance","GLOBAL",-2)~ THEN BEGIN UnbalancedFight
	SAY @21
	IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~GlobalGT("BSWhiner","LOCALS",2)~ THEN BEGIN WhinerFight
	SAY @22
	IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~Global("BhaalSpawnJoined","LOCALS",1)
    ReputationGT(LastTalkedToBy,4)~ THEN BEGIN Kickout
  SAY @23
  IF ~~ THEN REPLY @24 DO ~JoinParty()~ EXIT
  IF ~~ THEN REPLY @25 DO ~SetGlobal("BhaalSpawnJoined","LOCALS",0) SetDialog("BHALSPW")~ GOTO Farewell
END

IF ~~ THEN BEGIN Farewell
  SAY @26
  IF ~~ THEN EXIT
END


/* ========= *
 *  Banters  *
 * ========= */
BEGIN BHALSPWJ

IF ~True()~ THEN BEGIN WorryTalk
	SAY @27
	IF ~~ THEN REPLY @28 GOTO WorryTalk2
END

IF ~~ THEN BEGIN WorryTalk2
	SAY @29
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN HellTalk
	SAY @30
	COPY_TRANS Player1 25
END

IF ~~ THEN BEGIN AvatarAppearsTalk
	SAY @31
	IF ~~ THEN REPLY @32 GOTO AvatarAppearsTalk2
END

IF ~~ THEN BEGIN AvatarAppearsTalk2
	SAY @33
	IF ~~ THEN REPLY @34 GOTO AvatarAppearsTalk3
END

IF ~~ THEN BEGIN AvatarAppearsTalk3
	SAY @35
	COPY_TRANS Player1 5
END

IF ~~ THEN BEGIN IrenicusDead
	SAY @36
	COPY_TRANS Player1 16
END

IF ~~ THEN BEGIN TreeTalk
	SAY @37 = @38
	COPY_TRANS Player1 33
END

/*
IF ~~ THEN BEGIN KeldornBanter
	SAY @39
	IF ~~ THEN EXTERN Keldor BhaalSpawnBanter
END

IF ~~ THEN BEGIN KeldornBanter2
	SAY @40
	IF ~~ THEN EXTERN Keldor BhaalSpawnBanter2
END

IF ~~ THEN BEGIN KeldornBanter3
	SAY @41
	IF ~~ THEN EXTERN Keldor BhaalSpawnBanter3
END
*/

IF ~~ THEN BEGIN OisigTalk
	SAY @42
	IF ~~ THEN EXTERN Bhoisig SeeingEyeBanter
END

IF ~~ THEN BEGIN OisigTalk2
	SAY @43
	IF ~~ THEN EXTERN Bhoisig SeeingEyeBanter2
END

IF ~~ THEN BEGIN RyanInterject
	SAY @44
	IF ~~ THEN EXTERN KAYL2 BSInterject
END

IF ~~ THEN BEGIN RyanInterject2
	SAY @45
	IF ~~ THEN EXTERN KAYL2 BSInterject2
END

IF ~~ THEN BEGIN RyanInterject3
	SAY @46
	IF ~~ THEN EXTERN KAYL2 BSInterject3
END

/*
IF ~~ THEN BEGIN NotSoSimple
	SAY @47
	COPY_TRANS PPIRENI1 4
END
*/

/*
IF ~~ THEN BEGIN DivineRemoval
	SAY @48
	COPY_TRANS PPIRENI2 35
END
*/

/*
IF ~~ THEN BEGIN YoshimoBetrayal
	SAY @49
	COPY_TRANS YOSHJ 113
END
*/

/*
IF ~~ THEN BEGIN MoreSoul
	SAY @50
	IF ~OR(3)
		!InParty("Jaheira") !InMyArea("Jaheira") StateCheck("Jaheira",CD_STATE_NOTVALID)
		OR(3)
		!InParty("Minsc") !InMyArea("Minsc") StateCheck("Minsc",CD_STATE_NOTVALID)
		OR(3)
		!InParty("Imoen2") !InMyArea("Imoen2") StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN EXIT
	IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN EXTERN JAHEIRAJ 480
	IF ~OR(3)
		!InParty("Jaheira") !InMyArea("Jaheira") StateCheck("Jaheira",CD_STATE_NOTVALID)
		InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN EXTERN MINSCJ 176
	IF ~OR(3)
		!InParty("Jaheira") !InMyArea("Jaheira") StateCheck("Jaheira",CD_STATE_NOTVALID)
		OR(3)
		!InParty("Minsc") !InMyArea("Minsc") StateCheck("Minsc",CD_STATE_NOTVALID)
		InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN EXTERN IMOEN2J 30
END
*/

IF ~~ THEN BEGIN FinalTalk
	SAY @51
	COPY_TRANS HELLJON 7
END

IF ~~ THEN BEGIN ViconiaTalk
	SAY @52
	IF ~~ THEN EXTERN VICONI BSRebuttal
END

IF ~~ THEN BEGIN ViconiaTalk2
	SAY @53
	COPY_TRANS VICONI 2
END

IF ~~ THEN BEGIN FrankieTalk
	SAY @54
	COPY_TRANS COPGREET 1
END

IF ~~ THEN BEGIN HendakTalk1
	SAY @55
	COPY_TRANS HENDAK 4
END

IF ~~ THEN BEGIN HendakTalk2
	SAY @56
	COPY_TRANS HENDAK 7
END

IF ~~ THEN BEGIN HendakTalk3
	SAY @57
	COPY_TRANS HENDAK 19
END

IF ~~ THEN BEGIN NoMessNeed
	SAY @58
	IF ~~ THEN EXTERN SBSMESS PoliteGoodbye
END

IF ~~ THEN BEGIN WordQuestStart
	SAY @59
	IF ~~ THEN EXTERN SBSMESS MessQuest1
END

IF ~~ THEN BEGIN WordQuest1
	SAY @60
	IF ~~ THEN EXTERN SBSMESS MessQuest2
END

IF ~~ THEN BEGIN WordQuest2
	SAY @61
	IF ~~ THEN EXIT
END


/* ================ *
 *  External Files  *
 * ================ */

// Player1
// -------
EXTEND_BOTTOM Player1 25
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
	    Global("BhaalSpawnHellTalk","GLOBAL",0)~ THEN DO ~SetGlobal("BhaalSpawnHellTalk","GLOBAL",1)~ EXTERN BHALSPWJ HellTalk
END

EXTEND_BOTTOM Player1 5
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
	    Global("BhaalSpawnAvatarTalk","GLOBAL",0)~ THEN DO ~SetGlobal("BhaalSpawnAvatarTalk","GLOBAL",1)~ EXTERN BHALSPWJ AvatarAppearsTalk
END

EXTEND_BOTTOM Player1 16
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
	    Global("BhaalSpawnIrenicusDead","GLOBAL",0)~ THEN DO ~SetGlobal("BhaalSpawnIrenicusDead","GLOBAL",1)~ EXTERN BHALSPWJ IrenicusDead
END

EXTEND_BOTTOM Player1 33
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		Global("BhaalSpawnTreeTalk","GLOBAL",0)~ THEN DO ~SetGlobal("BhaalSpawnTreeTalk","GLOBAL",1)~ GOTO BhaalTreeTalk
END

APPEND Player1
	IF ~~ THEN BEGIN BhaalTreeTalk
		SAY @62
		IF ~~ THEN REPLY @63 EXTERN ~BHALSPWJ~ TreeTalk
		IF ~~ THEN REPLY @64 EXTERN ~BHALSPWJ~ TreeTalk
		IF ~~ THEN REPLY @65 EXTERN ~BHALSPWJ~ TreeTalk
	END
END

// Keldorn
// -------

ADD_TRANS_TRIGGER Keldor 0 ~OR(3)
!InParty("BHAALSPW") !InMyArea("BHAALSPW") StateCheck("BHAALSPW",CD_STATE_NOTVALID)~ DO 0 2

EXTEND_BOTTOM Keldor 0
		IF ~~ THEN REPLY @70 DO ~SetGlobalTimer("KeldornMetPlayer","GLOBAL",FIFTY_DAYS)~ GOTO 23
END
/*
// Doit être séparé de la partie précédente pour qu'ICT prennent en compte les changements ci-dessus.

// Moved to Special_Keldor.d

I_C_T Keldor 0 KeldornBanter
  // == Keldor IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)~ THEN @66
  == BHALSPWJ IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)~ THEN @39
  == Keldor @67
  == BHALSPWJ @40
  == Keldor @68
  == BHALSPWJ @41
  == Keldor @69
END
*/

/*
APPEND Keldor
	IF WEIGHT #-1 ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		NumTimesTalkedTo(0)~ THEN BEGIN KeldornBhaalSpawnBanter
		SAY @66
		IF ~OR(3)
!InParty("BHAALSPW") !InMyArea("BHAALSPW") StateCheck("BHAALSPW",CD_STATE_NOTVALID)~ THEN GOTO 0
		IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)~ THEN EXTERN BHALSPWJ KeldornBanter
	END

	IF ~~ THEN BEGIN BhaalSpawnBanter
		SAY @67
		IF ~~ THEN EXTERN BHALSPWJ KeldornBanter2
	END

	IF ~~ THEN BEGIN BhaalSpawnBanter2
		SAY @68
		IF ~~ THEN EXTERN BHALSPWJ KeldornBanter3
	END

	IF ~~ THEN BEGIN BhaalSpawnBanter3
		SAY @69
		IF ~~ THEN REPLY #8257 DO ~SetGlobalTimer("KeldornMetPlayer","GLOBAL",FIFTY_DAYS)~ GOTO 17
		IF ~~ THEN REPLY #8259 DO ~SetGlobalTimer("KeldornMetPlayer","GLOBAL",FIFTY_DAYS)~ GOTO 18
		IF ~~ THEN REPLY @70 DO ~SetGlobalTimer("KeldornMetPlayer","GLOBAL",FIFTY_DAYS)~ GOTO 23
	END

END
*/

// High Waiter Oisig
// -----------------
EXTEND_BOTTOM Bhoisig 9
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		Global("BhaalSpawnOisigBanter","GLOBAL",0)~ THEN DO ~SetGlobal("BhaalSpawnOisigBanter","GLOBAL",1)~ EXTERN BHALSPWJ OisigTalk
END

APPEND Bhoisig
	IF ~~ THEN BEGIN SeeingEyeBanter
		SAY @71
		IF ~~ THEN EXTERN BHALSPWJ OisigTalk2
	END

	IF ~~ THEN BEGIN SeeingEyeBanter2
		SAY @72
		COPY_TRANS Bhoisig 9
	END

END

// Sir Ryan Trawl
// --------------
EXTEND_BOTTOM KAYL2 10
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		Global("BhaalSpawnRyanBanter","GLOBAL",0)~ THEN DO ~SetGlobal("BhaalSpawnRyanBanter","GLOBAL",1)~ EXTERN BHALSPWJ RyanInterject
END

APPEND KAYL2

	IF ~~ THEN BEGIN BSInterject
		SAY @73
		IF ~~ THEN EXTERN BHALSPWJ RyanInterject2
	END

	IF ~~ THEN BEGIN BSInterject2
		SAY @74
		IF ~~ THEN EXTERN BHALSPWJ RyanInterject3
	END

	IF ~~ THEN BEGIN BSInterject3
		SAY @75
		COPY_TRANS KAYL2 10
	END

END

// Main Irenicus Plot
// ------------------

INTERJECT_COPY_TRANS PPIRENI1 4 SBS_NotSoSimple1
  == BHALSPWJ IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)~ THEN @47
END
/*
EXTEND_BOTTOM PPIRENI1 4
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		Global("BSSimpleObjection","GLOBAL",0)~ THEN DO ~SetGlobal("BSSimpleObjection","GLOBAL",1)~ EXTERN BHALSPWJ NotSoSimple
END
*/


I_C_T PPIRENI2 35 SBS_DivineRemoval1
  == BHALSPWJ   IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)~ THEN @48 
END
/*
EXTEND_BOTTOM PPIRENI2 35
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		Global("BSRemoveDivine","GLOBAL",0)~ THEN DO ~SetGlobal("BSRemoveDivine","GLOBAL",1)~ EXTERN BHALSPWJ DivineRemoval
END
*/


INTERJECT_COPY_TRANS YOSHJ 113 SBS_YoshimoBetrayal1
  == BHALSPWJ IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)~ THEN @49
END
/*
EXTEND_BOTTOM YOSHJ 113
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		Global("BSYoshimoBetrayal","GLOBAL",0)~ THEN DO ~SetGlobal("BSYoshimoBetrayal","GLOBAL",1)~ EXTERN BHALSPWJ YoshimoBetrayal
END
*/


INTERJECT_COPY_TRANS SUJON 14 SBS_MoreSoul1
  == BHALSPWJ IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		Global("BSMoreSoul","GLOBAL",0)~ THEN @50
END
/*
EXTEND_BOTTOM SUJON 14
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		Global("BSMoreSoul","GLOBAL",0)~ THEN DO ~Enemy() SetGlobal("BSMoreSoul","GLOBAL",1)~ EXTERN BHALSPWJ MoreSoul
END
*/

EXTEND_BOTTOM HELLJON 7
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		Global("BSFinalTalk","GLOBAL",0)~ THEN DO ~SetGlobal("BSFinalTalk","GLOBAL",1)~ EXTERN BHALSPWJ FinalTalk
END

EXTEND_BOTTOM HELLJON 8
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		Global("BSFinalTalk","GLOBAL",0)~ THEN DO ~SetGlobal("BSFinalTalk","GLOBAL",1)~ EXTERN BHALSPWJ FinalTalk
END

EXTEND_BOTTOM HELLJON 9
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		Global("BSFinalTalk","GLOBAL",0)~ THEN DO ~SetGlobal("BSFinalTalk","GLOBAL",1)~ EXTERN BHALSPWJ FinalTalk
END

EXTEND_BOTTOM HELLJON 10
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		Global("BSFinalTalk","GLOBAL",0)~ THEN DO ~SetGlobal("BSFinalTalk","GLOBAL",1)~ EXTERN BHALSPWJ FinalTalk
END

// Viconia
// -------
EXTEND_BOTTOM VICONI 2
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		Global("BSViconiaJoin","GLOBAL",0)~ THEN DO ~SetGlobal("BSViconiaJoin","GLOBAL",1)~ EXTERN BHALSPWJ ViconiaTalk
END

APPEND VICONI
	IF ~~ THEN BEGIN BSRebuttal
		SAY @76
		IF ~~ THEN EXTERN BHALSPWJ ViconiaTalk2
	END
END

// Frankie, the Copper Coronet Greeter
// -----------------------------------
EXTEND_BOTTOM COPGREET 1
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		Global("BSFrankie","GLOBAL",0)~ THEN DO ~SetGlobal("BSFrankie","GLOBAL",1)~ EXTERN BHALSPWJ FrankieTalk
END

// Hendak the Gladiator
// --------------------
EXTEND_BOTTOM HENDAK 4
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		Global("BSHendak1","GLOBAL",0)~ THEN DO ~SetGlobal("BSHendak1","GLOBAL",1)~ EXTERN BHALSPWJ HendakTalk1
END

EXTEND_BOTTOM HENDAK 7
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		Global("BSHendak2","GLOBAL",0)~ THEN DO ~SetGlobal("BSHendak2","GLOBAL",1)~ EXTERN BHALSPWJ HendakTalk2
END

EXTEND_BOTTOM HENDAK 19
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		Global("BSHendak3","GLOBAL",0)~ THEN DO ~SetGlobal("BSHendak3","GLOBAL",1)~ EXTERN BHALSPWJ HendakTalk3
END

// Radiant Heart Messenger
// -----------------------
BEGIN SBSMESS

IF ~True()~ THEN BEGIN Welcome
	SAY @77
	IF ~OR(3)
!InParty("BHAALSPW") !InMyArea("BHAALSPW") StateCheck("BHAALSPW",CD_STATE_NOTVALID)~ THEN REPLY #16441 EXIT
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		!Global("SBS_WordSendQuest","GLOBAL",2)~ THEN EXTERN BHALSPWJ NoMessNeed
	IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)
		Global("SBS_WordSendQuest","GLOBAL",2)~ THEN EXTERN BHALSPWJ WordQuestStart
END

IF ~~ THEN BEGIN PoliteGoodbye
	SAY @78
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN MessQuest1
	SAY @79
	IF ~~ THEN EXTERN BHALSPWJ WordQuest1
END

IF ~~ THEN BEGIN MessQuest2
	SAY @80
	IF ~~ THEN DO ~SetGlobal("SBS_WordSendQuest","GLOBAL",3) IncrementGlobal("BSBalance","GLOBAL",1)~ EXTERN BHALSPWJ WordQuest2
END
