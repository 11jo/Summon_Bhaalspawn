

// Keldorn
// -------

// Special
// // Doit �tre s�par� de la partie pr�sente dans bhaalspw.d pour qu'ICT prennent en compte les changements pr�c�dents.

I_C_T Keldor 0 SBS_KeldornBanter1
  // == Keldor IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)~ THEN @66
  == BHALSPWJ IF ~InParty("BHAALSPW") InMyArea("BHAALSPW") !StateCheck("BHAALSPW",CD_STATE_NOTVALID)~ THEN @39
  == Keldor @67
  == BHALSPWJ @40
  == Keldor @68
  == BHALSPWJ @41
  == Keldor @69
END
