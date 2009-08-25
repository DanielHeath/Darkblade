Name "Darkblade"
OutFile "Darkblade-1.0.exe"

; The default installation directory
InstallDir $PROGRAMFILES\Darkblade

; Request application privileges for Windows Vista
RequestExecutionLevel highest

LicenseLangString license ${LANG_ENGLISH} gpl.txt
LicenseData $(license)

;--------------------------------

; Pages

Page license
Page directory
Page instfiles

;--------------------------------

; The stuff to install
Section "Darkblade"

  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put files there
  File /r /x .git /x roadmap.txt /x *.bat /x *.lnk "C:\Documents and Settings\user\Desktop\Dev\Shoes\Darkblade\*.*"
  # create a shortcut named "new shortcut" in the start menu programs directory
  # presently, the new shortcut doesn't call anything (the second field is blank)
  createShortCut "$SMPROGRAMS\Darkblade.lnk" "C:\Program Files\Common Files\Shoes\0.r1134\shoes.exe" darkblade.rb

SectionEnd ; end Darkblade section

Section "Shoes"

SetOutPath "C:\Program Files\Common Files\Shoes\"
File /r "C:\Program Files\Common Files\Shoes\*.*"  

SectionEnd ; end Shoes section
