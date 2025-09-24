# **E621**
---

## **Beschreibung**

E621 ist ein Tool/Projekt (bitte hier kurz beschreiben, was dein Projekt genau macht).
Das Projekt kann einfach auf Ubuntu installiert und aktualisiert werden. Nach der Installation ist das Tool global verfügbar und kann direkt über die Kommandozeile ausgeführt werden.

---

## **Features**

* Einfache Installation mit nur einem Befehl
* Automatische Aktualisierung des Repositorys
* Installation von Python-Abhängigkeiten und Erstellung einer ausführbaren Binary
* Globale Verfügbarkeit des Befehls `E621`
* Cross-User Installation unter Ubuntu

---

## **Installation**

Führe den folgenden **One-Liner** aus, um alles automatisch zu installieren:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/AmexHusky/E621/main/install_e621.sh)"
```

> Das Skript installiert:
>
> * Git, Python3, Pip
> * Das E621 Repository unter `/opt/E621`
> * Python-Abhängigkeiten aus `requirements.txt`
> * Eine ausführbare Binary via PyInstaller
> * Globale Binary `E621` unter `/usr/local/bin/E621`

---

## **Benutzung**

### 1. Installation / Update & Starten

```bash
sudo E621 -Y
```

* `-Y` bestätigt automatisch alle Installationseinstellungen.
* Das Skript aktualisiert das Repository, installiert Abhängigkeiten und erstellt die Binary.

### 2. Nur starten

```bash
sudo E621 start
```

* Führt die bereits erstellte Binary aus, ohne Neuinstallation.

---

## **Repository manuell aktualisieren**

Wenn du das Repository oder die Binary neu bauen möchtest, führe einfach:

```bash
sudo E621 -Y
```

aus – das Skript zieht automatisch die neuesten Änderungen und baut die Binary neu.

---

## **Systemvoraussetzungen**

* Linux
* Python 3.11+
* Root-Rechte für Installation/Update

---

## **Autor & Lizenz**

**Created by Amex Husky**
**Copyright © 2025 Amex Husky**

Dieses Projekt ist Open Source und darf frei genutzt, modifiziert und weitergegeben werden, solange der Urheber genannt wird. 

---

## **Support / Kontakt**

Für Fragen oder Support kontaktiere:
**GitHub:** [https://github.com/AmexHusky/E621](https://github.com/AmexHusky/E621)


