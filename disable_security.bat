# ===============================
# Disable SmartScreen (System)
# ===============================
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d Off /f

# Disable SmartScreen (Policies)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableSmartScreen /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v ShellSmartScreenLevel /t REG_SZ /d Off /f

# Disable SmartScreen in Edge (if used)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v SmartScreenEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v SmartScreenPuaEnabled /t REG_DWORD /d 0 /f


# ===========================================
# Disable "Open File - Security Warning"
# "Publisher could not be verified"
# ===========================================

# Stop writing or enforcing Zone.Identifier (MOTW)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v SaveZoneInformation /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v SaveZoneInformation /t REG_DWORD /d 1 /f

# Disable scanning that triggers prompts
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v ScanWithAntiVirus /t REG_DWORD /d 1 /f

# Hide Zone Information / treat as trusted
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v HideZoneInfoOnProperties /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v HideZoneInfoOnProperties /t REG_DWORD /d 1 /f

# Allow risky file types without warnings
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v LowRiskFileTypes /t REG_SZ /d ".exe;.bat;.cmd;.msi;.ps1;.vbs;.js" /f

# Optional: Fully disable Attachment Manager (max suppression)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v DisableAttachmentManager /t REG_DWORD /d 1 /f


# ===============================
# Apply all changes
# ===============================
gpupdate /force
