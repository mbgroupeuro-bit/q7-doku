@echo off
cd /d D:\Projekt2027\Q7_Entwicklung\b_Q7-doku

if not exist ".git" (
    echo %date% %time% - Kein Git-Repo gefunden, initialisiere neu. >> git-backup-log.txt
    git init
    (
        echo git-backup-log.txt
    ) > .gitignore
    git add -A
    git commit -m "Erster Commit - Doku-Repo initialisiert"
) else (
    git add -A
    git diff --cached --quiet
    if %errorlevel%==0 (
        echo %date% %time% - Keine Aenderungen - kein Commit noetig. >> git-backup-log.txt
    ) else (
        git commit -m "Automatisches Backup %date% %time%" >> git-backup-log.txt
    )
)
